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

const TAG: string = "[UsbApiIsochronousTransferTest]";
export interface gPipe {
  busNum: number;
  devAddress: number;
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
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

function deviceConnected(gDeviceList: Array<usbMgr.USBDevice>)
{
    if (gDeviceList.length > 0) {
        console.info(TAG, "Test USB device is connected");
        return true;
    }
    console.info(TAG, "Test USB device is not connected");
    return false;
}

function getTransfersParam(gPipe: usbMgr.USBDevicePipe, endpointValue: number, typeValue: number, timeOutValue: number)
{
    let transferParams: usbMgr.UsbDataTransferParams = {
        devPipe: gPipe,
        flags: usbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK,
        endpoint: endpointValue,
        type: typeValue,
        timeout: timeOutValue,
        length: 192,
        callback: () => {},
        userData: new Uint8Array(10),
        buffer: new Uint8Array(192),
        isoPacketCount: 2,
    };
    return transferParams;
}

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
        let gDeviceList: Array<usbMgr.USBDevice> = usbMgr.getDevices();
        console.info(TAG, 'usb unit begin test getDevices **********', JSON.stringify(gDeviceList));
        isDeviceConnected = deviceConnected(gDeviceList);
        console.info(TAG, 'isDeviceConnected:', isDeviceConnected);
        if (isDeviceConnected) {
            devices = gDeviceList[0];
            let hasRight: boolean = usbMgr.hasRight(devices.name);
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
      console.log('*************Usb Unit UsbApiIsochronousTransferTest End*************');
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
    })

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0100
     * @tc.name     : testUsbSubmitTransfer001
     * @tc.desc     : isochronous transfer write successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer001', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbSubmitTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer001 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        if (usbMgr.claimInterface(gPipe, tmpInterface, true) !== 0) {
              console.info(TAG, 'claimInterface error');
        }    
        if (usbMgr.setInterface(gPipe, tmpInterface) !== 0) {
              console.info(TAG, 'setInterface error');
        }    
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000);
        try {
            await usbMgr.usbSubmitTransfer(transferParams);
            console.info(TAG, 'Isochronous testUsbSubmitTransfer001 end');
            usbMgr.closePipe(devices);
            done()
        } catch (error) {
             expect(error.message).assertEqual('error');
            console.error('Isochronous write successfully:', error);
        }

    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0200
     * @tc.name     : testUsbSubmitTransfer002
     * @tc.desc     : isochronous transfer read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer002', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbSubmitTransfer002 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer002 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 130, type, 2000);
        if (usbMgr.claimInterface(gPipe, tmpInterface, true) !== 0) {
              console.info(TAG, 'claimInterface error');
        }    
        if (usbMgr.setInterface(gPipe, tmpInterface) !== 0) {
              console.info(TAG, 'setInterface error');
        }
        try {
            await usbMgr.usbSubmitTransfer(transferParams);
            console.info(TAG, 'Isochronous testUsbSubmitTransfer002 end');
            usbMgr.closePipe(devices);
            done()
        } catch (error) {
            console.error('Isochronous write successfully:', error);
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0100
     * @tc.name     : testUsbSubmitTransfer003
     * @tc.desc     : isochronous transfer error endpoint.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer003', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbSubmitTransfer003 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer003 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, -1, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('Isochronous testUsbSubmitTransfer003 submitted.');
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbSubmitTransfer003 end');
            console.error('isochronous error endpoint:', error);
            expect(error.code).assertEqual(401);
        }
        usbMgr.closePipe(devices);
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0200
     * @tc.name     : testUsbSubmitTransfer004
     * @tc.desc     : isochronous transfer write claimInterface no call. IO error.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer004', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbSubmitTransfer004 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer004 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            console.info('Isochronous testUsbSubmitTransfer004 submitted.');
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbSubmitTransfer004 end');
            console.error('isochronous write IO error:', error);
            expect(error.code).assertEqual(14400012);
        }
        usbMgr.closePipe(devices);
        done()
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_Func_0100
     * @tc.name     : testUsbCancelTransfer001
     * @tc.desc     : isochronous transfer cancel failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbCancelTransfer001', 0, async (done: Function) => {
        console.info(TAG, 'Isochronous testUsbCancelTransfer001 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbCancelTransfer001 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = usbMgr.connectDevice(devices);
        let tmpInterface: usbMgr.USBInterface = devices.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 1, type, 2000);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            console.info('Isochronous testUsbCancelTransfer001 submitted.');
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbCancelTransfer001 end');
            console.error('isochronous write cancel failed:', error);
            expect(error.code).assertEqual(14400011);
        }
        usbMgr.closePipe(devices);
        done()
    });

  })

}