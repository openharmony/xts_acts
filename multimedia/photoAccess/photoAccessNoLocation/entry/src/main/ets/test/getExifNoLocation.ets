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

import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
} from '../../../../../../common'

export default function getExifNoLocationTest () {
  describe('getExifNoLocationTest', function () {
    beforeAll(async function () {
      console.info('beforeAll case')
      const atManager = abilityAccessCtrl.createAtManager();
      const appFlags = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
      const userId = 100;
      const appInfo = await bundleManager.getApplicationInfo('ohos.acts.multimedia.photoaccess', appFlags, userId);
      const tokenID = appInfo.accessTokenId;
      try {
        await atManager.grantUserGrantedPermission(tokenID, 'ohos.permission.READ_IMAGEVIDEO', 1);
      } catch (error) {
        console.info(`getPermission failed`);
      }
    })

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
              expect(!result.includes('GPSLongitude')).assertTrue();
              expect(!result.includes('GPSLatitudeRef')).assertTrue();
              expect(!result.includes('GPSLongitudeRef')).assertTrue();
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
        expect(!result.includes('GPSLongitude')).assertTrue();
        expect(!result.includes('GPSLatitudeRef')).assertTrue();
        expect(!result.includes('GPSLongitudeRef')).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_NOLOCATION_0400
     * @tc.name      : getExif_callback_004
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, no MEDIA_LOCATION permission, check GPSLongitude
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getExif_callback_004', 0, async function (done) {
      const testNum = 'getExif_callback_004';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_NOLOCATION_0400
     * @tc.name      : getExif_promise_004
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, no MEDIA_LOCATION permission, check GPSLongitude
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getExif_promise_004', 0, async function (done) {
      const testNum = 'getExif_promise_004';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifPromise(done, testNum, fetchOps);
    });
  })
}
