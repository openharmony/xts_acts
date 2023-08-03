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
  photoKeys,
  photoFetchOption,
  getFileAsset,
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

    async function createAssetCallback3 (done, testNum, displayName, createOption, fetchOps) {
      let asset: photoAccessHelper.PhotoAsset;
      try {
        helper.createAsset(displayName, createOption, async(err, createAsset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} createAsset failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              let fd = await createAsset.open("rw");
              await createAsset.close(fd);
              expect(createAsset.displayName).assertEqual(displayName);
              asset = await getFileAsset(testNum, fetchOps);
              console.info(`${testNum} createAsset displayName: ${asset.displayName}`);
              expect(asset.displayName).assertEqual(displayName);
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
          try {
            if (err !== undefined) {
              console.info(`${testNum} createAsset failed; err: ${err}`);
              expect(true).assertTrue();
            } else {
              console.info(`${testNum} createAsset success`);
              expect(false).assertTrue();
            }
          } catch(error) {
            console.info(`${testNum} error: ${error}`);
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

    async function createAssetPromise3 (done, testNum, displayName, createOption, fetchOps) {
      try {
        let createAsset : photoAccessHelper.PhotoAsset;
        createAsset = await helper.createAsset(displayName, createOption);
        expect(createAsset.displayName).assertEqual(displayName);
        let fd = await createAsset.open("rw");
        await createAsset.close(fd);
        expect(createAsset.displayName).assertEqual(displayName);
        let asset: photoAccessHelper.PhotoAsset;
        asset = await getFileAsset(testNum, fetchOps);
        console.info(`${testNum} createAsset displayName: ${asset.displayName}`);
        expect(asset.displayName).assertEqual(displayName);
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
     * @tc.desc      : createAsset by displayname
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
     * @tc.desc      : createAsset displayname is undefined and no createoption
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
     * @tc.desc      : createAsset displayname is not has extension and no createoption
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
     * @tc.desc      : createAsset with too long displayname
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
     * @tc.desc      : createAsset with undefined displayname
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
     * @tc.desc      : createAsset displayname is not has extension and subtype is DEFAULT
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
     * @tc.desc      : createAsset with too long displayname and subtype is DEFAULT
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

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_01000
    * @tc.name      : createAsset_callback_0010
    * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is DEFAULT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_0010', 2, async function (done) {
      const testNum = 'createAsset_callback_0010';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_callback_0010aaaaa';
      const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetCallback3(done, testNum, displayName, createOption, fetchOps);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_01100
    * @tc.name      : createAsset_callback_0011
    * @tc.desc      : createAsset with cameraShotKey.length is greater than or equal to 30 and has no subtype
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_0011', 2, async function (done) {
      const testNum = 'createAsset_callback_0011';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_callback_0011aaaaa';
      const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        cameraShotKey: cameraShotKey,
      };
      await createAssetCallback3(done, testNum, displayName, createOption, fetchOps);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_01200
    * @tc.name      : createAsset_callback_0012
    * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is SCREENSHOT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_0012', 2, async function (done) {
      const testNum = 'createAsset_callback_0012';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_callback_0012aaaaa';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_01300
    * @tc.name      : createAsset_callback_0013
    * @tc.desc      : createAsset with abnormal cameraShotKey.length is less than 30 and has no subtype
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_0013', 2, async function (done) {
      const testNum = 'createAsset_callback_0013';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_callback_0013a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_01400
    * @tc.name      : createAsset_callback_0014
    * @tc.desc      : createAsset with abnormal cameraShotKey.length is less than 30 and subtype is DEFAULT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_0014', 2, async function (done) {
      const testNum = 'createAsset_callback_0014';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_callback_0014a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_01500
    * @tc.name      : createAsset_callback_0015
    * @tc.desc      : createAsset with abnormal cameraShotKey.length is less than 30 and subtype is SCREENSHOT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_0015', 2, async function (done) {
      const testNum = 'createAsset_callback_0015';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_callback_0015a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_0000
     * @tc.name      : createAsset_promise_000
     * @tc.desc      : createAsset by displayname
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
     * @tc.desc      : createAsset by displayname with createOption(PhotoSubtype.SCREENSHOT)
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
     * @tc.desc      : createAsset displayname has no extension
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
     * @tc.desc      : createAsset displayname has no extension
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
     * @tc.desc      : createAsset displayname is too long
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
     * @tc.desc      : createAsset with undefined displayname
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
     * @tc.desc      : createAsset displayname has no extension
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
     * @tc.desc      : createAsset displayname is too long with subtype is DEFAULT
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

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_01000
     * @tc.name      : createAsset_promise_0010
     * @tc.desc      : createAsset with normal cameraShotKey.length is is greater than or equal to 30 and has no subtype
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_0010', 2, async function (done) {
      const testNum = 'createAsset_promise_0010';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_promise_0010aaaaaa';
      const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        cameraShotKey: cameraShotKey,
      };
      await createAssetPromise3(done, testNum, displayName, createOption, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_01100
     * @tc.name      : createAsset_promise_0011
     * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is DEFAULT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_0011', 2, async function (done) {
      const testNum = 'createAsset_promise_0011';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_promise_0011aaaaaa';
      const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetPromise3(done, testNum, displayName, createOption, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_01200
     * @tc.name      : createAsset_promise_0012
     * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is SCREENSHOT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_0012', 2, async function (done) {
      const testNum = 'createAsset_promise_0012';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_promise_0012aaaaaa';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_01300
     * @tc.name      : createAsset_promise_0013
     * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and subtype is SCREENSHOT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_0013', 2, async function (done) {
      const testNum = 'createAsset_promise_0013';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_promise_0013a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_01400
     * @tc.name      : createAsset_promise_0014
     * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and subtype is DEFAULT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_0014', 2, async function (done) {
      const testNum = 'createAsset_promise_0014';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_promise_0014a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_01500
     * @tc.name      : createAsset_promise_0015
     * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and has no subtype
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createAsset_promise_0015', 2, async function (done) {
      const testNum = 'createAsset_promise_0015';
      const displayName = testNum + '.jpg';
      const cameraShotKey = 'createAsset_promise_0015a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
    });

    //video
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1100
     * @tc.name      : createAsset_callback_011
     * @tc.desc      : createAsset by displayname
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
    * @tc.desc      : createAsset with displayname is too long
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
    * @tc.desc      : createAsset with displayname is too long and subtype is DEFAULT
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

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1700
    * @tc.name      : createAsset_callback_017
    * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is DEFAULT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_017', 2, async function (done) {
      const testNum = 'createAsset_callback_017';
      const displayName = testNum + '.mp4';
      const cameraShotKey = 'createAsset_callback_0170aaaaa';
      const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetCallback3(done, testNum, displayName, createOption, fetchOps);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1800
    * @tc.name      : createAsset_callback_0180
    * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and has no subtype
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_018', 2, async function (done) {
      const testNum = 'createAsset_callback_018';
      const displayName = testNum + '.mp4';
      const cameraShotKey = 'createAsset_callback_0180aaaaa';
      const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        cameraShotKey: cameraShotKey,
      };
      await createAssetCallback3(done, testNum, displayName, createOption, fetchOps);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_1900
    * @tc.name      : createAsset_callback_019
    * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is SCREENSHOT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_019', 2, async function (done) {
      const testNum = 'createAsset_callback_019';
      const displayName = testNum + '.mp4';
      const cameraShotKey = 'createAsset_callback_0190aaaaa';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_2000
    * @tc.name      : createAsset_callback_020
    * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and has no subtype
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_020', 2, async function (done) {
      const testNum = 'createAsset_callback_020';
      const displayName = testNum + '.mp4';
      const cameraShotKey = 'createAsset_callback_020a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_2100
    * @tc.name      : createAsset_callback_021
    * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and subtype is DEFAULT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_021', 2, async function (done) {
      const testNum = 'createAsset_callback_021';
      const displayName = testNum + '.mp4';
      const cameraShotKey = 'createAsset_callback_021a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ASSET_2200
    * @tc.name      : createAsset_callback_022
    * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and subtype is SCREENSHOT
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('createAsset_callback_022', 2, async function (done) {
      const testNum = 'createAsset_callback_022';
      const displayName = testNum + '.mp4';
      const cameraShotKey = 'createAsset_callback_022a';
      const createOption: photoAccessHelper.PhotoCreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
        cameraShotKey: cameraShotKey,
      };
      await createAssetAbnormalCallback2(done, testNum, displayName, createOption);
    });

    //promise
    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1100
    * @tc.name      : createAsset_promise_011
    * @tc.desc      : createAsset by displayname
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
    * @tc.desc      : createAsset with displayname is too long
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
    * @tc.desc      : createAsset displayname is too long with subtype is DEFAULT
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

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1700
    * @tc.name      : createAsset_promise_017
    * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and has no subtype
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
   it('createAsset_promise_017', 2, async function (done) {
    const testNum = 'createAsset_promise_017';
    const displayName = testNum + '.mp4';
    const cameraShotKey = 'createAsset_promise_0170aaaaaa';
    const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
    const createOption: photoAccessHelper.PhotoCreateOptions = {
      cameraShotKey: cameraShotKey,
    };
    await createAssetPromise3(done, testNum, displayName, createOption, fetchOps);
  });

  /**
   * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1800
   * @tc.name      : createAsset_promise_018
   * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is DEFAULT
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 2
   */
  it('createAsset_promise_018', 2, async function (done) {
    const testNum = 'createAsset_promise_018';
    const displayName = testNum + '.mp4';
    const cameraShotKey = 'createAsset_promise_0180aaaaaa';
    const fetchOps = photoFetchOption(testNum, photoKeys.CAMERA_SHOT_KEY, cameraShotKey);
    const createOption: photoAccessHelper.PhotoCreateOptions = {
      subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      cameraShotKey: cameraShotKey,
    };
    await createAssetPromise3(done, testNum, displayName, createOption, fetchOps);
  });

  /**
   * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_1900
   * @tc.name      : createAsset_promise_019
   * @tc.desc      : createAsset with normal cameraShotKey.length is greater than or equal to 30 and subtype is SCREENSHOT
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 2
   */
  it('createAsset_promise_019', 2, async function (done) {
    const testNum = 'createAsset_promise_019';
    const displayName = testNum + '.mp4';
    const cameraShotKey = 'createAsset_promise_0190aaaaa';
    const createOption: photoAccessHelper.PhotoCreateOptions = {
      subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
      cameraShotKey: cameraShotKey,
    };
    await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
  });

  /**
   * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_2000
   * @tc.name      : createAsset_promise_020
   * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and subtype is SCREENSHOT
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 2
   */
  it('createAsset_promise_020', 2, async function (done) {
    const testNum = 'createAsset_promise_020';
    const displayName = testNum + '.mp4';
    const cameraShotKey = 'createAsset_promise_0200a';
    const createOption: photoAccessHelper.PhotoCreateOptions = {
      subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT,
      cameraShotKey: cameraShotKey,
    };
    await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
  });

  /**
   * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_2100
   * @tc.name      : createAsset_promise_021
   * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and subtype is DEFAULT
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 2
   */
  it('createAsset_promise_021', 2, async function (done) {
    const testNum = 'createAsset_promise_021';
    const displayName = testNum + '.mp4';
    const cameraShotKey = 'createAsset_promise_0210a';
    const createOption: photoAccessHelper.PhotoCreateOptions = {
      subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      cameraShotKey: cameraShotKey,
    };
    await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
  });

  /**
   * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ASSET_2200
   * @tc.name      : createAsset_promise_022
   * @tc.desc      : createAsset with cameraShotKey.length is less than 30 and no subtype
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 2
   */
  it('createAsset_promise_022', 2, async function (done) {
    const testNum = 'createAsset_promise_022';
    const displayName = testNum + '.mp4';
    const cameraShotKey = 'createAsset_promise_0220a';
    const createOption: photoAccessHelper.PhotoCreateOptions = {
      cameraShotKey: cameraShotKey,
    };
    await createAssetAbnormalPromise2(done, testNum, displayName, createOption);
  });
  })
}
