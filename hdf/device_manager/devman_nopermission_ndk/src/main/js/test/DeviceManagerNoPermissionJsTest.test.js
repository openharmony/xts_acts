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

import usbManager from '@ohos.usbManager'
import deviceManager from '@ohos.driver.deviceManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

export default function DeviceManagerNoPermissionJsTest(){
describe("NoPermissionJsTest", function () {
    const TAG = "[NoPermissionJsTest]";
    const PERMISSION_DENIED_CODE = 201;
    const TEST_DEVICE_ID = 0;
    const TEST_DRIVER_UID = 'testDriverUid'
    const TEST_FUNCTION = (data) => {
        expect(data === null).assertTrue();
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
            const devicesList = usbManager.getDevices();
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
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0100
     * @tc.name       : NoPermission_queryDevices_001
     * @tc.desc       : verify permission of queryDevices
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_queryDevices_001", 0, done => {
        console.info('----------------------NoPermission_queryDevices_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            let devices = deviceManager.queryDevices(deviceManager.BusType.USB);
            expect(devices === null).assertTrue();
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_queryDevices_001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0200
     * @tc.name       : NoPermission_bindDevice_001
     * @tc.desc       : verify permission of bindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_bindDevice_001", 0, done => {
        console.info('----------------------NoPermission_bindDevice_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.bindDevice(TEST_DEVICE_ID, TEST_FUNCTION, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_bindDevice_001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0300
     * @tc.name       : NoPermission_bindDevice_002
     * @tc.desc       : verify permission of bindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_bindDevice_002", 0, async done => {
        console.info('----------------------NoPermission_bindDevice_002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.bindDevice(TEST_DEVICE_ID, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_bindDevice_001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0400
     * @tc.name       : NoPermission_bindDeviceDriver_001
     * @tc.desc       : verify permission of bindDeviceDriver
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_bindDeviceDriver_001", 0, done => {
        console.info('----------------------NoPermission_bindDeviceDriver_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.bindDeviceDriver(TEST_DEVICE_ID, TEST_FUNCTION, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_bindDeviceDriver_001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0500
     * @tc.name       : NoPermission_bindDeviceDriver_002
     * @tc.desc       : verify permission of bindDeviceDriver
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_bindDeviceDriver_002", 0, async done => {
        console.info('----------------------NoPermission_bindDeviceDriver_002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.bindDeviceDriver(TEST_DEVICE_ID, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_bindDeviceDriver_002 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0600
     * @tc.name       : NoPermission_unbindDevice_001
     * @tc.desc       : verify permission of unbindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_unbindDevice_001", 0, done => {
        console.info('----------------------NoPermission_unbindDevice_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.unbindDevice(TEST_DEVICE_ID, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_unbindDevice_001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0700
     * @tc.name       : NoPermission_unbindDevice_002
     * @tc.desc       : verify permission of unbindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_unbindDevice_002", 0, async done => {
        console.info('----------------------NoPermission_unbindDevice_002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.unbindDevice(TEST_DEVICE_ID).then(data => {
                expect(data === null).assertTrue();
            })
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_unbindDevice_002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0800
     * @tc.name       : NoPermission_queryDeviceInfo_001
     * @tc.desc       : verify permission of queryDeviceInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_queryDeviceInfo_001", 0, done => {
        console.info('----------------------NoPermission_queryDeviceInfo_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            let deviceInfos = deviceManager.queryDeviceInfo(TEST_DEVICE_ID);
            expect(deviceInfos === null).assertTrue();
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_queryDeviceInfo_001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0900
     * @tc.name       : NoPermission_queryDriverInfo_001
     * @tc.desc       : verify permission of queryDeviceInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("NoPermission_queryDriverInfo_001", 0, done => {
        console.info('----------------------NoPermission_queryDriverInfo_001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            let driverInfos = deviceManager.queryDriverInfo(TEST_DRIVER_UID);
            expect(driverInfos === null).assertTrue();
            done();
        } catch (err) {
            console.info(TAG, 'NoPermission_queryDriverInfo_001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

})
}
