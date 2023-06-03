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

export default function setHiddenTest () {
  describe('setHiddenTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    async function setHiddenCallback (done, testNum, fetchOps) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        asset.setHidden(true, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              let key = photoKeys.HIDDEN;
              expect(asset.get(key)).assertEqual(1);
              let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.HIDDEN);
              const album = await fetchResult.getFirstObject();
              fetchResult.close();
              const curFetchResult = await album.getAssets(fetchOps);
              expect(curFetchResult.getCount()).assertEqual(1);
            }
          } catch (error) {
            console.info(`${testNum} setHidden failed; error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function setHiddenCancelCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setHidden(true);
        asset.setHidden(false, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              let key = photoKeys.HIDDEN;
              expect(asset.get(key)).assertEqual(0);
              let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.HIDDEN);
              const album = await fetchResult.getFirstObject();
              fetchResult.close();
              const curFetchResult = await album.getAssets(fetchOps);
              expect(curFetchResult.getCount()).assertEqual(0);
            }
          } catch (error) {
            console.info(`${testNum} setHidden failed; error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function setHiddenPromise (done, testNum, fetchOps) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        await asset.setHidden(true);
        let key = photoKeys.HIDDEN;
        expect(asset.get(key)).assertEqual(1);
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.HIDDEN);
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

    async function setHiddenCancelPromise (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setHidden(true);
        await asset.setHidden(false);
        let key = photoKeys.HIDDEN;
        expect(asset.get(key)).assertEqual(0);
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.HIDDEN);
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETHIDDEN_0000
     * @tc.name      : setHidden_callback_000
     * @tc.desc      : image setHidden true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_callback_000', 0, async function (done) {
      const testNum = 'setHidden_callback_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb01.jpg');
      await setHiddenCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETHIDDEN_0100
     * @tc.name      : setHidden_callback_001
     * @tc.desc      : image setHidden false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_callback_001', 0, async function (done) {
      const testNum = 'setHidden_callback_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb02.jpg');
      await setHiddenCancelCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETHIDDEN_0200
     * @tc.name      : setHidden_callback_002
     * @tc.desc      : video setHidden true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_callback_002', 0, async function (done) {
      const testNum = 'setHidden_callback_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb01.mp4');
      await setHiddenCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETHIDDEN_0300
     * @tc.name      : setHidden_callback_003
     * @tc.desc      : video setHidden false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_callback_003', 0, async function (done) {
      const testNum = 'setHidden_callback_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favCb02.mp4');
      await setHiddenCancelCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETHIDDEN_0000
     * @tc.name      : setHidden_promise_000
     * @tc.desc      : image setHidden true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_promise_000', 0, async function (done) {
      const testNum = 'setHidden_promise_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro01.jpg');
      await setHiddenPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETHIDDEN_0100
     * @tc.name      : setHidden_promise_001
     * @tc.desc      : image setHidden false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_promise_001', 0, async function (done) {
      const testNum = 'setHidden_promise_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro02.jpg');
      await setHiddenCancelPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETHIDDEN_0200
     * @tc.name      : setHidden_promise_002
     * @tc.desc      : video setHidden true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_promise_002', 0, async function (done) {
      const testNum = 'setHidden_promise_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro01.mp4');
      await setHiddenPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETHIDDEN_0300
     * @tc.name      : setHidden_promise_003
     * @tc.desc      : video setHidden false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setHidden_promise_003', 0, async function (done) {
      const testNum = 'setHidden_promise_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'favPro02.mp4');
      await setHiddenCancelPromise(done, testNum, fetchOps);
    });
  })
}
