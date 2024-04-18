/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import vibrator from 'libvibratorndk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsMiscdeviceNdkTest() {
describe('ActsMiscdeviceNdkTest', () => {
    beforeAll(function () {
      /*
       * @tc.setup: setup invoked before all testcases
       */
      console.info('beforeAll caled')
    })

    afterAll(function () {
        /*
        * @tc.teardown: teardown invoked after all testcases
        */
        console.info('afterAll caled')
    })

    beforeEach(function () {
        /*
        * @tc.setup: setup invoked before each testcases
        */
        console.info('beforeEach caled')
    })

    afterEach(function () {
        /*
        * @tc.teardown: teardown invoked after each testcases
        */
        console.info('afterEach called')
    })

    const USAGE_ALARM = 1;
    const USAGE_RING = 2;
    const g_duration = 300;
    const UNSUPPORTED = 801;
    const PARAMETER_ERROR = 401;
    const DEVICE_OPERATION_FAILED = 14600101;

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0100
     * @tc.name       : testActsMiscdeviceNdkTest001
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest001', 0, async (done: Function) => {
        let ret = vibrator.startVibrator(0, USAGE_ALARM);
        console.info("Test MISC ret Result = " + ret);
        expect(ret).assertEqual(PARAMETER_ERROR);
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0200
     * @tc.name       : testActsMiscdeviceNdkTest002
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest002', 0 , async (done: Function) => {
        let ret = vibrator.startVibrator(g_duration, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        expect(ret).assertEqual(0);
        ret = vibrator.cancel();
        expect(ret).assertEqual(0);
        done()
    });

      /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0300
     * @tc.name       : testActsMiscdeviceNdkTest003
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest003', 0 , async (done: Function) => {
        let ret = vibrator.cancel();
        console.info("Test MISC ret Result = " + ret);
        if (ret == 0) {
            expect(false).assertTrue();
        } else {
            expect(true).assertTrue();
        }
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0400
     * @tc.name       : testActsMiscdeviceNdkTest004
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest004', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('coin_drop.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('coin_drop.json')
        let isSuccess = ((ret == 0) || (ret == UNSUPPORTED));
        expect(isSuccess).assertTrue();
        vibrator.cancel();
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0500
     * @tc.name       : testActsMiscdeviceNdkTest005
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest005', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('test_invalid_type.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_type.json')
        expect(ret).not(0);
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0600
     * @tc.name       : testActsMiscdeviceNdkTest006
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest006', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('test_invalid_startTime.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_startTime.json')
        if (ret == 0) {
            expect(false).assertTrue();
        } else {
            expect(true).assertTrue();
        }
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0700
     * @tc.name       : testActsMiscdeviceNdkTest007
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest007', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('test_invalid_duration.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_duration.json')
        if (ret == 0) {
            expect(false).assertTrue();
        } else {
            expect(true).assertTrue();
        }
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0800
     * @tc.name       : testActsMiscdeviceNdkTest008
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest008', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('test_invalid_intensity.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_intensity.json')
        if (ret == 0) {
            expect(false).assertTrue();
        } else {
            expect(true).assertTrue();
        }
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0900
     * @tc.name       : testActsMiscdeviceNdkTest009
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest009', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('test_invalid_frequency.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_frequency.json')
        if (ret == 0) {
            expect(false).assertTrue();
        } else {
            expect(true).assertTrue();
        }
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0100
     * @tc.name       : testActsMiscdeviceNdkTest010
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest010', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('test_129_event.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('test_129_event.json')
        if (ret == 0) {
            expect(false).assertTrue();
        } else {
            expect(true).assertTrue();
        }
        done()
    });

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0110
     * @tc.name       : testActsMiscdeviceNdkTest011
     * @tc.desc       : OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActsMiscdeviceNdkTest011', 0 , async (done: Function) => {
        let file = await globalThis.abilityContext.resourceManager.getRawFdSync('test_big_file_size.json');
        console.info("getRawFdSync, file.fd =", file.fd, file.offset, file.length);
        let ret = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
        console.info("Test MISC ret Result = " + ret);
        await globalThis.abilityContext.resourceManager.closeRawFdSync('test_big_file_size.json')
        if (ret == 0) {
            expect(false).assertTrue();
        } else {
            expect(true).assertTrue();
        }
        done()
    });

})

}