/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import process from '@ohos.process'
export default function ProcessTest() {
describe('ProcessManager', function () {

    /**
     * @tc.number:TEST_IS_APPUID_001
     * @tc.name:  testProcessManagerIsAppUid001
     * @tc.desc:  Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
        it('testProcessManagerIsAppUid001', 0, function () {
        let pro = new process.ProcessManager();
        let isorno = pro.isAppUid(167);
        expect(isorno).assertEqual(false);
    })



    /**
     * @tc.number:TEST_PROCESSMAMAGER_IS_APPUID_002
     * @tc.name:  testProcessManagerIsAppUid002
     * @tc.desc:  Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerIsAppUid002', 0, function () {
        let pro = new process.ProcessManager();
        let isorno = pro.isAppUid(80000);
        expect(isorno).assertEqual(false);
    })

    /**
    * @tc.number:TEST_PROCESSMAMAGER_IS_APPUID_003
     * @tc.name: testProcessManagerIsAppUid003
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerIsappuid003', 0, function () {
        let pro = new process.ProcessManager();
        let isorno = pro.isAppUid(123);
        expect(isorno).assertEqual(false);
    })

    /**
    * @tc.number:TEST_PROCESSMAMAGER_IS_APPUID_004
     * @tc.name: testProcessManagerIsAppUid004
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerIsappuid004', 0, function () {
        let pro = new process.ProcessManager();
        let isorno = pro.isAppUid(789);
        expect(isorno).assertEqual(false);
    })

    /**
    * @tc.number:TEST_PROCESSMAMAGER_IS_APPUID_005
     * @tc.name: testProcessManagerIsAppUid004
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerIsappuid005', 0, function () {
        let pro = new process.ProcessManager();
        let isorno = pro.isAppUid(8569);
        expect(isorno).assertEqual(false);
    })

    /**
    * @tc.number:TEST_PROCESSMAMAGER_IS_APPUID_006
     * @tc.name: testProcessManagerIsAppUid006
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerIsappuid006', 0, function () {
        try {
            let pro = new process.ProcessManager();
            //@ts-ignore
            let mag = pro.isAppUid("asdad");
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of v must be number.");
        }
    })
    
    /**
     * @tc.number:TEST_PROCESSMANAGER_GETUIDFORNAME_001
     * @tc.name:  testProcessManagerGetUidForName001
     * @tc.desc: Returns the uid based on the specified user name.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetUidForName001',0, function () {
        let pro = new process.ProcessManager();
        let pres = pro.getUidForName("root");
        if (pres != -1) {
            let flag = new Boolean(true);
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETUIDFORNAME_002
     * @tc.name:  testProcessManagerGetUidForName002
     * @tc.desc: Returns the uid based on the specified user name.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetUidForName002', 0, function () {
        let pro = new process.ProcessManager();
        for (let i=0; i<3; i++) {
            let pres = pro.getUidForName("12356");
            expect(pres).assertEqual(-1);
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETUIDFORNAME_003
     * @tc.name:  testProcessManagerGetUidForName003
     * @tc.desc:  Returns the uid based on the specified user name.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetUidForName003', 0, function () {
        let pro = new process.ProcessManager();
        for (let i=0; i<5; i++) {
            let pres = pro.getUidForName("as123");
            expect(pres).assertEqual(-1);
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETUIDFORNAME_004
     * @tc.name:  testGetUidForName004
     * @tc.desc:  Returns the uid based on the specified user name.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetUidForName004',0, function () {
        try {
            let pro = new process.ProcessManager();
            //@ts-ignore
            let pres = pro.getUidForName(12);
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of v must be string.");
        }
    })



      /**
     * @tc.number:TEST_PROCESSMANAGER_GETTHREADPRIORITY_001
     * @tc.name: testProcessManagerGetThreadPriority001
     * @tc.desc: Returns the thread priority based on the specified tid.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetThreadPriority001', 0, function () {
        let pro = new process.ProcessManager();
        let pres = process.tid;
        let pri = pro.getThreadPriority(pres);
        if (pri) {
            let flag = new Boolean(true);
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETTHREADPRIORITY_002
     * @tc.name: testProcessManagerGetThreadPriority002
     * @tc.desc: Returns the thread priority based on the specified tid.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetThreadPriority002', 0, function () {
        let pro = new process.ProcessManager();
        let pres = process.tid;
        for (let i=0; i<3; i++) {
            let pri = pro.getThreadPriority(pres);
            if (pri > 0) {
                let flag = new Boolean(true);
                expect(Boolean(flag)).assertEqual(true);
            }
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETTHREADPRIORITY_003
     * @tc.name: testProcessManagerGetThreadPriority003
     * @tc.desc: Returns the thread priority based on the specified tid.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetThreadPriority003', 0, function () {
        let pro = new process.ProcessManager();
        let pres = process.tid;
        for (let i=0; i<5; i++) {
            let pri = pro.getThreadPriority(pres);
            if (pri > 0) {
                let flag = new Boolean(true);
                expect(Boolean(flag)).assertEqual(true);
            }
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETTHREADPRIORITY_004
     * @tc.name:  testProcessManagerGetThreadPriority004
     * @tc.desc:  Returns the thread priority based on the specified tid.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetThreadPriority004', 0, function () {
        try {
            let pro = new process.ProcessManager();
            //@ts-ignore
            let pri = pro.getThreadPriority("asdad");
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of v must be number.");
        }
    })



    /**
     * @tc.number:TEST_PROCESSMANAGER_GETSYSTEMCONFIG_001
     * @tc.name: testProcessManagerGetSystemConfig001
     * @tc.desc: Returns the system configuration at runtime.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetSystemConfig001', 0, function () {
        let pro = new process.ProcessManager();
        let _SC_ARG_MAX = 0;
        let pri = pro.getSystemConfig(_SC_ARG_MAX);
        if (pri > 0) {
            var flag = new Boolean(true);
        }
        expect(Boolean(flag)).assertEqual(true);
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETSYSTEMCONFIG_002
     * @tc.name: testProcessManagerGetSystemConfig002
     * @tc.desc: Returns the system configuration at runtime.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetSystemConfig002', 0, function () {
        let pro = new process.ProcessManager();
        let _SC_ARG_MAX = 0;
        for (let i=0; i<3; i++) {
            let pri = pro.getSystemConfig(_SC_ARG_MAX);
            if (pri > 0) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETSYSTEMCONFIG_003
     * @tc.name: testProcessManagerGetSystemConfig003
     * @tc.desc: Returns the system configuration at runtime.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetSystemConfig003', 0, function () {
        let pro = new process.ProcessManager();
        let _SC_ARG_MAX = 0;
        for (let i=0; i<5; i++) {
            let pri = pro.getSystemConfig(_SC_ARG_MAX);
            if (pri > 0) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETSYSTEMCONFIG_004
     * @tc.name: testProcessManagerGetSystemConfig004
     * @tc.desc: Returns the system configuration at runtime.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetSystemConfig004', 0, function () {
        let pro = new process.ProcessManager();
        let _SC_OPEN_MAX = 4
        let pri = pro.getSystemConfig(_SC_OPEN_MAX);
        if (pri > 0) {
            var flag = new Boolean(true);
        }
        expect(Boolean(flag)).assertEqual(true);
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETSYSTEMCONFIG_005
     * @tc.name: testProcessManagerGetSystemConfig005
     * @tc.desc: Returns the system configuration at runtime.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetSystemConfig005', 0, function () {
        let pro = new process.ProcessManager();
        let _SC_PAGESIZE = 8;
        let pri = pro.getSystemConfig(_SC_PAGESIZE);
        if (pri > 0) {
            var flag = new Boolean(true);
        }
        expect(Boolean(flag)).assertEqual(true);
    })

    /**
    * @tc.number:TEST_PROCESSMANAGER_GETSYSTEMCONFIG_006
     * @tc.name: testGetSystemConfig006
     * @tc.desc: Returns the system configuration at runtime.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetSystemConfig006', 0, function () {
        try {
            let pro = new process.ProcessManager();
            //@ts-ignore
            let pri = pro.getSystemConfig("asdad");
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of v must be number.");
        }
    })

     /**
     * @tc.number:TEST_PROCESSMANAGER_GETENVIRONMENTVAR_001
     * @tc.name:  testProcessManagerGetEnvironmentVar001
     * @tc.desc:  Returns the system value for environment variables.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetEnvironmentVar001', 0, function () {
        let pro = new process.ProcessManager();
        let pri = pro.getEnvironmentVar("USER");
        if (pri != null) {
            var flag = new Boolean(true);
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETENVIRONMENTVAR_002
     * @tc.name:  testProcessManagerGetEnvironmentVar002
     * @tc.desc: Returns the system value for environment variables.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetEnvironmentVar002', 0, function () {
        let pro = new process.ProcessManager();
        for (let i=0; i<3; i++) {
            let pri = pro.getEnvironmentVar("PATH");
            if (pri != null) {
                var flag = new Boolean(true);
                expect(Boolean(flag)).assertEqual(true);
            }
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETENVIRONMENTVAR_003
     * @tc.name:  testProcessManagerGetEnvironmentVar003
     * @tc.desc: Returns the system value for environment variables.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetEnvironmentVar003', 0, function () {
        let pro = new process.ProcessManager();
        for (let i=0; i<100; i++) {
            let pri = pro.getEnvironmentVar("i123");
            if (pri == null) {
                var flag = new Boolean(true);
                expect(Boolean(flag)).assertEqual(true);
            }
        }
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_GETENVIRONMENTVAR_004
     * @tc.name:  testGetEnvironmentVar004
     * @tc.desc:  Returns the system value for environment variables.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerGetEnvironmentVar004', 0, function () {
        try {
            let pro = new process.ProcessManager();
            //@ts-ignore
            let pri = pro.getEnvironmentVar(123);
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of v must be string.");
        }
    })


    /**
     * @tc.number:TEST_PROCESSMANAGER_KILL_001
     * @tc.name:  testProcessManagerKill001
     * @tc.desc:  Return whether the signal was sent successfully.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerKill001', 0, function () {
        let pro = new process.ProcessManager();
        let result = pro.kill(3, 123);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_KILL_002
     * @tc.name:  testProcessManagerKill002
     * @tc.desc:  Return whether the signal was sent successfully.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerKill002', 0, function () {
        let pro = new process.ProcessManager();
        let pres = process.pid;
        let result = pro.kill(23, pres);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_KILL_003
     * @tc.name:  testProcessManagerKill003
     * @tc.desc:  Return whether the signal was sent successfully.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerKill003', 0, function () {
        let pro = new process.ProcessManager();
        let pres = process.pid;
        let result = pro.kill(28, pres);
        expect(result).assertEqual(true);
    })


    /**
     * @tc.number:TEST_PROCESSMANAGER_KILL_004
     * @tc.name:  testProcessManagerKill004
     * @tc.desc:  Return whether the signal was sent successfully.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerKill004', 0, function () {
        let pro = new process.ProcessManager();
        let result = pro.kill(3, 113);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number:TEST_PROCESSMANAGER_KILL_005
     * @tc.name:  testProcessManagerKill005
     * @tc.desc:  Return whether the signal was sent successfully.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testProcessManagerKill005', 0, function () {
        try {
            let pro = new process.ProcessManager();
            //@ts-ignore
            let result = pro.kill("asd", 123);
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of v must be number.");
        }
    })
})



describe('ProcessTest', function () {

     /**
     * @tc.number:TEST_EGID_001
     * @tc.name: testEgid001
     * @tc.desc: Returns the numeric valid group ID of the process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testEgid001', 0, function () {
        let result = process.egid;
        if (result > 0) {
            var flag = true;
        }
        expect(flag).assertEqual(true);
    })

     /**
     * @tc.number:TEST_EGID_002
     * @tc.name: testEgid002
     * @tc.desc: Returns the numeric valid group ID of the process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
     it('testEgid002', 0, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.egid;
            if (result != null) {
                if (result > 0) {
                    var flag = true;
                }
                expect(flag).assertEqual(true);
            }
        }
    })


    /**
     * @tc.number:TEST_EUID_001
     * @tc.name: testEuid001
     * @tc.desc: Return the numeric valid user identity of the process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
     it('testEuid001', 0, function () {
        let result = process.euid;
        if (result > 0) {
            var flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
     * @tc.number:TEST_EUID_002
     * @tc.name: testEuid002
     * @tc.desc: Return the numeric valid user identity of the process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
     it('testUid002', 0, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.euid;
            if (result != null) {
                if (result > 0) {
                    var flag = true;
                }
                expect(flag).assertEqual(true);
            }
        }
    })

    /**
     * @tc.number:TEST_GID_001
     * @tc.name: testGid001
     * @tc.desc: Return the numeric group if of the process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */

     it('testGid001', 0, function () {  
        let result = process.gid;
        if (result > 0) {
            var flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
     * @tc.number:TEST_GID_002
     * @tc.name: testGid002
     * @tc.desc: Return the numeric group if of the process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
     it('testGid002', 0, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.gid;
            if (result != null) {
                if (result > 0) {
                    var flag = true;
                }
                expect(flag).assertEqual(true);
            }
        }
    })
    
    /**
     * @tc.number:TEST_Uid_001
     * @tc.name: testUid001
     * @tc.desc: returns the digital user id of the process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testUid001', 0, function () {
        let result = process.uid;
        if (result > 0) {
            var flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
    * @tc.number:TEST_Uid_002
     * @tc.name: testUid002
     * @tc.desc: returns the digital user id of the process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testUid002', 0, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.uid;
            if (result != null) {
                if (result > 0) {
                    var flag = true;
                }
                expect(flag).assertEqual(true);
            }
        }
    })

    /**
    * @tc.number:TEST_Uid_003
     * @tc.name: testUid003
     * @tc.desc: returns the digital user id of the process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testUid003', 0, function () {
        for (let i = 0; i < 6; i++) {
            let result = process.uid;
            if (result != null) {
                if (result > 0) {
                    var flag = true;
                }
                expect(flag).assertEqual(true);
            }
        }
    })

    /**
    * @tc.number:TEST_Uid_004
     * @tc.name: testUid004
     * @tc.desc: returns the digital user id of the process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testUid004', 0, function () {
        for (let i = 0; i < 8; i++) {
            let result = process.uid;
            if (result != null) {
                if (result > 0) {
                    var flag = true;
                }
                expect(flag).assertEqual(true);
            }
        }
    })

    /**
    * @tc.number:TEST_Uid_005
     * @tc.name: testUid005
     * @tc.desc: returns the digital user id of the process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testUid005', 0, function () {
        for (let i = 0; i < 5; i++){
            let result = process.uid;
            if (result != null) {
                if (result > 0) {
                    var flag = true;
                }
                expect(flag).assertEqual(true);
            }
        }
    })

     /**
     * @tc.number:TEST_GROUPS_001
     * @tc.name:  testGroups001
     * @tc.desc:  Return an array with supplementary group id
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testGroups001', 0, function () {
        let result = process.groups;
        if (result != null) {
            var flag = true;
        }
        expect(flag).assertEqual(true);
    })


     /**
     * @tc.number:TEST_PID_001
     * @tc.name: testPid001
     * @tc.desc: Return pid is the pid of the current process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testPid001', 0, function () {
        let result = process.pid;
        if (result > 0) {
            var flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
    * @tc.number:TEST_PID_002
     * @tc.name: testPid002
     * @tc.desc: Return pid is the pid of the current process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testPid002', 0, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.pid;
            if (result > 0) {
                var flag = true;
            }
            expect(flag).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_PID_003
     * @tc.name: testPid003
     * @tc.desc: Return pid is the pid of the current process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testPid003', 0, function () {
        for (let i = 0; i < 5; i++) {
            let result = process.pid;
            if (result > 0) {
                var flag = true;
            }
            expect(flag).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_PID_004
     * @tc.name: testPid004
     * @tc.desc: Return pid is the pid of the current process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testPid004', 0, function () {
        for (let i = 0; i < 6; i++) {
            let result = process.pid;
            if (result > 0) {
                var flag = true;
            }
            expect(flag).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_PID_005
     * @tc.name: testPid005
     * @tc.desc: Return pid is the pid of the current process.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testPid005', 0, function () {
        for (let i = 0; i < 8; i++) {
            let result = process.pid;
            if (result > 0) {
                var flag = true;
            }
            expect(flag).assertEqual(true);
        }
    })



    /**
     * @tc.number:TEST_PPID_001
     * @tc.name: testPpid001
     * @tc.desc: Return ppid is The pid of the current child process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testTid001', 0, function () {
        let pres = process.ppid;
        if (pres > 0) {
            var flag = new Boolean(true);
        }
        expect(Boolean(flag)).assertEqual(true);
    })

    /**
     * @tc.number:TEST_PPID_002
     * @tc.name: testPpid002
     * @tc.desc: Return ppid is The pid of the current child process
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
     it('testPpid002', 0, function () {
        for (let i = 0; i < 8; i++) {
            let result = process.ppid;
            if (result > 0) {
                var flag = true;
            }
            expect(flag).assertEqual(true);
        }
    })
    
     /**
     * @tc.number:TEST_TID_001
     * @tc.name: testTid001
     * @tc.desc: Returns the tid of the current thread.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testTid001', 0, function () {
        let pres = process.tid;
        if (pres > 0) {
            var flag = new Boolean(true);
        }
        expect(Boolean(flag)).assertEqual(true);
    })

    /**
    * @tc.number:TEST_TID_002
     * @tc.name: testTid002
     * @tc.desc: Returns the tid of the current thread.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testTid002', 0, function () {
        for (let i=0; i < 5; i++) {
            let pres = process.tid;
            if (pres > 0) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_TID_003
     * @tc.name: testTid003
     * @tc.desc: Returns the tid of the current thread.
     * @tc.size:  MediumTest
     * @tc.type:  Constant
     * @tc.level: level 2
     */
    it('testTid003', 0, function () {
        for (let i=0; i < 3; i++) {
            let pres = process.tid;
            if (pres > 0) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_IS64BIT_001
     * @tc.name: testIs64Bit001
     * @tc.desc: Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testIs64Bit001', 0, function () {
        let isorno = process.is64Bit();
        if (isorno) {
            expect(isorno).assertEqual(true);
        } else {
            expect(isorno).assertEqual(false);
        }
    })

    /**
    * @tc.number:TEST_IS64BIT_002
     * @tc.name: testIs64Bit002
     * @tc.desc: Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testIs64Bit002', 0, function () {
        for (let i=0; i<3; i++) {
            let isorno = process.is64Bit();
            if (isorno) {
                expect(isorno).assertEqual(true);
            } else {
            expect(isorno).assertEqual(false);
         }
        }
    })

    /**
    * @tc.number:TEST_IS64BIT_003
     * @tc.name: testIs64Bit003
     * @tc.desc: Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testIs64Bit003', 0, function () {
        for (let i=0; i<5; i++) {
            let isorno = process.is64Bit();
            if (isorno) {
                expect(isorno).assertEqual(true);
            } else {
            expect(isorno).assertEqual(false);
            }
        }
    })


    /**
    * @tc.number:TEST_GET_START_REALTIME_001
     * @tc.name: testGetStartRealtime001
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetStartRealtime001', 0, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getStartRealtime();
            if (pri !== null) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_GET_START_REALTIME_002
     * @tc.name: testGetStartRealtime002
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetStartRealtime002', 0, function () {
        let pri = process.getStartRealtime();
        if (pri !== null) {
            var flag = new Boolean(true);
        }
        expect(Boolean(flag)).assertEqual(true);
    })

    /**
    * @tc.number:TEST_GET_START_REALTIME_003
     * @tc.name: testGetStartRealtime003
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetStartRealtime003', 0, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getStartRealtime();
            if (pri !== null) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_GET_START_REALTIME_004
     * @tc.name: testGetStartRealtime004
     * @tc.desc: Returns the elapsed real time (in milliseconds)
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetStartRealtime004', 0, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getStartRealtime();
            if (pri !== null) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }  
    })

    /**
    * @tc.number:TEST_GET_START_REALTIME_005
     * @tc.name: testGetStartRealtime005
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetStartRealtime005', 0, function () {
        for (let i=0; i<6; i++) {
            let pri = process.getStartRealtime();
            if (pri !== null) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })


      /**
     * @tc.number:TEST_GET_PAST_CPU_TIME_001
     * @tc.name: testGetpastCpuTime001
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetpastCpuTime001', 0, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getPastCpuTime();
            if (pri > 0) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_GET_PAST_CPU_TIME_002
     * @tc.name: testGetpastCpuTime002
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetpastCpuTime002', 0, function () {
        let pri = process.getPastCpuTime();
        if (pri > 0) {
            var flag = new Boolean(true);
        }
        expect(Boolean(flag)).assertEqual(true);
    })

    /**
    * @tc.number:TEST_GET_PAST_CPU_TIME_003
     * @tc.name: testGetpastCpuTime003
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetpastCpuTime003', 0, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getPastCpuTime();
            if (pri > 0) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })

    /**
    * @tc.number:TEST_GET_PAST_CPU_TIME_004
     * @tc.name: testGetpastCpuTime004
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testGetpastCpuTime004', 0, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getPastCpuTime();
            if (pri > 0) {
                var flag = new Boolean(true);
            }
            expect(Boolean(flag)).assertEqual(true);
        }
    })
     

    /**
     * @tc.number:TEST_CWD_001
     * @tc.name: testCwd001
     * @tc.desc: Return the current work directory
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

     it('testCwd001', 0, function () {
        let result=process.cwd();
        expect(result!=null).assertTrue();
    })


     /**
     * @tc.number:TEST_CHDIR_001
     * @tc.name: testChdir001
     * @tc.desc: Change current directory
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

     it('testChdir001', 0, function () {
        let result=process.cwd();
        let result1=process.chdir(result);
        expect(result!=null).assertTrue();
    })


     /**
     * @tc.number:TEST_UPTIME_001
     * @tc.name: testUptime001
     * @tc.desc: Returns the running time of the system.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testUptime001', 0, function () {
        let result1 = process.uptime();
        function sleep(d){
            while(process.uptime() - result1 <= d);
        }
        sleep(6);
        let result2 = process.uptime();
        var flag = false
        if ((result2 - result1) >= 6) {
            flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
    * @tc.number:TEST_UPTIME_002
     * @tc.name: testUptime002
     * @tc.desc: Returns the running time of the system.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testUptime002', 0, function () {
        let result1 = process.uptime();
        function sleep(d){
            while (process.uptime() - result1 <= d);
        }
        sleep(8);
        let result2 = process.uptime();
        var flag = false;
        if ((result2 - result1) >= 8) {
            flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
    * @tc.number:TEST_UPTIME_003
     * @tc.name: testUptime003
     * @tc.desc: Returns the running time of the system.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testUptime003', 0, function () {
        let result1 = process.uptime();
        function sleep(d){
            while (process.uptime() - result1 <= d);
        }
        sleep(10);
        let result2 = process.uptime();
        var flag = false;
        if ((result2 - result1) >= 10) {
            flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
    * @tc.number:TEST_UPTIME_004
     * @tc.name: testUptime004
     * @tc.desc: Returns the running time of the system.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testUptime004', 0, function () {
        let result1 = process.uptime();
        function sleep(d){
            while (process.uptime() - result1 <= d);
        }
        sleep(7);
        let result2 = process.uptime();
        var flag = false;
        if ((result2 - result1) >= 7) {
            flag = true;
        }
        expect(flag).assertEqual(true);
    })

    /**
    * @tc.number:TEST_UPTIME_005
     * @tc.name: testUptime005
     * @tc.desc: Returns the running time of the system.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it('testUptime005', 0, function () {
        let result1 = process.uptime();
        function sleep(d){
            while (process.uptime() - result1 <= d);
        }
        sleep(11);
        let result2 = process.uptime();
        var flag = false;
        if ((result2 - result1) >= 11) {
            flag = true;
        }
        expect(flag).assertEqual(true);
    })
})
}










    