/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
export interface gPipe {
  busNum: number;
  devAddress: number;
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

const TAG: string = "[UsbApiInterruptTransferTest]";
function deviceConnected(gDeviceList: Array<usbMgr.USBDevice>) {
    if (gDeviceList.length > 0) {
        console.info(TAG, "Test USB device is connected");
        return true;
    }
    console.info(TAG, "Test USB device is not connected");
    return false;
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
        await sleep(1000);
        let button = await driver.findComponent(BY.text('允许'));
        console.info(TAG, `button is ${JSON.stringify(button)}`);
        await sleep(1000);
        await button.click();
    } catch (err) {
        console.info(TAG, 'err is ' + err);
        return;
    }
}

function getTransfersParam(gPipe: usbMgr.USBDevicePipe, endpointValue: number, typeValue: number, timeOutValue: number)
{
    let transferParams: usbMgr.UsbDataTransferParams = {
        devPipe: gPipe,
        flags: usbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK,
        endpoint: endpointValue,
        type: typeValue,
        timeout: timeOutValue,
        length: 10, 
        callback: () => {},
        userData: new Uint8Array(10),
        buffer: new Uint8Array(10),
        isoPacketCount: 2,
    };
    return transferParams;
}

export default function UsbApiInterruptTransferTest() {
  
  describe('UsbApiInterruptTransferTest', () => {
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
                await sleep(1000);
                await driveFn();
                await sleep(1000);
            }
        }
        done();
    })

    afterAll( ()=> {
        let gDeviceList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        usbMgr.removeRight(gDeviceList[0].name);
        console.log('*************Usb Unit UsbApiInterruptTransferTest End*************');
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
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0100
     * @tc.name     : testUsbSubmitTransfer001
     * @tc.desc     : interrupt transfer error endpoint.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer001', 0, async (done: Function) => {
        console.info(TAG, 'interrupt testUsbSubmitTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer001 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, -1, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('interrupt testUsbSubmitTransfer001 submitted.');
        } catch (error) {
            console.info(TAG, 'interrupt testUsbSubmitTransfer001 end');
            console.error('interrupt write successfully:', error);
            expect(error.code).assertEqual(14400012);
        }
        usbMgr.closePipe(devices);
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0200
     * @tc.name     : testUsbSubmitTransfer002
     * @tc.desc     : interrupt transfer write claimInterface no call. IO error.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer002', 0, async (done: Function) => {
        console.info(TAG, 'interrupt testUsbSubmitTransfer002 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer002 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('interrupt testUsbSubmitTransfer002 submitted.');
        } catch (error) {
            console.info(TAG, 'interrupt testUsbSubmitTransfer002 end');
            console.error('interrupt write IO error:', error);
            expect(error.code).assertEqual(14400012);
        }
        usbMgr.closePipe(devices);
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0100
     * @tc.name     : testUsbSubmitTransfer003
     * @tc.desc     : interrupt transfer read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer003', 0, async (done: Function) => {
        console.info(TAG, 'interrupt testUsbSubmitTransfer003 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer003 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 129, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            transferParams.callback=(err, data)=>{
                console.info(TAG, 'interrupt testUsbSubmitTransfer003 data =' +JSON.stringify(data));
                expect(data.status >= 0).assertTrue();
                usbMgr.closePipe(devices);
                done()
            }
            await usbMgr.usbSubmitTransfer(transferParams);
            console.info(TAG, 'interrupt testUsbSubmitTransfer003 end');
        } catch (error) {
            expect(error.message).assertEqual('error');
            console.error('interrupt write successfully:', error);
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_Func_0100
     * @tc.name     : testUsbCancelTransfer001
     * @tc.desc     : interrupt transfer read cancel successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3  
     */
    it('testUsbCancelTransfer001', 0, async (done: Function) => {
        console.info(TAG, 'interrupt testUsbCancelTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbCancelTransfer001 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let devicesList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        if (devicesList.length == 0) {
            console.info(`device list is empty`);
        }
        let device: usbMgr.USBDevice = devicesList[0];
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 129, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        usbMgr.usbSubmitTransfer(transferParams);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            console.info(TAG, 'interrupt testUsbCancelTransfer001 end');
        } catch (error) {
            console.error('interrupt write successfully:', error);
        }
        usbMgr.closePipe(devices);
        done()
    });

  })

}