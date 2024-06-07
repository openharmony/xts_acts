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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect } from 'deccjsunit/index'
import {
  albumKeys,
  albumType,
  albumSubtype,
} from '../../../../../../../common'

export default function getAlbumsTest () {
  describe('getAlbumsTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_GROUP_ALBUMS_0100
      * @tc.name      : get_group_albums_001
      * @tc.desc      : get group albums 
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('get_group_albums_001', 0, async function (done) {
      const testNum = 'get_group_albums_001';
      try {
        const predicates = new dataSharePredicates.DataSharePredicates();
        const fetchOps : photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await helper.getAlbums(albumType.SMART, albumSubtype.GROUP_PHOTO, fetchOps);
        expect(fetchResult.getCount()).assertEqual(0);
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_DISMISS_GROUP_ALBUMS_0200
      * @tc.name      : dismiss_group_albums_002
      * @tc.desc      : dismiss group albums 
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('dismiss_group_albums_002', 0, async function (done) {
      const testNum = 'dismiss_group_albums_002';
      try {
        await helper.createAlbum('testGroupAlbumsdismiss');
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(albumKeys.ALBUM_NAME, ['testGroupAlbumsdismiss']);
        const fetchOps : photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        const album = await fetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        try {
          albumChangeRequest.dismiss();
          console.info(`${testNum} dismiss failed`);
          expect(false).assertTrue();
        } catch (error) {
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${testNum} error: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
