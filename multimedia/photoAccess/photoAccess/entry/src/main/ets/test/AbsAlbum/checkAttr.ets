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
  albumType,
  albumSubtype,
  fetchOption,
  getFileAsset,
  getId,
  photoKeys
} from '../../../../../../../common'

export default function checkAlbumAttrTest () {
  describe('checkAlbumAttrTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    async function checkAssetAttr (done, testNum) {
      try {
        const album = await helper.createAlbum(testNum);
        expect(album.albumType).assertEqual(albumType.USER);
        expect(album.albumSubtype).assertEqual(albumSubtype.USER_GENERIC);
        expect(album.albumName).assertEqual(testNum);
        const id = getId(album.albumUri);
        expect(album.albumUri).assertEqual('file://media/PhotoAlbum/' + id);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await album.addAssets([asset]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_0000
      * @tc.name      : album_000
      * @tc.desc      : chech album attr
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_000', 0, async function (done) {
      const testNum = 'album_000';
      await checkAssetAttr(done, testNum);
    });
  })
}
