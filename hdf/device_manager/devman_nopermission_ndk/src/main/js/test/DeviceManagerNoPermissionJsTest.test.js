/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import usb from '@ohos.usbManager'
import deviceManager from '@ohos.driver.deviceManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

export default function DeviceManagerNoPermissionJsTest(){
describe("NoPermissionJsTest", function () {
    const TAG = "[NoPermissionJsTest]";
    const PERMISSION_DENIED_CODE = 201;
    const TEST_DEVICE_ID = 0;
    const TEST_DRIVER_UID = 'testDriverUid'
    const TEST_FUNCTION = () => {
        console.info("Test function is called");
    };

    let deviceNum = 0;
    const isDeviceConnected = done => {
        if (deviceNum > 0) {
            console.info("Test USB device is connected");
            return true;
        }
        console.info("Test USB device is not connected");
        expect(true).assertTrue();
        if (typeof(done) === 'function') {
            done();
        }
        return false;
    }

    beforeAll(function () {
        console.info('beforeAll called');
        try {
            const devicesList = usb.getDevices();
            if (Array.isArray(devicesList)) {
                deviceNum = devicesList.length;
            }
        } catch (err) {
            console.error(TAG, `getDevices failed, message is ${err.message}`);
        }
    })

    afterAll(function () {
        console.info('afterAll called');
    })

    beforeEach(function () {
        console.info('beforeEach called');
    })

    afterEach(function () {
        console.info('afterEach called');
    })

    /*
     * @tc.name:Permission_queryDevices_001
     * @tc.desc:verify permission of queryDevices
     * @tc.type: FUNC
     */
    it("Permission_queryDevices_001", 0, done => {
        console.info('----------------------Permission_queryDevices_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.queryDevices();
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_bindDevice_001
     * @tc.desc:verify permission of bindDevice
     * @tc.type: FUNC
     */
    it("Permission_bindDevice_001", 0, done => {
        console.info('----------------------Permission_bindDevice_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.bindDevice(TEST_DEVICE_ID, TEST_FUNCTION, TEST_FUNCTION);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_bindDevice_002
     * @tc.desc:verify permission of bindDevice
     * @tc.type: FUNC
     */
    it("Permission_bindDevice_002", 0, async done => {
        console.info('----------------------Permission_bindDevice_002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.bindDevice(TEST_DEVICE_ID, TEST_FUNCTION);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_bindDeviceDriver_001
     * @tc.desc:verify permission of bindDeviceDriver
     * @tc.type: FUNC
     */
    it("Permission_bindDeviceDriver_001", 0, done => {
        console.info('----------------------Permission_bindDeviceDriver_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.bindDeviceDriver(TEST_DEVICE_ID, TEST_FUNCTION, TEST_FUNCTION);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_bindDeviceDriver_002
     * @tc.desc:verify permission of bindDeviceDriver
     * @tc.type: FUNC
     */
    it("Permission_bindDeviceDriver_002", 0, async done => {
        console.info('----------------------Permission_bindDeviceDriver_002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.bindDeviceDriver(TEST_DEVICE_ID, TEST_FUNCTION);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_unbindDevice_001
     * @tc.desc:verify permission of unbindDevice
     * @tc.type: FUNC
     */
    it("Permission_unbindDevice_001", 0, done => {
        console.info('----------------------Permission_unbindDevice_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.unbindDevice(TEST_DEVICE_ID, TEST_FUNCTION);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_unbindDevice_002
     * @tc.desc:verify permission of unbindDevice
     * @tc.type: FUNC
     */
    it("Permission_unbindDevice_002", 0, async done => {
        console.info('----------------------Permission_unbindDevice_002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.unbindDevice(TEST_DEVICE_ID);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_queryDeviceInfo_001
     * @tc.desc:verify permission of queryDeviceInfo
     * @tc.type: FUNC
     */
    it("Permission_queryDeviceInfo_001", 0, done => {
        console.info('----------------------Permission_queryDeviceInfo_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.queryDeviceInfo(TEST_DEVICE_ID);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.name:Permission_queryDriverInfo_001
     * @tc.desc:verify permission of queryDriverInfo
     * @tc.type: FUNC
     */
    it("Permission_queryDriverInfo_001", 0, done => {
        console.info('----------------------Permission_queryDriverInfo_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.queryDriverInfo(TEST_DRIVER_UID);
            expect(false).assertTrue();
            done();
        } catch (err) {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });
});
}
