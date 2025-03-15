/*
 * Copyright (C) 2023-2025 Huawei Device Co., Ltd.
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

import deviceManager from '@ohos.driver.deviceManager'
import usbManager from '@ohos.usbManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function DeviceManagerJsTest(){
describe("DeviceManagerJsTest", function () {

    let deviceList;
    let isDeviceConnected;
    let qDeviceList;
    const PARAM_NULL = null;
    const TAG = '[DeviceManagerJsTest]';

    function deviceConnected() {
        if (deviceList.length > 0) {
            console.info(TAG, "Test USB device is connected");
            return true;
        }
        console.info(TAG, "Test USB device is not connected");
        return false;
    }

    function callback(data) {
        console.info(TAG, "callback" + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual("number");
    }

    function callback2() {
        console.info(TAG, "callback2" + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual("number");
    }

    beforeAll(function() {
        console.info(TAG, 'beforeAll called');
        try {
            deviceList = usbManager.getDevices();
            console.info(TAG, 'beforeAll getDevices ', JSON.stringify(deviceList));
        } catch (err) {
            console.info(TAG, 'beforeAll getDevices failed, catch error is : ' + err);
        }
        isDeviceConnected = deviceConnected();
        if (isDeviceConnected) {
            try {
                qDeviceList = deviceManager.queryDevices(deviceManager.BusType.USB);
                console.info(TAG, 'beforeAll queryDevices ', JSON.stringify(qDeviceList));
            } catch(err) {
                console.info(TAG, 'beforeAll queryDevices failed, catch error is : ' + err);
            }
        }
    })

    afterAll(function() {
        console.info(TAG, 'afterAll called')
    })

    beforeEach(function() {
        console.info(TAG, 'beforeEach called')
    })

    afterEach(function() {
        console.info(TAG, 'afterEach called')
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0100
     * @tc.name       : testQueryDevices001
     * @tc.desc       : verify queryDevice result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testQueryDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info(TAG, '----------------------testQueryDevices001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices(deviceManager.BusType.USB);
            console.info(TAG, 'Test case testQueryDevices001 devices :' + JSON.stringify(devices));
            expect(devices != null).assertEqual(true);
            expect(devices[0] != null).assertEqual(true);
            expect(devices[0].deviceId != null).assertEqual(true);
            expect(devices[0].description != null).assertEqual(true);
            expect(devices[0].vendorId != null).assertEqual(true);
            expect(devices[0].productId != null).assertEqual(true);
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices001 catch err :' + err);
            expect().assertFail();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0200
     * @tc.name       : testQueryDevices002
     * @tc.desc       : verify queryDevice no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testQueryDevices002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevices002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices();
            console.info(TAG, 'Test case testQueryDevices002 ret : ', JSON.stringify(devices));
            expect(devices != null).assertTrue();
            expect(devices[0].deviceId != null).assertTrue();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices002 catch err : ', err);
            expect().assertFail();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_2000
     * @tc.name       : testQueryDevices004
     * @tc.desc       : verify queryDevice param is 12345
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testQueryDevices004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevices004---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices(12345);
            console.info(TAG, 'Test case testQueryDevices004 ret : ', JSON.stringify(devices));
            expect(devices.length == 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices004 catch err : ', err);
            expect().assertFail();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_2100
     * @tc.name       : testQueryDevices005
     * @tc.desc       : verify queryDevice errcode 22900001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testQueryDevices005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevices005---------------------------');
        if (isDeviceConnected) {
            expect(isDeviceConnected).assertTrue();
            return
        }
        try {
            let devices = deviceManager.queryDevices();
            console.info(TAG, 'Test case testQueryDevices005 ret : ', JSON.stringify(devices));
            expect().assertFail();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices005 catch err : ', err);
            expect(err.code).assertEqual(22900001);
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0300
     * @tc.name       : testBindDevicesCallBack001
     * @tc.desc       : verify bindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDevicesCallBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesCallBack001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice('fakeid', (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack001 ret : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack001 ret : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesCallBack001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0400
     * @tc.name       : testBindDevicesCallBack002
     * @tc.desc       : verify bindDevice any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDevicesCallBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesCallBack002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesCallBack002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0500
     * @tc.name       : testBindDeviceDriverCallBack001
     * @tc.desc       : verify bindDeviceDriver any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDeviceDriverCallBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverCallBack001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(12345, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverCallBack001 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1700
     * @tc.name       : testBindDeviceDriverCallBack002
     * @tc.desc       : verify bindDeviceDriver param is string
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDeviceDriverCallBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverCallBack002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver('fakeid', (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverCallBack002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0600
     * @tc.name       : testBindDevicesPromise001
     * @tc.desc       : verify bindDevice invalid param count
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDevicesPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice();
            console.info(TAG, 'Test case testBindDevicesPromise001 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0700
     * @tc.name       : testBindDevicesPromise002
     * @tc.desc       : verify bindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDevicesPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345);
            console.info(TAG, 'Test case testBindDevicesPromise002 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0800
     * @tc.name       : testBindDevicesPromise003
     * @tc.desc       : verify bindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDevicesPromise003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise003---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345, 23456);
            console.info(TAG, 'Test case testBindDevicesPromise003 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise003 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0900
     * @tc.name       : testBindDevicesPromise004
     * @tc.desc       : verify bindDevice promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDevicesPromise004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise004---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice('fakeid', (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDevicesPromise004 then fail', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise004 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1000
     * @tc.name       : testBindDevicesPromise005
     * @tc.desc       : verify bindDevice promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDevicesPromise005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise005---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345, (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDevicesPromise005 then fail', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise005 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1100
     * @tc.name       : testBindDeviceDriverPromise001
     * @tc.desc       : verify bindDeviceDriver promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testBindDeviceDriverPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverPromise001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(qDeviceList[0].deviceId, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise001 data', data);
                expect(data != null).assertTrue();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise001 then data', data);
                let remoteDeviceDriver = data;
                expect(remoteDeviceDriver.deviceId != null).assertTrue();
                expect(remoteDeviceDriver.remote != null).assertTrue();
                done();
            }, error => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise001 then error', error);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverPromise001 catch error : ', error);
            console.info(TAG, 'Test case fail, There is no driver for the corresponding device');
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1800
     * @tc.name       : testBindDeviceDriverPromise002
     * @tc.desc       : verify bindDeviceDriver promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDeviceDriverPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverPromise002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(12345, (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise002 then fail', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverPromise002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1900
     * @tc.name       : testBindDeviceDriverPromise003
     * @tc.desc       : verify bindDeviceDriver promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBindDeviceDriverPromise003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverPromise003---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver('fakeid', (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise003 then fail: ', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverPromise003 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1200
     * @tc.name       : testUnbindDevicesCallBack001
     * @tc.desc       : verify unbindDevice any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testUnbindDevicesCallBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesCallBack001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice('fakeid', (error, data) => {
                console.info(TAG, 'Test case testUnbindDevicesCallBack001 error : ', error, ',data : ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesCallBack001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1300
     * @tc.name       : testUnbindDevicesCallBack002
     * @tc.desc       : verify unbindDevice any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUnbindDevicesCallBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesCallBack002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(12345, (error, data) => {
                console.info(TAG, 'Test case testUnbindDevicesCallBack002 error : ', error, ',data : ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesCallBack002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1400
     * @tc.name       : testUnbindDevicesPromise001
     * @tc.desc       : verify unbindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testUnbindDevicesPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesPromise001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice();
            console.info(TAG, 'Test case testUnbindDevicesPromise001 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesPromise001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1500
     * @tc.name       : testUnbindDevicesPromise002
     * @tc.desc       : verify unbindDevice promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testUnbindDevicesPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesPromise002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(12345).then(data => {
                console.info(TAG, 'Test case testUnbindDevicesPromise002 data : ', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesPromise002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })
})
}
