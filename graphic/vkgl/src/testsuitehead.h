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
#ifndef TEST_SUITETESTSHRINKHEAD_H
#define TEST_SUITETESTSHRINKHEAD_H

#define SHRINK_SUITETEST_HEAD(TestSuite)   \
namespace OHOS {                                                            \
    class TestSuite : public testing::Test {              \
    public:              \
        static time_t startTime;              \
        static time_t endTime;              \
        static FuncRunResult runResult;              \
    protected:              \
        static void SetUpTestCase(void)     \
        {                                   \
            time(&startTime);                   \
            RegistPackage();                    \
            runResult.numPassed = 0;            \
            runResult.numFailed = 0;            \
            runResult.numNotSupported = 0;      \
            runResult.numWarnings = 0;          \
            runResult.numWaived = 0;            \
        };              \
        static void TearDownTestCase(void)  \
        {                                                                                           \
            time(&endTime);                                                                         \
            printf("Test run totals --- Passed[%d]\n", runResult.numPassed);                        \
            printf("Test run totals --- Failed[%d]\n", runResult.numFailed);                        \
            printf("Test run totals --- Notsupport[%d]\n", runResult.numNotSupported);              \
            printf("Test run totals --- Warnings[%d]\n", runResult.numWarnings);                    \
            printf("Test run totals --- Waved[%d]\n", runResult.numWaived);                         \
            std::cout << "testmain end --- COST TIME ["<< (endTime-startTime) << "]" << std::endl;       \
        };              \
        virtual void SetUp(void) {};              \
        virtual void TearDown(void) {};              \
    };              \
}                                                                   
#endif // 为缩减代码而存在