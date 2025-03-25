/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import process from '@ohos.process'
export default function ProcessTest() {
describe('ProcessTest', function () {

    function delay(duration) {
        return new Promise(resolve => setTimeout(resolve, duration));
    }

    /**
     * @tc.name: testGetUid001
     * @tc.desc: returns the digital user id of the process.
     */
    it('testGetUid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let result = process.uid
        if (result > 0) {
            var flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name: testGetUid002
     * @tc.desc: returns the digital user id of the process.
     */
    it('testGetUid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetUid003
     * @tc.desc: returns the digital user id of the process.
     */
    it('testGetUid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 6; i++) {
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetUid004
     * @tc.desc: returns the digital user id of the process.
     */
    it('testGetUid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 8; i++) {
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetUid005
     * @tc.desc: returns the digital user id of the process.
     */
    it('testGetUid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 5; i++){
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testKill001
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testKill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let result = process.kill(3, 123)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testKill002
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testKill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.pid
        let result = process.kill(23, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testKill003
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testKill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.pid
        let result = process.kill(28, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testKill004
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testKill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.pid
        let result = process.kill(17, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testKill005
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testKill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let result = process.kill(3, 113)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testKill006
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testKill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.pid
        let result = process.kill('17', pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testUptime001
     * @tc.desc: Returns the running time of the system.
     */
    it('testUptime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let result1 = process.uptime()
        function sleep(d){
            while(process.uptime() - result1 <= d);
        }
        sleep(3);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 3) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name: testUptime002
     * @tc.desc: Returns the running time of the system.
     */
    it('testUptime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function ()  {
        let result1 = process.uptime()
        await delay(4000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 4) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name: testUptime003
     * @tc.desc: Returns the running time of the system.
     */
    it('testUptime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function ()  {
        let result1 = process.uptime()
        await delay(2000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 2) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name: testUptime004
     * @tc.desc: Returns the running time of the system.
     */
    it('testUptime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function ()  {
        let result1 = process.uptime()
        await delay(3000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 3) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name: testUptime005
     * @tc.desc: Returns the running time of the system.
     */
    it('testUptime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function ()  {
        let result1 = process.uptime()
        await delay(2000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 5) {
            flag = true
        }
        expect(flag).assertEqual(false)
    })

    /**
     * @tc.name: testPid001
     * @tc.desc: Return pid is the pid of the current process.
     */
    it('testPid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let result = process.pid
        if (result > 0) {
            var flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name: testPid002
     * @tc.desc: Return pid is the pid of the current process.
     */
    it('testPid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name: testPid003
     * @tc.desc: Return pid is the pid of the current process.
     */
    it('testPid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 5; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name: testPid004
     * @tc.desc: Return pid is the pid of the current process.
     */
    it('testPid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 6; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name: testPid005
     * @tc.desc: Return pid is the pid of the current process.
     */
    it('testPid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 8; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name: testTid001
     * @tc.desc: Returns the tid of the current thread.
     */
    it('testTid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        if (pres > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testTid002
     * @tc.desc: Returns the tid of the current thread.
     */
    it('testTid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 5; i++) {
            let pres = process.tid
            if (pres > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testTid003
     * @tc.desc: Returns the tid of the current thread.
     */
    it('testTid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 3; i++) {
            let pres = process.tid
            if (pres > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })


    /**
     * @tc.name: testisIsolatedProcess001
     * @tc.desc: Returns a boolean whether the process is isolated.
     */
    it('testisIsolatedProcess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.isIsolatedProcess()
        expect(pres).assertEqual(true)
    })

    /**
     * @tc.name: testisIsolatedProcess002
     * @tc.desc: Returns a boolean whether the process is isolated.
     */
    it('testisIsolatedProcess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 3; i++) {
            let pres = process.isIsolatedProcess()
            expect(pres).assertEqual(true)
        }
    })

    /**
     * @tc.name: testisIsolatedProcess003
     * @tc.desc: Returns a boolean whether the process is isolated.
     */
    it('testisIsolatedProcess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 5; i++) {
            let pres = process.isIsolatedProcess()
            expect(pres).assertEqual(true)
        }
    })


    /**
     * @tc.name: testIsappuid001
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testIsappuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(167)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid002
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testIsappuid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(123)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid003
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testIsappuid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(80000)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid004
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testIsappuid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(789)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid005
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testIsappuid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(8569)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIs64Bit001
     * @tc.desc: Returns a boolean whether the process is running in a 64-bit environment.
     */
    it('testIs64Bit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.is64Bit()
        if (isorno) {
            expect(isorno).assertEqual(true)
        } else {
            expect(isorno).assertEqual(false)
        }
    })

    /**
     * @tc.name: testIs64Bit002
     * @tc.desc: Returns a boolean whether the process is running in a 64-bit environment.
     */
    it('testIs64Bit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let isorno = process.is64Bit()
            if (isorno) {
                expect(isorno).assertEqual(true)
            } else {
            expect(isorno).assertEqual(false)
         }
        }
    })

    /**
     * @tc.name: testIs64Bit003
     * @tc.desc: Returns a boolean whether the process is running in a 64-bit environment.
     */
    it('testIs64Bit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let isorno = process.is64Bit()
            if (isorno) {
                expect(isorno).assertEqual(true)
            } else {
            expect(isorno).assertEqual(false)
            }
        }
    })


    /**
     * @tc.name: testGetUidForName001
     * @tc.desc: Returns the uid based on the specified user name.
     */
    it('testGetUidForName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.getUidForName("root")
        if (pres != -1) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetUidForName002
     * @tc.desc: Returns the uid based on the specified user name.
     */
    it('testGetUidForName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pres = process.getUidForName("12356")
            expect(pres).assertEqual(-1)
        }
    })

    /**
     * @tc.name: testGetUidForName003
     * @tc.desc: Returns the uid based on the specified user name.
     */
    it('testGetUidForName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pres = process.getUidForName("12356")
            expect(pres).assertEqual(-1)
        }
    })


    /**
     * @tc.name: testGetThreadPriority001
     * @tc.desc: Returns the thread priority based on the specified tid.
     */
    it('testGetThreadPriority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        let pri = process.getThreadPriority(pres)
        if (pri) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetThreadPriority002
     * @tc.desc: Returns the thread priority based on the specified tid.
     */
    it('testGetThreadPriority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        for (let i=0; i<3; i++) {
            let pri = process.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetThreadPriority003
     * @tc.desc: Returns the thread priority based on the specified tid.
     */
    it('testGetThreadPriority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        for (let i=0; i<5; i++) {
            let pri = process.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetStartRealtime001
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @the system to the start of the process.
     */
    it('testGetStartRealtime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetStartRealtime002
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @the system to the start of the process.
     */
    it('testGetStartRealtime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pri = process.getStartRealtime()
        if (pri !== null) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetStartRealtime003
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @the system to the start of the process.
     */
    it('testGetStartRealtime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetStartRealtime004
     * @tc.desc: Returns the elapsed real time (in milliseconds)
     * @taken from the start of the system to the start of the process.
     */
    it('testGetStartRealtime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }  
    })

    /**
     * @tc.name: testGetStartRealtime005
     * @tc.desc: Returns the elapsed real time (in milliseconds) taken from the start of
     * @the system to the start of the process.
     */
    it('testGetStartRealtime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<6; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetpastCpuTime001
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     */
    it('testGetpastCpuTime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getPastCpuTime()
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetpastCpuTime002
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     */
    it('testGetpastCpuTime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pri = process.getPastCpuTime()
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetpastCpuTime003
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     */
    it('testGetpastCpuTime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getPastCpuTime()
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetpastCpuTime004
     * @tc.desc: Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     */
    it('testGetpastCpuTime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getPastCpuTime()
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetSystemConfig001
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testGetSystemConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_ARG_MAX = 0
        let pri = process.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetSystemConfig002
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testGetSystemConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_ARG_MAX = 0
        for (let i=0; i<3; i++) {
            let pri = process.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetSystemConfig003
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testGetSystemConfig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_ARG_MAX = 0
        for (let i=0; i<5; i++) {
            let pri = process.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetSystemConfig004
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testGetSystemConfig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_OPEN_MAX = 4
        let pri = process.getSystemConfig(_SC_OPEN_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetSystemConfig005
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testGetSystemConfig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_PAGESIZE = 8
        let pri = process.getSystemConfig(_SC_PAGESIZE)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetEnvironmentVar001
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testGetEnvironmentVar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pri = process.getEnvironmentVar("USER")
        if (pri != null) {
            var flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar002
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testGetEnvironmentVar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getEnvironmentVar("PATH")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar003
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testGetEnvironmentVar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getEnvironmentVar("PATH")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar004
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testGetEnvironmentVar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<6; i++) {
            let pri = process.getEnvironmentVar("USER")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar005
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testGetEnvironmentVar005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getEnvironmentVar("USER")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar006
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testGetEnvironmentVar006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<100; i++) {
            let pri = process.getEnvironmentVar("i123")
            if (pri == null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })
})
describe('ProcessManager', function () {
    /**
     * @tc.name: testIsappuid001
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
        it('testProcessManagerIsappuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(167)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid002
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testProcessManagerIsappuid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(123)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid003
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testProcessManagerIsappuid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(80000)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid004
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testProcessManagerIsappuid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(789)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid005
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testProcessManagerIsappuid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(8569)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name: testIsappuid006
     * @tc.desc: Returns a boolean whether the specified uid belongs to a particular application.
     */
    it('testProcessManagerIsappuid006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let mag = pro.isAppUid("asdad")
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of code must be number.")
        }
    })
    /**
     * @tc.name: testKill001
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testProcessManagerKill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let result = pro.kill(3, 123)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testKill002
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testProcessManagerKill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.pid
        let result = pro.kill(23, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testKill003
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testProcessManagerKill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.pid
        let result = pro.kill(28, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testKill004
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testProcessManagerKill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.pid
        let result = pro.kill(17, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testKill005
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testProcessManagerKill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let result = pro.kill(3, 113)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testKill006
     * @tc.desc: Return whether the signal was sent successfully.
     */
    it('testProcessManagerKill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let result = pro.kill("asd", 123)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of signal or pid must be " +
                "number.")
        }
    })

    /**
     * @tc.name: testGetUidForName001
     * @tc.desc: Returns the uid based on the specified user name.
     */
    it('testProcessManagerGetUidForName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = pro.getUidForName("root")
        if (pres != -1) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetUidForName002
     * @tc.desc: Returns the uid based on the specified user name.
     */
    it('testProcessManagerGetUidForName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<3; i++) {
            let pres = pro.getUidForName("12356")
            expect(pres).assertEqual(-1)
        }
    })

    /**
     * @tc.name: testGetUidForName003
     * @tc.desc: Returns the uid based on the specified user name.
     */
    it('testProcessManagerGetUidForName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<5; i++) {
            let pres = pro.getUidForName("as123")
            expect(pres).assertEqual(-1)
        }
    })
    /**
     * @tc.name: testGetUidForName004
     * @tc.desc: Returns the uid based on the specified user name.
     */
    it('testProcessManagerGetUidForName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pres = pro.getUidForName(12)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of code must be string.")
        }
    })

    /**
     * @tc.name: testGetThreadPriority001
     * @tc.desc: Returns the thread priority based on the specified tid.
     */
    it('testProcessManagerGetThreadPriority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.tid
        let pri = pro.getThreadPriority(pres)
        if (pri) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetThreadPriority002
     * @tc.desc: Returns the thread priority based on the specified tid.
     */
    it('testProcessManagerGetThreadPriority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.tid
        for (let i=0; i<3; i++) {
            let pri = pro.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetThreadPriority003
     * @tc.desc: Returns the thread priority based on the specified tid.
     */
    it('testProcessManagerGetThreadPriority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.tid
        for (let i=0; i<5; i++) {
            let pri = pro.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetThreadPriority001
     * @tc.desc: Returns the thread priority based on the specified tid.
     */
    it('testProcessManagerGetThreadPriority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pri = pro.getThreadPriority("asdad")
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of code must be number.")
        }
    })

    /**
     * @tc.name: testGetSystemConfig001
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testProcessManagerGetSystemConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_ARG_MAX = 0
        let pri = pro.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetSystemConfig002
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testProcessManagerGetSystemConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_ARG_MAX = 0
        for (let i=0; i<3; i++) {
            let pri = pro.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetSystemConfig003
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testProcessManagerGetSystemConfig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_ARG_MAX = 0
        for (let i=0; i<5; i++) {
            let pri = pro.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetSystemConfig004
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testProcessManagerGetSystemConfig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_OPEN_MAX = 4
        let pri = pro.getSystemConfig(_SC_OPEN_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetSystemConfig005
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testProcessManagerGetSystemConfig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_PAGESIZE = 8
        let pri = pro.getSystemConfig(_SC_PAGESIZE)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name: testGetSystemConfig001
     * @tc.desc: Returns the system configuration at runtime.
     */
    it('testProcessManagerGetSystemConfig006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pri = pro.getSystemConfig("asdad")
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of name must be number.")
        }
    })

        /**
     * @tc.name: testGetEnvironmentVar001
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testProcessManagerGetEnvironmentVar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pri = pro.getEnvironmentVar("USER")
        if (pri != null) {
            var flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar002
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testProcessManagerGetEnvironmentVar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<3; i++) {
            let pri = pro.getEnvironmentVar("PATH")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar006
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testProcessManagerGetEnvironmentVar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<100; i++) {
            let pri = pro.getEnvironmentVar("i123")
            if (pri == null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name: testGetEnvironmentVar001
     * @tc.desc: Returns the system value for environment variables.
     */
    it('testProcessManagerGetEnvironmentVar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pri = pro.getEnvironmentVar(123)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of name must be string.")
        }
    })
})
}