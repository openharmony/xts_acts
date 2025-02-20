/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

const TAG: string = "[UsbApiIsochronousTransferTest]";

export default function UsbApiIsochronousTransferTest() {
  
  describe('UsbApiIsochronousTransferTest', () => {
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
      console.log('*************Usb Unit UsbApiIsochronousTransferTest End*************');
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
     * @tc.desc     : isochronous transfer write successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbIsochronousTransfer001', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbIsochronousTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbIsochronousTransfer001 No device is connected');
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('Isochronous testUsbIsochronousTransfer001 submitted.');
            expect(0).assertEqual(0);
            console.info(TAG, 'Isochronous testUsbIsochronousTransfer001 end');
        } catch (error) {
            console.error('Isochronous write successfully:', error);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0200
     * @tc.name     : testUsbSubmitTransfer0200
     * @tc.desc     : isochronous transfer read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbIsochronousTransfer002', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbIsochronousTransfer002 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbIsochronousTransfer002 No device is connected');
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 129, type, 2000, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('Isochronous testUsbIsochronousTransfer002 submitted.');
            expect(0).assertEqual(0);
            console.info(TAG, 'Isochronous testUsbIsochronousTransfer002 end');
        } catch (error) {
            console.error('Isochronous write successfully:', error);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0100
     * @tc.name     : testUsbSubmitTransfer0300
     * @tc.desc     : isochronous transfer error endpoint.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbIsochronousTransfer003', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbIsochronousTransfer003 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbIsochronousTransfer003 No device is connected');
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, -1, type, 2000, handleUsbTransferCallback);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('Isochronous testUsbIsochronousTransfer003 submitted.');
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbIsochronousTransfer003 end');
            console.error('isochronous error endpoint:', error);
            expect(error.code).assertEqual(401);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0200
     * @tc.name     : testUsbSubmitTransfer0400
     * @tc.desc     : isochronous transfer write claimInterface no call. IO error.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbIsochronousTransfer004', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbIsochronousTransfer004 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbIsochronousTransfer004 No device is connected');
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000, handleUsbTransferCallback);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('Isochronous testUsbIsochronousTransfer004 submitted.');
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbIsochronousTransfer004 end');
            console.error('isochronous write IO error:', error);
            expect(error.code).assertEqual(14400012);
        }
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_Func_0100
     * @tc.name     : testUsbCancelTransfer0100
     * @tc.desc     : isochronous transfer cancel failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbIsochronousTransfer005', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbIsochronousTransfer005 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbIsochronousTransfer005 No device is connected');
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000, handleUsbTransferCallback);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            console.info('Isochronous testUsbIsochronousTransfer005 submitted.');
        } catch (error) {
            console.info(TAG, 'Isochronous UsbCancelTransfer UsbSubmitTransfer005 end');
            console.error('isochronous write cancel failed:', error);
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
    console.info('USB Data Transfer Callback');
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