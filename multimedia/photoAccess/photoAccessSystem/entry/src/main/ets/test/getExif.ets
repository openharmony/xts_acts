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

import { describe, beforeAll, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  getPermission,
  fetchOption
} from '../../../../../../common'

export default function getExifTest () {
  describe('getExifTest', function () {
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    const exifInfo = {
      ImageWidth: '3456',
      UserComment: 'gray',
    }

    async function getExifCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} result: ${result}`)
              expect(result.length > 0).assertTrue();
              const msg = JSON.parse(result);
              console.info(`${testNum} ImageWidth: ${msg.ImageWidth}, UserComment: ${msg.UserComment}`)
              expect(msg.ImageWidth).assertEqual(exifInfo.ImageWidth);
              expect(msg.UserComment).assertEqual(exifInfo.UserComment);
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
    }

    async function getExifAbnormalCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          console.info(`${testNum} err: ${err}, result: ${result}`);
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
            } else {
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
    }

    async function getExifPromise (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const result = await asset.getExif();
        console.info(`${testNum} result: ${result}`)
        expect(result.length > 0).assertTrue();
        const msg = JSON.parse(result);
        console.info(`${testNum} ImageWidth: ${msg.ImageWidth}, UserComment: ${msg.UserComment}`)
        expect(msg.ImageWidth).assertEqual(exifInfo.ImageWidth);
        expect(msg.UserComment).assertEqual(exifInfo.UserComment);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getExifAbnormalPromise (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.getExif();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0000
     * @tc.name      : getExif_callback_000
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getExif_callback_000', 0, async function (done) {
      const testNum = 'getExif_callback_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0100
     * @tc.name      : getExif_callback_001
     * @tc.desc      : getExif.jpg, fetchColumn without all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_001', 2, async function (done) {
      const testNum = 'getExif_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifAbnormalCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0200
     * @tc.name      : getExif_callback_002
     * @tc.desc      : 01.jpg, fetchColumn with all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_002', 2, async function (done) {
      const testNum = 'getExif_callback_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await getExifAbnormalCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0000
     * @tc.name      : getExif_promise_000
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getExif_promise_000', 0, async function (done) {
      const testNum = 'getExif_promise_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0100
     * @tc.name      : getExif_promise_001
     * @tc.desc      : getExif.jpg, fetchColumn without all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_001', 2, async function (done) {
      const testNum = 'getExif_promise_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifAbnormalPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0200
     * @tc.name      : getExif_promise_002
     * @tc.desc      : 01.jpg, fetchColumn with all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_002', 2, async function (done) {
      const testNum = 'getExif_promise_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await getExifAbnormalPromise(done, testNum, fetchOps);
    });
  })
}
