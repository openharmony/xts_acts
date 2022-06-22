/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ActsApp.h"
#include "tcuPlatform.hpp"
#include "tcuTestContext.hpp"
#include "tcuTestSessionExecutor.hpp"
#include "tcuTestHierarchyUtil.hpp"
#include "tcuCommandLine.hpp"
#include "tcuTestLog.hpp"

#include "qpInfo.h"
#include "qpDebugOut.h"
#include "deMath.h"

namespace tcu {
    using std::string;
    /*--------------------------------------------------------------------****!
    *  Writes all packages found stdout without any
    *  separations. Recommended to be used with a single package
    *  only. It's possible to use test selectors for limiting the export
    *  to one package in a multipackage binary.
    *--------------------------------------------------------------------*/
    static void writeCaselistsToStdout (TestPackageRoot& root, TestContext& testCtx)
    {
        DefaultHierarchyInflater inflater(testCtx);
        de::MovePtr<const CaseListFilter> caseListFilter(
            testCtx.getCommandLine().createCaseListFilter(testCtx.getArchive()));
        TestHierarchyIterator iter(root, inflater, *caseListFilter);

        while (iter.getState() != TestHierarchyIterator::STATE_FINISHED) {
            iter.next();
            tcu::TestNode* testNode = iter.getNode();
            while (testNode->getNodeType() != NODETYPE_PACKAGE) {
                if (iter.getState() == TestHierarchyIterator::STATE_ENTER_NODE)
                    std::cout << (isTestNodeTypeExecutable(testNode->getNodeType()) ? "TEST" : "GROUP")
                        << ": " << iter.getNodePath() << "\n";
                iter.next();
            }

            DE_ASSERT(iter.getState() == TestHierarchyIterator::STATE_LEAVE_NODE &&
                    testNode->getNodeType() == NODETYPE_PACKAGE);
            iter.next();
        };
    }


    /*--------------------------------------------------------------------****!
    * Verifies that amber capability requirements in the .amber files
    * match with capabilities defined on the CTS C code.
    ****--------------------------------------------------------------------*/
    static void verifyAmberCapabilityCoherency (TestPackageRoot& root, TestContext& testCtx)
    {
        DefaultHierarchyInflater inflater(testCtx);
        de::MovePtr<const CaseListFilter> caseListFilter(
            testCtx.getCommandLine().createCaseListFilter(testCtx.getArchive()));
        TestHierarchyIterator iter(root, inflater, *caseListFilter);
        int count = 0;
        int errorCount = 0;

        bool ok = true;

        while (iter.getState() != TestHierarchyIterator::STATE_FINISHED) {
            iter.next();
            tcu::TestNode* testNode = iter.getNode();
            while (testNode->getNodeType() != NODETYPE_PACKAGE) {
                if (iter.getState() == TestHierarchyIterator::STATE_ENTER_NODE &&
                    isTestNodeTypeExecutable(testNode->getNodeType())) {
                    std::cout << iter.getNodePath() << "\n";
                    testCtx.getLog() << tcu::TestLog::Message << iter.getNodePath() << tcu::TestLog::EndMessage;
                    count++;
                };
                iter.next();
            };

            DE_ASSERT(iter.getState() == TestHierarchyIterator::STATE_LEAVE_NODE &&
                testNode->getNodeType() == NODETYPE_PACKAGE);
            iter.next();
        };
        std::cout << count << " amber tests, " << errorCount << " errors.\n";
        if (!ok) {
            TCU_THROW(InternalError, "One or more CTS&Amber test requirements do not match; check log for details");
        };
    }

