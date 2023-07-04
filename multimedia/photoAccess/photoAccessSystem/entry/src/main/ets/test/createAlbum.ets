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
  checkUserAlbum,
  genRadomStr,
  sleep,
  getPermission,
} from '../../../../../../common'

export default function createAlbumTest () {
  describe('createAlbumTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ALBUM_0000
      * @tc.name      : createAlbum_callback_000
      * @tc.desc      : create albums test
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('createAlbum_callback_000', 0, async function (done) {
      const testNum = 'createAlbum_callback_000';
      try {
        let albumName = testNum;
        helper.createAlbum(albumName, (err, album) => {
          try {
            if (err != undefined) {
              console.info(`${testNum} createAlbum failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              checkUserAlbum(expect, testNum, album, albumName, '');
            }
          } catch (error) {
            console.info(`${testNum} createAlbum failed, error: ${error}`);
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ALBUM_0100
      * @tc.name      : createAlbum_callback_001
      * @tc.desc      : create albums with illegal characters
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('createAlbum_callback_001', 2, async function (done) {
      const testNum = 'createAlbum_callback_001';
      try {
        let TITLE_REGEX_CHECK = '\\/:*?"\'`<>|{}\[\]';
        let baseName = testNum;
        for (let i = 0; i < TITLE_REGEX_CHECK.length; i++) {
          let albumName = baseName + TITLE_REGEX_CHECK[i];
          helper.createAlbum(albumName, (err) => {
            try {
              if (err !== undefined) {
                console.info(`${testNum} createAlbum failed, err: ${err}`);
                expect(false).assertTrue();
              } else {
                expect(false).assertTrue();
              }
            } catch (error) {
              console.info(`${testNum} createAlbum error, err: ${error}`);
            }
            done();
          })
          await sleep(50);
        }
      } catch(error) {
        console.info(`${testNum} failed, error: ${error} ${error.code === '13900020'}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ALBUM_0200
      * @tc.name      : createAlbum_callback_002
      * @tc.desc      : create an existing album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('createAlbum_callback_002', 2, async function (done) {
      const testNum = 'createAlbum_callback_002';
      try {
        let albumName = testNum;
        await helper.createAlbum(albumName);
        helper.createAlbum(albumName, (err) => {
          try {
            if (err != undefined) {
              console.info(`${testNum} createAlbum failed, err: ${err.code === 13900015}`);
              expect(err.code == 13900015).assertTrue();
            } else {
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} createAlbum failed, error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code === -1).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_ALBUM_0300
      * @tc.name      : createAlbum_callback_003
      * @tc.desc      : create albums with long name
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('createAlbum_callback_003', 2, async function (done) {
      const testNum = 'createAlbum_callback_003';
      try {
        let albumName = genRadomStr(256);
        helper.createAlbum(albumName, (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} createAlbum failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} createAlbum failed, error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ALBUM_0000
      * @tc.name      : createAlbum_promise_000
      * @tc.desc      : create albums test
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('createAlbum_promise_000', 0, async function (done) {
      const testNum = 'createAlbum_promise_000';
      try {
        let albumName = testNum;
        const album = await helper.createAlbum(albumName);
        await checkUserAlbum(expect, testNum, album, albumName, '');
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ALBUM_0100
      * @tc.name      : createAlbum_promise_001
      * @tc.desc      : create albums with illegal characters
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('createAlbum_promise_001', 2, async function (done) {
      const testNum = 'createAlbum_promise_001';
      try {
        let TITLE_REGEX_CHECK = '\\/:*?"\'`<>|{}\[\]';
        let baseName = 'SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ALBUM_002';
        let count = 0;
        for (let i = 0; i < TITLE_REGEX_CHECK.length; i++) {
          let albumName = baseName + TITLE_REGEX_CHECK[i];
          try {
            await helper.createAlbum(albumName);
            expect(false).assertTrue();
          } catch (error) {
            if (error.code == 13900020) {
              count++;
            }
          }
          if (i + 1 === TITLE_REGEX_CHECK.length) {
            expect(count).assertEqual(TITLE_REGEX_CHECK.length);
            done();
          }
        }
      } catch(error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ALBUM_0200
      * @tc.name      : createAlbum_promise_002
      * @tc.desc      : create an existing album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('createAlbum_promise_002', 2, async function (done) {
      const testNum = 'createAlbum_promise_002';
      try {
        let albumName = testNum;
        await helper.createAlbum(albumName);
        await helper.createAlbum(albumName);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_ALBUM_0300
      * @tc.name      : createAlbum_promise_003
      * @tc.desc      : create albums with long name
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('createAlbum_promise_003', 2, async function (done) {
      const testNum = 'createAlbum_promise_003';
      try {
        let albumName = genRadomStr(256);
        await helper.createAlbum(albumName);
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
