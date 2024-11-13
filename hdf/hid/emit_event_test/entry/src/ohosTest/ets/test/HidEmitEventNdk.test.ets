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

import { describe, expect, beforeAll, afterAll, it } from '@ohos/hypium'
import hidEmitEvent from 'libhidemiteventndk.so'


const TAG: string = "[HidEmitEventTest]";
const DEVICE_NOSUPPORT_ERRINFO: string = "The device does not support or cannot find hid_ddk_service;";
const HID_DDK_INVALID_PARAMETER: number = 401;

function IsDevcieSupport(errCode: number, caseName: string) {
  if (errCode == -3) {
    console.info(TAG, `Test result ${caseName} : ${DEVICE_NOSUPPORT_ERRINFO}`);
    expect('undefined').assertEqual(DEVICE_NOSUPPORT_ERRINFO);
  }
}

export default function HidEmitEventTest() {
  describe('HidEmitEventTest', () => {

    beforeAll(async () => {
      console.log(TAG, '*************hid Unit HidEmitEventTest start*************');
    })

    afterAll(async () => {
      console.log(TAG, '*************hid Unit HidEmitEventTest end*************');
    })

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0100
     * @tc.name       : testHidCreateDevice0100
     * @tc.desc       : OH_Hid_CreateDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidCreateDevice0100', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidCreateDevice();
      console.info(TAG, "Test result testHidCreateDevice0100 : " + ret);
      IsDevcieSupport(ret, 'testHidCreateDevice0100');
      expect(ret >= 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0800
     * @tc.name       : testHidCreateDevice0200
     * @tc.desc       : OH_Hid_CreateDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidCreateDevice0200', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidCreateDeviceOne();
      console.info(TAG, "Test result testHidCreateDevice0200 : " + ret);
      IsDevcieSupport(ret, 'testHidCreateDevice0100');
      expect(ret == HID_DDK_INVALID_PARAMETER).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0900
     * @tc.name       : testHidCreateDevice0300
     * @tc.desc       : OH_Hid_CreateDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidCreateDevice0300', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidCreateDevice();
      console.info(TAG, "Test result testHidCreateDevice0300 : " + ret);
      IsDevcieSupport(ret, 'testHidCreateDevice0100');
      expect(ret == HID_DDK_INVALID_PARAMETER).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0200
     * @tc.name       : testHidEmitEventOne0100
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventOne0100', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventOne();
      console.info(TAG, "Test result testHidEmitEventOne0100 : " + ret);
      IsDevcieSupport(ret, 'testHidEmitEventOne0100');
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0300
     * @tc.name       : testHidEmitEventTwo0200
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventTwo0200', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventTwo();
      console.info(TAG, "Test result testHidEmitEventTwo0200 : " + ret);
      IsDevcieSupport(ret, 'testHidEmitEventTwo0200');
      expect(ret != 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0400
     * @tc.name       : testHidEmitEventThree0300
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventThree0300', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventThree();
      console.info(TAG, "Test result testHidEmitEventThree0300 : " + ret);
      IsDevcieSupport(ret, 'testHidEmitEventThree0300');
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0500
     * @tc.name       : testHidDestroyDeviceOne0100
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceOne0100', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceOne();
      console.info(TAG, "Test result testHidDestroyDeviceOne0100 : " + ret);
      IsDevcieSupport(ret, 'testHidDestroyDeviceOne0100');
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0600
     * @tc.name       : testHidDestroyDeviceTwo0200
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceTwo0200', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceTwo();
      console.info(TAG, "Test result testHidDestroyDeviceTwo0200 : " + ret);
      IsDevcieSupport(ret, 'testHidDestroyDeviceTwo0200');
      expect(ret != 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0700
     * @tc.name       : testHidDestroyDeviceThree0300
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceThree0300', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceThree();
      console.info(TAG, "Test result testHidDestroyDeviceThree0300 : " + ret);
      IsDevcieSupport(ret, 'testHidDestroyDeviceThree0300');
      expect(ret != 0).assertTrue();
      done()
    });

  })
}
