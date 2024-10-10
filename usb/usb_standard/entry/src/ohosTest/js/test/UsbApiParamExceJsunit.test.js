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

import usbManager from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


export default function UsbApiParamExceJsunitTest() {
describe('UsbApiParamExceJsunitTest', function () {

    const TAG = "[UsbApiParamExceJsunitTest]";
    const PARAM_NULL = null;
    const PARAM_UNDEFINED = undefined;
    const PARAM_NULLSTRING = "";
    const PARAM_NUMBEREX = 123;
    let gDeviceList;
    let devices;
    let gPipe;
    let isDeviceConnected;
    let tmpPipe = {
        busNum: null,
        devAddress: null
    };
    function deviceConnected() {
        if (gDeviceList.length > 0) {
            console.info(TAG, "Test USB device is connected");
            return true;
        }
        console.info(TAG, "Test USB device is not connected");
        return false;
    }

    beforeAll(async function () {
        console.log(TAG, '*************Usb Unit UsbApiParamExceJsunitTest Begin*************');
        const Version = usbManager.getVersion();
        console.info(TAG, 'usb unit begin test getversion :' + Version);

        // version > 17  host currentMode = 2 device currentMode = 1
        gDeviceList = usbManager.getDevices();
        isDeviceConnected = deviceConnected();
        if (isDeviceConnected) {
            let hasRight = usbManager.hasRight(gDeviceList[0].name);
            if (!hasRight) {
                console.info(TAG, `beforeAll: usb requestRight start`);
                await getPermission();
                CheckEmptyUtils.sleep(1000);
                await driveFn();
                CheckEmptyUtils.sleep(1000);
            }

            tmpPipe.busNum = gDeviceList[0].busNum;
            tmpPipe.devAddress = gDeviceList[0].devAddress;
        }
    })

    beforeEach(function () {
        console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
        gDeviceList = usbManager.getDevices();
        if (isDeviceConnected) {
            devices = gDeviceList[0];
            console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
        }
    })

    afterEach(function () {
        console.info(TAG, 'afterEach: *************Usb Unit Test CaseEx*************');
        devices = null;
        gPipe = null;
        console.info(TAG, 'afterEach return devices : ' + JSON.stringify(devices));
    })

    afterAll(function () {
        console.log(TAG, '*************Usb Unit UsbApiParamExceJsunitTest End*************');
    })

    async function driveFn() {
        console.info('**************driveFn**************');
        try {
            let driver = await UiDriver.create();
            console.info(TAG, ` come in driveFn`);
            console.info(TAG, `driver is ${JSON.stringify(driver)}`);
            CheckEmptyUtils.sleep(1000);
            let button = await driver.findComponent(BY.text('允许'));
            console.info(TAG, `button is ${JSON.stringify(button)}`);
            CheckEmptyUtils.sleep(1000);
            await button.click();
        } catch (err) {
            console.info(TAG, 'err is ' + err);
            return;
        }
    }

    async function getPermission() {
        console.info('**************getPermission**************');
        try {
            usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
                console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
            })
        } catch (err) {
            console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
            return
        }
    }

    function getPipe(testCaseName) {
        gPipe = usbManager.connectDevice(devices);
        console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
        expect(gPipe !== null).assertTrue();
    }

    function toReleaseInterface(testCaseName, tInterface) {
        let ret = usbManager.releaseInterface(tmpPipe, tInterface);
        console.info(TAG, `usb ${testCaseName} releaseInterface ret: ${ret}`);
        expect(ret).assertEqual(0);
    }
    
    function toClosePipe(testCaseName) {
        let isPipClose = usbManager.closePipe(tmpPipe);
        console.info(TAG, `usb ${testCaseName} closePipe ret: ${isPipClose}`);
        expect(isPipClose).assertEqual(0);
    }

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0100
     * @tc.name     : testHasRightParamEx001
     * @tc.desc     : Negative test: Param is null string
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testHasRightParamEx001', 0, function () {
        console.info(TAG, 'usb testHasRightParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let isHasRight = usbManager.hasRight(PARAM_NULLSTRING);
            console.info(TAG, 'usb case hasRight ret : ' + isHasRight);
            expect(isHasRight).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasRightParamEx001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0200
     * @tc.name     : testHasRightParamEx002
     * @tc.desc     : Negative test: Param add number '123'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testHasRightParamEx002', 0, function () {
        console.info(TAG, 'usb testHasRightParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            for (var i = 0; i < gDeviceList.length; i++) {
                let deviceName = gDeviceList[i].name;
                deviceName = deviceName + "123";
                let isHasRight = usbManager.hasRight(deviceName);
                console.info(TAG, 'usb [', deviceName, '] hasRight ret : ' + isHasRight);
                expect(isHasRight).assertFalse();
            }
        } catch (err) {
            console.info(TAG, 'testHasRightParamEx002 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0300
     * @tc.name     : testRequestRightParamEx001
     * @tc.desc     : Negative test: Param is null string
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRequestRightParamEx001', 0, async function () {
        console.info(TAG, 'usb testRequestRightParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let isHasRight = await usbManager.requestRight(PARAM_NULLSTRING);
            console.info(TAG, 'usb case requestRight ret : ' + isHasRight);
            expect(isHasRight).assertFalse();
        } catch (err) {
            console.info(TAG, 'testRequestRightParamEx001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0400
     * @tc.name     : testRequestRightParamEx002
     * @tc.desc     : Negative test: Param add number 'abc'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRequestRightParamEx002', 0, async function () {
        console.info(TAG, 'usb testRequestRightParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            for (var i = 0; i < gDeviceList.length; i++) {
                let deviceName = gDeviceList[i].name;
                deviceName = deviceName + "abc";
                let isHasRight = await usbManager.requestRight(deviceName);
                console.info(TAG, 'usb [', deviceName, '] requestRight ret : ' + isHasRight);
                expect(isHasRight).assertFalse();
            }
        } catch (err) {
            console.info(TAG, 'testRequestRightParamEx002 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0500
     * @tc.name     : testRemoveRightParamEx001
     * @tc.desc     : Negative test: Param is null string
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRemoveRightParamEx001', 0, function () {
        console.info(TAG, 'usb testRemoveRightParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let remRight = usbManager.removeRight(PARAM_NULLSTRING);
            console.info(TAG, 'usb case removeRight ret : ' + remRight);
            expect(remRight).assertFalse();
        } catch (err) {
            console.info(TAG, 'testRemoveRightParamEx001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0600
     * @tc.name     : testRemoveRightParamEx002
     * @tc.desc     : Negative test: Param add letter 'abc'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRemoveRightParamEx002', 0, function () {
        console.info(TAG, 'usb testRemoveRightParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            for (var i = 0; i < gDeviceList.length; i++) {
                let deviceName = gDeviceList[i].name;
                deviceName = deviceName + "abc";
                let remRight = usbManager.removeRight(deviceName);
                console.info(TAG, 'usb [', deviceName, '] removeRight ret : ', remRight);
                expect(remRight).assertFalse();
            }
        } catch (err) {
            console.info(TAG, 'testRemoveRightParamEx002 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0700
     * @tc.name     : testRemoveRightParamEx003
     * @tc.desc     : Negative test: Param add special characters '@#'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRemoveRightParamEx003', 0, function () {
        console.info(TAG, 'usb testRemoveRightParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            for (var i = 0; i < gDeviceList.length; i++) {
                let deviceName = gDeviceList[i].name;
                deviceName = deviceName + "@#";
                let remRight = usbManager.removeRight(deviceName);
                console.info(TAG, 'usb [', deviceName, '] removeRight ret : ', remRight);
                expect(remRight).assertFalse();
            }
        } catch (err) {
            console.info(TAG, 'testRemoveRightParamEx003 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0800
     * @tc.name     : testRemoveRightParamEx004
     * @tc.desc     : Negative test: Param add number '123'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRemoveRightParamEx004', 0, function () {
        console.info(TAG, 'usb testRemoveRightParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            for (var i = 0; i < gDeviceList.length; i++) {
                let deviceName = gDeviceList[i].name;
                deviceName = deviceName + "123";
                let remRight = usbManager.removeRight(deviceName);
                console.info(TAG, 'usb [', deviceName, '] removeRight ret : ', remRight);
                expect(remRight).assertFalse();
            }
        } catch (err) {
            console.info(TAG, 'testRemoveRightParamEx004 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0900
     * @tc.name     : testConnectDeviceParamEx001
     * @tc.desc     : Negative test: Param add number '123'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx001', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let deviceName = devices.name + "123";
            devices.name = deviceName;
            let gPipe = usbManager.connectDevice(devices);

            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1000
     * @tc.name     : testConnectDeviceParamEx002
     * @tc.desc     : Negative test: Param add letter 'abc'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx002', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let deviceName = devices.name + "abc";
            devices.name = deviceName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx002 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1100
     * @tc.name     : testConnectDeviceParamEx003
     * @tc.desc     : Negative test: Param add special characters '@#'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx003', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let deviceName = devices.name + "@#";
            devices.name = deviceName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx003 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1200
     * @tc.name     : testConnectDeviceParamEx004
     * @tc.desc     : Negative test: devices name is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx004', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.name = PARAM_NULLSTRING;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx004 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1300
     * @tc.name     : testConnectDeviceParamEx005
     * @tc.desc     : Negative test: devices serial is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx005', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.serial = PARAM_NULLSTRING;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.serial, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx005 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1400
     * @tc.name     : testConnectDeviceParamEx006
     * @tc.desc     : Negative test: devices serial add letter abc
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx006', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devSerial = devices.serial + "abc";
            devices.serial = devSerial;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.serial, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx006 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1500
     * @tc.name     : testConnectDeviceParamEx007
     * @tc.desc     : Negative test: devices serial add number 123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx007', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devSerial = devices.serial + "123";
            devices.serial = devSerial;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.serial, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx007 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1600
     * @tc.name     : testConnectDeviceParamEx008
     * @tc.desc     : Negative test: devices serial add special characters '@#'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx008', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devSerial = devices.serial + "@#";
            devices.serial = devSerial;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.serial, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx008 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1700
     * @tc.name     : testConnectDeviceParamEx009
     * @tc.desc     : Negative test: devices manufacturerName add special characters '@#'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx009', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devManufacturerName = devices.manufacturerName + "@#";
            devices.manufacturerName = devManufacturerName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.manufacturerName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx009 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1800
     * @tc.name     : testConnectDeviceParamEx010
     * @tc.desc     : Negative test: devices manufacturerName add special characters 'abc'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx010', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devManufacturerName = devices.manufacturerName + "abc";
            devices.manufacturerName = devManufacturerName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.manufacturerName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx010 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_1900
     * @tc.name     : testConnectDeviceParamEx011
     * @tc.desc     : Negative test: devices manufacturerName add special characters '123'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx011', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devManufacturerName = devices.manufacturerName + "123";
            devices.manufacturerName = devManufacturerName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.manufacturerName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx011 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2000
     * @tc.name     : testConnectDeviceParamEx012
     * @tc.desc     : Negative test: devices manufacturerName add special characters ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx012', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.manufacturerName = PARAM_NULLSTRING;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.manufacturerName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx012 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })
    
    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2100
     * @tc.name     : testConnectDeviceParamEx013
     * @tc.desc     : Negative test: devices productName add special characters '@#'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx013', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devProductName = devices.productName + "@#";
            devices.productName = devProductName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.productName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx013 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2200
     * @tc.name     : testConnectDeviceParamEx014
     * @tc.desc     : Negative test: devices productName add special characters 'abc'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx014', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devProductName = devices.productName + "abc";
            devices.productName = devProductName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.productName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx014 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2300
     * @tc.name     : testConnectDeviceParamEx015
     * @tc.desc     : Negative test: devices productName add special characters '123'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx015', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devProductName = devices.productName + "123";
            devices.productName = devProductName;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.productName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx015 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2400
     * @tc.name     : testConnectDeviceParamEx016
     * @tc.desc     : Negative test: devices productName is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx016', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.productName = PARAM_NULLSTRING;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.productName, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx016 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2500
     * @tc.name     : testConnectDeviceParamEx017
     * @tc.desc     : Negative test: devices version add special characters '@#'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx017', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devVersion = devices.version + "@#";
            devices.version = devVersion;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.version, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx017 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2600
     * @tc.name     : testConnectDeviceParamEx018
     * @tc.desc     : Negative test: devices version add special characters 'abc'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx018', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devVersion = devices.version + "abc";
            devices.version = devVersion;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.version, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx018 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2700
     * @tc.name     : testConnectDeviceParamEx019
     * @tc.desc     : Negative test: devices version add special characters '123'
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx019', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devVersion = devices.version + "123";
            devices.version = devVersion;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.version, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx019 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2800
     * @tc.name     : testConnectDeviceParamEx020
     * @tc.desc     : Negative test: devices version is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx020', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.version = PARAM_NULLSTRING;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.version, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx020 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_2900
     * @tc.name     : testConnectDeviceParamEx021
     * @tc.desc     : Negative test: devices vendorId is add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx021', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devVendorId = devices.vendorId + 1000;
            devices.vendorId = devVendorId;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.vendorId, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx021 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3000
     * @tc.name     : testConnectDeviceParamEx022
     * @tc.desc     : Negative test: devices productId is add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx022', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devProductId = devices.productId + 1000;
            devices.productId = devProductId;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.productId, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx022 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3100
     * @tc.name     : testConnectDeviceParamEx023
     * @tc.desc     : Negative test: devices clazz is add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx023', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devClazz = devices.clazz + 1000;
            devices.clazz = devClazz;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.clazz, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx023 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3200
     * @tc.name     : testConnectDeviceParamEx024
     * @tc.desc     : Negative test: devices subClass is add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx024', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devSubClass = devices.subClass + 1000;
            devices.subClass = devSubClass;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.subClass, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx024 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3300
     * @tc.name     : testConnectDeviceParamEx025
     * @tc.desc     : Negative test: devices protocol is add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx025', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devProtocol = devices.protocol + 1000;
            devices.protocol = devProtocol;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.protocol, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx025 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3400
     * @tc.name     : testConnectDeviceParamEx026
     * @tc.desc     : Negative test: devices busNum is add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx026', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devBusNum = devices.busNum + 1000;
            devices.busNum = devBusNum;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.busNum, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(gPipe !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(14400001);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3500
     * @tc.name     : testConnectDeviceParamEx027
     * @tc.desc     : Negative test: devices devAddress is add number 10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testConnectDeviceParamEx027', 0, function () {
        console.info(TAG, 'usb testConnectDeviceParamEx027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devDevAddress = devices.devAddress + 1000;
            devices.devAddress = devDevAddress;
            let gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.devAddress, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(gPipe !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamEx027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(14400001);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3600
     * @tc.name     : testClosePipeParamEx001
     * @tc.desc     : Negative test: pipe busNum add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClosePipeParamEx001', 0, function () {
        console.info(TAG, 'usb testClosePipeParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClosePipeParamEx001");
        try {
            gPipe.busNum = gPipe.busNum + 1000;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [', gPipe.busNum, '] closePipe ret : ', ret);
            expect(ret !== null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamEx001 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClosePipeParamEx001");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3700
     * @tc.name     : testClosePipeParamEx002
     * @tc.desc     : Negative test: pipe devAddress add number 10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClosePipeParamEx002', 0, function () {
        console.info(TAG, 'usb testClosePipeParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClosePipeParamEx002");
        try {
            let pipDevAdd = gPipe.devAddress + 10000;
            gPipe.devAddress = pipDevAdd;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [', gPipe.devAddress, '] closePipe ret : ', ret);
            expect(ret !== null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamEx002 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClosePipeParamEx002");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3800
     * @tc.name     : testGetRawDescriptorParamEx001
     * @tc.desc     : Negative test: pipe busNum add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetRawDescriptorParamEx001', 0, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetRawDescriptorParamEx001");
        try {
            let pipBusNum = gPipe.busNum + 1000;
            gPipe.busNum = pipBusNum;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.busNum, '] getRawDescriptor ret : ', ret);
            expect(ret).assertEqual(undefined);
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamEx001 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetRawDescriptorParamEx001");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_3900
     * @tc.name     : testGetRawDescriptorParamEx002
     * @tc.desc     : Negative test: pipe devAddress add number 10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetRawDescriptorParamEx002', 0, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetRawDescriptorParamEx002");
        try {
            let pipDevAdd = gPipe.devAddress + 10000;
            gPipe.devAddress = pipDevAdd;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.devAddress, '] getRawDescriptor ret : ', ret);
            expect(ret).assertEqual(undefined);
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamEx002 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetRawDescriptorParamEx002");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4000
     * @tc.name     : testGetRawDescriptorParamEx003
     * @tc.desc     : Negative test: pipe busNum -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetRawDescriptorParamEx003', 0, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetRawDescriptorParamEx003");
        try {
            gPipe.busNum = -23;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.busNum, '] getRawDescriptor ret : ', ret);
            expect(ret).assertEqual(undefined);
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamEx003 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetRawDescriptorParamEx003");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4100
     * @tc.name     : testGetRawDescriptorParamEx004
     * @tc.desc     : Negative test: pipe devAddress -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetRawDescriptorParamEx004', 0, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetRawDescriptorParamEx004");
        try {
            gPipe.devAddress = -23;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.devAddress, '] getRawDescriptor ret : ', ret);
            expect(ret).assertEqual(undefined);
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamEx004 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetRawDescriptorParamEx004");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4200
     * @tc.name     : testGetRawDescriptorParamEx005
     * @tc.desc     : Negative test: pipe busNum -23, devAddress -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetRawDescriptorParamEx005', 0, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamEx005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetRawDescriptorParamEx005");
        try {
            gPipe.busNum = -23;
            gPipe.devAddress = -23;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.devAddress, '] getRawDescriptor ret : ', ret);
            expect(ret).assertEqual(undefined);
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamEx005 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetRawDescriptorParamEx005");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4300
     * @tc.name     : testGetFileDescriptorParamEx001
     * @tc.desc     : Negative test: pipe busNum add number 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptorParamEx001', 0, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetFileDescriptorParamEx001");
        try {
            let pipBusNum = gPipe.busNum + 1000;
            gPipe.busNum = pipBusNum;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.busNum, '] getFileDescriptor ret : ', ret);
            expect(ret).assertEqual(-1);
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamEx001 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetFileDescriptorParamEx001");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4400
     * @tc.name     : testGetFileDescriptorParamEx002
     * @tc.desc     : Negative test: pipe devAddress add number 10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptorParamEx002', 0, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetFileDescriptorParamEx002");
        try {
            let pipDevAdd = gPipe.devAddress + 10000;
            gPipe.devAddress = pipDevAdd;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.devAddress, '] getFileDescriptor ret : ', ret);
            expect(ret).assertEqual(-1);
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamEx002 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetFileDescriptorParamEx002");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4500
     * @tc.name     : testGetFileDescriptorParamEx003
     * @tc.desc     : Negative test: pipe busNum -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptorParamEx003', 0, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetFileDescriptorParamEx003");
        try {
            gPipe.busNum = -23;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.busNum, '] getFileDescriptor ret : ', ret);
            expect(ret).assertEqual(-1);
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamEx003 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetFileDescriptorParamEx003");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4600
     * @tc.name     : testGetFileDescriptorParamEx004
     * @tc.desc     : Negative test: pipe devAddress -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptorParamEx004', 0, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetFileDescriptorParamEx004");
        try {
            gPipe.devAddress = -23;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.devAddress, '] getFileDescriptor ret : ', ret);
            expect(ret).assertEqual(-1);
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamEx004 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetFileDescriptorParamEx004");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4700
     * @tc.name     : testGetFileDescriptorParamEx005
     * @tc.desc     : Negative test: pipe busNum -23, devAddress -23
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetFileDescriptorParamEx005', 0, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamEx005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testGetFileDescriptorParamEx005");
        try {
            gPipe.busNum = -23;
            gPipe.devAddress = -23;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [', gPipe.devAddress, '] getFileDescriptor ret : ', ret);
            expect(ret).assertEqual(-1);
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamEx005 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testGetFileDescriptorParamEx005");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4800
     * @tc.name     : testClaimInterfaceParamEx001
     * @tc.desc     : Negative test: interfaces id add 123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx001', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx001");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = tmpInterface.id + 123;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.id, '] claimInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx001 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx001");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_4900
     * @tc.name     : testClaimInterfaceParamEx002
     * @tc.desc     : Negative test: interfaces id -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx002', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx002");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = -1;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.id, '] claimInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx002 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx002");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5000
     * @tc.name     : testClaimInterfaceParamEx003
     * @tc.desc     : Negative test: pipe busNum add 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx003', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx003");
        try {
            gPipe.busNum = gPipe.busNum + 1000;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum, '] claimInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx003 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx003");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5100
     * @tc.name     : testClaimInterfaceParamEx004
     * @tc.desc     : Negative test: pipe busNum -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx004', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx004");
        try {
            gPipe.busNum = -1;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum, '] claimInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx004 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx004");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5200
     * @tc.name     : testClaimInterfaceParamEx005
     * @tc.desc     : Negative test: pipe devAddress add 10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx005', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx005");
        try {
            gPipe.devAddress = gPipe.devAddress + 10000;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.devAddress, '] claimInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx005 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx005");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5300
     * @tc.name     : testClaimInterfaceParamEx006
     * @tc.desc     : Negative test: pipe devAddress -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx006', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx006");
        try {
            gPipe.devAddress = -1;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.devAddress, '] claimInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx006 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx006");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5400
     * @tc.name     : testClaimInterfaceParamEx007
     * @tc.desc     : Negative test: pipe devAddress -1, busNum -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx007', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx007");
        try {
            gPipe.busNum = -1;
            gPipe.devAddress = -1;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum , ", ",gPipe.devAddress, '] claimInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx007 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx007");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5500
     * @tc.name     : testClaimInterfaceParamEx008
     * @tc.desc     : Negative test: interfaces protocol add 100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx008', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx008");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = tmpInterface.protocol + 100;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.protocol, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx008 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx008");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5600
     * @tc.name     : testClaimInterfaceParamEx009
     * @tc.desc     : Negative test: interfaces clazz add 100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx009', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx009");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = tmpInterface.clazz + 100;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.clazz, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx009 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx009");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5700
     * @tc.name     : testClaimInterfaceParamEx010
     * @tc.desc     : Negative test: interfaces name add 123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx010', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx010");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = tmpInterface.name + '123';
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx010 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx010");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5800
     * @tc.name     : testClaimInterfaceParamEx011
     * @tc.desc     : Negative test: interfaces name add @#
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx011', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx011");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = tmpInterface.name + '@#';
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx011 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx011");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_5900
     * @tc.name     : testClaimInterfaceParamEx012
     * @tc.desc     : Negative test: interfaces name add abc
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx012', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx012");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = tmpInterface.name + 'abc';
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx012 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx012");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6000
     * @tc.name     : testClaimInterfaceParamEx013
     * @tc.desc     : Negative test: interfaces name is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx013', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx013");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_NULLSTRING;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx013 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx013");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6100
     * @tc.name     : testClaimInterfaceParamEx014
     * @tc.desc     : Negative test: interfaces alternateSetting add 100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx014', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx014");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = tmpInterface.alternateSetting + 100;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.alternateSetting, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx014 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx014");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6200
     * @tc.name     : testClaimInterfaceParamEx015
     * @tc.desc     : Negative test: interfaces subClass add 100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamEx015', 0, function () {
        console.info(TAG, 'usb testClaimInterfaceParamEx015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testClaimInterfaceParamEx015");
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = tmpInterface.subClass + 100;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.subClass, '] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamEx015 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testClaimInterfaceParamEx015");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6300
     * @tc.name     : testSetConfigurationParamEx001
     * @tc.desc     : Negative test: configs id add 100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx001', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx001");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.id = tmpConfig.id + 100;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.id, '] setConfiguration ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx001 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx001");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6400
     * @tc.name     : testSetConfigurationParamEx002
     * @tc.desc     : Negative test: configs id is -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx002', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx002");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.id = -1;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.id, '] setConfiguration ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx002 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx002");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6500
     * @tc.name     : testSetConfigurationParamEx003
     * @tc.desc     : Negative test: configs name is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx003', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx003");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.name = PARAM_NULLSTRING;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.name, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx003 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx003");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6600
     * @tc.name     : testSetConfigurationParamEx004
     * @tc.desc     : Negative test: configs name add "123"
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx004', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx004");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.name = tmpConfig.name + "123";
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.name, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx004 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx004");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6700
     * @tc.name     : testSetConfigurationParamEx005
     * @tc.desc     : Negative test: configs name add "abc"
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx005', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx005");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.name = tmpConfig.name + "abc";
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.name, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx005 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx005");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6800
     * @tc.name     : testSetConfigurationParamEx006
     * @tc.desc     : Negative test: configs name add "@#"
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx006', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx006");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.name = tmpConfig.name + "@#";
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.name, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx006 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx006");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_6900
     * @tc.name     : testSetConfigurationParamEx007
     * @tc.desc     : Negative test: configs maxPower add 100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx007', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx007");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.maxPower = tmpConfig.maxPower + 100;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.maxPower, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx007 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx007");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7000
     * @tc.name     : testSetConfigurationParamEx008
     * @tc.desc     : Negative test: configs isRemoteWakeup is true
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx008', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx008");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.isRemoteWakeup = true;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.isRemoteWakeup, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx008 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx008");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7100
     * @tc.name     : testSetConfigurationParamEx009
     * @tc.desc     : Negative test: configs isRemoteWakeup is false
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx009', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx009");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.isRemoteWakeup = false;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.isRemoteWakeup, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx009 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx009");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7200
     * @tc.name     : testSetConfigurationParamEx010
     * @tc.desc     : Negative test: configs isSelfPowered is true
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx010', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx010");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.isSelfPowered = true;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.isSelfPowered, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx010 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx010");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7300
     * @tc.name     : testSetConfigurationParamEx011
     * @tc.desc     : Negative test: configs isSelfPowered is false
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetConfigurationParamEx011', 0, function () {
        console.info(TAG, 'usb testSetConfigurationParamEx011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetConfigurationParamEx011");
        try {
            let tmpConfig = devices.configs[0];
            tmpConfig.isSelfPowered = false;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [', tmpConfig.isSelfPowered, '] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamEx011 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe("testSetConfigurationParamEx011");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7400
     * @tc.name     : testSetInterfaceParamEx001
     * @tc.desc     : Negative test: pipe busNum add 1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx001', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx001");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.busNum = gPipe.busNum + 1000;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx001 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testSetInterfaceParamEx001", tmpInterface);
        toClosePipe("testSetInterfaceParamEx001");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7500
     * @tc.name     : testSetInterfaceParamEx002
     * @tc.desc     : Negative test: pipe devAddress add 10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx002', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx002");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.devAddress = gPipe.devAddress + 10000;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.devAddress, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx002 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testSetInterfaceParamEx002", tmpInterface);
        toClosePipe("testSetInterfaceParamEx002");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7600
     * @tc.name     : testSetInterfaceParamEx003
     * @tc.desc     : Negative test: pipe busNum is -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx003', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx003");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.busNum = -1;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx003 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testSetInterfaceParamEx003", tmpInterface);
        toClosePipe("testSetInterfaceParamEx003");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7700
     * @tc.name     : testSetInterfaceParamEx004
     * @tc.desc     : Negative test: pipe devAddress is -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx004', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx004");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.devAddress = -1;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.devAddress, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx004 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testSetInterfaceParamEx001", tmpInterface);
        toClosePipe("testSetInterfaceParamEx004");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7800
     * @tc.name     : testSetInterfaceParamEx005
     * @tc.desc     : Negative test: pipe devAddress -1, busNum -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx005', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx005");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.busNum = -1;
            gPipe.devAddress = -1;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum,', ', gPipe.devAddress, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx005 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testSetInterfaceParamEx005", tmpInterface);
        toClosePipe("testSetInterfaceParamEx005");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_7900
     * @tc.name     : testSetInterfaceParamEx006
     * @tc.desc     : Negative test: interface id +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx006', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx006");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.id = tmpInterface.id + 100;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.id, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx006 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx006", tmpInterface);
        toClosePipe("testSetInterfaceParamEx006");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8000
     * @tc.name     : testSetInterfaceParamEx007
     * @tc.desc     : Negative test: interface id -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx007', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx007");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.id = -1;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.id, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx007 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx007", tmpInterface);
        toClosePipe("testSetInterfaceParamEx007");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8100
     * @tc.name     : testSetInterfaceParamEx008
     * @tc.desc     : Negative test: interface protocol +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx008', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx008");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.protocol = tmpInterface.protocol + 100;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.protocol, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx008 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx008", tmpInterface);
        toClosePipe("testSetInterfaceParamEx008");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8200
     * @tc.name     : testSetInterfaceParamEx009
     * @tc.desc     : Negative test: interface protocol +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx009', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx009");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.protocol = tmpInterface.protocol + 100;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.protocol, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx009 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx009", tmpInterface);
        toClosePipe("testSetInterfaceParamEx009");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8300
     * @tc.name     : testSetInterfaceParamEx010
     * @tc.desc     : Negative test: interface clazz +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx010', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx010");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.clazz = tmpInterface.clazz + 100;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.clazz, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx010 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx010", tmpInterface);
        toClosePipe("testSetInterfaceParamEx010");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8400
     * @tc.name     : testSetInterfaceParamEx011
     * @tc.desc     : Negative test: interface subClass +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx011', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx011");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.subClass = tmpInterface.subClass + 100;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.subClass, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx011 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx011", tmpInterface);
        toClosePipe("testSetInterfaceParamEx011");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8500
     * @tc.name     : testSetInterfaceParamEx012
     * @tc.desc     : Negative test: interface alternateSetting +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx012', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx012");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.alternateSetting = tmpInterface.alternateSetting + 100;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.alternateSetting, '] setInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx012 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx012", tmpInterface);
        toClosePipe("testSetInterfaceParamEx012");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8600
     * @tc.name     : testSetInterfaceParamEx013
     * @tc.desc     : Negative test: interface name ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx013', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx013");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = PARAM_NULLSTRING;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx013 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx013", tmpInterface);
        toClosePipe("testSetInterfaceParamEx013");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8700
     * @tc.name     : testSetInterfaceParamEx014
     * @tc.desc     : Negative test: interface name +@#
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx014', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx014");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = tmpInterface.name + "@#";
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx014 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx014", tmpInterface);
        toClosePipe("testSetInterfaceParamEx014");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8800
     * @tc.name     : testSetInterfaceParamEx015
     * @tc.desc     : Negative test: interface name +123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx015', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx015");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = tmpInterface.name + "123";
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx015 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx015", tmpInterface);
        toClosePipe("testSetInterfaceParamEx015");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_8900
     * @tc.name     : testSetInterfaceParamEx016
     * @tc.desc     : Negative test: interface name +abc
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetInterfaceParamEx016', 0, function () {
        console.info(TAG, 'usb testSetInterfaceParamEx016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testSetInterfaceParamEx016");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = tmpInterface.name + "123";
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamEx016 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testSetInterfaceParamEx016", tmpInterface);
        toClosePipe("testSetInterfaceParamEx016");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9000
     * @tc.name     : testReleaseInterfaceParamEx001
     * @tc.desc     : Negative test: pipe busNum +1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx001', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx001");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.busNum = gPipe.busNum + 1000;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum, '] releaseInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx001 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testReleaseInterfaceParamEx001", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx001");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9100
     * @tc.name     : testReleaseInterfaceParamEx002
     * @tc.desc     : Negative test: pipe devAddress +10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx002', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx002");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.devAddress = gPipe.devAddress + 10000;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.devAddress, '] releaseInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx002 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testReleaseInterfaceParamEx002", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx002");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9200
     * @tc.name     : testReleaseInterfaceParamEx003
     * @tc.desc     : Negative test: pipe busNum -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx003', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx003");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.busNum = -1;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.busNum, '] releaseInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx003 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testReleaseInterfaceParamEx003", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx003");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9300
     * @tc.name     : testReleaseInterfaceParamEx004
     * @tc.desc     : Negative test: pipe devAddress +10000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx004', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx004");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            gPipe.devAddress = -1;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', gPipe.devAddress, '] releaseInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx004 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface("testReleaseInterfaceParamEx004", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx004");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9400
     * @tc.name     : testReleaseInterfaceParamEx005
     * @tc.desc     : Negative test: interface id +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx005', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx005");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.id = tmpInterface.id + 100;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.id, '] releaseInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx005 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx005", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx005");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9500
     * @tc.name     : testReleaseInterfaceParamEx006
     * @tc.desc     : Negative test: interface id -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx006', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx006");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.id = -1;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.id, '] releaseInterface ret : ', ret);
            expect(ret !== 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx006 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx006", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx006");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9600
     * @tc.name     : testReleaseInterfaceParamEx007
     * @tc.desc     : Negative test: interface name ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx007', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx007");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = PARAM_NULLSTRING;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx007 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx007", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx007");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9700
     * @tc.name     : testReleaseInterfaceParamEx008
     * @tc.desc     : Negative test: interface name +123
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx008', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx008");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = tmpInterface.name + "123";
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx008 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx008", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx008");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9800
     * @tc.name     : testReleaseInterfaceParamEx009
     * @tc.desc     : Negative test: interface name +abc
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx009', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx009");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = tmpInterface.name + "abc";
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx009 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx009", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx009");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_9900
     * @tc.name     : testReleaseInterfaceParamEx010
     * @tc.desc     : Negative test: interface name +@#
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx010', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx010");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.name = tmpInterface.name + "@#";
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.name, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx010 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx010", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx010");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0110
     * @tc.name     : testReleaseInterfaceParamEx011
     * @tc.desc     : Negative test: interface clazz +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx011', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx011");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.clazz = tmpInterface.clazz + 100;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.clazz, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx011 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx011", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx011");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0120
     * @tc.name     : testReleaseInterfaceParamEx012
     * @tc.desc     : Negative test: interface protocol +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx012', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx012");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.protocol = tmpInterface.protocol + 100;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.protocol, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx012 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx012", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx012");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0130
     * @tc.name     : testReleaseInterfaceParamEx013
     * @tc.desc     : Negative test: interface subClass +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx013', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx013");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.subClass = tmpInterface.subClass + 100;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.subClass, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx013 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx013", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx013");
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamEx_0140
     * @tc.name     : testReleaseInterfaceParamEx014
     * @tc.desc     : Negative test: interface alternateSetting +100
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReleaseInterfaceParamEx014', 0, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamEx014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe("testReleaseInterfaceParamEx014");
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
            expect(isClaim).assertEqual(0);
            tmpInterface.alternateSetting = tmpInterface.alternateSetting + 100;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [', tmpInterface.alternateSetting, '] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamEx014 catch err code: ', err);
            expect(err !== null).assertFalse();
        }
        gDeviceList = usbManager.getDevices();
        tmpInterface = gDeviceList[0].configs[0].interfaces[0];
        toReleaseInterface("testReleaseInterfaceParamEx014", tmpInterface);
        toClosePipe("testReleaseInterfaceParamEx014");
    })

})
}
