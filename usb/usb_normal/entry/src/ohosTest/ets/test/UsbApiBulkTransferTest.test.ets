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

import { beforeAll, afterAll, beforeEach, describe, it, expect } from "@ohos/hypium"
import usbMgr from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';

const TAG: string = "[UsbApiBulkTransferTest]";

export default function UsbApiBulkTransferTest() {
  
  describe('UsbApiBulkTransferTest', () => {
    let portCurrentMode = 0;
    let isDeviceConnected:boolean = false;
    let devices: usbMgr.USBDevice;
    let gPipe:gPipe = {
       'busNum': 0,
       'devAddress': 0
    }

    beforeAll( async (done: Function) => {
      console.log(TAG, '*************Usb Unit UsbApiParamErrJsunitTest Begin*************');
        // const Version = usbMgr.getVersion();
        // console.info(TAG, 'usb unit begin test getversion :' + Version);

        // version > 17  host currentMode = 2 device currentMode = 1
        let gDeviceList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        console.info(TAG, 'usb unit begin test getDevices **********', JSON.stringify(gDeviceList));
        isDeviceConnected = deviceConnected(gDeviceList);
        console.info(TAG, 'isDeviceConnected:', isDeviceConnected);
        if (isDeviceConnected) {
            let hasRight: boolean = usbMgr.hasRight(gDeviceList[0].name);
            if (!hasRight) {
                console.info(TAG, `beforeAll: usb requestRight start`);
                await getPermission(gDeviceList);
                CheckEmptyUtils.sleep(1000);
                await driveFn();
                CheckEmptyUtils.sleep(1000);
            }
        }
        done();
    })

    afterAll( ()=> {
      console.log('*************Usb Unit UsbApiBulkTransferTest End*************');
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
        let gDeviceList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        if (isDeviceConnected) {
            devices = gDeviceList[0];
            console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(gPipe));
        }

    })

     /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0100
     * @tc.name     : testUsbSubmitTransfer0100
     * @tc.desc     : bulk transfer write successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbBulkTransfer001', 0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbBulkTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbBulkTransfer001 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        handleUsbTransferCallback();
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices(); 
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        usbMgr.requestRight(device.name);
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('bulk testUsbBulkTransfer001 submitted.');
            expect(0).assertEqual(0);
            console.info(TAG, 'bulk testUsbBulkTransfer001 end');
        } catch (error) {
            expect(error.message).assertEqual('error');
            console.error('bulk write successfully:', error);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0200
     * @tc.name     : testUsbSubmitTransfer0200
     * @tc.desc     : bulk transfer read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbBulkTransfer002', 0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbBulkTransfer002 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbBulkTransfer002 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        handleUsbTransferCallback();
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices(); 
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        usbMgr.requestRight(device.name);
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 129, type, 2000, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('bulk testUsbBulkTransfer002 submitted.');
            expect(0).assertEqual(0);
            console.info(TAG, 'bulk testUsbBulkTransfer002 end');
        } catch (error) {
            expect(error.message).assertEqual('error');
            console.error('bulk write successfully:', error);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0100
     * @tc.name     : testUsbSubmitTransfer0300
     * @tc.desc     : bulk transfer error endpoint. IO error.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbBulkTransfer003', 0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbBulkTransfer003 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbBulkTransfer003 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        handleUsbTransferCallback();
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices(); 
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        usbMgr.requestRight(device.name);
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, -1, type, 2000, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('bulk testUsbBulkTransfer003 submitted.');
        } catch (error) {
            console.info(TAG, 'bulk testUsbBulkTransfer003 end');
            console.error('bulk transfer error endpoint:', error);
            expect(error.code == 14400012).assertTrue();
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_UsbCancelTransfer_Func_0100
     * @tc.name     : testUsbCancelTransfer0100
     * @tc.desc     : bulk transfer write cancel successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbBulkTransfer004', 0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbBulkTransfer004 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbBulkTransfer004 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        handleUsbTransferCallback();
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices(); 
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        usbMgr.requestRight(device.name);
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 0, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        usbMgr.usbSubmitTransfer(transferParams);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            console.info('bulk testUsbBulkTransfer004 submitted.');
            expect(0).assertEqual(0);
        } catch (error) {
            expect(error.message).assertEqual('error');
            console.info(TAG, 'bulk testUsbBulkTransfer004 end');
            console.error('bulk write cancel successfully:', error);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_UsbCancelTransfer_Func_0200
     * @tc.name     : testUsbCancelTransfer0200
     * @tc.desc     : bulk transfer read cancel successfully. 
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbBulkTransfer005', 0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbBulkTransfer005 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbBulkTransfer005 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        handleUsbTransferCallback();
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices(); 
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        usbMgr.requestRight(device.name);
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 129, type, 0, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        usbMgr.usbSubmitTransfer(transferParams);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            console.info('bulk testUsbBulkTransfer005 submitted.');
            expect(0).assertEqual(0);
        } catch (error) {
            expect(error.message).assertEqual('error');
            console.info(TAG, 'bulk testUsbBulkTransfer005 end');
            console.error('bulk write cancel successfully:', error);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_UsbCancelTransfer_ErrCode_0100
     * @tc.name     : testUsbCancelTransfer0100
     * @tc.desc     : bulk transfer write cancel failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbBulkTransfer006', 0, async (done: Function) => {
        console.info(TAG, 'bulk testUsbBulkTransfer006 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbBulkTransfer006 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        handleUsbTransferCallback();
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        usbMgr.requestRight(device.name);
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 500, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            console.info('bulk testUsbBulkTransfer006 submitted.');
        } catch (error) {
            console.info(TAG, 'bulk testUsbBulkTransfer006 end');
            console.error('bulk write cancel error:', error);
            expect(error.code).assertEqual(14400011);
        }
        done()
    });

  })

}

function deviceConnected(gDeviceList: Array<usbMgr.USBDevice>) {
    if (gDeviceList.length > 0) {
        console.info(TAG, "Test USB device is connected");
        return true;
    }
    console.info(TAG, "Test USB device is not connected");
    return false;
}

function getTransfersParam(gPipe: usbMgr.USBDevicePipe, endpointValue: number, typeValue: number, timeOutValue: number, callbackFun:() => void)
{
    let transferParams: usbMgr.UsbDataTransferParams = {
        devPipe: gPipe,
        flags: usbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK,
        endpoint: endpointValue,
        type: typeValue,
        timeout: timeOutValue,
        length: 10, 
        callback: callbackFun,
        userData: new Uint8Array(10),
        buffer: new Uint8Array(10),
        isoPacketCount: 2,
    };
    return transferParams;
}

function handleUsbTransferCallback() {
    console.info('USB Data Transfer Callback:003 ');
}

async function getPermission(gDeviceList: Array<usbMgr.USBDevice>) {
        console.info('**************getPermission**************');
        try {
            usbMgr.requestRight(gDeviceList[0].name).then(hasRight => {
            console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
            })
        } catch (err) {
            console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
            return
        }
}

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

export interface gPipe {
  busNum: number;
  devAddress: number;
}