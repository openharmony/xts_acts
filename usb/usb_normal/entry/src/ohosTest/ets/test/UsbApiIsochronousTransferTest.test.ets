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

function getTransfersParam(gPipe: usbMgr.USBDevicePipe, flagsValue:number, endpointValue: number, typeValue: number, timeOutValue: number)
{
    let transferParams: usbMgr.UsbDataTransferParams = {
        devPipe: gPipe,
        flags: flagsValue,
        endpoint: endpointValue,
        type: typeValue,
        timeout: timeOutValue,
        length: 16,
        callback: () => {},
        userData: new Uint8Array(10),
        buffer: new Uint8Array(16),
        isoPacketCount: 1,
    };
    return transferParams;
}

interface Endprint {
    usbInterface: usbMgr.USBInterface | undefined,
    usbEndprint: usbMgr.USBEndpoint
}

function getEndprint(devices: usbMgr.USBDevice, direction: number, type: number): Endprint | undefined {
      let usbConfigs: usbMgr.USBConfiguration[] = devices.configs;
      let usbInterfaces: usbMgr.USBInterface[] = [];
      let usbInterface: usbMgr.USBInterface | undefined = undefined
      let usbEndpoints: usbMgr.USBEndpoint[] = [];
      let usbEndprint: usbMgr.USBEndpoint | undefined = undefined
      for (let i = 0; i < usbConfigs.length; i++) {
        usbInterfaces = usbConfigs[i].interfaces;
        for (let i = 0; i < usbInterfaces.length; i++) {
          usbEndpoints = usbInterfaces[i].endpoints;
          usbEndprint = usbEndpoints.find((value) => {
            return value.direction === direction
              && value.type === type;
          })
          if (usbEndprint !== undefined) {
            usbInterface = usbInterfaces[i];
            break;
          }
        }
      }
      if (usbEndprint === undefined) {
        console.error(`get usbEndprint error`)
        return undefined;
      }

      let endprint: Endprint = {
        usbInterface: usbInterface,
        usbEndprint: usbEndprint
      }
      return endprint
}

