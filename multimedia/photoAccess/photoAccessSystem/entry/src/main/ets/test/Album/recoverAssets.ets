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
  fetchOption,
  getFileAsset,
  getPermission,
  albumType,
  albumSubtype
} from '../../../../../../../common'

export default function recoverAssetsTest () {
  describe('recoverAssetsTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    async function recoverAssetsCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await helper.deleteAssets([asset.uri]);
        const albumFetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        expect(albumFetchResult.getCount()).assertEqual(1);
        const trashAlbum = await albumFetchResult.getFirstObject();
        albumFetchResult.close();
        const assetFetchResult = await trashAlbum.getAssets(fetchOps);
        expect(assetFetchResult.getCount()).assertEqual(1);
        const trashAsset = await assetFetchResult.getFirstObject();
        assetFetchResult.close();
        trashAlbum.recoverAssets([trashAsset], async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`)
              expect(false).assertTrue();
            } else {
              let newFetchResult = await trashAlbum.getAssets(fetchOps);
              expect(newFetchResult.getCount()).assertEqual(0);
              newFetchResult = await helper.getAssets(fetchOps);
              expect(newFetchResult.getCount()).assertEqual(1);
              newFetchResult.close();
            }
          } catch (error) {
            console.info(`${testNum} recover failed; error: ${error}`)
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function recoverAssetsPromise (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await helper.deleteAssets([asset.uri]);
        const albumFetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        expect(albumFetchResult.getCount()).assertEqual(1);
        const trashAlbum = await albumFetchResult.getFirstObject();
        albumFetchResult.close();
        const assetFetchResult = await trashAlbum.getAssets(fetchOps);
        expect(assetFetchResult.getCount()).assertEqual(1);
        const trashAsset = await assetFetchResult.getFirstObject();
        assetFetchResult.close();
        await trashAlbum.recoverAssets([trashAsset]);
        let newFetchResult = await trashAlbum.getAssets(fetchOps);
        expect(newFetchResult.getCount()).assertEqual(0);
        newFetchResult = await helper.getAssets(fetchOps);
        expect(newFetchResult.getCount()).assertEqual(1);
        newFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_RECOVER_ASSETS_0000
     * @tc.name      : recoverAssets_callback_000
     * @tc.desc      : recover image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('recoverAssets_callback_000', 0, async function (done) {
      let testNum = 'recoverAssets_callback_000'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'recoverCb01.jpg');
      await recoverAssetsCallback(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_RECOVER_ASSETS_0100
     * @tc.name      : recoverAssets_callback_001
     * @tc.desc      : recover video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('recoverAssets_callback_001', 2, async function (done) {
      let testNum = 'recoverAssets_callback_001'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'recoverCb01.mp4');
      await recoverAssetsCallback(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_RECOVER_ASSETS_0000
     * @tc.name      : recoverAssets_promise_000
     * @tc.desc      : recover image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('recoverAssets_promise_000', 0, async function (done) {
      let testNum = 'recoverAssets_promise_000'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'recoverPro01.jpg');
      await recoverAssetsPromise(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_RECOVER_ASSETS_0100
     * @tc.name      : recoverAssets_promise_001
     * @tc.desc      : recover video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('recoverAssets_promise_001', 2, async function (done) {
      let testNum = 'recoverAssets_promise_001'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'recoverPro01.mp4');
      await recoverAssetsPromise(done, testNum, currentFetchOp)
    });
  })
}
