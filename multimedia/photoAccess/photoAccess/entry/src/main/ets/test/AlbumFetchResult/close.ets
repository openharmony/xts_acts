/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
  albumType,
  albumSubtype,
  getAlbumFetchResult,
  fetchOption,
  albumKeys
} from '../../../../../../../common'

export default function albumCloseTest () {
  describe('albumCloseTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ALBUM_CLOSE_0000
     * @tc.name      : album_close_000
     * @tc.desc      : close
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_close_000', 0, async function (done) {
      const testNum = 'album_close_000';
      try {
        const subTypes : Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let fetchResult = getAlbumFetchResult();
        let passCount = 0;
        for (let i = 0; i < subTypes.length; i++) {
          fetchResult = await helper.getAlbums(albumType.SYSTEM, subTypes[i]);
          expect(fetchResult.getCount()).assertEqual(1);
          fetchResult.close();
          let count = 0;
          try {
            fetchResult.getCount();
          } catch (error) {
            console.info(`${testNum} getCount failed; error: ${error}`);
            count++;
          }
          try {
            await fetchResult.getFirstObject();
          } catch (error) {
            console.info(`${testNum} getFirstObject failed; error: ${error}`);
            count++;
          }
          try {
            await fetchResult.getNextObject();
          } catch (error) {
            console.info(`${testNum} getNextObject failed; error: ${error}`);
            count++;
          }
          try {
            await fetchResult.getLastObject();
          } catch (error) {
            console.info(`${testNum} getLastObject failed; error: ${error}`);
            count++;
          }
          try {
            await fetchResult.getObjectByPosition(0);
          } catch (error) {
            console.info(`${testNum} getObjectByPosition failed; error: ${error}`);
            count++;
          }
          try {
            await fetchResult.getAllObjects();
          } catch (error) {
            console.info(`${testNum} getAllObjects failed; error: ${error}`);
            count++;
          }
          try {
            fetchResult.isAfterLast();
          } catch (error) {
            console.info(`${testNum} isAfterLast failed; error: ${error}`);
            count++;
          }
          expect(count).assertEqual(7);
          passCount++;
          if (i + 1 === subTypes.length) {
            expect(passCount).assertEqual(subTypes.length);
            done();
          }
        }
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ALBUM_CLOSE_0100
     * @tc.name      : album_close_001
     * @tc.desc      : close
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_close_001', 0, async function (done) {
      const testNum = 'album_close_001';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, album.albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();
        let count = 0;
        try {
          fetchResult.getCount();
        } catch (error) {
          console.info(`${testNum} getCount failed; error: ${error}`);
          count++;
        }
        try {
          await fetchResult.getFirstObject();
        } catch (error) {
          console.info(`${testNum} getFirstObject failed; error: ${error}`);
          count++;
        }
        try {
          await fetchResult.getNextObject();
        } catch (error) {
          console.info(`${testNum} getNextObject failed; error: ${error}`);
          count++;
        }
        try {
          await fetchResult.getLastObject();
        } catch (error) {
          console.info(`${testNum} getLastObject failed; error: ${error}`);
          count++;
        }
        try {
          await fetchResult.getObjectByPosition(0);
        } catch (error) {
          console.info(`${testNum} getObjectByPosition failed; error: ${error}`);
          count++;
        }
        try {
          await fetchResult.getAllObjects();
        } catch (error) {
          console.info(`${testNum} getAllObjects failed; error: ${error}`);
          count++;
        }
        try {
          fetchResult.isAfterLast();
        } catch (error) {
          console.info(`${testNum} isAfterLast failed; error: ${error}`);
          count++;
        }
        expect(count).assertEqual(7);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
