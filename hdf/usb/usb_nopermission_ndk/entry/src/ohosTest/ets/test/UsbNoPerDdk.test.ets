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

import { beforeAll, describe, it, expect } from "@ohos/hypium"
import usbNoPerDdk from 'libusbddkndk.so'
import deviceManager from "@ohos.driver.deviceManager";


export default function usbNoPerDdkTest() {
  let deviceId: number = -1;

  describe('usbNoPerDdkTest', () => {

    const TAG: string = "[usbNoPerDdkTest]";
    const DDK_ERR_NOPERM: number = -19;
    const USB_DDK_FAILED: number = -1;

    beforeAll(async () => {
      try {
        let devices: Array<deviceManager.Device> = deviceManager.queryDevices(deviceManager.BusType.USB);
        for (let item of devices) {
          let device: deviceManager.USBDevice = item as deviceManager.USBDevice;
          deviceId = device.deviceId;
          console.info(TAG, `Device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(TAG, `Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
    })

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0100
     * @tc.name       : testUsbInitNoPer001
     * @tc.desc       : OH_Usb_Init Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbInitNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbInitNoPer001---------------------------');
      try {
        const ret = usbNoPerDdk.usbInit();
        console.info(TAG, "Test Result testUsbInitNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbInitNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0200
     * @tc.name       : testUsbReleaseNoPer001
     * @tc.desc       : OH_Usb_Release Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbReleaseNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbInitNoPer001---------------------------');
      try {
        const ret = usbNoPerDdk.usbRelease();
        console.info(TAG, "Test Result testUsbReleaseNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbReleaseNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0300
     * @tc.name       : testUsbGetDeviceDescriptorNoPer001
     * @tc.desc       : OH_Usb_GetDeviceDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetDeviceDescriptorNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbGetDeviceDescriptorNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbGetDeviceDescriptor(deviceId);
        console.info(TAG, "Test Result testUsbGetDeviceDescriptorNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetDeviceDescriptorNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0400
     * @tc.name       : testUsbGetConfigDescriptorNoPer001
     * @tc.desc       : OH_Usb_GetConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetConfigDescriptorNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbGetConfigDescriptorNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbGetConfigDescriptor(deviceId);
        console.info(TAG, "Test Result testUsbGetConfigDescriptorNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetConfigDescriptorNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0500
     * @tc.name       : testUsbFreeConfigDescriptorNoPer001
     * @tc.desc       : OH_Usb_FreeConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbFreeConfigDescriptorNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbFreeConfigDescriptorNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbFreeConfigDescriptor(deviceId);
        console.info(TAG, "Test Result testUsbFreeConfigDescriptorNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbFreeConfigDescriptorNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0600
     * @tc.name       : testUsbClaimInterfaceNoPer001
     * @tc.desc       : OH_Usb_ClaimInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbClaimInterfaceNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbClaimInterfaceNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbClaimInterface(deviceId);
        console.info(TAG, "Test Result testUsbClaimInterfaceNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbClaimInterfaceNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0700
     * @tc.name       : testUsbReleaseInterfaceNoPer001
     * @tc.desc       : OH_Usb_ReleaseInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbReleaseInterfaceNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbReleaseInterfaceNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbReleaseInterface(deviceId);
        console.info(TAG, "Test Result testUsbReleaseInterfaceNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbReleaseInterfaceNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0800
     * @tc.name       : testUsbSelectInterfaceSettingNoPer001
     * @tc.desc       : OH_Usb_SelectInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSelectInterfaceSettingNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSelectInterfaceSettingNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSelectInterfaceSetting(deviceId);
        console.info(TAG, "Test Result testUsbSelectInterfaceSettingNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSelectInterfaceSettingNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0900
     * @tc.name       : testUsbGetCurrentInterfaceSettingNoPer001
     * @tc.desc       : OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetCurrentInterfaceSettingNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbGetCurrentInterfaceSettingNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbGetCurrentInterfaceSetting(deviceId);
        console.info(TAG, "Test Result testUsbGetCurrentInterfaceSettingNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetCurrentInterfaceSettingNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1000
     * @tc.name       : testUsbSendControlReadRequestNoPer001
     * @tc.desc       : OH_Usb_SendControlReadRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendControlReadRequestNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendControlReadRequestNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendControlReadRequest(deviceId);
        console.info(TAG, "Test Result testUsbSendControlReadRequestNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendControlReadRequestNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1100
     * @tc.name       : testUsbSendControlWriteRequestNoPer001
     * @tc.desc       : OH_Usb_SendControlWriteRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendControlWriteRequestNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendControlWriteRequestNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendControlWriteRequest(deviceId);
        console.info(TAG, "Test Result testUsbSendControlWriteRequestNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendControlWriteRequestNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1200
     * @tc.name       : testUsbSendPipeRequestNoPer001
     * @tc.desc       : OH_Usb_SendPipeRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequestNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendPipeRequestNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendPipeRequest(deviceId);
        console.info(TAG, "Test Result testUsbSendPipeRequestNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1300
     * @tc.name       : testUsbCreateDeviceMemMapNoPer001
     * @tc.desc       : OH_Usb_CreateDeviceMemMap Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     /* @tc.level      : Level 0/
     */
    it('testUsbCreateDeviceMemMapNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbCreateDeviceMemMapNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbCreateDeviceMemMap(deviceId);
        console.info(TAG, "Test Result testUsbCreateDeviceMemMapNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbCreateDeviceMemMapNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1400
     * @tc.name       : testUsbDestroyDeviceMemMapNoPer001
     * @tc.desc       : OH_Usb_DestroyDeviceMemMap Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbDestroyDeviceMemMapNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbDestroyDeviceMemMapNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbDestroyDeviceMemMap(deviceId);
        console.info(TAG, "Test Result testUsbDestroyDeviceMemMapNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbDestroyDeviceMemMapNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

     /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1500
     * @tc.name       : testUsbSendPipeRequestWithAshmemNoPer001
     * @tc.desc       : OH_Usb_SendPipeRequestWithAshmem Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequestWithAshmemNoPer001', 0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendPipeRequestWithAshmemNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendPipeRequestWithAshmem(deviceId);
        console.info(TAG, "Test Result testUsbSendPipeRequestWithAshmemNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestWithAshmemNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

  })
}
