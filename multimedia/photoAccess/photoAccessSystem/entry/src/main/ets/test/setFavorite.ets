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
import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  albumType,
  albumSubtype,
} from '../../../../../../common'

export default function setFavoriteTest () {
  describe('setFavoriteTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    async function setFavoriteCallback (done, testNum, fetchOps) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        asset.setFavorite(true, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              let key = photoKeys.FAVORITE;
              expect(asset.get(key)).assertEqual(1);
              let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
              const album = await fetchResult.getFirstObject();
              fetchResult.close();
              const curFetchResult = await album.getAssets(fetchOps);
              expect(curFetchResult.getCount()).assertEqual(1);
            }
          } catch (error) {
            console.info(`${testNum} setFavorite failed; error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function setFavoriteCancelCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setFavorite(true);
        asset.setFavorite(false, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              let key = photoKeys.FAVORITE;
              expect(asset.get(key)).assertEqual(0);
              let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
              const album = await fetchResult.getFirstObject();
              fetchResult.close();
              const curFetchResult = await album.getAssets(fetchOps);
              expect(curFetchResult.getCount()).assertEqual(0);
            }
          } catch (error) {
            console.info(`${testNum} setFavorite failed; error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function setFavoritePromise (done, testNum, fetchOps) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        await asset.setFavorite(true);
        let key = photoKeys.FAVORITE;
        expect(asset.get(key)).assertEqual(1);
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const curFetchResult = await album.getAssets(fetchOps);
        expect(curFetchResult.getCount()).assertEqual(1);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function setFavoriteCancelPromise (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setFavorite(true);
        await asset.setFavorite(false);
        let key = photoKeys.FAVORITE;
        expect(asset.get(key)).assertEqual(0);
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const curFetchResult = await album.getAssets(fetchOps);
        expect(curFetchResult.getCount()).assertEqual(0);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETFAVORITE_0000
     * @tc.name      : setFavorite_callback_000
     * @tc.desc      : image setFavorite true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_callback_000', 0, async function (done) {
      const testNum = 'setFavorite_callback_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb01.jpg');
      await setFavoriteCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETFAVORITE_0100
     * @tc.name      : setFavorite_callback_001
     * @tc.desc      : image setFavorite false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_callback_001', 0, async function (done) {
      const testNum = 'setFavorite_callback_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb02.jpg');
      await setFavoriteCancelCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETFAVORITE_0200
     * @tc.name      : setFavorite_callback_002
     * @tc.desc      : video setFavorite true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_callback_002', 0, async function (done) {
      const testNum = 'setFavorite_callback_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb01.mp4');
      await setFavoriteCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETFAVORITE_0300
     * @tc.name      : setFavorite_callback_003
     * @tc.desc      : video setFavorite false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_callback_003', 0, async function (done) {
      const testNum = 'setFavorite_callback_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb02.mp4');
      await setFavoriteCancelCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETFAVORITE_0000
     * @tc.name      : setFavorite_promise_000
     * @tc.desc      : image setFavorite true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_promise_000', 0, async function (done) {
      const testNum = 'setFavorite_promise_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro01.jpg');
      await setFavoritePromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETFAVORITE_0100
     * @tc.name      : setFavorite_promise_001
     * @tc.desc      : image setFavorite false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_promise_001', 0, async function (done) {
      const testNum = 'setFavorite_promise_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro02.jpg');
      await setFavoriteCancelPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETFAVORITE_0200
     * @tc.name      : setFavorite_promise_002
     * @tc.desc      : video setFavorite true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_promise_002', 0, async function (done) {
      const testNum = 'setFavorite_promise_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro01.mp4');
      await setFavoritePromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETFAVORITE_0300
     * @tc.name      : setFavorite_promise_003
     * @tc.desc      : video setFavorite false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFavorite_promise_003', 0, async function (done) {
      const testNum = 'setFavorite_promise_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro02.mp4');
      await setFavoriteCancelPromise(done, testNum, fetchOps);
    });
  })
}
