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
import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  fetchOption,
  fetchAllOption,
  getFileAsset,
} from '../../../../../../../common'

export default function addAssetsTest () {
  describe('addAssetsTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0100
      * @tc.name      : addAssets_callback_001
      * @tc.desc      : add image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('addAssets_callback_001', 0, async function (done) {
      const testNum = 'addAssets_callback_001';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addCb01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        album.addAssets([asset], async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult = await album.getAssets(fetchOps);
              expect(fetchResult.getCount()).assertEqual(1);
              fetchResult.close()
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0300
      * @tc.name      : addAssets_callback_003
      * @tc.desc      : add image&video asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_callback_003', 2, async function (done) {
      const testNum = 'addAssets_callback_003';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addCb03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addCb01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testNum, fetchOps2);
        assetList.push(asset2);

        album.addAssets(assetList, async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult = await album.getAssets(fetchAllOption());
              expect(fetchResult.getCount()).assertEqual(2);
              fetchResult.close()
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0500
      * @tc.name      : addAssets_callback_005
      * @tc.desc      : add undefined array to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_callback_005', 2, async function (done) {
      const testNum = 'addAssets_callback_005';
      try {
        const album = await helper.createAlbum(testNum);
        album.addAssets(undefined, async (err) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    });

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0100
      * @tc.name      : addAssets_promise_001
      * @tc.desc      : add image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('addAssets_promise_001', 0, async function (done) {
      const testNum = 'addAssets_promise_001';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addPro01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await album.addAssets([asset]);
        const fetchResult = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0300
      * @tc.name      : addAssets_promise_003
      * @tc.desc      : add image&video asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_003', 2, async function (done) {
      const testNum = 'addAssets_promise_003';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addPro03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addPro01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testNum, fetchOps2);
        assetList.push(asset2);

        await album.addAssets(assetList);
        const fetchResult = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(2);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0400
      * @tc.name      : addAssets_promise_004
      * @tc.desc      : add empty array to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_004', 2, async function (done) {
      const testNum = 'addAssets_promise_004';
      try {
        const album = await helper.createAlbum(testNum);
        await album.addAssets([]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0500
      * @tc.name      : addAssets_promise_005
      * @tc.desc      : add undefined array to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_005', 2, async function (done) {
      const testNum = 'addAssets_promise_005';
      try {
        const album = await helper.createAlbum(testNum);
        await album.addAssets(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    });
  })
}