export default function UsbApiIsochronousTransferTest() {
  
  describe('UsbApiIsochronousTransferTest', () => {
    let isDeviceConnected:boolean = false;
    let devices: usbMgr.USBDevice;

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
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0200
     * @tc.name     : testUsbSubmitTransfer001
     * @tc.desc     : isochronous transfer read successfully.
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let endprint  = getEndprint(devices, 128, type)
        if (endprint === undefined || endprint.usbInterface === undefined || endprint.usbEndprint === undefined) {
            return
        }
        let usbInterface = endprint.usbInterface;
        let usbEndprint = endprint.usbEndprint;
        console.info('usbEndprint.address = ' + JSON.stringify(usbEndprint.address));

        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, usbEndprint.address, type, 2000);
        if (usbMgr.claimInterface(gPipe, usbInterface, true) !== 0) {
            console.info(TAG, 'claimInterface error');
        }
        if (usbMgr.setInterface(gPipe, usbInterface) !== 0) {
            console.info(TAG, 'setInterface error');
        }

        try {
            transferParams.callback = (err: Error, data: usbMgr.SubmitTransferCallback) => {
                console.info('data = ' + JSON.stringify(data));
                console.info('testUsbSubmitTransfer001 transfer success, result = ' + transferParams.buffer.toString());
                expect(data.isoPacketDescs[0].status == usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
                data.isoPacketDescs[0].status == usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
                usbMgr.closePipe(devices);
                done()
            }
            await usbMgr.usbSubmitTransfer(transferParams);
            console.info(TAG, 'Isochronous testUsbSubmitTransfer001 end');
        } catch (error) {
            expect().assertFail();
            console.error('Isochronous error:', error);
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_Func_0100
     * @tc.name     : testUsbSubmitTransfer002
     * @tc.desc     : isochronous transfer write successfully.
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let endprint  = getEndprint(devices, 0, type)
        if (endprint === undefined || endprint.usbInterface === undefined || endprint.usbEndprint === undefined) {
            return
        }
        let usbInterface = endprint.usbInterface;
        let usbEndprint = endprint.usbEndprint;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, usbEndprint.address, type, 2000);
        if (usbMgr.claimInterface(gPipe, usbInterface, true) !== 0) {
            console.info(TAG, 'claimInterface error');
        }
        if (usbMgr.setInterface(gPipe, usbInterface) !== 0) {
            console.info(TAG, 'setInterface error');
        }

        try {
            transferParams.callback = (err: Error, data: usbMgr.SubmitTransferCallback) => {
                console.info(TAG, 'Isochronous testUsbSubmitTransfer002 data =' + JSON.stringify(data));
                expect(data.isoPacketDescs[0].status == usbMgr.UsbTransferStatus.TRANSFER_COMPLETED).assertTrue();
                usbMgr.closePipe(devices);
                done();
            }
            await usbMgr.usbSubmitTransfer(transferParams);
            console.info(TAG, 'Isochronous testUsbSubmitTransfer002 end');
        } catch (error) {
            expect().assertFail();
            console.error('Isochronous error:', error);
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
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, -1, type, 2000);
        usbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbSubmitTransfer003 end');
            console.error('isochronous error endpoint:', error);
            expect(error.code).assertEqual(401);
            usbMgr.closePipe(devices);
            done()
        }
        
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0200
     * @tc.name     : testUsbSubmitTransfer004
     * @tc.desc     : isochronous transfer claimInterface no call. IO error.
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
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
        let endprint  = getEndprint(devices, 0, type)
        if (endprint === undefined || endprint.usbInterface === undefined || endprint.usbEndprint === undefined) {
            return
        }
        let usbInterface = endprint.usbInterface;
        let usbEndprint = endprint.usbEndprint;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, usbEndprint.address, type, 2000);
        
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbSubmitTransfer004 end');
            console.error('isochronous IO error:', error);
            expect(error.code).assertEqual(14400012);
            usbMgr.closePipe(devices);
            done()
        }

    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbSubmitTransfer_ErrCode_0300
     * @tc.name     : testUsbSubmitTransfer005
     * @tc.desc     : iso transfer No permission.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbSubmitTransfer005', 0, async (done: Function) => {
        console.info(TAG, 'iso testUsbSubmitTransfer005 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbSubmitTransfer005 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = {
            'busNum': 0,
            'devAddress': 0
        }

        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, 0 , 0, 0);
        try {
            usbMgr.usbSubmitTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'iso testUsbSubmitTransfer005 end');
            console.error('iso cancel error:', error);
            expect(error.code).assertEqual(14400001);
            usbMgr.closePipe(devices);
            done()
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_usbCancelTransfer_ErrCode_0100
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
        let flags: number = 0;
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 1, type, 0);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'Isochronous testUsbCancelTransfer001 end');
            console.error('isochronous cancel failed:', error);
            expect(error.code).assertEqual(14400011);
            usbMgr.closePipe(devices);
            done()
        }
    });

    /**
     * @tc.number   : SUB_USB_Host_JS_UsbCancelTransfer_ErrCode_0200
     * @tc.name     : testUsbCancelTransfer002
     * @tc.desc     : isochronous transfer No permission.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbCancelTransfer002', 0, async (done: Function) => {
        console.info(TAG, 'isochronous testUsbCancelTransfer002 enter');
        if (!isDeviceConnected) {
			console.info(TAG, 'usb testUsbCancelTransfer002 No device is connected');
            expect(isDeviceConnected).assertFalse();
            done()
            return
        }
        let gPipe: usbMgr.USBDevicePipe = {
            'busNum': 0,
            'devAddress': 0
        }

        let transferParams: usbMgr.UsbDataTransferParams = getTransfersParam(gPipe, 0, 0 , 0, 0);
        try {
            usbMgr.usbCancelTransfer(transferParams);
            expect().assertFail();
        } catch (error) {
            console.info(TAG, 'isochronous testUsbCancelTransfer002 end');
            console.error('isochronous cancel error:', error);
            expect(error.code).assertEqual(14400001);
            usbMgr.closePipe(devices);
            done()
        }
    });

  })

}