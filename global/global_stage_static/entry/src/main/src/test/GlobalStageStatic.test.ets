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

export default function globalStageTest() {

  describe("globalStageTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start globalStageTest*************');
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

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_static_0100
     * @tc.name      : getStringSync_stagetest_static_0100
     * @tc.desc      : getStringSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getStringSync_stagetest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let value: string = res.getStringSync(
        {
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01000000
        }, 100);
      hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_stagetest_static_0100 1' + value);
      expect(value).assertEqual('global_stage_static');
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_static_0200
     * @tc.name      : getStringSync_stagetest_static_0200
     * @tc.desc      : getStringSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringSync_stagetest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: string = res.getStringSync(
        {
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01000000
        });
      hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_stagetest_static_0200 1' + value);
      expect(value).assertEqual('global_stage_static');
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_static_0100
     * @tc.name      : getStringValue_stage_test_static_0100
     * @tc.desc      : getStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getStringValue_stage_test_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      res.getStringValue({
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000000
      }, (err: BusinessError<void> | null, value: string | undefined) => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_stage_test_static_0100 ' + value);
        expect(value).assertEqual('global_stage_static');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_static_0200
     * @tc.name      : getStringValue_stage_test_static_0200
     * @tc.desc      : getStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getStringValue_stage_test_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await res.getStringValue({
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000000
      }).then((value: string) => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_stage_test_static_0200 ' + value);
        expect(value).assertEqual('global_stage_static');
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_0100
     * @tc.name     : getStringArrayValue_stage_test_static_0100
     * @tc.desc     : errcode 9001002 in promise mode by resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static2",
        moduleName: "entry",
        id: 0x01234567
      };
      res.getStringArrayValue(resource).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayValue promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_0200
     * @tc.name     : getStringArrayValue_stage_test_static_0200
     * @tc.desc     : errcode 9001001 in promise mode by resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue({
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01234567
      }).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayValue promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0100
     * @tc.name     : getMediaContent_stage_test_static_0100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContent_stage_test_static_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getStringArrayValue_callback_res_9001001 start');
      try {
        res.getMediaContent(0x01234567, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent callback 9001001 end');
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0200
     * @tc.name     : getMediaContent_stage_test_static_0200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContent_stage_test_static_0200", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent_callback_9001002 start');
      try {
        res.getMediaContent(0x01000014, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent callback 9001002 end');
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0300
     * @tc.name     : getMediaContent_stage_test_static_0300
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContent_stage_test_static_0300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent_callback_9001002 start');
      try {
        res.getMediaContent(0x01000014, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent callback 9001002 end');
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0400
     * @tc.name     : getMediaContent_stage_test_static_0400
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_0100
     * @tc.name     : getMediaContentBase64_stage_test_static_0100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01234567
      };
      res.getMediaContentBase64(resource).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContentBase64 promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_0200
     * @tc.name     : getMediaContentBase64_stage_test_static_0200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64({
        bundleName: "com.example.globalBasic11",
        moduleName: "entry_test",
        id: 0x01000007
      }).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContentBase64 promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_0300
     * @tc.name     : getMediaContentBase64_stage_test_static_0300
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContentBase64_stage_test_static_0300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64_stage_test_static_0300 start');
      try {
        let resource: resourceManager.Resource = {
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01234567
        };
        res.getMediaContentBase64(resource, (err: BusinessError<void> | null, data: string | undefined) => {
          hilog.info(domain, tag, 'getMediaContentBase64 callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContentBase64 callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContentBase64 callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContentBase64 callback 9001001 end');
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_0400
     * @tc.name     : getMediaContentBase64_stage_test_static_0400
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContentBase64_stage_test_static_0400", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64_stage_test_static_0400 callback err code 9001002 start');
      try {
        let resource: resourceManager.Resource = {
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x0100002b
        };
        res.getMediaContentBase64(resource, (err: BusinessError<void> | null, data: string | undefined) => {
          hilog.info(domain, tag, 'getMediaContentBase64 callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContentBase64 callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContentBase64 callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue callback 9001002 end');
    })


    /* *
     * @tc.number  SUB_GLOBAL_GETCOLORSYNC_STAGE_JS_static_0100
     * @tc.name    getColorSync_test_static_0100
     * @tc.desc    get the sync color in promise mode
     */
    it('getColorSync_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        res.getColorSync({
          bundleName: "com.example.global_stage.static",
          moduleName: "entry_test",
          id: 0x21000014
        });
      } catch (err: BusinessError) {
        console.log('getColorByNameSync_test_static_006 err.code' + err.code);
        console.log('getColorByNameSync_test_static_006 err.message' + err.message);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
        done();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETRAWFILECONTENTSYNC_STAGE_static_0100
     * @tc.name      : getRawFileContentSync_stagetest_static_0100
     * @tc.desc      : getRawFileContentSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getRawFileContentSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Uint8Array =
        res.getRawFileContentSync('rawfiletest.xml');
      hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContentSync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIABYNAMESYNC_STAGE_static_0100
     * @tc.name      : getMediaByNameSync_stagetest_static_0100
     * @tc.desc      : getMediaByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaByNameSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Uint8Array = res.getMediaByNameSync('app_icon');
      console.log('getMediaByNameSync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETCONFIGURATIONSYNC_STAGE_static_0100
     * @tc.name      : getConfigurationSync_stagetest_static_0100
     * @tc.desc      : getConfigurationSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getConfigurationSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      console.log('getConfigurationSync_stagetest_static_0100 1' + JSON.stringify(value));
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETDEVICECAPABILITYSYNC_STAGE_static_0100
     * @tc.name      : getDeviceCapabilitySync_stagetest_static_0100
     * @tc.desc      : getDeviceCapabilitySync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getDeviceCapabilitySync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: resourceManager.DeviceCapability = res.getDeviceCapabilitySync();
      console.log('getDeviceCapabilitySync_stagetest_static_0100 1' + JSON.stringify(value));
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GetLocales_static_0010
     * @tc.name      : SUB_GLOBAL_GetLocales_static_0010
     * @tc.desc      : getLocales
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_GetLocales_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let value: string = res.getLocales().toString();
      console.log('SUB_GLOBAL_GetLocales_static_0010' + value);
      expect(value).assertEqual("");
      done();
    })

    /**
     * @tc.number    : SUB_GOLBAL_REMSGR_isRawDir_static_0010
     * @tc.name      : SUB_GOLBAL_REMSGR_isRawDir_static_0010
     * @tc.desc      : isRawDir
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GOLBAL_REMSGR_isRawDir_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let value: boolean = res.isRawDir('rawfiletest.xml');
      console.log('SUB_GOLBAL_REMSGR_isRawDir_static_0010_value' + value);
      expect(value == false).assertTrue();
    })

    /**
     * @tc.number    : SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010
     * @tc.name      : SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010
     * @tc.desc      : getOverrideConfiguration
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let value: resourceManager.Configuration = res.getOverrideConfiguration();
      console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010_value' + value.mnc);
      expect(value.mnc == 0).assertTrue();
    })


    /**
     * @tc.number    : SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010
     * @tc.name      : SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010
     * @tc.desc      : getOverrideResourceManager
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let completeOverrideConfiguration: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
        colorMode: resourceManager.ColorMode.LIGHT,
        screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
      }
      let value =
        res.getOverrideResourceManager(completeOverrideConfiguration);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010_value' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc == 460).assertTrue();
    })

    /**
     * @tc.number    : SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010
     * @tc.name      : SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010
     * @tc.desc      : updateOverrideConfiguration
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let completeOverrideConfiguration: resourceManager.Configuration = {
        mcc: 461,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
        colorMode: resourceManager.ColorMode.DARK,
        screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
      }
      let value = res.getOverrideResourceManager();
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010_value-before' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc != 461).assertTrue();
      value.updateOverrideConfiguration(completeOverrideConfiguration);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010_value-after' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc == 461).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0100
     * @tc.name      : resourceManager_test_getStringSync_static_0010
     * @tc.desc      : %2$d(The second parameter is an integer)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0010', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001b
      };
      let value_one = resMgr.getStringSync(0x0100001b, "format string", 10, "TestTest");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0010 value_one:' + value_one);
      expect(value_one).assertEqual('10 TestTest');
      let value_two = resMgr.getStringSync(resource, "format string", 10, "TestTest");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0010 value_two:' + value_two);
      expect(value_two).assertEqual('10 TestTest');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0200
     * @tc.name      : resourceManager_test_getStringSync_static_0020
     * @tc.desc      : %2$d(The second parameter is an integer in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0020', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100002c
      };
      let value_one = resMgr.getStringSync(0x0100002c, "format string", 1.234568E+16);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0020 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000');
      let value_two = resMgr.getStringSync(resource, "format string", 1.234568E+16);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0020 value_two:' + value_two);
      expect(value_two).assertEqual('12345680000000000');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0300
     * @tc.name      : resourceManager_test_getStringSync_static_0030
     * @tc.desc      : %2$d(The second parameter is a decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0030', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000029
      };
      let value_one = resMgr.getStringSync(0x01000029, "format string", 10.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0030 value_one:' + value_one);
      expect(value_one).assertEqual('10');
      let value_two = resMgr.getStringSync(resource, "format string", 10.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0030 value_two:' + value_two);
      expect(value_two).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0400
     * @tc.name      : resourceManager_test_getStringSync_static_0040
     * @tc.desc      : %2$d(The second parameter is a decimal number in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0040', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001c
      };
      let value_one = resMgr.getStringSync(0x0100001c, "format string", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0040 value_one:' + value_one);
      expect(value_one).assertEqual('0');
      let value_two = resMgr.getStringSync(resource, "format string", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0040 value_two:' + value_two);
      expect(value_two).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0500
     * @tc.name      : resourceManager_test_getStringSync_static_0050
     * @tc.desc      : %3$s(The third parameter is a Chinese string)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0050', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000014
      };
      let value_one = resMgr.getStringSync(0x01000014, "format string", 12, "测试测试");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0050 value_one:' + value_one);
      expect(value_one).assertEqual('测试测试');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "测试测试");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0050 value_two:' + value_two);
      expect(value_two).assertEqual('测试测试');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0600
     * @tc.name      : resourceManager_test_getStringSync_static_0060
     * @tc.desc      : %3$s(The third parameter is an English string)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0060', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000025
      };
      let value_one = resMgr.getStringSync(0x01000025, "format string", 12, "TestTest");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0060 value_one:' + value_one);
      expect(value_one).assertEqual('TestTest');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0060 value_two:' + value_two);
      expect(value_two).assertEqual('TestTest');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0700
     * @tc.name      : resourceManager_test_getStringSync_static_0070
     * @tc.desc      : %4$f(The fourth parameter is an integer)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0070', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001c
      };
      let value_one = resMgr.getStringSync(0x0100001c, "format string", 12, "TestTest", 20);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0070 value_one:' + value_one);
      expect(value_one).assertEqual('20');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 20);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0070 value_two:' + value_two);
      expect(value_two).assertEqual('20');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0800
     * @tc.name      : resourceManager_test_getStringSync_static_0080
     * @tc.desc      : %4$f(The fourth parameter is an integer in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0080', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000017
      };
      let value_one = resMgr.getStringSync(0x01000017, "format string", 12, "TestTest", 1.234568E+16);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0080 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568E+16);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0080 value_two:' + value_two);
      expect(value_two).assertEqual('12345680000000000');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_0900
     * @tc.name      : resourceManager_test_getStringSync_static_0090
     * @tc.desc      : %4$f(The fourth parameter is a decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0090', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000020
      };
      let value_one = resMgr.getStringSync(0x01000020, "format string", 12, "TestTest", 20.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0090 value_one:' + value_one);
      expect(value_one).assertEqual('20.01');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 20.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0090 value_two:' + value_two);
      expect(value_two).assertEqual('20.01');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1000
     * @tc.name      : resourceManager_test_getStringSync_static_0100
     * @tc.desc      : %4$f(The fourth parameter is a decimal number in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0100', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000027
      };
      let value_one = resMgr.getStringSync(0x01000027, "format string", 12, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0100 value_one:' + value_one);
      expect(value_one).assertEqual('0');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0100 value_two:' + value_two);
      expect(value_two).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1100
     * @tc.name      : resourceManager_test_getStringSync_static_0110
     * @tc.desc      : %%d
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0110', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000019
      };
      let value_one = resMgr.getStringSync(0x01000019, 12);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0110 value_one:' + value_one);
      expect(value_one).assertEqual('%d');
      let value_two = resMgr.getStringSync(resource, 12);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0110 value_two:' + value_two);
      expect(value_two).assertEqual('%d');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1200
     * @tc.name      : resourceManager_test_getStringSync_static_0120
     * @tc.desc      : %%%s
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0120', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000023
      };
      let value_one = resMgr.getStringSync(0x01000023, "format string", 12, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0120 value_one:' + value_one);
      expect(value_one).assertEqual('%format string');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0120 value_two:' + value_two);
      expect(value_two).assertEqual('%format string');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1300
     * @tc.name      : resourceManager_test_getStringSync_static_0130
     * @tc.desc      : %%%%f
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0130', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000023
      };
      let value_one = resMgr.getStringSync(0x01000023, 12.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0130 value_one:' + value_one);
      expect(value_one).assertEqual('%%f');
      let value_two = resMgr.getStringSync(resource, 12.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0130 value_two:' + value_two);
      expect(value_two).assertEqual('%%f');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1400
     * @tc.name      : resourceManager_test_getStringSync_static_0140
     * @tc.desc      : %2$d %3$s %4$f(The second parameter is integer, the third is Chinese, the fourth is decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0140', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001d
      };
      let value_one = resMgr.getStringSync(0x0100001d,
        "format string", 10, "测试测试", 98.78);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0140 value_one:' + value_one);
      expect(value_one).assertEqual('10 测试测试 98.78');
      let value_two = resMgr.getStringSync(resource, "format string", 10, "测试测试", 98.78);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0140 value_two:' + value_two);
      expect(value_two).assertEqual('10 测试测试 98.78');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1500
     * @tc.name      : resourceManager_test_getStringSync_static_0150
     * @tc.desc      : %2$d %3$s %4$f(The second parameter is integer in scientific notation,
     * the third is English, the fourth is decimal in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0150', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001a
      };
      let value_one = resMgr.getStringSync(0x0100001a,
        "format string", 1.234568E+16, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0150 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000 TestTest 0');
      let value_two = resMgr.getStringSync(resource, "format string", 1.234568E+16, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0150 value_two:' + value_two);
      expect(value_two).assertEqual('12345680000000000 TestTest 0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1600
     * @tc.name      : resourceManager_test_getStringSync_static_0160
     * @tc.desc      : %2$d %3$s %4$f %%d(The parameter is null)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0160', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001d
      };
      let value_one = resMgr.getStringSync(0x0100001d);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0160 value_one:' + value_one);
      expect(value_one).assertEqual('%d %1$d');
      let value_two = resMgr.getStringSync(resource);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0160 value_two:' + value_two);
      expect(value_two).assertEqual('%d %1$d');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1700
     * @tc.name      : resourceManager_test_getStringSync_static_0170
     * @tc.desc      : %d %1$d(The parameter is null)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0170', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001d
      };
      let value_one = resMgr.getStringSync(0x0100001d);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0170 value_one:' + value_one);
      expect(value_one).assertEqual('%d %1$d');
      let value_two = resMgr.getStringSync(resource);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0170 value_two:' + value_two);
      expect(value_two).assertEqual('%d %1$d');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1800
     * @tc.name      : resourceManager_test_getStringSync_static_0180
     * @tc.desc      : %2$d %3$s %4$f(There are more parameters than placeholder indexes)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0180', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000018
      };
      let value_one = resMgr.getStringSync(0x01000018, "format string", 30, "测试测试", 98.78, 1.234568E+16, "TestTest",
        1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0180 value_one:' + value_one);
      expect(value_one).assertEqual('30 测试测试 98.78');
      let value_two = resMgr.getStringSync(resource, "format string",
        30, "测试测试", 98.78, 1.234568E+16, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0180 value_two:' + value_two);
      expect(value_two).assertEqual('30 测试测试 98.78');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_1900
     * @tc.name      : resourceManager_test_getStringSync_static_0190
     * @tc.desc      : %d %1$d(Inconsistent placeholder styles)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0190', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001c
      };
      let value_one = resMgr.getStringSync(0x0100001c, 40);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0190 value_one:' + value_one);
      expect(value_one).assertEqual('40 40');
      let value_two = resMgr.getStringSync(resource, 40);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0190 value_two:' + value_two);
      expect(value_two).assertEqual('40 40');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2000
     * @tc.name      : resourceManager_test_getStringSync_static_0200
     * @tc.desc      : %%%d %1$d(Inconsistent placeholder styles)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0200', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000026
      };
      let value_one = resMgr.getStringSync(0x01000026, 40);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0200 value_one:' + value_one);
      expect(value_one).assertEqual('%40 40');
      let value_two = resMgr.getStringSync(resource, 40);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0200 value_two:' + value_two);
      expect(value_two).assertEqual('%40 40');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2100
     * @tc.name      : resourceManager_test_getStringSync_static_0210
     * @tc.desc      : %d %d %s %s %f %f(Arguments and placeholder match and equal in number)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0210', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100002e
      };
      let value_one = resMgr.getStringSync(0x0100002e, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0210 value_one:' + value_one);
      expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      let value_two = resMgr.getStringSync(resource, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0210 value_two:' + value_two);
      expect(value_two).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2200
     * @tc.name      : resourceManager_test_getStringSync_static_0220
     * @tc.desc      : %d %d %s %s %f %f(The parameters is more than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_static_0220', Level.LEVEL2, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000030
      };
      let value_one =
        resMgr.getStringSync(0x01000030, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08, 15,
          "format string", 15.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0220 value_one:' + value_one);
      expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      let value_two = resMgr.getStringSync(resource, 50, 1.234568E+16, "测试测试",
        "TestTest", 98.78, 1.234568e-08, 15, "format string", 15.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0220 value_two:' + value_two);
      expect(value_two).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2300
     * @tc.name      : resourceManager_test_getStringSync_static_0230
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getStringSync_static_0230', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync(0x0100002a);
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0230' + error.code + error.message);
        expect(JSON.stringify(error.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2400
     * @tc.name      : resourceManager_test_getStringSync_static_0240
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getStringSync_static_0240', Level.LEVEL3, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000028
      };
      try {
        resMgr.getStringSync(resource, 50);
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0240' + error.code + error.message);
        expect(JSON.stringify(error.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2600
     * @tc.name      : resourceManager_test_getStringSync_static_0260
     * @tc.desc      : The wrong parameter type
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getStringSync_static_0260', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync(0x01000028, "format string", "format", "1.5", "string");
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0260' + error.code + error.message);
        expect(JSON.stringify(error.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2700
     * @tc.name      : resourceManager_test_getStringSync_static_0270
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getStringSync_static_0270', Level.LEVEL3, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000026
      };
      try {
        resMgr.getStringSync(resource, "format string", "format", "1.5", "string");
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0270' + error.code + error.message);
        expect(JSON.stringify(error.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_static_2900
     * @tc.name      : resourceManager_test_getStringSync_static_0290
     * @tc.desc      : Parameters less than required
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getStringSync_static_0290', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync(0x01000027);
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0290' + error.code + error.message);
        expect(JSON.stringify(error.code)).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_3000
     * @tc.name      : resourceManager_test_getStringSync_static_0300
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getStringSync_static_0300', Level.LEVEL3, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000025
      };
      try {
        resMgr.getStringSync(resource, 50);
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0300' + error.code + error.message);
        expect(JSON.stringify(error.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0020
     * @tc.name      : resourceManager_test_getSymbol_static_0020
     * @tc.desc      : getSymbol resource by reference
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0020', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbol(0xF0003);
      console.log('resourceManager_test_getSymbol_static_0020:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0040
     * @tc.name      : resourceManager_test_getSymbol_static_0040
     * @tc.desc      : getSymbol resource resId invalid
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getSymbol_static_0040', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getSymbol(0x01234567);
        console.log('resourceManager_test_getSymbol_static_0040:' + value);
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_getSymbol_static_0040_errorCode' + error.code);
        console.log('resourceManager_test_getSymbol_static_0040_errorMessage' + error.message);
        expect(JSON.stringify(error.code) == '9001001').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0070
     * @tc.name      : resourceManager_test_getSymbol_static_0070
     * @tc.desc      : getSymbol normal resource object
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0070', Level.LEVEL2, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0xF0003
      };
      let value = res.getSymbol(resource);
      console.log('resourceManager_test_getSymbol_static_0070:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0080
     * @tc.name      : resourceManager_test_getSymbol_static_0080
     * @tc.desc      : getSymbol normal reference resource
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0080', Level.LEVEL2, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0xF0003
      };
      let value = res.getSymbol(resource);
      console.log('resourceManager_test_getSymbol_static_0080:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0100
     * @tc.name      : resourceManager_test_getSymbol_static_0100
     * @tc.desc      : getSymbol resId invalid by resource object
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01234567
      };
      try {
        let value = res.getSymbol(resource);
        console.log('resourceManager_test_getSymbol_static_0100:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getSymbol_static_0100_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_static_0100_errorMessage' + e.message);
        expect(e.code == 9001001).assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0110
     * @tc.name      : resourceManager_test_getSymbol_static_0110
     * @tc.desc      : getSymbol resource not found by resource object
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getSymbol_static_0110', Level.LEVEL3, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000008
      };
      try {
        let value = res.getSymbol(resource);
        console.log('resourceManager_test_getSymbol_static_0110:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getSymbol_static_0110_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_static_0110_errorMessage' + e.message);
        expect(e.code == 9001002).assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0140
     * @tc.name      : resourceManager_test_getSymbol_static_0140
     * @tc.desc      : getSymbolByName reference resource
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0140', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbolByName('symbolTestReference');
      console.log('resourceManager_test_getSymbol_static_0140:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0160
     * @tc.name      : resourceManager_test_getSymbol_static_0160
     * @tc.desc      : getSymbolByName resName invalid
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getSymbol_static_0160', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getSymbolByName('invalidName');
        console.log('resourceManager_test_getSymbol_static_0160:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getSymbol_static_0160_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_static_0160_errorMessage' + e.message);
        expect(e.code == 9001003).assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0190
     * @tc.name      : resourceManager_test_getSymbol_static_0190
     * @tc.desc      : getSymbol normal resource by resId in Chinese
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0190', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbol(0xF0001);
      console.log('resourceManager_test_getSymbol_static_0190:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0200
     * @tc.name      : resourceManager_test_getSymbol_static_0200
     * @tc.desc      : getSymbol normal resource by resId in Chinese
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0xF0001
      };
      let value = res.getSymbol(resource);
      console.log('resourceManager_test_getSymbol_static_0200:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_static_0210
     * @tc.name      : resourceManager_test_getSymbol_static_0210
     * @tc.desc      : getSymbolByName normal name ZH
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_static_0210', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbolByName('symbolTest2');
      console.log('resourceManager_test_getSymbol_static_0210:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0020
     * @tc.name      : resourceManager_test_getRawFdSync_static_0020
     * @tc.desc      : getRawFdSync with subdirectory non-empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFdSync_static_0020', Level.LEVEL3, async (): Promise<void> => {
      let value = res.getRawFdSync('A/test.txt');
      console.log('resourceManager_test_getRawFdSync_static_0020_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_static_0020_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_static_0020_length' + value.length);
      expect(value != null && value.length == 4).assertTrue();
      res.closeRawFdSync('A/test.txt');
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0030
     * @tc.name      : resourceManager_test_getRawFdSync_static_0030
     * @tc.desc      : getRawFdSync with subdirectory empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFdSync_static_0030', Level.LEVEL3, async (): Promise<void> => {
      let value = res.getRawFdSync('A/none.xml');
      console.log('resourceManager_test_getRawFdSync_static_0030_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_static_0030_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_static_0030_length' + value.length);
      expect(value != null && value.length == 0).assertTrue();
      res.closeRawFdSync('A/none.xml');
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0050
     * @tc.name      : resourceManager_test_getRawFdSync_static_0050
     * @tc.desc      : getRawFdSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getRawFdSync_static_0050', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getRawFdSync('error_path.xml');
        console.log('resourceManager_test_getRawFdSync_static_0050:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getRawFdSync_static_0050_errorCode' + e.code);
        console.log('resourceManager_test_getRawFdSync_static_0050_errorMessage' + e.message);
        expect(e.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0170
     * @tc.name      : resourceManager_test_getRawFileContentSync_static_0170
     * @tc.desc      : getRawFileContentSync with subdirectory empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileContentSync_static_0170', Level.LEVEL2, () => {
      let value = res.getRawFileContentSync('A/none.xml');
      hilog.info(0x0000, 'testTag', '%{public}s', 'resourceManager_test_getRawFileContentSync_static_0170:' + value);
      expect(value.length == 0).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0160
     * @tc.name      : resourceManager_test_getRawFileContentSync_static_0160
     * @tc.desc      : getRawFileContentSync with subdirectory non-empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileContentSync_static_0160', Level.LEVEL2, () => {
      let value = res.getRawFileContentSync('A/test.txt');
      hilog.info(0x0000, 'testTag', '%{public}s', 'resourceManager_test_getRawFileContentSync_static_0160:' + value);
      expect(value.length == 4).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0190
     * @tc.name      : resourceManager_test_getRawFileContentSync_static_0190
     * @tc.desc      : getRawFileContentSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getRawFileContentSync_static_0190', Level.LEVEL3, () => {
      try {
        let value = res.getRawFileContentSync('error_path.xml');
        hilog.info(0x0000, 'testTag', '%{public}s', 'resourceManager_test_getRawFileContentSync_static_0190:' + value);
      } catch (e: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getRawFileContentSync_static_0190_errorCode' + e.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getRawFileContentSync_static_0190_errorMessage' + e.message);
        expect(e.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0120
     * @tc.name      : resourceManager_test_getRawFileListSync_static_0120
     * @tc.desc      : getRawFileListSync with subdirectory
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileListSync_static_0120', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getRawFileListSync('A');
      console.log('resourceManager_test_getRawFileListSync_static_0120:' + value);
      expect(value.length >= 102).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0140
     * @tc.name      : resourceManager_test_getRawFileListSync_static_0140
     * @tc.desc      : getRawFileListSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_getRawFileListSync_static_0140', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getRawFileListSync('error_path');
        console.log('resourceManager_test_getRawFileListSync_static_0140:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getRawFileListSync_static_0140_errorCode' + e.code);
        console.log('resourceManager_test_getRawFileListSync_static_0140_errorMessage' + e.message);
        expect(e.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_static_0100
     * @tc.name      : resourceManager_test_closeRawFdSync_static_0100
     * @tc.desc      : closeRawFdSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('resourceManager_test_closeRawFdSync_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.closeRawFdSync('error_path.xml');
        console.log('resourceManager_test_closeRawFdSync_static_0100:');
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_closeRawFdSync_static_0100_errorCode' + error.code);
        console.log('resourceManager_test_closeRawFdSync_static_0100_errorMessage' + error.message);
        expect(error.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_0400
     * @tc.name     : getStringArrayValue_stage_test_static_0400
     * @tc.desc     : errcode 9001002 in promise mode by Resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.globalBasic11",
        moduleName: "entry",
        id: 0x01234567
      };
      res.getStringArrayValue(resource).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayValue promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_static_0500
     * @tc.name      : getStringArrayValue_stage_test_static_0500
     * @tc.desc      : errcode 9001006 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_static_0500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue({
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100002e
      }, (err: BusinessError<void> | null) => {
        console.log('getStringArrayValue_stage_test_static_0500 error code:' + err?.code);
        expect(err?.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_0700
     * @tc.name     : getStringArrayValue_stage_test_static_0700
     * @tc.desc     : errcode 9001001 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getStringArrayValue_stage_test_static_0700", Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayValue_callback_9001001 start');
      try {
        let resource: resourceManager.Resource = {
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01234567
        };
        res.getStringArrayValue(resource, (err: BusinessError<void> | null, data: Array<string> | undefined) => {
          hilog.info(domain, tag, 'getStringArrayValue callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getStringArrayValue callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getStringArrayValue callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayValue_callback_9001001 end');
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_0800
     * @tc.name     : getStringArrayValue_stage_test_static_0800
     * @tc.desc     : errcode 9001002 in promise mode by Resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getStringArrayValue_stage_test_static_0800", Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getBundleNameByUid callback err code 9001002 start');
      try {
        let resource: resourceManager.Resource = {
          bundleName: "com.example.globalBasic11",
          moduleName: "entry_test",
          id: 0x01234567
        };
        res.getStringArrayValue(resource, (err: BusinessError<void> | null, data: Array<string> | undefined) => {
          hilog.info(domain, tag, 'getStringArrayValue callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getStringArrayValue callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getStringArrayValue callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue callback 9001002 end');
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_0900
     * @tc.name     : getStringArrayValue_stage_test_static_0900
     * @tc.desc     : errcode 9001002 in promise mode by Resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_0900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100002e
      };
      res.getStringArrayValue(resource).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayValue promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_1000
     * @tc.name     : getStringArrayValue_stage_test_static_1000
     * @tc.desc     : errcode 9001001 in promise
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_1000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x01234567).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue resId promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue resId promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_1011
     * @tc.name     : getStringArrayValue_stage_test_static_1011
     * @tc.desc     : errcode 9001002 in promise
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_1011', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x01000008).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })
    /**
     * @tc.number   : getStringArrayValue_stage_test_static_1012
     * @tc.name     : getStringArrayValue_stage_test_static_1012
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_1012', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x0100002e).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_1013
     * @tc.name     : getStringArrayValue_stage_test_static_1013
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getStringArrayValue_stage_test_static_1013", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getStringArrayValue_callback_9001001 start');
      try {
        res.getStringArrayValue(0x01234567, (err: BusinessError<void> | null, data: Array<string> | undefined) => {
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 end');
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_1014
     * @tc.name     : getStringArrayValue_stage_test_static_1014
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getStringArrayValue_stage_test_static_1014", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getStringArrayValue_callback_res_9001002 start');
      try {
        res.getStringArrayValue(0x01000007, (err: BusinessError<void> | null, data: Array<string> | undefined) => {
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 end');
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0500
     * @tc.name     : getMediaContent_stage_test_static_0500
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContent_stage_test_static_0500", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent  callback err code 9001001 start');
      try {
        res.getMediaContent(0x01234567, 0, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent density callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent density callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent density callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent density callback 9001001 end');
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0600
     * @tc.name     : getMediaContent_stage_test_static_0600
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_0600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x0100000c).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0800
     * @tc.name     : getMediaContent_stage_test_static_0800
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_0800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567, 0).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent density  promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContent  density promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_0900
     * @tc.name     : getMediaContent_stage_test_static_0900
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContent_stage_test_static_0900", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent  density callback err code 9001002 start');
      try {
        res.getMediaContent(0x0100000c, 0, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent density callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent density callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent density callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent density callback 9001002 end');
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_1200
     * @tc.name     : getMediaContent_stage_test_static_1200
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_1200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x0100000c, 0).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContent density promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContent density promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_static_1400
     * @tc.name     : getStringArrayValue_stage_test_static_1400
     * @tc.desc     : errcode 9001001 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_static_1400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x01234567).then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.message' + error.message);
        expect(JSON.stringify(error.code) == '9001001').assertTrue();
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_1700
     * @tc.name     : getMediaContent_stage_test_static_1700
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_1700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_1700 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_1800
     * @tc.name     : getMediaContent_stage_test_static_1800
     * @tc.desc     : errcode 9001002 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_1800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01000005, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_1800 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_1900
     * @tc.name     : getMediaContent_stage_test_static_1900
     * @tc.desc     : errcode 9001001 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_1900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_1900 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_2000
     * @tc.name     : getMediaContent_stage_test_static_2000
     * @tc.desc     : errcode 9001002 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_2000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01000005, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_2000 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_2100
     * @tc.name     : getMediaContent_stage_test_static_2100
     * @tc.desc     : errcode 9001001 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_2100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567).then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.message' + error.message);
        expect(JSON.stringify(error.code) == '9001001').assertTrue();
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_2200
     * @tc.name     : getMediaContent_stage_test_static_2200
     * @tc.desc     : errcode 9001002 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_2200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContent(0x01000005)
      } catch (err: BusinessError) {
        console.log('getMediaContent_stage_test_static_2200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_2300
     * @tc.name     : getMediaContent_stage_test_static_2300
     * @tc.desc     : errcode 9001001 in promise mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_2300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContent(0x01234567, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContent_stage_test_static_2300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_stage_test_static_2400
     * @tc.name     : getMediaContent_stage_test_static_2400
     * @tc.desc     : errcode 9001002 in promise mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_static_2400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContent(0x01000005, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContent_stage_test_static_2400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_1100
     * @tc.name     : getMediaContentBase64_stage_test_static_1100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_1100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01234567).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_1200
     * @tc.name     : getMediaContentBase64_stage_test_static_1200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_1200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01000031).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_1300
     * @tc.name     : getMediaContentBase64_stage_test_static_1300
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContentBase64_stage_test_static_1300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback err code 201 start');
      try {
        res.getMediaContentBase64(0x01234567, (err: BusinessError<void> | null, data: string | undefined) => {
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 end');
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_1400
     * @tc.name     : getMediaContentBase64_stage_test_static_1400
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it("getMediaContentBase64_stage_test_static_1400", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback err code 9001002 start');
      try {
        res.getMediaContentBase64(0x01000031, (err: BusinessError<void> | null, data: string | undefined) => {
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue callback 9001002 end');
    })
    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_1700
     * @tc.name     : getMediaContentBase64_stage_test_static_1700
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_1700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01234567, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_1700 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_1800
     * @tc.name     : getMediaContentBase64_stage_test_static_1800
     * @tc.desc     : errcode 9001002 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_1800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01000031, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_1800 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_1900
     * @tc.name     : getMediaContentBase64_stage_test_static_1900
     * @tc.desc     : errcode 9001001 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_1900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01234567, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_1900 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_2000
     * @tc.name     : getMediaContentBase64_stage_test_static_2000
     * @tc.desc     : errcode 9001002 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_2000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01000031, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_2000 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_2100
     * @tc.name     : getMediaContentBase64_stage_test_static_2100
     * @tc.desc     : errcode 9001001 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_2100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01234567)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_2200
     * @tc.name     : getMediaContentBase64_stage_test_static_2200
     * @tc.desc     : errcode 9001002 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_2200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01000031)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_2300
     * @tc.name     : getMediaContentBase64_stage_test_static_2300
     * @tc.desc     : errcode 9001001 in promise mode by resId with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_2300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01234567, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_static_2400
     * @tc.name     : getMediaContentBase64_stage_test_static_2400
     * @tc.desc     : errcode 9001002 in promise mode by resId with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_static_2400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01000031, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.number   : getStringByName_stage_test_static_0100
     * @tc.name     : getStringByName_stage_test_static_0100
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByName_stage_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringByName('', (err: BusinessError<void> | null) => {
        console.log('getStringByName_stage_test_static_0100 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayByName_stage_test_static_0100
     * @tc.name     : getStringArrayByName_stage_test_static_0100
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayByName_stage_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayByName('', (err: BusinessError<void> | null) => {
        console.log('getStringArrayByName_stage_test_static_0100 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaByName_test_static_0300
     * @tc.name     : getMediaByName_test_static_0300
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_test_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaByName('', (err: BusinessError<void> | null) => {
        console.log('getMediaByName_test_static_0300 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64ByName_test_static_0400
     * @tc.name     : getMediaBase64ByName_test_static_0400
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaBase64ByName('', 0, (err: BusinessError<void> | null) => {
        console.log('getMediaBase64ByName_test_static_0400 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getStringSync_test_static_0100
     * @tc.name     : getStringSync_test_static_0100
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0100', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000034)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0200
     * @tc.name     : getStringSync_test_static_0200
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0200', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000019)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0200 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0300
     * @tc.name     : getStringSync_test_static_0300
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0300', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000034, 'test', 1)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0300 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0400
     * @tc.name     : getStringSync_test_static_0400
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0400', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000012, 'test', 1)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0400 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0500
     * @tc.name     : getStringSync_test_static_0500
     * @tc.desc     : errcode 9001007
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0500', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x0100002a, 'test', 1)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0500 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0600
     * @tc.name     : getStringSync_test_static_0600
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0600', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01234567)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0600 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0700
     * @tc.name     : getStringSync_test_static_0700
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0700', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01234567, 'aaa', 0)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0700 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0800
     * @tc.name     : getStringSync_test_static_0800
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0800', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01234567
      };
      try {
        res.getStringSync(resource)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0800 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_0900
     * @tc.name     : getStringSync_test_static_0900
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_0900', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000034
      };
      try {
        res.getStringSync(resource)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0900 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_1000
     * @tc.name     : getStringSync_test_static_1000
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_1000', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000019
      };
      try {
        res.getStringSync(resource)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_1000 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_1100
     * @tc.name     : getStringSync_test_static_1100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_1100', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01234567
      };
      try {
        res.getStringSync(resource, 'aaa', 0)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_1100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_1200
     * @tc.name     : getStringSync_test_static_1200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_1200', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000034
      };
      try {
        res.getStringSync(resource, 'aaa', 0)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_1200 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_static_1300
     * @tc.name     : getStringSync_test_static_1300
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_1300', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000012
      };
      try {
        res.getStringSync(resource, 'aaa', 0)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_1300 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringByNameSync_test_static_0100
     * @tc.name     : getStringByNameSync_test_static_0100
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringByNameSync('test_stringLoopB')
      } catch (err: BusinessError) {
        console.log('getStringByNameSync_test_static_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.number   : getStringByNameSync_test_static_0300
     * @tc.name     : getStringByNameSync_test_static_0300
     * @tc.desc     : errcode 9001003
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringByNameSync('boolean_static_2', 'aaa', 1)
      } catch (err) {
        let error = err as BusinessError
        console.log('getStringByNameSync_test_static_0300 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.number   : getBoolean_test_static_0200
     * @tc.name     : getBoolean_test_static_0200
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getBoolean(0x01234567)
      } catch (err) {
        let error = err as BusinessError
        console.log('getBoolean_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.number   : getBooleanByName_test_static_0100
     * @tc.name     : getBooleanByName_test_static_0100
     * @tc.desc     : errcode 9001003
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBooleanByName_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getBooleanByName("")
      } catch (err) {
        let error = err as BusinessError
        console.log('getBooleanByName_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.number   : getNumber_test_static_0100
     * @tc.name     : getNumber_test_static_0100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_static_0100', Level.LEVEL3, () => {
      try {
        res.getNumber(0x01234567)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getNumber_test_static_0100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getNumber_test_static_0200
     * @tc.name     : getNumber_test_static_0200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_static_0200', Level.LEVEL3, () => {
      try {
        res.getNumber(0x01000034)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getNumber_test_static_0200 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getNumber_test_static_0300
     * @tc.name     : getNumber_test_static_0300
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_static_0300', Level.LEVEL3, () => {
      try {
        res.getNumber(0x01000039)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getNumber_test_static_0300 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getNumber_test_static_0400
     * @tc.name     : getNumber_test_static_0400
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_static_0400', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01234567
      }
      try {
        res.getNumber(resource)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getNumber_test_static_0400 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getNumber_test_static_0500
     * @tc.name     : getNumber_test_static_0500
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_static_0500', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000034
      }
      try {
        res.getNumber(resource)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getNumber_test_static_0500 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getNumber_test_static_0600
     * @tc.name     : getNumber_test_static_0600
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_static_0600', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000039
      }
      try {
        res.getNumber(resource)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getNumber_test_static_0600 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getNumberByName_test_static_0100
     * @tc.name     : getNumberByName_test_static_0100
     * @tc.desc     : errcode 9001003
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumberByName_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getNumberByName('')
      } catch (err) {
        let error = err as BusinessError
        console.log('getNumberByName_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.number   : getRawFileContent_test_static_0100
     * @tc.name     : getRawFileContent_test_static_0100
     * @tc.desc     : errcode 9001005 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContent_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getRawFileContent('plural_name_loop', (err: BusinessError<void> | null) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContent_test_static_0100 error code:' + err?.code);
        expect(JSON.stringify(err?.code)).assertEqual('9001005');
        done();
      })
    })

    /**
     * @tc.number   : getRawFileContent_test_static_0200
     * @tc.name     : getRawFileContent_test_static_0200
     * @tc.desc     : errcode 9001005 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContent_test_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getRawFileContent('plural_name_loop').then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContent_test_static_0200 error code:' + error.code);
        expect(JSON.stringify(error.code)).assertEqual('9001005');
        done();
      })
    })

    /**
     * @tc.number   : getRawFdSync_test_static_0100
     * @tc.name     : getRawFdSync_test_static_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFdSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getRawFdSync('notExist')
      } catch (err) {
        let error = err as BusinessError
        console.log('getRawFdSync_test_static_0100 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001005').assertTrue();
      }
    })

    /**
     * @tc.number   : getRawFileListSync_test_static_0100
     * @tc.name     : getRawFileListSync_test_static_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileListSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getRawFileListSync('notExist')
      } catch (err) {
        let error = err as BusinessError
        console.log('getRawFileListSync_test_static_0100 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001005').assertTrue();
      }
    })

    /**
     * @tc.number   : getRawFileContentSync_test_static_0100
     * @tc.name     : getRawFileContentSync_test_static_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContentSync_test_static_0100', Level.LEVEL3, () => {
      try {
        res.getRawFileContentSync('notExist')
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContentSync_test_static_0100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001005');
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_static_0100
     * @tc.name     : getMediaContentSync_test_static_0100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentSync(0x01234567)
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaContentSync_test_static_0100 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001001').assertTrue();
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_static_0200
     * @tc.name     : getMediaContentSync_test_static_0200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentSync(0x0100000c)
      } catch (err: BusinessError) {
        console.log('getMediaContentSync_test_static_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_static_0300
     * @tc.name     : getMediaContentSync_test_static_0300
     * @tc.desc     : errcode 9001001 Resource density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01234567
      }
      try {
        res.getMediaContentSync(resource)
      } catch (err: BusinessError) {
        console.log('getMediaContentSync_test_static_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_static_0400
     * @tc.name     : getMediaContentSync_test_static_0400
     * @tc.desc     : errcode 9001002 Resource density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_static_0400', Level.LEVEL3, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x0100001a
      }
      try {
        res.getMediaContentSync(resource)
      } catch (err: BusinessError) {
        console.log('getMediaContentSync_test_static_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.number    : getMediaContentSync_test_static_0500
     * @tc.name      : getMediaContentSync_test_static_0500
     * @tc.desc      : getMediaContentSync with res id density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaContentSync_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let value: Uint8Array = res.getMediaContentSync(0x01000018, 0);
      console.log('getMediaContentSync_test_static_0500 1' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentSync_test_static_0600
     * @tc.name      : getMediaContentSync_test_static_0600
     * @tc.desc      : getMediaContentSync with resource object density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaContentSync_test_static_0600', Level.LEVEL2, async (): Promise<void> => {
      let value: Uint8Array = res.getMediaContentSync({
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000018
      }, 0);
      console.log('getMediaContentSync_test_static_0600 1' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_static_0100
     * @tc.name      : getMediaContentBase64Sync_test_static_0100
     * @tc.desc      : getMediaContentBase64Sync with res id density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaContentBase64Sync_test_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value: string = res.getMediaContentBase64Sync(0x01000018, 0);
      console.log('getMediaContentBase64Sync_test_static_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_static_0200
     * @tc.name      : getMediaContentBase64Sync_test_static_0200
     * @tc.desc      : getMediaContentBase64Sync with resource object density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaContentBase64Sync_test_static_0200', Level.LEVEL2, async (): Promise<void> => {
      let value: string = res.getMediaContentBase64Sync({
        bundleName: "com.example.global_stage.static",
        moduleName: "entry",
        id: 0x01000018
      }, 0);
      console.log('getMediaContentBase64Sync_test_static_0200:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_static_0300
     * @tc.name      : getMediaContentBase64Sync_test_static_0300
     * @tc.desc      : error code 9001001 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentBase64Sync(0x01234567);
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaContentBase64Sync_test_static_0300 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001001').assertTrue();
      }
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_static_0400
     * @tc.name      : getMediaContentBase64Sync_test_static_0400
     * @tc.desc      : error code 9001001 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_static_0400', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentBase64Sync({
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01234567
        });
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64Sync_test_static_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_static_0500
     * @tc.name      : getMediaContentBase64Sync_test_static_0500
     * @tc.desc      : error code 9001002 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_static_0500', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentBase64Sync(0x01000005);
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64Sync_test_static_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_static_0600
     * @tc.name      : getMediaContentBase64Sync_test_static_0600
     * @tc.desc      : error code 9001002 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_static_0600', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentBase64Sync({
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01000019
        });
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64Sync_test_static_0600 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_static_0100
     * @tc.name      : getStringArrayValueSync_test_static_0100
     * @tc.desc      : error code 9001001 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync(0x01234567);
      } catch (err) {
        let error = err as BusinessError
        console.log('getStringArrayValueSync_test_static_0100 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001001').assertTrue();
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_static_0200
     * @tc.name      : getStringArrayValueSync_test_static_0200
     * @tc.desc      : error code 9001001 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync({
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01234567
        });
      } catch (err: BusinessError) {
        console.log('getStringArrayValueSync_test_static_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_static_0300
     * @tc.name      : getStringArrayValueSync_test_static_0300
     * @tc.desc      : error code 9001002 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync(0x01000005);
      } catch (err: BusinessError) {
        console.log('getStringArrayValueSync_test_static_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_static_0400
     * @tc.name      : getStringArrayValueSync_test_static_0400
     * @tc.desc      : error code 9001002 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_static_0400', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync({
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x01000005
        });
      } catch (err: BusinessError) {
        console.log('getStringArrayValueSync_test_static_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_static_0500
     * @tc.name      : getStringArrayValueSync_test_static_0500
     * @tc.desc      : error code 9001006 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_static_0500', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync(0x0100002e);
      } catch (err: BusinessError) {
        console.log('getStringArrayValueSync_test_static_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_static_0600
     * @tc.name      : getStringArrayValueSync_test_static_0600
     * @tc.desc      : error code 9001006 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_static_0600', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync({
          bundleName: "com.example.global_stage.static",
          moduleName: "entry",
          id: 0x0100002e
        });
      } catch (err: BusinessError) {
        console.log('getStringArrayValueSync_test_static_0600 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.number    : getMediaByNameSync_test_static_0100
     * @tc.name      : getMediaByNameSync_test_static_0100
     * @tc.desc      : with density by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaByNameSync_test_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value: Uint8Array = res.getMediaByNameSync('icon', 0);
      console.log('getMediaByNameSync_test_static_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaByNameSync_test_static_0200
     * @tc.name      : getMediaByNameSync_test_static_0200
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaByNameSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaByNameSync('invalidName', 0);
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaByNameSync_test_static_0200 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001003').assertTrue();
      }
    })

    /**
     * @tc.number    : getMediaBase64ByNameSync_test_static_0100
     * @tc.name      : getMediaBase64ByNameSync_test_static_0100
     * @tc.desc      : with density by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaBase64ByNameSync_test_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value: string = res.getMediaBase64ByNameSync('icon', 0);
      console.log('getMediaBase64ByNameSync_test_static_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaBase64ByNameSync_test_static_0200
     * @tc.name      : getMediaBase64ByNameSync_test_static_0200
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaBase64ByNameSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaBase64ByNameSync('invalidName', 0);
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaBase64ByNameSync_test_static_0200 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001003').assertTrue();
      }
    })

    /**
     * @tc.number    : getStringArrayByNameSync_test_static_0100
     * @tc.name      : getStringArrayByNameSync_test_static_0100
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayByNameSync('invalidName');
      } catch (err) {
        let error = err as BusinessError
        console.log('getStringArrayByNameSync_test_static_0100 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001003').assertTrue();
      }
    })

    /**
     * @tc.number    : getStringArrayByNameSync_test_static_0200
     * @tc.name      : getStringArrayByNameSync_test_static_0200
     * @tc.desc      : error code 9001006 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayByNameSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayByNameSync('sizeListThree');
      } catch (err: BusinessError) {
        console.log('getStringArrayByNameSync_test_static_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_GetLocales_static_0020
     * @tc.name      : SUB_GLOBAL_GetLocales_static_0020
     * @tc.desc      : getLocales
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_GetLocales_static_0020', Level.LEVEL2, async (): Promise<void> => {
      let value: string = res.getLocales(false).toString();
      console.log('SUB_GLOBAL_GetLocales_static_0020:' + value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.number   : getStringSync_test_static_1400
     * @tc.name     : getStringSync_test_static_1400
     * @tc.desc     : errcode 9001007 with array
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_static_1400', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x0100002a, 'test', 0)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_1400 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.number   : isRawDir_test_static_0100
     * @tc.name     : isRawDir_test_static_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('isRawDir_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.isRawDir('invalidPath');
      } catch (err) {
        let error = err as BusinessError
        console.log('isRawDir_test_static_0100 error code:' + error.code);
        expect(JSON.stringify(error.code) == '9001005').assertTrue();
      }
    })
    console.log('*************end globalStageTest*************');
  })
}