/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterEach,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ResmgrTest() {

  describe("ResmgrTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start ResmgrTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      resContext = abilityDelegator.getAppContext()
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_0700
    * @tc.name    getStringArrayValue_test_static_003
    * @tc.desc    test getStringArray method in callback mode
    */
    it('getStringArrayValue_test_static_003', Level.LEVEL0, async (): Promise<void> => {
      res.getStringArrayValue(0x200000A, (err: BusinessError<void> | null, value: Array<string> | undefined) => {
        expect(value !== null).assertTrue();
        if (value != null) {
          console.log('getStringArrayValue_test_static_003 ' + value);
          console.log('getStringArrayValue_test_static_003 ' + value.length);
          console.log('getStringArrayValue_test_static_003 ' + value[0]);
          expect(value?.length).assertEqual(4);
          let str0: string = value[0];
          let str1: string = value[1];
          let str2: string = value[2];
          let str3: string = value[3];
          expect(str0).assertEqual('small');
          expect(str1).assertEqual('middle');
          expect(str2).assertEqual('large');
          expect(str3).assertEqual('extra large');
        } else {
          console.log('getStringArrayValue_test_static_003 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_0800
    * @tc.name    getStringArrayValue_test_static_004
    * @tc.desc    test getStringArray method in promise mode
    */
    it('getStringArrayValue_test_static_004', Level.LEVEL0, async (): Promise<void> => {
      res.getStringArrayValue(0x200000A).then((value: string[]) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayValue_test_static_004 ' + value);
        console.log('getStringArrayValue_test_static_004 ' + value.length);
        console.log('getStringArrayValue_test_static_004 ' + value[0]);
        expect(value.length).assertEqual(4);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_0900
     * @tc.name    getMediaContent_test_static_003
     * @tc.desc    test getMedia method in callback mode
    */
    it('getMediaContent_test_static_003', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaContent(0x01000001, (err: BusinessError<void> | null, value: Uint8Array | undefined) => {
        if (value?.length) {
          console.log('getMediaContent_test_static_003 ' + value?.length);
          expect(true).assertTrue();
        } else {
          console.log('getMediaContent_test_static_003 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1000
     * @tc.name    getMediaContent_test_static_004
     * @tc.desc    test getMedia method in promise mode
    */
    it('getMediaContent_test_static_004', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaContent(0x200001C).then((value: string): void => {
        console.log('getMediaContent_test_static_004 ' + value.length);
        expect(value.length > 0).assertTrue();
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1100
     * @tc.name    getMediaContentBase64_test_static_003
     * @tc.desc    test getMediaBase64 method in callback mode
    */
    it('getMediaContentBase64_test_static_003', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaContentBase64(0x01000001, (err: BusinessError<void> | null, value: string | undefined) => {
        if (value?.length) {
          console.log('getMediaContentBase64_test_static_003 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaContentBase64_test_static_003 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1200
     * @tc.name    getMediaContentBase64_test_static_004
     * @tc.desc    test getMediaBase64 method in promise mode
    */
    it('getMediaContentBase64_test_static_004', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaContentBase64(0x200001C).then(value => {
        expect(value.length > 0).assertTrue();
      })
    })

    /* *
     * @tc.number  getConfiguration_test_static_002
     * @tc.name    getConfiguration_test_static_002
     * @tc.desc    test getConfiguration method in promise mode
     */
    it('getConfiguration_test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getConfiguration_test_static_002 0');
      expect(resourceManager.Direction.DIRECTION_HORIZONTAL == 1).assertTrue();
      console.log('getConfiguration_test_static_002 1');
      done();
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1400
     * @tc.name  getConfiguration_test_static_003
     * @tc.desc    test getConfiguration method in promise mode
   */
    it('getConfiguration_test_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getConfiguration_test_static_003 0');
      expect(resourceManager.Direction.DIRECTION_VERTICAL == 0).assertTrue();
      console.log('getConfiguration_test_static_003 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_002
     * @tc.name    getDeviceCapability_test_static_002
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_002 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_PHONE == 0).assertTrue();
      console.log('getDeviceCapability_test_static_002 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_003
     * @tc.name    getDeviceCapability_test_static_003
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_003 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_TABLET == 1).assertTrue();
      console.log('getDeviceCapability_test_static_003 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_004
     * @tc.name    getDeviceCapability_test_static_004
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_004 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_CAR == 2).assertTrue();
      console.log('getDeviceCapability_test_static_004 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_005
     * @tc.name    getDeviceCapability_test_static_005
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_005 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_PC == 3).assertTrue();
      console.log('getDeviceCapability_test_static_005 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_006
     * @tc.name    getDeviceCapability_test_static_006
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_006 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_TV == 4).assertTrue();
      console.log('getDeviceCapability_test_static_006 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_007
     * @tc.name    getDeviceCapability_test_static_007
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_007 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE == 6).assertTrue();
      console.log('getDeviceCapability_test_static_007 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_017
     * @tc.name    getDeviceCapability_test_static_017
     * @tc.desc    test getDeviceCapability method in promise mode
     */
    it('getDeviceCapability_test_static_017', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_017 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_2IN1 == 7).assertTrue();
      console.log('getDeviceCapability_test_static_017 1');
      done();
    })

    /* *
        * @tc.number  getScreenDensity_test_static_002
        * @tc.name    getScreenDensity_test_static_002
        * @tc.desc    test getDeviceCapability method in promise mode
       */
    it('getScreenDensity_test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_002 0');
      expect(resourceManager.ScreenDensity.SCREEN_SDPI == 120).assertTrue();
      console.log('getScreenDensity_test_static_002 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_003
     * @tc.name    getScreenDensity_test_static_003
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_003 0');
      expect(resourceManager.ScreenDensity.SCREEN_MDPI == 160).assertTrue();
      console.log('getScreenDensity_test_static_003 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_004
     * @tc.name    getScreenDensity_test_static_004
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_004 0');
      expect(resourceManager.ScreenDensity.SCREEN_LDPI == 240).assertTrue();
      console.log('getScreenDensity_test_static_004 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_005
     * @tc.name    getScreenDensity_test_static_005
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_005 0');
      expect(resourceManager.ScreenDensity.SCREEN_XLDPI == 320).assertTrue();
      console.log('getScreenDensity_test_static_005 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_006
     * @tc.name    getScreenDensity_test_static_006
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_006 0');
      expect(resourceManager.ScreenDensity.SCREEN_XXLDPI == 480).assertTrue();
      console.log('getScreenDensity_test_static_006 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_007
     * @tc.name    getScreenDensity_test_static_007
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_007 0');
      expect(resourceManager.ScreenDensity.SCREEN_XXXLDPI == 640).assertTrue();
      console.log('getScreenDensity_test_static_007 1');
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_Static_2000
    * @tc.name    getRawFd_test_static_001
    * @tc.desc    test getRawFileDescriptor method in callback mode
    */
    it('getRawFd_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res.getRawFd('rawfiletest.xml',
        (error: BusinessError<void> | null, rawfile: resourceManager.RawFileDescriptor | undefined) => {
          let fdValue = rawfile?.fd;
          let offsetValue = rawfile?.offset;
          let lengthValue = rawfile?.length;
          expect(rawfile !== null).assertTrue();
          console.log('getRawFd_test_static_001--'
            + 'fd:' + fdValue
            + ' offset:' + offsetValue
            + ' length:' + lengthValue);
        })
    })

    /* *
    * @tc.number  getRawFd_test_static_002
    * @tc.name    getRawFd_test_static_002
    * @tc.desc    test getRawFileDescriptor method in promise mode
    */
    it('getRawFd_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res.getRawFd('rawfiletest.xml').then((rawfile: resourceManager.RawFileDescriptor): void => {
        rawfile.fd = 2000;
        rawfile.offset = 20;
        rawfile.length = 200;
        expect(rawfile !== null).assertTrue();
        console.log('getRawFd_test_static_002--' + rawfile);
        console.log('getRawFd_test_static_002--'
          + 'fd:' + rawfile.fd
          + ' offset:' + rawfile.offset
          + ' length:' + rawfile.length);
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2400
     * @tc.name    getStringByName_test_static_001
     * @tc.desc    test getStringByName method in callback mode
     */
    it('getStringByName_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res.getStringByName('app_name').then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringByName_test_static_001 ' + value);
        expect(value).assertEqual('resmgr');
      })
    })

    /* *
      * @tc.number  getStringByName_test_static_002
      * @tc.name    getStringByName_test_static_002
      * @tc.desc    test getString method in promise mode
      */
    it('getStringByName_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res.getStringByName('app_name').then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringByName_test_static_002 ' + value);
        expect(value).assertEqual('resmgr');
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2600
     * @tc.name    getStringArrayByName_test_static_001
     * @tc.desc    test getStringArrayByName method in callback mode
     */
    it('getStringArrayByName_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res.getStringArrayByName('sizeList', (err: BusinessError<void> | null, value: Array<string> | undefined) => {
        expect(value !== null).assertTrue();
        if (value != null) {
          console.log('getStringArrayByName_test_static_001 ' + value);
          console.log('getStringArrayByName_test_static_001 ' + value?.length);
          console.log('getStringArrayByName_test_static_001 ' + value[0]);
          expect(value?.length).assertEqual(4);
          let str0: string = value[0];
          let str1: string = value[1];
          let str2: string = value[2];
          let str3: string = value[3];
          expect(str0).assertEqual('small');
          expect(str1).assertEqual('middle');
          expect(str2).assertEqual('large');
          expect(str3).assertEqual('extra large');
        } else {
          console.log('getStringArrayByName_test_static_001 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2700
    * @tc.name    getStringArrayByName_test_static_002
    * @tc.desc    test getStringArrayByName method in promise mode
    */
    it('getStringArrayByName_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res.getStringArrayByName('sizeList').then((value: string[]) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayByName_test_static_002 ' + value);
        console.log('getStringArrayByName_test_static_002 ' + value.length);
        console.log('getStringArrayByName_test_static_002 ' + value[0]);
        expect(value.length).assertEqual(4);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2000
    * @tc.name    getMediaBase64ByName_test_static_001
    * @tc.desc    test getMediaBase64ByName method in callback mode
    */
    it('getMediaBase64ByName_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaBase64ByName('background', (err: BusinessError<void> | null, value: string | undefined) => {
        if (value?.length) {
          console.log('getMediaBase64ByName_test_static_001 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaBase64ByName_test_static_001 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2100
     * @tc.name    getMediaBase64ByName_test_static_002
     * @tc.desc    test getMediaBase64ByName method in promise mode
     */
    it('getMediaBase64ByName_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaBase64ByName('icon').then((value: string): void => {
        expect(value.length > 0).assertTrue();
        console.log('getMediaBase64ByName_test_static_002 ' + value);
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0300
    * @tc.name    getMediaBase64ByName_test_static_0100
    * @tc.desc    test getMediaBase64ByName method in callback mode with density
   */
    it('getMediaBase64ByName_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaBase64ByName('background', 0, (err: BusinessError<void> | null, value: string | undefined) => {
        if (value?.length) {
          console.log('getMediaBase64ByName_test_static_0100 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaBase64ByName_test_static_0100 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0600
     * @tc.name    getMediaContent_test_static_0200
     * @tc.desc    test getMediaContent method in promise mode with density
    */
    it('getMediaContent_test_static_0200', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaContent(0x01000001, 0).then((value: string): void => {
        console.log('getMediaContent_test_static_0200 ' + value);
        expect(value.length > 0).assertTrue();
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0500
     * @tc.name    getMediaContent_test_static_0100
     * @tc.desc    test getMediaContent method in callback mode with density
    */
    it('getMediaContent_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaContent(0x01000001, 0, (err: BusinessError<void> | null, value: Uint8Array | undefined) => {
        if (value?.length) {
          console.log('getMediaContent_test_static_0100 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaContent_test_static_0100 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0800
     * @tc.name    getMediaContentBase64_test_static_0200
     * @tc.desc    test getMediaContentBase64 method in promise mode with density
    */
    it('getMediaContentBase64_test_static_0200', Level.LEVEL0, async (): Promise<void> => {
      res.getMediaContentBase64(0x01000001, 0).then((value: string): void => {
        console.log('getMediaContentBase64_test_static_0200 ' + value);
        expect(value.length > 0).assertTrue();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETSYSTEMRESOURCEMANAGER_JS_static_0100
    * @tc.name    getSystemResourceManager_test_static_0100
    * @tc.desc    test getSystemResourceManager method
    */
    it('getSystemResourceManager_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = resourceManager.getSystemResourceManager();
      hilog.info(0x0000, 'testTag', '%{public}s', 'getSystemResourceManager_test_static_0100 ' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /* *
      * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0100
      * @tc.name    getColor_test_static_0100
      * @tc.desc    test getColor method in callback mode
      */
    it('getColor_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      res.getColor(0x2000010, (err: BusinessError<void> | null, value: number | undefined) => {
        expect(value !== null).assertTrue();
        console.log('getColor_test_static_001 ' + value);
        expect(value).assertEqual(-1);
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0100
    * @tc.name    getColorByName_test_static_0100
    * @tc.desc    test getColorByName method in callback mode
   */
    it('getColorByName_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      res.getColorByName('color_test1', (err: BusinessError<void> | null, value: number | undefined) => {
        expect(value !== null).assertTrue();
        console.log('getColorByName_test_static_0100 ' + value);
        expect(value).assertEqual(4294967295);
      })
    })

    /**
     * @tc.number    : getIntPluralStringByNameSync_test_static_0100
     * @tc.name      : getIntPluralStringByNameSync_test_static_0100
     * @tc.desc      : test getMediaContent 9error code 9001004 by name
     */
    it('getIntPluralStringByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getIntPluralStringByNameSync('string_format8', 1);
      } catch (err: BusinessError) {
        let error = err as BusinessError
        console.log('getIntPluralStringByNameSync_test_static_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001004);
      }
    })

    /**
     * @tc.number    : getDoublePluralStringByNameSync_test_static_0100
     * @tc.name      : getDoublePluralStringByNameSync_test_static_0100
     * @tc.desc      : test getDoublePluralStringByNameSync with error code 9001004
     */
    it('getDoublePluralStringByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDoublePluralStringByNameSync('string_format8', 2.1);
      } catch (err: BusinessError) {
        let error = err as BusinessError
        console.log('getDoublePluralStringByNameSync_test_static_0100 error code:' + error.code);
        expect(err.code).assertEqual(9001004);
      }
    })
    console.log('*************end ResmgrTest*************');
  })
}