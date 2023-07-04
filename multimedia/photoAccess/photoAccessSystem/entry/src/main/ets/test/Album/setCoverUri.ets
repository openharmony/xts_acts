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
  albumType,
  albumSubtype,
  fetchOption,
  getPermission,
  getFileAsset,
  albumKeys
} from '../../../../../../../common'

export default function setCoverUriTest () {
  describe('setCoverUriTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission();
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SET_COVER_URI_0000
      * @tc.name      : setCoverUri_callback_000
      * @tc.desc      : album change coverUri
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('setCoverUri_callback_000', 0, async function (done) {
      const testNum = 'setCoverUri_callback_000';
      try {
        const album = await helper.createAlbum(testNum);
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
        const asset1 = await getFileAsset(testNum, fetchOps);
        fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '02.jpg');
        const asset2 = await getFileAsset(testNum, fetchOps);
        await album.addAssets([asset1]);
        expect(album.coverUri).assertEqual(asset1.uri);
        album.setCoverUri(asset2.uri, async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, testNum);
              const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
              console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
              const curAlbum = await fetchResult.getFirstObject();
              expect(curAlbum.coverUri).assertEqual(asset2.uri);
              fetchResult.close();
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
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SET_COVER_URI_0000
      * @tc.name      : setCoverUri_promise_000
      * @tc.desc      : album change coverUri
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('setCoverUri_promise_000', 0, async function (done) {
      const testNum = 'setCoverUri_promise_000';
      try {
        const album = await helper.createAlbum(testNum);
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
        const asset1 = await getFileAsset(testNum, fetchOps);
        fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '02.jpg');
        const asset2 = await getFileAsset(testNum, fetchOps);
        await album.addAssets([asset1]);
        expect(album.coverUri).assertEqual(asset1.uri);
        await album.setCoverUri(asset2.uri);
        fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, testNum);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        const curAlbum = await fetchResult.getFirstObject();
        expect(curAlbum.coverUri).assertEqual(asset2.uri);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
