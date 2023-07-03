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
  albumKeys,
  albumType,
  albumSubtype,
  getPermission,
  fetchOption,
} from '../../../../../../common'

export default function deleteAlbumsTest () {
  describe('deleteAlbumsTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    //callback
    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_DELETE_ALBUMS_0000
    * @tc.name      : deleteAlbums_callback_000
    * @tc.desc      : delete user test
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('deleteAlbums_callback_000', 0, async function (done) {
      const testNum = 'deleteAlbums_callback_000';
      try {
        let albumNames = [
          'deleteAlbums_callback_000_001',
          'deleteAlbums_callback_000_002',
          'deleteAlbums_callback_000_003',
          'deleteAlbums_callback_000_004',
          'deleteAlbums_callback_000_005',
        ];
        let albumList : Array<photoAccessHelper.Album> = new Array();
        for (let i = 0; i < albumNames.length; i++) {
          let album = await helper.createAlbum(albumNames[i]);
          albumList.push(album);
        }
        helper.deleteAlbums(albumList, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} deleteAlbums failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              let count = 0;
              for (let i = 0; i < albumNames.length; i++) {
                let fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumNames[i]);
                let fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
                expect(fetchResult.getCount()).assertEqual(0);
                fetchResult.close();
                count++;
              }
              expect(count).assertEqual(albumNames.length);
            }
          } catch (error) {
            console.info(`${testNum} deleteAlbums failed, error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_DELETE_ALBUMS_0100
    * @tc.name      : deleteAlbums_callback_001
    * @tc.desc      : delete system albums, which should be failed.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('deleteAlbums_callback_001', 2, async function (done) {
      const testNum = 'deleteAlbums_callback_001';
      try {
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.ANY);
        expect(fetchResult.getCount()).assertEqual(7);
        let albumList = await fetchResult.getAllObjects();
        fetchResult.close();
        console.info(`${testNum} albumList: ${albumList.length}`);
        helper.deleteAlbums(albumList, (err) => {
          try {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    //promise
    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_DELETE_ALBUMS_0000
    * @tc.name      : deleteAlbums_promise_000
    * @tc.desc      : delete albums test
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('deleteAlbums_promise_000', 0, async function (done) {
      const testNum = 'deleteAlbums_promise_000';
      try {
        let albumNames = [
          'deleteAlbums_promise_000_001',
          'deleteAlbums_promise_000_002',
          'deleteAlbums_promise_000_003',
          'deleteAlbums_promise_000_004',
          'deleteAlbums_promise_000_005',
        ];
        let albumList : Array<photoAccessHelper.Album> = new Array();
        for (let i = 0; i < albumNames.length; i++) {
          let album = await helper.createAlbum(albumNames[i]);
          albumList.push(album);
        }
        await helper.deleteAlbums(albumList);
        let count = 0;
        for (let i = 0; i < albumNames.length; i++) {
          let fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumNames[i]);
          let fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
          expect(fetchResult.getCount()).assertEqual(0);
          fetchResult.close();
          count++;
        }
        expect(count).assertEqual(albumNames.length);
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
    * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_DELETE_ALBUMS_0100
    * @tc.name      : deleteAlbums_promise_001
    * @tc.desc      : delete system albums, which should be failed.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('deleteAlbums_promise_001', 2, async function (done) {
      const testNum = 'deleteAlbums_promise_001';
      try {
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.ANY);
        expect(fetchResult.getCount()).assertEqual(7);
        let albumList = await fetchResult.getAllObjects();
        fetchResult.close();
        console.info(`${testNum} albumList: ${albumList.length}`);
        await helper.deleteAlbums(albumList);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });
  })
}
