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

export default function deleteAssetsTest () {
  describe('deleteAssetsTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    async function deleteAssetsCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        console.info(`${testNum} asset.uri: ${asset.uri}`)
        await helper.deleteAssets([asset.uri]);
        console.info(`${testNum} deleteAssets end`)
        const albumFetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        expect(albumFetchResult.getCount()).assertEqual(1);
        const trashAlbum = await albumFetchResult.getFirstObject();
        albumFetchResult.close();
        const assetFetchResult = await trashAlbum.getAssets(fetchOps);
        expect(assetFetchResult.getCount()).assertEqual(1);
        const trashAsset = await assetFetchResult.getFirstObject();
        assetFetchResult.close();
        trashAlbum.deleteAssets([trashAsset], async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`)
              expect(false).assertTrue();
            } else {
              let newFetchResult = await trashAlbum.getAssets(fetchOps);
              expect(newFetchResult.getCount()).assertEqual(0);
              newFetchResult.close();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`)
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function deleteAssetsPromise (done, testNum, fetchOps) {
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
        await trashAlbum.deleteAssets([trashAsset]);
        let newFetchResult = await trashAlbum.getAssets(fetchOps);
        expect(newFetchResult.getCount()).assertEqual(0);
        newFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_DELETE_ASSETS_0000
     * @tc.name      : deleteAssets_callback_000
     * @tc.desc      : delete image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('deleteAssets_callback_000', 0, async function (done) {
      let testNum = 'deleteAssets_callback_000'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'deleteCb01.jpg');
      await deleteAssetsCallback(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_DELETE_ASSETS_0100
     * @tc.name      : deleteAssets_callback_001
     * @tc.desc      : delete video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('deleteAssets_callback_001', 2, async function (done) {
      let testNum = 'deleteAssets_callback_001'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'deleteCb01.mp4');
      await deleteAssetsCallback(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_DELETE_ASSETS_0000
     * @tc.name      : deleteAssets_promise_000
     * @tc.desc      : delete image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('deleteAssets_promise_000', 0, async function (done) {
      let testNum = 'deleteAssets_promise_000'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'deletePro01.jpg');
      await deleteAssetsPromise(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_DELETE_ASSETS_0100
     * @tc.name      : deleteAssets_promise_001
     * @tc.desc      : delete video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('deleteAssets_promise_001', 2, async function (done) {
      let testNum = 'deleteAssets_promise_001'
      let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'deletePro01.mp4');
      await deleteAssetsPromise(done, testNum, currentFetchOp)
    });
  })
}
