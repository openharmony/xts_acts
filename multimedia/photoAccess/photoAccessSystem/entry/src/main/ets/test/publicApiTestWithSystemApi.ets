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

import fileio from "@ohos.fileio";
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect } from 'deccjsunit/index'
import {
  albumType,
  albumSubtype,
  photoKeys,
  fetchOption,
  getFileAsset,
  photoFetchOption,
  sleep,
} from '../../../../../../common'

export default function publicApiTestWithSystemApiTest () {
  describe('publicApiTestWithSystemApiTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    const { NOTIFY_ADD, NOTIFY_UPDATE, NOTIFY_REMOVE, NOTIFY_ALBUM_ADD_ASSET, NOTIFY_ALBUM_REMOVE_ASSET } =
      photoAccessHelper.NotifyType;
    const DEFAULT_PHOTO_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_PHOTO_URI;
    const DEFAULT_ALBUM_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_ALBUM_URI;

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0100
      * @tc.name      : album_getAssets_callback_001
      * @tc.desc      : add image asset to system album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_callback_001', 0, async function (done) {
      const testNum = 'album_getAssets_callback_001';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close()
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumGetAssetsCb01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setFavorite(true);

        album.getAssets(fetchOps, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} count: ${fetchResult.getCount()}`);
              expect(fetchResult.getCount()).assertEqual(1);
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
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0200
      * @tc.name      : addAssets_callback_002
      * @tc.desc      : add setFavorite image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_callback_002', 2, async function (done) {
      const testNum = 'addAssets_callback_002';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addCb02.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await asset.setFavorite(true);
        album.addAssets([asset], async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult = await album.getAssets(fetchOps);
              expect(fetchResult.getCount()).assertEqual(1);
              fetchResult.close()
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
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0600
      * @tc.name      : addAssets_callback_006
      * @tc.desc      : add deleted image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_callback_006', 2, async function (done) {
      const testNum = 'addAssets_callback_006';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addCb04.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await helper.deleteAssets([asset.uri]);
        album.addAssets([asset], async (err) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0100
      * @tc.name      : removeAssets_callback_001
      * @tc.desc      : user album remove setFavorite image asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_001', 2, async function (done) {
      const testNum = 'removeAssets_callback_001';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb02.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await asset.setFavorite(true);
        await album.addAssets([asset]);
        album.removeAssets([asset], async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult = await album.getAssets(fetchOps);
              expect(fetchResult.getCount()).assertEqual(0);
              fetchResult.close()
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
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0200
      * @tc.name      : album_getAssets_callback_002
      * @tc.desc      : screenshots album getAssets
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_callback_002', 0, async function (done) {
      const testNum = 'album_getAssets_callback_002';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.SCREENSHOT);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'screenshotsCb01.jpg');
        album.getAssets(fetchOps, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(fetchResult.getCount()).assertEqual(1);
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
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0300
      * @tc.name      : album_getAssets_callback_003
      * @tc.desc      : camera album getAssets
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_callback_003', 0, async function (done) {
      const testNum = 'album_getAssets_callback_003';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.CAMERA);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'cameraCb01.jpg');
        album.getAssets(fetchOps, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(fetchResult.getCount()).assertEqual(1);
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
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_0000
     * @tc.name      : off_000
     * @tc.desc      : off listening create file, type NOTIFY_ADD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('off_000', 0, async function (done) {
      const testNum = 'off_000';
      try {
        const createAsset = await helper.createAsset(testNum + '.jpg');
        let count = 0;
        await sleep(500);
        helper.on(createAsset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        helper.off(createAsset.uri);
        await sleep(100);
        let fd = await createAsset.getReadOnlyFd();
        await createAsset.close(fd);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_0200
     * @tc.name      : off_002
     * @tc.desc      : off listening setFavorite(true) file, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('off_002', 0, async function (done) {
      const testNum = 'off_002';
      try {
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off02.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count= 0;
        await sleep(500);
        helper.on(asset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(100);
        helper.off(asset.uri);
        await sleep(100);
        await asset.setFavorite(true);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_0300
     * @tc.name      : off_003
     * @tc.desc      : off listening setFavorite(false) file, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('off_003', 0, async function (done) {
      const testNum = 'off_003';
      try {
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off03.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setFavorite(true);
        let count= 0;
        await sleep(500);
        helper.on(asset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(100);
        helper.off(asset.uri);
        await sleep(100);
        await asset.setFavorite(false);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_0400
     * @tc.name      : off_004
     * @tc.desc      : off listening delete file, type NOTIFY_REMOVE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('off_004', 0, async function (done) {
      const testNum = 'off_004';
      try {
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off04.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count= 0;
        await sleep(500);
        helper.on(asset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} asset changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(100);
        helper.off(asset.uri);
        await sleep(100);
        await helper.deleteAssets([asset.uri]);
        await sleep(2000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_0500
     * @tc.name      : off_005
     * @tc.desc      : off listening recover file, type NOTIFY_ADD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('off_005', 0, async function (done) {
      const testNum = 'off_005';
      try {
        let testFileName = 'testCreateFile' + Date.now() + '.jpg';
        let fileAsset = await helper.createAsset(testFileName);
        let fd = await fileAsset.open('rw');
        await fileAsset.close(fd);
        await helper.deleteAssets([fileAsset.uri]);
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, testFileName);
        let trashFetchResult = await trashAlbum.getAssets(fetchOps);
        const trashFileAsset = await trashFetchResult.getFirstObject();
        let count= 0;
        await sleep(500);
        helper.on(trashFileAsset.uri, false, async (changeData) => {
          count++;
          console.info(`off_005 changeData: ${JSON.stringify(changeData)}`);
          expect(false).assertTrue();
          done();
        });
        await sleep(100);
        helper.off(trashFileAsset.uri);
        await sleep(100);
        await trashAlbum.recoverAssets([trashFileAsset]);
        await sleep(2000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`off_005: tryError: $${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_0600
     * @tc.name      : off_006
     * @tc.desc      : off listening trash delete file, type NOTIFY_REMOVE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('off_006', 0, async function (done) {
      const testNum = 'off_006';
      try {
        let testFileName = 'testCreateFile' + Date.now() + '.jpg';
        let fileAsset = await helper.createAsset(testFileName);
        let fd = await fileAsset.open('rw');
        await fileAsset.close(fd);
        await helper.deleteAssets([fileAsset.uri]);
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, testFileName);
        let trashFetchResult = await trashAlbum.getAssets(fetchOps);
        const trashFileAsset = await trashFetchResult.getFirstObject();
        let count= 0;
        await sleep(500);
        helper.on(trashAlbum.albumUri, false, async (changeData) => {
          count++;
          console.info(`off_006 changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(100);
        helper.off(trashAlbum.albumUri);
        await sleep(100);
        await trashAlbum.deleteAssets([trashFileAsset]);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`off_006: tryError: $${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_0900
     * @tc.name      : off_009
     * @tc.desc      : off listening delete album, type NOTIFY_REMOVE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('off_009', 0, async function (done) {
      try {
        let count= 0;
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        await sleep(500);
        helper.on(DEFAULT_ALBUM_URI, true, async (changeData) => {
          count++;
          console.info(`off_009 changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(100);
        helper.off(DEFAULT_ALBUM_URI);
        await sleep(100);
        await helper.deleteAlbums([album]);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`off_009: tryError: $${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_1300
     * @tc.name      : off_013
     * @tc.desc      : off listening DEFAULT_ALBUM_URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('off_013', 0, async function (done) {
      const testNum = 'off_013';
      try {
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off13.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let testFileName = 'testCreateFile4' + Date.now() + '.jpg';
        let fileAsset = await helper.createAsset(testFileName);
        let fd = await fileAsset.open('rw');
        await fileAsset.close(fd);
        await helper.deleteAssets([fileAsset.uri]);
        await sleep(500);
        let listenCount = 0;
        helper.on(DEFAULT_ALBUM_URI, true, async (changeData) => {
          listenCount++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(100);
        helper.off(DEFAULT_ALBUM_URI);
        await sleep(100);
        // 1
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        // 2
        await sleep(500);
        album.albumName = 'hello';
        await album.commitModify();
        // 3
        await sleep(500);
        await album.addAssets([asset]);
        // 5
        await sleep(500);
        await album.removeAssets([asset]);
        // 6
        await sleep(500);
        await helper.deleteAlbums([album]);
        // 7
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, testFileName);
        let trashFetchResult = await trashAlbum.getAssets(fetchOps1);
        let trashFileAsset = await trashFetchResult.getFirstObject();
        await trashAlbum.deleteAssets([trashFileAsset]);
        await sleep(1000);
        expect(listenCount).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_OFF_1400
     * @tc.name      : off_014
     * @tc.desc      : off listening DEFAULT_PHOTO_URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('off_014', 0, async function (done) {
      const testNum = 'off_014';
      try {
        let listenCount = 0;
        let fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'off14.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        helper.on(DEFAULT_PHOTO_URI, true, async (changeData) => {
          listenCount++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(100);
        helper.off(DEFAULT_PHOTO_URI);
        await sleep(100);
        // 1
        let fd = await asset.open('rw');
        await asset.close(fd);
        // 2
        await sleep(500);
        const newTitle = testNum + asset.get(photoKeys.TITLE);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();
        // 3
        await sleep(500);
        await asset.setFavorite(true);
        // 4
        await sleep(500);
        await asset.setFavorite(false);
        // 5
        await sleep(500);
        await helper.deleteAssets([asset.uri]);
        // 6
        await sleep(500);
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off14.jpg')
        let trashFetchResult = await trashAlbum.getAssets(fetchOps1);
        let trashFileAsset = await trashFetchResult.getFirstObject();
        await trashAlbum.recoverAssets([trashFileAsset]);
        await sleep(1000);
        expect(listenCount).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_0000
     * @tc.name      : on_callback_000
     * @tc.desc      : off listening create file, type NOTIFY_ADD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_callback_000', 0, async function (done) {
      const testNum = 'on_callback_000';
      try {
        const createAsset = await helper.createAsset(testNum + '.jpg');
        let count = 0;
        await sleep(500);
        helper.on(createAsset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          helper.off(createAsset.uri);
          expect(changeData.type).assertEqual(NOTIFY_ADD);
          expect(changeData.uris[0]).assertEqual(createAsset.uri);
        });
        await sleep(100);
        let fd = await createAsset.getReadOnlyFd();
        await createAsset.close(fd);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_0200
     * @tc.name      : on_callback_002
     * @tc.desc      : listening setFavorite(true) file, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_callback_002', 0, async function (done) {
      const testNum = 'on_callback_002';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on02.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count= 0;
        await sleep(500);
        helper.on(asset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          helper.off(asset.uri);
          expect(changeData.type).assertEqual(NOTIFY_UPDATE);
          expect(changeData.uris[0]).assertEqual(asset.uri);
        });
        await asset.setFavorite(true);
        await sleep(1000);
        helper.off(asset.uri);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_0300
     * @tc.name      : on_callback_003
     * @tc.desc      : listening setFavorite(false) file, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_callback_003', 0, async function (done) {
      const testNum = 'on_callback_003';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on03.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setFavorite(true);
        let count= 0;
        await sleep(500);
        helper.on(asset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          helper.off(asset.uri);
          expect(changeData.type).assertEqual(NOTIFY_UPDATE);
          expect(changeData.uris[0]).assertEqual(asset.uri);
        });
        await asset.setFavorite(false);
        await sleep(1000);
        helper.off(asset.uri);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_0400
     * @tc.name      : on_callback_004
     * @tc.desc      : listening delete file, type NOTIFY_REMOVE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_callback_004', 0, async function (done) {
      const testNum = 'on_callback_004';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on04.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let listenCount = 0;
        await sleep(500);
        helper.on(asset.uri, false, async (changeData) => {
          listenCount++;
          console.info(`${testNum} asset changeData: ${JSON.stringify(changeData)}`);
          helper.off(asset.uri);
          expect(changeData.type).assertEqual(NOTIFY_REMOVE);
          expect(changeData.uris[0]).assertEqual(asset.uri);
        });
        await helper.deleteAssets([asset.uri]);
        await sleep(2000);
        helper.off(asset.uri);
        expect(listenCount).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_0500
     * @tc.name      : on_callback_005
     * @tc.desc      : listening recover file, type NOTIFY_ADD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('on_callback_005', 0, async function (done) {
        const testNum = 'on_callback_005';
      try {
        let testFileName = 'testCreateFile' + Date.now() + '.jpg';
        let fileAsset = await helper.createAsset(testFileName);
        let fd = await fileAsset.open('rw');
        await fileAsset.close(fd);
        await helper.deleteAssets([fileAsset.uri]);
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, testFileName);
        let trashFetchResult = await trashAlbum.getAssets(fetchOps);
        const trashFileAsset = await trashFetchResult.getFirstObject();
        let count= 0;
        await sleep(500);
        helper.on(trashFileAsset.uri, false, async (changeData) => {
          count++;
          console.info(`on_callback_005 changeData: ${JSON.stringify(changeData)}`);
          expect(changeData.type).assertEqual(NOTIFY_ADD);
          expect(changeData.uris[0]).assertEqual(trashFileAsset.uri);
          helper.off(trashFileAsset.uri);
        });
        await trashAlbum.recoverAssets([trashFileAsset]);
        await sleep(2000);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`on_callback_005: tryError: $${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_0600
     * @tc.name      : on_callback_006
     * @tc.desc      : listening trash delete file, type NOTIFY_REMOVE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('on_callback_006', 0, async function (done) {
        const testNum = 'on_callback_006';
      try {
        let testFileName = 'testCreateFile' + Date.now() + '.jpg';
        let fileAsset = await helper.createAsset(testFileName);
        let fd = await fileAsset.open('rw');
        await fileAsset.close(fd);
        await helper.deleteAssets([fileAsset.uri]);
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, testFileName);
        let trashFetchResult = await trashAlbum.getAssets(fetchOps);
        const trashFileAsset = await trashFetchResult.getFirstObject();
        let count= 0;
        await sleep(500);
        helper.on(trashAlbum.albumUri, false, async (changeData) => {
          count++;
          console.info(`on_callback_006 changeData: ${JSON.stringify(changeData)}`);
          helper.off(trashAlbum.albumUri);
          expect(changeData.type).assertEqual(NOTIFY_ALBUM_REMOVE_ASSET);
          expect(changeData.suburis[0]).assertEqual(trashFileAsset.uri);
        });
        await trashAlbum.deleteAssets([trashFileAsset]);
        await sleep(1000);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`on_callback_006: tryError: $${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_0900
     * @tc.name      : on_callback_009
     * @tc.desc      : listening delete album, type NOTIFY_REMOVE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_callback_009', 0, async function (done) {
      try {
        let albumUri = '';
        let listenCount = 0;
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        albumUri = album.albumUri;
        await sleep(500);
        helper.on(DEFAULT_ALBUM_URI, true, async (changeData) => {
          listenCount++;
          if (listenCount < 2) {
            console.info(`on_callback_009 changeData: ${JSON.stringify(changeData)}`);
            expect(changeData.type).assertEqual(NOTIFY_REMOVE);
            expect(changeData.uris[0]).assertEqual(albumUri);
            done();
          }
        });
        await helper.deleteAlbums([album]);
        await sleep(1000);
        expect(listenCount).assertEqual(1);
        helper.off(DEFAULT_ALBUM_URI);
        done();
      } catch (error) {
        console.log(`on_callback_009: tryError: $${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_1000
     * @tc.name      : on_callback_010
     * @tc.desc      : listening change album coverUri, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_callback_010', 0, async function example(done) {
      const testNum = 'on_callback_010';
      try {
        let albumUri = '';
        let count= 0;
        let albumName = testNum + Date.now();
        let album = await helper.createAlbum(albumName);
        albumUri = album.albumUri;
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on10.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await sleep(500);
        helper.on(albumUri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          expect(changeData.type).assertEqual(NOTIFY_UPDATE);
          expect(changeData.uris[0]).assertEqual(albumUri);
        });
        album.setCoverUri(asset.uri);
        await album.commitModify();
        await sleep(1000);
        helper.off(albumUri);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_1300
     * @tc.name      : on_callback_013
     * @tc.desc      : listening DEFAULT_ALBUM_URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('on_callback_013', 0, async function (done) {
      const testNum = 'on_callback_013';
      try {
        let albumUri = '';
        let trashAlbumUri = '';
        let trashFileAssetUri = '';
        let listenCount = 0;
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on13.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let testFileName = 'testCreateFile' + Date.now() + '.jpg';
        let fileAsset = await helper.createAsset(testFileName);
        let fd = await fileAsset.open('rw');
        await fileAsset.close(fd);
        await helper.deleteAssets([fileAsset.uri]);
        await sleep(500);
        helper.on(DEFAULT_ALBUM_URI, true, async (changeData) => {
          listenCount++;
          switch (listenCount) {
            case 1:
              console.info(`on_callback_013_1 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_ADD);
              expect(changeData.uris[0]).assertEqual(albumUri);
              break;
            case 2:
              console.info(`on_callback_013_2 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_UPDATE);
              expect(changeData.uris[0]).assertEqual(albumUri);
              break;
            case 3:
              console.info(`on_callback_013_3 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_ALBUM_ADD_ASSET);
              expect(changeData.uris[0]).assertEqual(albumUri);
              break;
            case 4:
              console.info(`on_callback_013_4 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_UPDATE);
              expect(changeData.uris[0]).assertEqual(albumUri);
              break;
            case 5:
              console.info(`on_callback_013_5 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_ALBUM_REMOVE_ASSET);
              expect(changeData.uris[0]).assertEqual(albumUri);
              break;
            case 6:
              console.info(`on_callback_013_6 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_REMOVE);
              expect(changeData.uris[0]).assertEqual(albumUri);
              break;
            case 7:
              console.info(`on_callback_013_7 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.uris[0]).assertEqual(trashAlbumUri);
              expect(changeData.type).assertEqual(NOTIFY_ALBUM_REMOVE_ASSET);
              expect(changeData.suburis[0]).assertEqual(trashFileAssetUri);
              break;
            default:
              break;
          }
        });
        // 1
        let albumName = testNum + Date.now();
        let album = await helper.createAlbum(albumName);
        albumUri = album.albumUri;
        // 2
        await sleep(500);
        album.albumName = Date.now() + album.albumName;
        await album.commitModify();
        // 3
        await sleep(500);
        await album.addAssets([asset]);
        // 4
        await sleep(500);
        album.albumName = testNum + album.albumName;
        await album.commitModify();
        // 5
        await sleep(500);
        await album.removeAssets([asset]);
        // 6
        await sleep(500);
        await helper.deleteAlbums([album]);
        // 7
        await sleep(500);
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        trashAlbumUri = trashAlbum.albumUri;
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, testFileName);
        let trashFetchResult = await trashAlbum.getAssets(fetchOps1);
        let trashFileAsset = await trashFetchResult.getFirstObject();
        trashFileAssetUri = trashFileAsset.uri;
        console.log(`on_callback_013: trashFileAssetUri: ${trashFileAssetUri}`);
        await trashAlbum.deleteAssets([trashFileAsset]);
        await sleep(1000);
        helper.off(DEFAULT_ALBUM_URI);
        expect(listenCount).assertEqual(7);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_1400
     * @tc.name      : on_callback_014
     * @tc.desc      : listening DEFAULT_PHOTO_URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('on_callback_014', 0, async function (done) {
      const testNum = 'on_callback_014';
      try {
        let listenCount = 0;
        const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'on14.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let photoAssetUri = asset.uri;
        helper.on(DEFAULT_PHOTO_URI, true, async (changeData) => {
          listenCount++;
          switch (listenCount) {
            case 1:
              console.info(`on_callback_014_2 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_UPDATE);
              expect(changeData.uris[0]).assertEqual(photoAssetUri);
              break;
            case 2:
              console.info(`on_callback_014_3 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_UPDATE);
              expect(changeData.uris[0]).assertEqual(photoAssetUri);
              break;
            case 3:
              console.info(`on_callback_014_4 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_UPDATE);
              expect(changeData.uris[0]).assertEqual(photoAssetUri);
              break;
            case 4:
              console.info(`on_callback_014_5 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_REMOVE);
              expect(changeData.uris[0]).assertEqual(photoAssetUri);
              break;
            case 5:
              console.info(`on_callback_014_6 changeData: ${JSON.stringify(changeData)}`);
              expect(changeData.type).assertEqual(NOTIFY_ADD);
              expect(changeData.uris[0]).assertEqual(photoAssetUri);
              break;
            default:
              break;
          }
        });
        // 1
        await sleep(500);
        const newTitle = testNum + asset.get(photoKeys.TITLE);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();
        // 2
        await sleep(500);
        await asset.setFavorite(true);
        // 3
        await sleep(500);
        await asset.setFavorite(false);
        // 4
        await sleep(500);
        await helper.deleteAssets([asset.uri]);
        // 5
        await sleep(500);
        let trashAlbumList = await helper.getAlbums(albumType.SYSTEM, albumSubtype.TRASH);
        let trashAlbum = await trashAlbumList.getFirstObject();
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on14.jpg')
        let trashFetchResult = await trashAlbum.getAssets(fetchOps1);
        let trashFileAsset = await trashFetchResult.getFirstObject();
        await trashAlbum.recoverAssets([trashFileAsset]);
        await sleep(1000);
        helper.off(DEFAULT_PHOTO_URI);
        expect(listenCount).assertEqual(5);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_1500
     * @tc.name      : on_callback_015
     * @tc.desc      : listening 32
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('on_callback_015', 0, async function (done) {
      const testNum = 'on_callback_015';
      try {
        helper.off(DEFAULT_PHOTO_URI);
        let listenCount = 0;
        let fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'on15.jpg');
        let asset = await getFileAsset(testNum, fetchOps);

        //prepare environment
        await asset.setFavorite(true);

        //test start; notify times lessthan 32 in 500ms
        let i = 0;
        helper.on(DEFAULT_PHOTO_URI, true, async (changeData) => {
          listenCount++;
          console.info(`${testNum} i: ${i}, listenCount: ${listenCount}`);
          if (listenCount > 1) {
            if (i <= 32) {
              expect(listenCount - 1).assertEqual(1);
            } else {
              expect(listenCount - 1).assertEqual(Math.ceil(i/32))
            }
            console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
            expect(changeData.type).assertEqual(NOTIFY_UPDATE);
            expect(changeData.uris.length).assertEqual(i);
          }
        });

        const endTime = Date.now() + 500;
        for (let now = Date.now(); now < endTime; now = Date.now()) {
          i++;
          const newTitle = asset.get(photoKeys.TITLE).toString() + i;
          asset.set(photoKeys.TITLE, newTitle);
          await asset.commitModify();
        }
        await sleep(2000);
        helper.off(DEFAULT_PHOTO_URI);
        expect(listenCount).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_1600
     * @tc.name      : on_callback_016
     * @tc.desc      : listening 500ms
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('on_callback_016', 0, async function (done) {
      const testNum = 'on_callback_016';
      try {
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on16.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let fd = await asset.open('rw');
        await asset.close(fd);
        let listenCount = 0;
        await sleep(500);
        helper.on(asset.uri, false, async (changeData) => {
          listenCount++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          expect(changeData.type).assertEqual(NOTIFY_UPDATE);
          expect(changeData.uris[0]).assertEqual(asset.uri);
        });
        for (let i = 0; i < 10; i++) {
          if (i % 2 == 0) {
            await asset.setFavorite(true);
          } else {
            await asset.setFavorite(false);
          }
          await sleep(500);
        }
        await sleep(2000);
        helper.off(asset.uri);
        expect(listenCount).assertEqual(10);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ON_CALLBACK_1700
     * @tc.name      : on_callback_017
     * @tc.desc      : listening update file, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_callback_017', 0, async function example(done) {
      try {
        let testFileName = 'testCreateFile' + Date.now() + '.jpg';
        let fileAsset = await helper.createAsset(testFileName);
        let fd = await fileAsset.open('rw');
        let buf = new ArrayBuffer(1);
        buf[0] = 1;
        await fileio.write(fd, buf);
        await fileAsset.close(fd);
        let count= 0;
        await sleep(1000);
        helper.on(fileAsset.uri, false, async (changeData) => {
          count++;
          console.info(`on_callback_017 changeData: ${JSON.stringify(changeData)}`);
          expect(changeData.type).assertEqual(NOTIFY_UPDATE);
          expect(changeData.uris[0]).assertEqual(fileAsset.uri);
          done();
        });
        fd = await fileAsset.open('rw');
        buf = new ArrayBuffer(1);
        buf[0] = 0;
        await fileio.write(fd, buf);
        await fileAsset.close(fd);
        await sleep(1000);
        expect(count).assertEqual(1);
        helper.off(fileAsset.uri);
        done();
      } catch (error) {
        console.log(`on_callback_017: tryError: $${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0100
      * @tc.name      : album_getAssets_promise_001
      * @tc.desc      : add image asset to system album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_promise_001', 0, async function (done) {
      const testNum = 'album_getAssets_promise_001';
      try {
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumGetAssetsPro01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setFavorite(true);
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult = await album.getAssets(fetchOps);
        expect(curFetchResult.getCount()).assertEqual(1);
        curFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0200
      * @tc.name      : addAssets_promise_002
      * @tc.desc      : add setFavorite image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_002', 2, async function (done) {
      const testNum = 'addAssets_promise_002';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addPro02.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await asset.setFavorite(true);
        await album.addAssets([asset]);
        const fetchResult = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0600
      * @tc.name      : addAssets_promise_006
      * @tc.desc      : add deleted image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_006', 2, async function (done) {
      const testNum = 'addAssets_promise_006';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addPro04.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await helper.deleteAssets([asset.uri]);
        await album.addAssets([asset]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0100
      * @tc.name      : removeAssets_promise_001
      * @tc.desc      : add setFavorite image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_001', 2, async function (done) {
      const testNum = 'removeAssets_promise_001';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro02.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await asset.setFavorite(true);
        await album.addAssets([asset]);
        await album.removeAssets([asset]);
        console.info(`${testNum} album.count: ${album.count}`);
        const fetchResult = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0200
      * @tc.name      : album_getAssets_promise_002
      * @tc.desc      : screenshots album getAssets
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_promise_002', 0, async function (done) {
      const testNum = 'album_getAssets_promise_002';
      try {
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.SCREENSHOT);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'screenshotsPro01.jpg');
        const curFetchResult = await album.getAssets(fetchOps);
        expect(curFetchResult.getCount()).assertEqual(1);
        curFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0300
      * @tc.name      : album_getAssets_promise_003
      * @tc.desc      : camera album getAssets
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_promise_003', 0, async function (done) {
      const testNum = 'album_getAssets_promise_003';
      try {
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.CAMERA);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'cameraPro01.jpg');
        const curFetchResult = await album.getAssets(fetchOps);
        expect(curFetchResult.getCount()).assertEqual(1);
        curFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