    /*--------------------------------------------------------------------****!
    * \brief Construct test application
    *
    * If a fatal error occurs during initialization constructor will call
    * die() with debug information.
    *
    * \param platform Reference to platform implementation.
    *--------------------------------------------------------------------*/
    ActsApp::ActsApp (Platform& platform, Archive& archive, TestLog& log, const CommandLine& cmdLine)
        : m_platform(platform),
        m_watchDog(DE_NULL),
        m_crashHandler(DE_NULL),
        m_crashed(false),
        m_testCtx(DE_NULL),
        m_testRoot(DE_NULL),
        m_testExecutor(DE_NULL)
    {
        print("dEQP Core %s (0x%08x) starting..\n", qpGetReleaseName(), qpGetReleaseId());
        print("  target implementation = '%s'\n", qpGetTargetName());

        if (!deSetRoundingMode(DE_ROUNDINGMODE_TO_NEAREST_EVEN)) {
            qpPrintf("WARNING: Failed to set floating-point rounding mode!\n");
        };

        try {
            const RunMode    runMode    = cmdLine.getRunMode();

            // Initialize watchdog
            if (cmdLine.isWatchDogEnabled()) {
                TCU_CHECK_INTERNAL(m_watchDog = qpWatchDog_create(onWatchdogTimeout, this,
                    WATCHDOG_TOTAL_TIME_LIMIT_SECS, WATCHDOG_INTERVAL_TIME_LIMIT_SECS));
            };

            // Initialize crash handler.
            if (cmdLine.isCrashHandlingEnabled()) {
                TCU_CHECK_INTERNAL(m_crashHandler = qpCrashHandler_create(onCrash, this));
            };

            // Create test context
            m_testCtx = new TestContext(m_platform, archive, log, cmdLine, m_watchDog);

            // Create root from registry
            m_testRoot = new TestPackageRoot(*m_testCtx, TestPackageRegistry::getSingleton());

            // \note No executor is created if runmode is not EXECUTE
            if (runMode == RUNMODE_EXECUTE) {
                m_testExecutor = new TestSessionExecutor(*m_testRoot, *m_testCtx);
            } else if (runMode == RUNMODE_DUMP_STDOUT_CASELIST) {
                writeCaselistsToStdout(*m_testRoot, *m_testCtx);
            } else if (runMode == RUNMODE_DUMP_XML_CASELIST) {
                writeXmlCaselistsToFiles(*m_testRoot, *m_testCtx, cmdLine);
            } else if (runMode == RUNMODE_DUMP_TEXT_CASELIST) {
                writeTxtCaselistsToFiles(*m_testRoot, *m_testCtx, cmdLine);
            } else if (runMode == RUNMODE_VERIFY_AMBER_COHERENCY) {
                verifyAmberCapabilityCoherency(*m_testRoot, *m_testCtx);
            } else {
                DE_ASSERT(false);
            };
        } catch (const std::exception& e) {
            cleanup();
            die("Failed to initialize dEQP: %s", e.what());
        };
    }

    ActsApp::~ActsApp (void)
    {
        cleanup();
    }

    void ActsApp::cleanup (void)
    {
        delete m_testExecutor;
        delete m_testRoot;
        delete m_testCtx;

        m_testExecutor = DE_NULL
        m_testRoot = DE_NULL
        m_testCtx = DE_NULL
        
        if (m_crashHandler) {
            qpCrashHandler_destroy(m_crashHandler);
        };

        if (m_watchDog) {
            qpWatchDog_destroy(m_watchDog);
        };
    }

    /*--------------------------------------------------------------------****!
    * \brief Step forward test execution
    * \return true if application should call iterate() again and false
    *         if test execution session is complete.
    ****--------------------------------------------------------------------*/
    bool ActsApp::iterate (void)
    {
        if (!m_testExecutor) {
            DE_ASSERT(m_testCtx->getCommandLine().getRunMode() != RUNMODE_EXECUTE);
            return false;
        };

        // Poll platform events
        const bool platformOk = m_platform.processEvents();

        // Iterate a step.
        bool testExecOk = false;
        if (platformOk) {
            try {
                testExecOk = m_testExecutor->iterate();
            } catch (const std::exception& e) {
                die("%s", e.what());
            };
        };

        return platformOk && testExecOk;
    }

    const TestRunStatus& ActsApp::getResult (void) const
    {
        return m_testExecutor->getStatus();
    }
} // tcu