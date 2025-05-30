/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  photoKeys,
  fetchOption,
  fetchAllOption,
  getFileAsset,
  sleep,
  getPermission,
  driveFn
} from '../common'
import common from '@ohos.app.ability.common'
import { BusinessError } from '@ohos.base'

export default function removeAssetsTest () {
  describe('removeAssetsTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    const helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext)

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0000
      * @tc.name      : removeAssets_callback_000
      * @tc.desc      : user album remove image asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('removeAssets_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'removeAssets_callback_000';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb01.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);
        // add asset to album will create a new asset
        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        fetchResult.close();
        album.removeAssets([newAsset], async (err:BusinessError) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult:ESObject = await album.getAssets(fetchOps);
              expect(fetchResult.getCount()).assertEqual(0);
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0200
      * @tc.name      : removeAssets_callback_002
      * @tc.desc      : user album remove image&video asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_002';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testContext, testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testContext, testNum, fetchOps2);
        assetList.push(asset2);
        await album.addAssets(assetList);
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(2);
        let albumAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        fetchResult.close();
        // remove video & image
        album.removeAssets(albumAssetList, async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
              expect(fetchResult.getCount()).assertEqual(0);
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0300
      * @tc.name      : removeAssets_callback_003
      * @tc.desc      : user album remove empty array
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_003';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        album.removeAssets([], async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0400
      * @tc.name      : removeAssets_callback_004
      * @tc.desc      : user album remove undefined array,error code 13900020
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_004';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        album.removeAssets(undefined, async (err) => {
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(error.code === '13900020' || error.code === '401').assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0500
      * @tc.name      : removeAssets_callback_005
      * @tc.desc      : user album image asset twice
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_callback_005';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb04.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        album.removeAssets([newAsset], async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0600
      * @tc.name      : removeAssets_callback_006
      * @tc.desc      : user album remove [123123] array,error code 14000011
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
        it('removeAssets_callback_006', Level.LEVEL2, async (done: Function) => {
          const testNum = 'removeAssets_callback_006';
          try {
            const album: ESObject = await helper.createAlbum(testNum);
            album.removeAssets(['123123'], async (err: BusinessError) => {
              expect(false).assertTrue(); 
            })
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(error.code).assertEqual('14000011');
            done();
          }
        });

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0000
      * @tc.name      : removeAssets_promise_000
      * @tc.desc      : user album remove image asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('removeAssets_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'removeAssets_promise_000';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro01.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult:ESObject = await album.getAssets(fetchOps);
        console.info(`${testNum} count: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(1);
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        fetchResult = await album.getAssets(fetchOps);
        console.info(`${testNum} count: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0200
      * @tc.name      : removeAssets_promise_002
      * @tc.desc      : user album remove image&video asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_002';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testContext, testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testContext, testNum, fetchOps2);
        assetList.push(asset2);

        await album.addAssets(assetList);
        let fetchResult:ESObject = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(2);
        let albumAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        await album.removeAssets(albumAssetList);
        fetchResult = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0300
      * @tc.name      : removeAssets_promise_003
      * @tc.desc      : user album remove empty array
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_003';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        await album.removeAssets([]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0400
      * @tc.name      : removeAssets_promise_004
      * @tc.desc      : user album remove undefined array,error code 13900020
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_004';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        await album.removeAssets(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(error.code === '13900020' || error.code === '401').assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0500
      * @tc.name      : removeAssets_promise_005
      * @tc.desc      : remove image asset twice
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_005';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro04.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        await album.removeAssets([newAsset]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0600
      * @tc.name      : removeAssets_promise_006
      * @tc.desc      : user album remove 123123 array,error code 14000011
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'removeAssets_promise_006';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        console.log(`${testNum} start`);
        await album.removeAssets([123123]);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });
  })
}
