/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

// @ts-nocheck
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, beforeAll, it, expect } from 'deccjsunit/index'
import {
  getPermission
} from '../../../../../../common'

export default function createAssetTest () {
  describe('createAssetTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    async function createAssetCallback1 (done, testNum, displayName) {
      try {
				helper.createAsset(displayName, (err, createAsset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} createAsset failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(createAsset.displayName).assertEqual(displayName);
            }
          } catch (error) {
            console.info(`${testNum} createAsset failed; error: ${error}`);
          }
          done();
        })
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(false).assertTrue();
				done();
      }
    }

    async function createAssetCallback2 (done, testNum, displayName, createOption) {
      try {
				helper.createAsset(displayName, createOption, (err, createAsset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} createAsset failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(createAsset.displayName).assertEqual(displayName);
            }
          } catch (error) {
            console.info(`${testNum} createAsset failed; error: ${error}`);
          }
          done();
        })
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(false).assertTrue();
				done();
      }
    }

    async function createAssetAbnormalCallback1 (done, testNum, displayName) {
      try {
				helper.createAsset(displayName, (err, createAsset) => {
          if (err !== undefined) {
            console.info(`${testNum} createAsset failed; err: ${err}`);
            expect(true).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(true).assertTrue();
				done();
      }
    }

    async function createAssetAbnormalCallback2 (done, testNum, displayName, createOption) {
      try {
				helper.createAsset(displayName, createOption, (err, createAsset) => {
          if (err !== undefined) {
            console.info(`${testNum} createAsset failed; err: ${err}`);
            expect(true).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(true).assertTrue();
				done();
      }
    }

    async function createAssetPromise1 (done, testNum, displayName) {
      try {
        let createAsset : photoAccessHelper.PhotoAsset;
        createAsset = await helper.createAsset(displayName);
        expect(createAsset.displayName).assertEqual(displayName);
        done();
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(false).assertTrue();
				done();
      }
    }

    async function createAssetPromise2 (done, testNum, displayName, createOption) {
      try {
        let createAsset : photoAccessHelper.PhotoAsset;
        createAsset = await helper.createAsset(displayName, createOption);
        expect(createAsset.displayName).assertEqual(displayName);
        done();
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(false).assertTrue();
				done();
      }
    }

    async function createAssetAbnormalPromise1 (done, testNum, displayName) {
      try {
        await helper.createAsset(displayName);
				expect(false).assertTrue();
        done()
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(true).assertTrue();
				done();
      }
    }

    async function createAssetAbnormalPromise2 (done, testNum, displayName, createOption) {
      try {
        await helper.createAsset(displayName, createOption);
				expect(false).assertTrue();
        done()
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(true).assertTrue();
				done();
      }
    }

    //image
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0000
     * @tc.name      : createAsset_callback_000
     * @tc.desc      : createAsset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_callback_000', 0, async function (done) {
			const testNum = 'createAsset_callback_000';
      const displayName = testNum + '.jpg';
			await createAssetCallback1(done, testNum, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0100
     * @tc.name      : createAsset_callback_001
     * @tc.desc      : createAsset with createOption(PhotoSubtype.DEFAULT)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_001', 2, async function (done) {
			const testNum = 'createAsset_callback_001';
      const displayName = testNum + '.jpg';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetCallback2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0200
     * @tc.name      : createAsset_callback_002
     * @tc.desc      : createAsset with createOption(PhotoSubtype.SCREENSHOT)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_002', 2, async function (done) {
			const testNum = 'createAsset_callback_002';
      const displayName = testNum + '.jpg';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
      };
			await createAssetCallback2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0400
     * @tc.name      : createAsset_callback_004
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_004', 2, async function (done) {
			const testNum = 'createAsset_callback_004';
			await createAssetAbnormalCallback1(done, testNum, undefined);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0500
     * @tc.name      : createAsset_callback_005
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_005', 2, async function (done) {
			const testNum = 'createAsset_callback_005';
      const displayName = testNum;
			await createAssetAbnormalCallback1(done, testNum, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0600
     * @tc.name      : createAsset_callback_006
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_006', 2, async function (done) {
			const testNum = 'createAsset_callback_006';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.jpg';
			await createAssetAbnormalCallback1(done, testNum, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0700
     * @tc.name      : createAsset_callback_007
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_007', 2, async function (done) {
			const testNum = 'createAsset_callback_007';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetAbnormalCallback2(done, testNum, undefined, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0800
     * @tc.name      : createAsset_callback_008
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_008', 2, async function (done) {
			const testNum = 'createAsset_callback_008';
      const displayName = testNum;
			const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_0900
     * @tc.name      : createAsset_callback_009
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_callback_009', 2, async function (done) {
			const testNum = 'createAsset_callback_009';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.jpg';
			const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0000
     * @tc.name      : createAsset_promise_000
     * @tc.desc      : createAsset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_promise_000', 0, async function (done) {
			const testNum = 'createAsset_promise_000';
      const displayName = testNum + '.jpg';
			await createAssetPromise1(done, testNum, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0100
     * @tc.name      : createAsset_promise_001
     * @tc.desc      : createAsset with createOption(PhotoSubtype.DEFAULT)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_001', 2, async function (done) {
			const testNum = 'createAsset_promise_001';
      const displayName = testNum + '.jpg';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetPromise2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0200
     * @tc.name      : createAsset_promise_002
     * @tc.desc      : createAsset with createOption(PhotoSubtype.SCREENSHOT)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_002', 2, async function (done) {
			const testNum = 'createAsset_promise_002';
      const displayName = testNum + '.jpg';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
      };
			await createAssetPromise2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0400
     * @tc.name      : createAsset_promise_004
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_004', 2, async function (done) {
			const testNum = 'createAsset_promise_004';
			await createAssetAbnormalPromise1(done, testNum, undefined);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0500
     * @tc.name      : createAsset_promise_005
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_005', 2, async function (done) {
			const testNum = 'createAsset_promise_005';
      const displayName = testNum;
			await createAssetAbnormalPromise1(done, testNum, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0600
     * @tc.name      : createAsset_promise_006
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_006', 2, async function (done) {
			const testNum = 'createAsset_promise_006';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.jpg';
			await createAssetAbnormalPromise1(done, testNum, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0700
     * @tc.name      : createAsset_promise_007
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_007', 2, async function (done) {
			const testNum = 'createAsset_promise_007';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetAbnormalPromise2(done, testNum, undefined, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0800
     * @tc.name      : createAsset_promise_008
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_008', 2, async function (done) {
			const testNum = 'createAsset_promise_008';
      const displayName = testNum;
			const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0900
     * @tc.name      : createAsset_promise_009
     * @tc.desc      : createAsset abnormal param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_009', 2, async function (done) {
			const testNum = 'createAsset_promise_009';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.jpg';
			const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
			await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
    });

    //video
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1100
     * @tc.name      : createAsset_callback_011
     * @tc.desc      : createAsset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAsset_callback_011', 0, async function (done) {
      const testNum = 'createAsset_callback_011';
      const displayName = testNum + '.mp4';
      await createAssetCallback1(done, testNum, displayName);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1200
    * @tc.name      : createAsset_callback_012
    * @tc.desc      : createAsset with createOption(PhotoSubtype.DEFAULT)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_012', 2, async function (done) {
      const testNum = 'createAsset_callback_012';
      const displayName = testNum + '.mp4';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      await createAssetCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1300
    * @tc.name      : createAsset_callback_013
    * @tc.desc      : createAsset with createOption(PhotoSubtype.SCREENSHOT)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_013', 2, async function (done) {
      const testNum = 'createAsset_callback_013';
      const displayName = testNum + '.mp4';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
      };
      await createAssetCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1500
    * @tc.name      : createAsset_callback_015
    * @tc.desc      : createAsset abnormal param
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_015', 2, async function (done) {
      const testNum = 'createAsset_callback_015';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.mp4';
      await createAssetAbnormalCallback1(done, testNum, displayName);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1600
    * @tc.name      : createAsset_callback_016
    * @tc.desc      : createAsset abnormal param
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_016', 2, async function (done) {
      const testNum = 'createAsset_callback_016';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.mp4';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    //promise
    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1100
    * @tc.name      : createAsset_promise_011
    * @tc.desc      : createAsset
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('createAsset_promise_011', 0, async function (done) {
      const testNum = 'createAsset_promise_011';
      const displayName = testNum + '.mp4';
      await createAssetPromise1(done, testNum, displayName);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1200
    * @tc.name      : createAsset_promise_012
    * @tc.desc      : createAsset with createOption(PhotoSubtype.DEFAULT)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_promise_012', 2, async function (done) {
      const testNum = 'createAsset_promise_012';
      const displayName = testNum + '.mp4';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      await createAssetPromise2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1300
    * @tc.name      : createAsset_promise_013
    * @tc.desc      : createAsset with createOption(PhotoSubtype.SCREENSHOT)
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_promise_013', 2, async function (done) {
      const testNum = 'createAsset_promise_013';
      const displayName = testNum + '.mp4';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
      };
      await createAssetPromise2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1500
    * @tc.name      : createAsset_promise_015
    * @tc.desc      : createAsset abnormal param
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_promise_015', 2, async function (done) {
      const testNum = 'createAsset_promise_015';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.mp4';
      await createAssetAbnormalPromise1(done, testNum, displayName);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1600
    * @tc.name      : createAsset_promise_016
    * @tc.desc      : createAsset abnormal param
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_promise_016', 2, async function (done) {
      const testNum = 'createAsset_promise_016';
      let value = '';
      for (let i = 0; i < 253; i++) {
        value += 'a';
      }
      const displayName = value + '.mp4';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
    });
  })
}
