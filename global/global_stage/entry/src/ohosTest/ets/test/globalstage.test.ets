/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import sendableResourceManager from '@ohos.sendableResourceManager';
import { GlobalContext } from '../test/global';

export default function globalStageTest() {
  describe("globalStageTest", () => {
    console.log('*************start globalStageTest*************');
    let res: Context;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      res = (GlobalContext.getContext().getObject('yq') as Context)
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_0100
     * @tc.name      : getStringSync with resource object and format value
     * @tc.desc      : getStringSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringSync_stagetest_0100', 0, async (done: Function) => {
      let mgr: resourceManager.ResourceManager = res.resourceManager;
      try {
        let value: string = mgr.getStringSync(
          {
            bundleName: "ohos.acts.globalstage",
            moduleName: "entry_test",
            id: $r('app.string.app_name').id
          }, 100);
        console.log('getStringSync_stagetest_0100 1' + value);
        expect(value).assertEqual('ohosProject 100');
      } catch (error) {
        console.log('getStringSync_stagetest_0100 3' + error.code);
        expect(error.code == 401).assertTrue();
        console.log('getStringSync_stagetest_0100 3' + error.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_0200
     * @tc.name      : getStringSync with resource object
     * @tc.desc      : getStringSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringSync_stagetest_0200', 0, async (done: Function) => {
      let mgr: resourceManager.ResourceManager = res.resourceManager;
      try {
        let value: string = mgr.getStringSync(
          {
            bundleName: "ohos.acts.globalstage",
            moduleName: "entry_test",
            id: $r('app.string.app_name').id
          });
        console.log('getStringSync_stagetest_0200 1' + value);
        expect(value).assertEqual('ohosProject %d');
      } catch (error) {
        console.log('getStringSync_stagetest_0200 2' + error.code);
        expect(error.code == 401).assertTrue();
        console.log('getStringSync_stagetest_0200 3' + error.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0100
     * @tc.name      : getStringByNameSync with resource name
     * @tc.desc      : getStringByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getStringByNameSync('app_name');
        console.log('getStringByNameSync_stagetest_0100 1' + value);
        expect(value).assertEqual('ohosProject %d');
      } catch (e) {
        console.log('getStringByNameSync_stagetest_0100 2' + e.code);
        console.log('getStringByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0200
     * @tc.name      : getStringByNameSync with resource name and format value
     * @tc.desc      : getStringByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringByNameSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getStringByNameSync('app_name', 100);
        console.log('getStringByNameSync_stagetest_0200 1' + value);
        expect(value).assertEqual('ohosProject 100');
      } catch (e) {
        console.log('getStringByNameSync_stagetest_0200 2' + e.code);
        console.log('getStringByNameSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_0100
     * @tc.name      : getStringValue with resource name in callback mode
     * @tc.desc      : getStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringValue_stage_test_0100', 0, async (done: Function) => {
      res.resourceManager.getStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.app_name').id
      }, (err: BusinessError, value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringValue_stage_test_0100 ' + value);
        expect(value).assertEqual('ohosProject %d');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_0200
     * @tc.name      : getStringValue with resource name in promise mode
     * @tc.desc      : getStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringValue_stage_test_0200', 0, async (done: Function) => {
      res.resourceManager.getStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.app_name').id
      }).then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringValue_stage_test_0200 ' + value);
        expect(value).assertEqual('ohosProject %d');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0100
     * @tc.name      : getStringArrayValue with resource name in callback mode
     * @tc.desc      : getStringArrayValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValue_stage_test_0100', 0, async (done: Function) => {
      res.resourceManager.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.strarray.sizeList').id
      }, (err: BusinessError, value: Array<string>) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayValue_stage_test_0100 ' + value);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0200
     * @tc.name      : getStringArrayValue with resource name in promise mode
     * @tc.desc      : getStringArrayValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValue_stage_test_0200', 0, async (done: Function) => {
      res.resourceManager.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.strarray.sizeList').id
      }).then((value: Array<string>) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayValue_stage_test_0200 ' + value);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0100
     * @tc.name      : getMediaContent with resource name in callback mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0100', 0, async (done: Function) => {
      res.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, (err: BusinessError, value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0100 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0200
     * @tc.name      : getMediaContent with resource name in promise mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0200', 0, async (done: Function) => {
      res.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }).then((value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0200 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0300
     * @tc.name      : getMediaContent with resource name and density in callback mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0300', 0, async (done: Function) => {
      res.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 0, (err: BusinessError, value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0300 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0400
     * @tc.name      : getMediaContent with resource name and density in promise mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0400', 0, async (done: Function) => {
      res.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 0).then((value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0400 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0100
     * @tc.name      : getMediaContentBase64 with resource name in callback mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0100', 0, async (done: Function) => {
      res.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, (err: BusinessError, value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0100 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0200
     * @tc.name      : getMediaContentBase64 with resource name in promise mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0200', 0, async (done: Function) => {
      res.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }).then((value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0200 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0300
     * @tc.name      : getMediaContentBase64 with resource name and density in callback mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0300', 0, async (done: Function) => {
      res.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 0, (err: BusinessError, value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0300 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0400
     * @tc.name      : getMediaContentBase64 with resource name and density in promise mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0400', 0, async (done: Function) => {
      res.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 0).then((value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0400 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0100
     * @tc.name      : getPluralStringValue with resource name in callback mode
     * @tc.desc      : getPluralStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValue_stage_test_0100', 0, async (done: Function) => {
      res.resourceManager.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.plural.plural_name').id
      }, 2, (error: BusinessError, value: string) => {
        expect(value !== null).assertTrue();
        console.log('getPluralStringValue_stage_test_0100 ' + value);
        expect(value).assertEqual('2 apples');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0200
     * @tc.name      : getPluralStringValue with resource name in promise mode
     * @tc.desc      : getPluralStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValue_stage_test_0200', 0, async (done: Function) => {
      res.resourceManager.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.plural.plural_name').id
      }, 2).then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getPluralStringValue_stage_test_0200 ' + value);
        expect(value).assertEqual('2 apples');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETBOOLEAN_STAGE_0100
     * @tc.name      : getBoolean with resource name
     * @tc.desc      : getBoolean
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getBoolean_stage_test_0100', 0, async (done: Function) => {
      let value: boolean = res.resourceManager.getBoolean({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.boolean.boolean_1').id
      });
      console.log('getBoolean_stage_test_0100 ' + value);
      expect(value).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETNUMBER_STAGE_0100
     * @tc.name      : getNumber with resource name
     * @tc.desc      : getNumber
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNumber_stage_test_0100', 0, async (done: Function) => {
      let value: number = res.resourceManager.getNumber({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.integer.integer_1').id
      });
      console.log('getinteger_stage_test_0100 ' + value);
      expect(value).assertEqual(100);
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETDRAWABLEDESCRIPTOR_STAGE_0100
     * @tc.name      : getDrawableDescriptor with resource name
     * @tc.desc      : getDrawableDescriptor
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getDrawableDescriptor_stage_test_0100', 0, async (done: Function) => {
      let out = true;
      let value: DrawableDescriptor = res.resourceManager.getDrawableDescriptor(
        {
          bundleName: "ohos.acts.globalstage", moduleName: "entry_test", id: $r('app.media.icon').id
        });
      console.log('getDrawableDescriptor_stage_test_0100 ' + value);
      if (value == null) {
        out = false;
      }
      console.log('getDrawableDescriptor_test_2100 ' + out);
      expect(out).assertTrue();
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_GETCOLOR_STAGE_JS_0100
    * @tc.name    test getColor method with resource param in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0100', 0, async (done: Function) => {
      res.resourceManager.getColor({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      }, (err: BusinessError, value: number) => {
        expect(value !== null).assertTrue();
        console.log('getColor_test_0100 ' + value);
        expect(value).assertEqual(4294967295);
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_GETCOLOR_STAGE_JS_0200
    * @tc.name    test getColor method with resource param in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0200', 0, async (done: Function) => {
      res.resourceManager.getColor({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      }).then((value: number) => {
        expect(value !== null).assertTrue();
        console.log('getColor_test_0200 ' + value);
        expect(value).assertEqual(4294967295);
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_GETCOLORSYNC_STAGE_JS_0100
    * @tc.name    test getColorSync method with resource param in promise mode
    * @tc.desc    get the sync color in promise mode
    */
    it('getColorSync_test_0100', 0, async (done: Function) => {
      let value: number = res.resourceManager.getColorSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      });
      expect(value !== null).assertTrue();
      console.log('getColorSync_test_0100 ' + value);
      expect(value).assertEqual(4294967295);
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETRAWFDSYNC_STAGE_0100
     * @tc.name      : getRawFdSync with path
     * @tc.desc      : getRawFdSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getRawFdSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: resourceManager.RawFileDescriptor = res.resourceManager.getRawFdSync('rawfiletest.xml');
        console.log('getRawFdSync_stagetest_0100 1' + value.fd);
        console.log('getRawFdSync_stagetest_0100 1' + value.offset);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getRawFdSync_stagetest_0100 2' + e.code);
        console.log('getRawFdSync_stagetest_0100 3' + e.message);
      }
      res.resourceManager.closeRawFdSync('rawfiletest.xml');
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETRAWFILELISTSYNC_STAGE_0100
     * @tc.name      : getRawFileListSync with path
     * @tc.desc      : getRawFileListSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getRawFileListSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: Array<string> = res.resourceManager.getRawFileListSync('');
        console.log('getRawFileListSync_stagetest_0100 1' + value);
        console.log('getRawFileListSync_stagetest_0100 1' + value.length);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getRawFileListSync_stagetest_0100 2' + e.code);
        console.log('getRawFileListSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETRAWFILECONTENTSYNC_STAGE_0100
     * @tc.name      : getRawFileContentSync with path
     * @tc.desc      : getRawFileContentSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getRawFileContentSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: Uint8Array =
        res.resourceManager.getRawFileContentSync('rawfiletest.xml');
        console.log('getRawFileContentSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getRawFileContentSync_stagetest_0100 2' + e.code);
        console.log('getRawFileContentSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTSYNC_STAGE_0100
     * @tc.name      : getMediaContentSync with res id
     * @tc.desc      : getMediaContentSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: Uint8Array = res.resourceManager.getMediaContentSync($r('app.media.icon').id);
        console.log('getMediaContentSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getMediaContentSync_stagetest_0100 2' + e.code);
        console.log('getMediaContentSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTSYNC_STAGE_0200
     * @tc.name      : getMediaContentSync with resource object
     * @tc.desc      : getMediaContentSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value: Uint8Array = res.resourceManager.getMediaContentSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.media.icon').id
        });
        console.log('getMediaContentSync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getMediaContentSync_stagetest_0200 2' + e.code);
        console.log('getMediaContentSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64SYNC_STAGE_0100
     * @tc.name      : getMediaContentBase64Sync with res id
     * @tc.desc      : getMediaContentBase64Sync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64Sync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getMediaContentBase64Sync($r('app.media.icon').id);
        console.log('getMediaContentBase64Sync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getMediaContentBase64Sync_stagetest_0100 2' + e.code);
        console.log('getMediaContentBase64Sync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64SYNC_STAGE_0200
     * @tc.name      : getMediaContentBase64Sync with resource object
     * @tc.desc      : getMediaContentBase64Sync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64Sync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getMediaContentBase64Sync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.media.icon').id
        });
        console.log('getMediaContentBase64Sync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getMediaContentBase64Sync_stagetest_0200 2' + e.code);
        console.log('getMediaContentBase64Sync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUESYNC_STAGE_0100
     * @tc.name      : getPluralStringValueSync with res id
     * @tc.desc      : getPluralStringValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValueSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getPluralStringValueSync($r('app.plural.plural_name').id, 0);
        console.log('getPluralStringValueSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getPluralStringValueSync_stagetest_0100 2' + e.code);
        console.log('getPluralStringValueSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUESYNC_STAGE_0200
     * @tc.name      : getPluralStringValueSync with resource object
     * @tc.desc      : getPluralStringValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValueSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.plural.plural_name').id
        }, 1);
        console.log('getPluralStringValueSync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getPluralStringValueSync_stagetest_0200 2' + e.code);
        console.log('getPluralStringValueSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUESYNC_STAGE_0100
     * @tc.name      : getStringArrayValueSync with res id
     * @tc.desc      : getStringArrayValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValueSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: Array<string> =
        res.resourceManager.getStringArrayValueSync($r('app.strarray.sizeList').id);
        console.log('getStringArrayValueSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getStringArrayValueSync_stagetest_0100 2' + e.code);
        console.log('getStringArrayValueSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUESYNC_STAGE_0200
     * @tc.name      : getStringArrayValueSync with resource object
     * @tc.desc      : getStringArrayValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValueSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value: Array<string> = res.resourceManager.getStringArrayValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.strarray.sizeList').id
        });
        console.log('getStringArrayValueSync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getStringArrayValueSync_stagetest_0200 2' + e.code);
        console.log('getStringArrayValueSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGBYNAMESYNC_STAGE_0100
     * @tc.name      : getPluralStringByNameSync with resource name
     * @tc.desc      : getPluralStringByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getPluralStringByNameSync('plural_name', 2);
        console.log('getPluralStringByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getPluralStringByNameSync_stagetest_0100 2' + e.code);
        console.log('getPluralStringByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIABYNAMESYNC_STAGE_0100
     * @tc.name      : getMediaByNameSync with resource name
     * @tc.desc      : getMediaByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: Uint8Array = res.resourceManager.getMediaByNameSync('icon');
        console.log('getMediaByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getMediaByNameSync_stagetest_0100 2' + e.code);
        console.log('getMediaByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIABASE64BYNAMESYNC_STAGE_0100
     * @tc.name      : getMediaBase64ByNameSync with resource name
     * @tc.desc      : getMediaBase64ByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaBase64ByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getMediaBase64ByNameSync('icon');
        console.log('getMediaBase64ByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getMediaBase64ByNameSync_stagetest_0100 2' + e.code);
        console.log('getMediaBase64ByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYBYNAMESYNC_STAGE_0100
     * @tc.name      : getStringArrayByNameSync with resource name
     * @tc.desc      : getStringArrayByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: Array<string> = res.resourceManager.getStringArrayByNameSync('sizeList');
        console.log('getStringArrayByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getStringArrayByNameSync_stagetest_0100 2' + e.code);
        console.log('getStringArrayByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETCONFIGURATIONSYNC_STAGE_0100
     * @tc.name      : getConfigurationSync
     * @tc.desc      : getConfigurationSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getConfigurationSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: resourceManager.Configuration = res.resourceManager.getConfigurationSync();
        console.log('getStringArrayByNameSync_stagetest_0100 1' + value.locale);
        console.log('getStringArrayByNameSync_stagetest_0100 1' + value.direction);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getConfigurationSync_stagetest_0100 2' + e.code);
        console.log('getConfigurationSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETDEVICECAPABILITYSYNC_STAGE_0100
     * @tc.name      : getDeviceCapabilitySync
     * @tc.desc      : getDeviceCapabilitySync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getDeviceCapabilitySync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value: resourceManager.DeviceCapability = res.resourceManager.getDeviceCapabilitySync();
        console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.screenDensity);
        console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.deviceType);
        expect(value !== null).assertTrue();
      } catch (e) {
        console.log('getDeviceCapabilitySync_stagetest_0100 2' + e.code);
        console.log('getDeviceCapabilitySync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GetLocales_0010
     * @tc.name      : getLocales without parameter
     * @tc.desc      : getLocales
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_GetLocales_0010', 0, async (done: Function) => {
      try {
        let value: string = res.resourceManager.getLocales().toString();
        console.log('SUB_GLOBAL_GetLocales_0010' + value);
        expect(value == 'en-US,zh-CN').assertTrue();
      } catch (e) {
        console.log('SUB_GLOBAL_GetLocales_0010_errorCode' + e.code);
        console.log('SUB_GLOBAL_GetLocales_0010_errorMessage' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0010
     * @tc.name      : getSymbol resource not found by resid
     * @tc.desc      : getSymbol
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_GetSymbol_0010', 0, async (done: Function) => {
      try {
        let value: number = res.resourceManager.getSymbol($r('app.symbol.symbolTest1').id);
        console.log('SUB_GLOBAL_Getsymbol_0010_value' + value);
        expect(value == 983043).assertTrue();
      } catch (e) {
        console.log('SUB_GLOBAL_GetSymbol_0010_errorCode' + e.code);
        console.log('SUB_GLOBAL_GetSymbol_0010_errorMessage' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0130
     * @tc.name      : getSymbolByName normal name
     * @tc.desc      : getSymbolByName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_GetSymbol_0130', 0, async (done: Function) => {
      try {
        let value: number = res.resourceManager.getSymbolByName('symbolTest1');
        console.log('SUB_GLOBAL_Getsymbol_0130' + value);
        expect(value == 983043).assertTrue();
      } catch (e) {
        console.log('SUB_GLOBAL_GetSymbol_0130_errorCode' + e.code);
        console.log('SUB_GLOBAL_GetSymbol_0130_errorMessage' + e.message);
      }
      done();
    })

    it('SUB_GOLBAL_REMSGR_isRawDir_0010', 0, async () => {
      try {
        let value: boolean = res.resourceManager.isRawDir('rawfiletest.xml');
        console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_value' + value);
        expect(value == false).assertTrue();
      } catch (e) {
        console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_errorCode' + e.code);
        console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_errorMessage' + e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010', 0, async () => {
      try {
        let value: resourceManager.Configuration = res.resourceManager.getOverrideConfiguration();
        console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_value' + value.mnc);
        expect(value.mnc == 0).assertTrue();
      } catch (e) {
        console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_errorCode' + e.code);
        console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_errorMessage' + e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010', 0, async () => {
      try {
        let completeOverrideConfiguration: resourceManager.Configuration = {
          mcc: 460,
          mnc: 101,
          locale: 'en-US',
          direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
          deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
          colorMode: 1,
          screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
        }

        let value =
        res.resourceManager.getOverrideResourceManager(completeOverrideConfiguration);
        console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010_value' + value.getOverrideConfiguration().mcc);
        expect(value.getOverrideConfiguration().mcc == 460).assertTrue();
      } catch (e) {
        console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010_errorCode' + e.code);
        console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010_errorMessage' + e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010', 0, async () => {
      try {
        let completeOverrideConfiguration: resourceManager.Configuration = {
          mcc: 461,
          mnc: 101,
          locale: 'en-US',
          direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
          deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
          colorMode: 1,
          screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
        }

        let value = res.resourceManager.getOverrideResourceManager();
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_value-before' +
        value.getOverrideConfiguration().mcc);
        expect(value.getOverrideConfiguration().mcc != 461).assertTrue();
        value.updateOverrideConfiguration(completeOverrideConfiguration);
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_value-after' +
        value.getOverrideConfiguration().mcc);
        expect(value.getOverrideConfiguration().mcc == 461).assertTrue();
      } catch (e) {
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_errorCode' + e.code);
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_errorMessage' + e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010', 0, async () => {
      try {
        let resource: resourceManager.Resource = {
          bundleName: 'com.example.myapplication',
          moduleName: 'entry',
          id: $r('app.string.module_desc').id,
          params: ["sdfd", 123],
          type: 10001,
        }
        let value = sendableResourceManager.resourceToSendableResource(resource);
        console.log('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010_value' + value.type);
        expect(value.type == 10001).assertTrue();
      } catch (e) {
        console.log('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010_errorCode' + e.code);
        console.log('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010_errorMessage' + e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010', 0, async () => {
      try {
        let resource: resourceManager.Resource = {
          bundleName: 'com.example.myapplication',
          moduleName: 'entry',
          id: $r('app.string.module_desc').id,
          params: ["sdfd", 123],
          type: 10001,
        }
        let sendableresource = sendableResourceManager.resourceToSendableResource(resource);
        let value = sendableResourceManager.sendableResourceToResource(sendableresource);
        value.type = 10002
        console.log('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010_value' + value.type);
        expect(value.type == 10002).assertTrue();
      } catch (e) {
        console.log('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010_errorCode' + e.code);
        console.log('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010_errorMessage' + e.message);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0100
     * @tc.name      : resourceManager_test_getStringSync_0010
     * @tc.desc      : %2$d(The second parameter is an integer)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0010', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringOne').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringOne').id, "format string", 10);
        console.log('resourceManager_test_getStringSync_0010 value_one:' + value_one);
        expect(value_one).assertEqual('10');
        let value_two = resMgr.getStringSync(resource, "format string", 10);
        console.log('resourceManager_test_getStringSync_0010 value_two:' + value_two);
        expect(value_two).assertEqual('10');
        let value_three = resMgr.getStringByNameSync('test_stringOne', "format string", 10);
        console.log('resourceManager_test_getStringSync_0010 value_three:' + value_three);
        expect(value_three).assertEqual('10');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0010 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0200
     * @tc.name      : resourceManager_test_getStringSync_0020
     * @tc.desc      : %2$d(The second parameter is an integer in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0020', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwo').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringTwo').id, "format string", 1.234568E+16);
        console.log('resourceManager_test_getStringSync_0020 value_one:' + value_one);
        expect(value_one).assertEqual('12345680000000000');
        let value_two = resMgr.getStringSync(resource, "format string", 1.234568E+16);
        console.log('resourceManager_test_getStringSync_0020 value_two:' + value_two);
        expect(value_two).assertEqual('12345680000000000');
        let value_three = resMgr.getStringByNameSync('test_stringTwo', "format string", 1.234568E+16);
        console.log('resourceManager_test_getStringSync_0020 value_three:' + value_three);
        expect(value_three).assertEqual('12345680000000000');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0020 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0300
     * @tc.name      : resourceManager_test_getStringSync_0030
     * @tc.desc      : %2$d(The second parameter is a decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0030', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringThree').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringThree').id, "format string", 10.01);
        console.log('resourceManager_test_getStringSync_0030 value_one:' + value_one);
        expect(value_one).assertEqual('10');
        let value_two = resMgr.getStringSync(resource, "format string", 10.01);
        console.log('resourceManager_test_getStringSync_0030 value_two:' + value_two);
        expect(value_two).assertEqual('10');
        let value_three = resMgr.getStringByNameSync('test_stringThree', "format string", 10.01);
        console.log('resourceManager_test_getStringSync_0030 value_three:' + value_three);
        expect(value_three).assertEqual('10');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0030 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0400
     * @tc.name      : resourceManager_test_getStringSync_0040
     * @tc.desc      : %2$d(The second parameter is a decimal number in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0040', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFour').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringFour').id, "format string", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0040 value_one:' + value_one);
        expect(value_one).assertEqual('0');
        let value_two = resMgr.getStringSync(resource, "format string", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0040 value_two:' + value_two);
        expect(value_two).assertEqual('0');
        let value_three = resMgr.getStringByNameSync('test_stringFour', "format string", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0040 value_three:' + value_three);
        expect(value_three).assertEqual('0');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0040 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0500
     * @tc.name      : resourceManager_test_getStringSync_0050
     * @tc.desc      : %3$s(The third parameter is a Chinese string)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0050', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFive').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringFive').id, "format string", 12, "测试测试");
        console.log('resourceManager_test_getStringSync_0050 value_one:' + value_one);
        expect(value_one).assertEqual('测试测试');
        let value_two = resMgr.getStringSync(resource, "format string", 12, "测试测试");
        console.log('resourceManager_test_getStringSync_0050 value_two:' + value_two);
        expect(value_two).assertEqual('测试测试');
        let value_three = resMgr.getStringByNameSync('test_stringFive', "format string", 12, "测试测试");
        console.log('resourceManager_test_getStringSync_0050 value_three:' + value_three);
        expect(value_three).assertEqual('测试测试');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0050 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0600
     * @tc.name      : resourceManager_test_getStringSync_0060
     * @tc.desc      : %3$s(The third parameter is an English string)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0060', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSix').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringSix').id, "format string", 12, "TestTest");
        console.log('resourceManager_test_getStringSync_0060 value_one:' + value_one);
        expect(value_one).assertEqual('TestTest');
        let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest");
        console.log('resourceManager_test_getStringSync_0060 value_two:' + value_two);
        expect(value_two).assertEqual('TestTest');
        let value_three = resMgr.getStringByNameSync('test_stringSix', "format string", 12, "TestTest");
        console.log('resourceManager_test_getStringSync_0060 value_three:' + value_three);
        expect(value_three).assertEqual('TestTest');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0060 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0700
     * @tc.name      : resourceManager_test_getStringSync_0070
     * @tc.desc      : %4$f(The fourth parameter is an integer)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0070', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSeven').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringSeven').id, "format string", 12, "TestTest", 20);
        console.log('resourceManager_test_getStringSync_0070 value_one:' + value_one);
        expect(value_one).assertEqual(20);
        let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 20);
        console.log('resourceManager_test_getStringSync_0070 value_two:' + value_two);
        expect(value_two).assertEqual(20);
        let value_three = resMgr.getStringByNameSync('test_stringSeven', "format string", 12, "TestTest", 20);
        console.log('resourceManager_test_getStringSync_0070 value_three:' + value_three);
        expect(value_three).assertEqual(20);
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0070 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0800
     * @tc.name      : resourceManager_test_getStringSync_0080
     * @tc.desc      : %4$f(The fourth parameter is an integer in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0080', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringEight').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringEight')
          .id, "format string", 12, "TestTest", 1.234568E+16);
        console.log('resourceManager_test_getStringSync_0080 value_one:' + value_one);
        expect(value_one).assertEqual('12345680000000000');
        let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568E+16);
        console.log('resourceManager_test_getStringSync_0080 value_two:' + value_two);
        expect(value_two).assertEqual('12345680000000000');
        let value_three = resMgr.getStringByNameSync('test_stringEight', "format string", 12, "TestTest", 1.234568E+16);
        console.log('resourceManager_test_getStringSync_0080 value_three:' + value_three);
        expect(value_three).assertEqual('12345680000000000');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0080 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0900
     * @tc.name      : resourceManager_test_getStringSync_0090
     * @tc.desc      : %4$f(The fourth parameter is a decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0090', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringNine').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringNine')
          .id, "format string", 12, "TestTest", 20.01);
        console.log('resourceManager_test_getStringSync_0090 value_one:' + value_one);
        expect(value_one).assertEqual('20.01');
        let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 20.01);
        console.log('resourceManager_test_getStringSync_0090 value_two:' + value_two);
        expect(value_two).assertEqual('20.01');
        let value_three = resMgr.getStringByNameSync('test_stringNine', "format string", 12, "TestTest", 20.01);
        console.log('resourceManager_test_getStringSync_0090 value_three:' + value_three);
        expect(value_three).assertEqual('20.01');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0090 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1000
     * @tc.name      : resourceManager_test_getStringSync_0100
     * @tc.desc      : %4$f(The fourth parameter is a decimal number in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0100', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringTen')
          .id, "format string", 12, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0100 value_one:' + value_one);
        expect(value_one).assertEqual('0');
        let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0100 value_two:' + value_two);
        expect(value_two).assertEqual('0');
        let value_three = resMgr.getStringByNameSync('test_stringTen', "format string", 12, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0100 value_three:' + value_three);
        expect(value_three).assertEqual('0');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0100 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1100
     * @tc.name      : resourceManager_test_getStringSync_0110
     * @tc.desc      : %%d
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0110', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringEleven').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringEleven').id, 12);
        console.log('resourceManager_test_getStringSync_0110 value_one:' + value_one);
        expect(value_one).assertEqual('%d');
        let value_two = resMgr.getStringSync(resource, 12);
        console.log('resourceManager_test_getStringSync_0110 value_two:' + value_two);
        expect(value_two).assertEqual('%d');
        let value_three = resMgr.getStringByNameSync('test_stringEleven', 12);
        console.log('resourceManager_test_getStringSync_0110 value_three:' + value_three);
        expect(value_three).assertEqual('%d');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0110 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1200
     * @tc.name      : resourceManager_test_getStringSync_0120
     * @tc.desc      : %%%s
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0120', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwelve').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringTwelve')
          .id, "format string", 12, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0120 value_one:' + value_one);
        expect(value_one).assertEqual('%format string');
        let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0120 value_two:' + value_two);
        expect(value_two).assertEqual('%format string');
        let value_three = resMgr.getStringByNameSync('test_stringTwelve', "format string", 12, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0120 value_three:' + value_three);
        expect(value_three).assertEqual('%format string');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0120 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1300
     * @tc.name      : resourceManager_test_getStringSync_0130
     * @tc.desc      : %%%%f
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0130', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringThirteen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringThirteen').id, 12.01);
        console.log('resourceManager_test_getStringSync_0130 value_one:' + value_one);
        expect(value_one).assertEqual('%%f');
        let value_two = resMgr.getStringSync(resource, 12.01);
        console.log('resourceManager_test_getStringSync_0130 value_two:' + value_two);
        expect(value_two).assertEqual('%%f');
        let value_three = resMgr.getStringByNameSync('test_stringThirteen', 12.01);
        console.log('resourceManager_test_getStringSync_0130 value_three:' + value_three);
        expect(value_three).assertEqual('%%f');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0130 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1400
     * @tc.name      : resourceManager_test_getStringSync_0140
     * @tc.desc      : %2$d %3$s %4$f(The second parameter is integer, the third is Chinese, the fourth is decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0140', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFourteen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringFourteen').id,
          "format string", 10, "测试测试", 98.78);
        console.log('resourceManager_test_getStringSync_0140 value_one:' + value_one);
        expect(value_one).assertEqual('10 测试测试 98.78');
        let value_two = resMgr.getStringSync(resource, "format string", 10, "测试测试", 98.78);
        console.log('resourceManager_test_getStringSync_0140 value_two:' + value_two);
        expect(value_two).assertEqual('10 测试测试 98.78');
        let value_three = resMgr.getStringByNameSync('test_stringFourteen', "format string", 10, "测试测试", 98.78);
        console.log('resourceManager_test_getStringSync_0140 value_three:' + value_three);
        expect(value_three).assertEqual('10 测试测试 98.78');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0140 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1500
     * @tc.name      : resourceManager_test_getStringSync_0150
     * @tc.desc      : %2$d %3$s %4$f(The second parameter is integer in scientific notation,
     * the third is English, the fourth is decimal in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0150', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFifteen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringFifteen').id,
          "format string", 1.234568E+16, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0150 value_one:' + value_one);
        expect(value_one).assertEqual('12345680000000000 TestTest 0');
        let value_two = resMgr.getStringSync(resource, "format string", 1.234568E+16, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0150 value_two:' + value_two);
        expect(value_two).assertEqual('12345680000000000 TestTest 0');
        let value_three = resMgr.getStringByNameSync('test_stringFifteen',
          "format string", 1.234568E+16, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0150 value_three:' + value_three);
        expect(value_three).assertEqual('12345680000000000 TestTest 0');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0150 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1600
     * @tc.name      : resourceManager_test_getStringSync_0160
     * @tc.desc      : %2$d %3$s %4$f %%d(The parameter is null)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0160', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSixteen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringSixteen').id);
        console.log('resourceManager_test_getStringSync_0160 value_one:' + value_one);
        expect(value_one).assertEqual('%2$d %3$s %4$f %d');
        let value_two = resMgr.getStringSync(resource);
        console.log('resourceManager_test_getStringSync_0160 value_two:' + value_two);
        expect(value_two).assertEqual('%2$d %3$s %4$f %d');
        let value_three = resMgr.getStringByNameSync('test_stringSixteen');
        console.log('resourceManager_test_getStringSync_0160 value_three:' + value_three);
        expect(value_three).assertEqual('%2$d %3$s %4$f %d');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0160 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1700
     * @tc.name      : resourceManager_test_getStringSync_0170
     * @tc.desc      : %d %1$d(The parameter is null)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0170', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSeventeen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringSeventeen').id);
        console.log('resourceManager_test_getStringSync_0170 value_one:' + value_one);
        expect(value_one).assertEqual('%d %1$d');
        let value_two = resMgr.getStringSync(resource);
        console.log('resourceManager_test_getStringSync_0170 value_two:' + value_two);
        expect(value_two).assertEqual('%d %1$d');
        let value_three = resMgr.getStringByNameSync('test_stringSeventeen');
        console.log('resourceManager_test_getStringSync_0170 value_three:' + value_three);
        expect(value_three).assertEqual('%d %1$d');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0170 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1800
     * @tc.name      : resourceManager_test_getStringSync_0180
     * @tc.desc      : %2$d %3$s %4$f(There are more parameters than placeholder indexes)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0180', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringEighteen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringEighteen')
          .id, "format string", 30, "测试测试", 98.78, 1.234568E+16, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0180 value_one:' + value_one);
        expect(value_one).assertEqual('30 测试测试 98.78');
        let value_two = resMgr.getStringSync(resource, "format string",
          30, "测试测试", 98.78, 1.234568E+16, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0180 value_two:' + value_two);
        expect(value_two).assertEqual('30 测试测试 98.78');
        let value_three = resMgr.getStringByNameSync('test_stringEighteen',
          "format string", 30, "测试测试", 98.78, 1.234568E+16, "TestTest", 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0180 value_three:' + value_three);
        expect(value_three).assertEqual('30 测试测试 98.78');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0180 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1900
     * @tc.name      : resourceManager_test_getStringSync_0190
     * @tc.desc      : %d %1$d(Inconsistent placeholder styles)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0190', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringNineteen').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringNineteen').id, 40);
        console.log('resourceManager_test_getStringSync_0190 value_one:' + value_one);
        expect(value_one).assertEqual('40 40');
        let value_two = resMgr.getStringSync(resource, 40);
        console.log('resourceManager_test_getStringSync_0190 value_two:' + value_two);
        expect(value_two).assertEqual('40 40');
        let value_three = resMgr.getStringByNameSync('test_stringNineteen', 40);
        console.log('resourceManager_test_getStringSync_0190 value_three:' + value_three);
        expect(value_three).assertEqual('40 40');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0190 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2000
     * @tc.name      : resourceManager_test_getStringSync_0200
     * @tc.desc      : %%%d %1$d(Inconsistent placeholder styles)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0200', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwenty').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringTwenty').id, 40);
        console.log('resourceManager_test_getStringSync_0200 value_one:' + value_one);
        expect(value_one).assertEqual('%40 40');
        let value_two = resMgr.getStringSync(resource, 40);
        console.log('resourceManager_test_getStringSync_0200 value_two:' + value_two);
        expect(value_two).assertEqual('%40 40');
        let value_three = resMgr.getStringByNameSync('test_stringTwenty', 40);
        console.log('resourceManager_test_getStringSync_0200 value_three:' + value_three);
        expect(value_three).assertEqual('%40 40');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0190 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2100
     * @tc.name      : resourceManager_test_getStringSync_0210
     * @tc.desc      : %d %d %s %s %f %f(Arguments and placeholder match and equal in number)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0210', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyOne').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringTwentyOne')
          .id, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0210 value_one:' + value_one);
        expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
        let value_two = resMgr.getStringSync(resource, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0210 value_two:' + value_two);
        expect(value_two).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
        let value_three = resMgr.getStringByNameSync('test_stringTwentyOne', 50,
          1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
        console.log('resourceManager_test_getStringSync_0210 value_three:' + value_three);
        expect(value_three).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0210 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2200
     * @tc.name      : resourceManager_test_getStringSync_0220
     * @tc.desc      : %d %d %s %s %f %f(The parameters is more than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0220', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyTwo').id
      };
      try {
        let value_one = resMgr.getStringSync($r('app.string.test_stringTwentyTwo')
          .id, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08, 15, "format string", 15.01);
        console.log('resourceManager_test_getStringSync_0220 value_one:' + value_one);
        expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
        let value_two = resMgr.getStringSync(resource, 50, 1.234568E+16, "测试测试",
          "TestTest", 98.78, 1.234568e-0815, 15, "format string", 15.01);
        console.log('resourceManager_test_getStringSync_0220 value_two:' + value_two);
        expect(value_two).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
        let value_three = resMgr.getStringByNameSync('test_stringTwentyTwo', 50, 1.234568E+16,
          "测试测试", "TestTest", 98.78, 1.234568e-08, 15, "format string", 15.01);
        console.log('resourceManager_test_getStringSync_0220 value_three:' + value_three);
        expect(value_three).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('resourceManager_test_getStringSync_0220 failed, error code: ${code}, message: ${message}.');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2300
     * @tc.name      : resourceManager_test_getStringSync_0230
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0230', 0, () => {
      let resMgr = res.resourceManager;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyThree').id);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0230'+error.code+error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2400
     * @tc.name      : resourceManager_test_getStringSync_0240
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0240', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyThree').id
      };
      try {
        resMgr.getStringSync(resource, 50);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0240'+error.code+error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2500
     * @tc.name      : resourceManager_test_getStringByNameSync_0250
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringByNameSync_0250', 0, () => {
      let resMgr = res.resourceManager;
      try {
        resMgr.getStringByNameSync($r('app.string.test_stringTwentyThree').id);
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0250'+error.code+error.message);
        expect(error.code).assertEqual(9001008);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2600
     * @tc.name      : resourceManager_test_getStringSync_0260
     * @tc.desc      : The wrong parameter type
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0260', 0, () => {
      let resMgr = res.resourceManager;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyFour').id, "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0260'+error.code+error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2700
     * @tc.name      : resourceManager_test_getStringSync_0270
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0270', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyFour').id
      };
      try {
        resMgr.getStringSync(resource, "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0270'+error.code+error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2800
     * @tc.name      : resourceManager_test_getStringByNameSync_0280
     * @tc.desc      : Parameter out of index
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringByNameSync_0280', 0, () => {
      let resMgr = res.resourceManager;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFour', "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0280'+error.code+error.message);
        expect(error.code).assertEqual(9001008);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2900
     * @tc.name      : resourceManager_test_getStringSync_0290
     * @tc.desc      : Parameters less than required
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0290', 0, () => {
      let resMgr = res.resourceManager;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyFive').id);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0290'+error.code+error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_3000
     * @tc.name      : resourceManager_test_getStringSync_0300
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0300', 0, () => {
      let resMgr = res.resourceManager;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyFive').id
      };
      try {
        resMgr.getStringSync(resource, 50);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0300'+error.code+error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_3100
     * @tc.name      : resourceManager_test_getStringByNameSync_0310
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringByNameSync_0310', 0, () => {
      let resMgr = res.resourceManager;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFive');
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0310'+error.code+error.message);
        expect(error.code).assertEqual(9001008);
      }
    })
    console.log('*************end globalStageTest*************');
  })
}