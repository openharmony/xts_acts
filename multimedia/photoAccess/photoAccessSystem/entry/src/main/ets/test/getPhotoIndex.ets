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
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { describe, it, expect, beforeAll} from 'deccjsunit/index'
import {
  photoKeys,
  fetchAllOption,
  photoFetchOption,
  getFileAsset,
  albumType,
  albumSubtype,
} from '../../../../../../common'

export default function getPhotoIndexTest () {
  describe('getPhotoIndexTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
    async function setIndexFavorite() {
      try {
        let fetchOps = photoFetchOption("setIndexFavorite", photoKeys.DISPLAY_NAME, 'favoriteIndex01.jpg');
        let asset = await getFileAsset("setIndexFavorite", fetchOps);
        await asset.setFavorite(true);
        fetchOps = photoFetchOption("setIndexFavorite", photoKeys.DISPLAY_NAME, 'favoriteIndex02.jpg');
        asset = await getFileAsset("setIndexFavorite", fetchOps);
        await asset.setFavorite(true);
        fetchOps = photoFetchOption("setIndexFavorite", photoKeys.DISPLAY_NAME, 'favoriteIndex03.jpg');
        asset = await getFileAsset("setIndexFavorite", fetchOps);
        await asset.setFavorite(true);
      } catch (error){
        console.info(`setIndexFavorite setFavorite; error: ${error}`);
      }
    }

    async function setIndexHidden() {
      try {
        let fetchOps = photoFetchOption("setIndexHidden", photoKeys.DISPLAY_NAME, 'hiddenIndex01.jpg');
        let asset = await getFileAsset("setIndexHidden", fetchOps);
        await asset.setHidden(true);
        fetchOps = photoFetchOption("setIndexHidden", photoKeys.DISPLAY_NAME, 'hiddenIndex02.jpg');
        asset = await getFileAsset("setIndexHidden", fetchOps);
        await asset.setHidden(true);
        fetchOps = photoFetchOption("setIndexHidden", photoKeys.DISPLAY_NAME, 'hiddenIndex03.jpg');
        asset = await getFileAsset("setIndexHidden", fetchOps);
        await asset.setHidden(true);
      } catch (error){
        console.info(`setIndexHidden setHidden; error: ${error}`);
      }
    }

    async function setIndexTrash() {
      try {
        let fetchOps = photoFetchOption("setIndexTrash", photoKeys.DISPLAY_NAME, 'trashIndex01.jpg');
        let asset = await getFileAsset("setIndexTrash", fetchOps);
        await helper.deleteAssets([asset.uri]);
        fetchOps = photoFetchOption("setIndexTrash", photoKeys.DISPLAY_NAME, 'trashIndex02.jpg');
        asset = await getFileAsset("setIndexTrash", fetchOps);
        await helper.deleteAssets([asset.uri]);
        fetchOps = photoFetchOption("setIndexTrash", photoKeys.DISPLAY_NAME, 'trashIndex03.jpg');
        asset = await getFileAsset("setIndexTrash", fetchOps);
        await helper.deleteAssets([asset.uri]);
      } catch (error){
        console.info(`"setIndexTrash deleteAssets; error: ${error}`);
      }
    }

    beforeAll(async function(){
      console.info("beforeAll case");
      await setIndexFavorite();
      await setIndexHidden();
      await setIndexTrash();
    });

    async function getPhotoIndexTestCallBack(done, testNum, albumSubType, fetchOpForGetIndex) {
      let expectIndex = 1;
      try {
        let fetchOp = fetchAllOption();
        let albumFetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubType, fetchOp);
        if (albumFetchResult == undefined) {
          console.info(`${testNum} getAlbums failed`);
          expect(false).assertTrue();
        }
        let album = await albumFetchResult.getFirstObject();
        if (album == undefined) {
          console.info(`${testNum} album getFirstObject failed`);
          expect(false).assertTrue();
        }
        console.info('album.uri is : ' + album.albumUri);
        let photoFetchResult = await album.getAssets(fetchOpForGetIndex);
        if (photoFetchResult == undefined) {
          console.info(`${testNum} album getAssets failed`);
          expect(false).assertTrue();
        }
        let photoAsset = await photoFetchResult.getObjectByPosition(expectIndex);
        if (photoAsset == undefined) {
          console.info(`${testNum} getObjectByPosition failed`);
          expect(false).assertTrue();
        }
        helper.getPhotoIndex(photoAsset.uri, album.albumUri, fetchOpForGetIndex, (err, index) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getPhotoIndex failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(index).assertEqual(expectIndex + 1);
            }
          } catch (error) {
            console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
          }
          done();
        })
      }catch (error) {
        console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getPhotoIndexTestCallBack1(done, testNum, fetchOpForGetIndex) {
      let expectIndex = 1;
      try {
        let fetchResult = await helper.getAssets(fetchOpForGetIndex);
        if (fetchResult == undefined) {
          console.info(`${testNum} album getAssets failed`);
          expect(false).assertTrue();
        }
        let photoAsset = await fetchResult.getObjectByPosition(expectIndex);
        if (photoAsset == undefined) {
          console.info(`${testNum} getObjectByPosition failed`);
          expect(false).assertTrue();
        }
        helper.getPhotoIndex(photoAsset.uri, "", fetchOpForGetIndex, (err, index) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getPhotoIndex failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(index).assertEqual(expectIndex + 1);
            }
          } catch (error) {
            console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
          }
          done();
        })
      }catch (error) {
        console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getPhotoIndexTestAbnormalCallBack(done, testNum, fetchOpForGetIndex) {
      let expectIndex = 1;
      try {
        let fetchResult = await helper.getAssets(fetchOpForGetIndex);
        if (fetchResult == undefined) {
          console.info(`${testNum} album getAssets failed`);
          expect(false).assertTrue();
        }
        let photoAsset = await fetchResult.getObjectByPosition(expectIndex);
        if (photoAsset == undefined) {
          console.info(`${testNum} getObjectByPosition failed`);
          expect(false).assertTrue();
        }
        helper.getPhotoIndex(photoAsset.uri, "", fetchOpForGetIndex, (err, index) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getPhotoIndex failed; err: ${err}`);
              expect(true).assertTrue();
            } else {
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
          }
          done();
        })
      }catch (error) {
        console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    }

    async function getPhotoIndexTestPromise(done, testNum, albumSubType, fetchOpForGetIndex) {
      let expectIndex = 1;
      try {
        let fetchOp = fetchAllOption();
        let albumFetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubType, fetchOp);
        if (albumFetchResult == undefined) {
          console.info(`${testNum} getAlbums failed`);
          expect(false).assertTrue();
        }
        let album = await albumFetchResult.getFirstObject();
        if (album == undefined) {
          console.info(`${testNum} album getFirstObject failed`);
          expect(false).assertTrue();
        }
        let photoFetchResult = await album.getAssets(fetchOpForGetIndex);
        if (photoFetchResult == undefined) {
          console.info(`${testNum} album getAssets failed`);
          expect(false).assertTrue();
        }
        let photoAsset = await photoFetchResult.getObjectByPosition(expectIndex);
        if (photoAsset == undefined) {
          console.info(`${testNum} getObjectByPosition failed`);
          expect(false).assertTrue();
        }
        let index = await helper.getPhotoIndex(photoAsset.uri, album.albumUri, fetchOpForGetIndex);
        console.info(`${testNum} get index : ` + index);
        expect(index).assertEqual(expectIndex + 1);
        done();
      }catch (error) {
        console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getPhotoIndexTestPromise1(done, testNum, fetchOpForGetIndex) {
      let expectIndex = 1;
      try {
        let fetchResult = await helper.getAssets(fetchOpForGetIndex);
        if (fetchResult == undefined) {
          console.info(`${testNum} album getAssets failed`);
          expect(false).assertTrue();
        }
        let photoAsset = await fetchResult.getObjectByPosition(expectIndex);
        if (photoAsset == undefined) {
          console.info(`${testNum} getObjectByPosition failed`);
          expect(false).assertTrue();
        }
        let index = await helper.getPhotoIndex(photoAsset.uri, "", fetchOpForGetIndex);
        console.info(`${testNum} get index : ` + index);
        expect(index).assertEqual(expectIndex + 1);
        done();
      }catch (error) {
        console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getPhotoIndexTestAbnormalPromise(done, testNum, fetchOpForGetIndex) {
      let expectIndex = 1;
      try {
        let fetchResult = await helper.getAssets(fetchOpForGetIndex);
        if (fetchResult == undefined) {
          console.info(`${testNum} album getAssets failed`);
          expect(false).assertTrue();
        }
        let photoAsset = await fetchResult.getObjectByPosition(expectIndex);
        if (photoAsset == undefined) {
          console.info(`${testNum} getObjectByPosition failed`);
          expect(false).assertTrue();
        }
        let index = await helper.getPhotoIndex(photoAsset.uri, "", fetchOpForGetIndex);
        expect(false).assertTrue();
        done();
      }catch (error) {
        console.info(`${testNum} getPhotoIndex failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    }

    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0000
     * @tc.name      : getPhotoIndex_callback_000
     * @tc.desc      : getPhotoIndex by no album type and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPhotoIndex_callback_000', 0, async function (done) {
      const testNum = 'getPhotoIndex_callback_000';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0100
     * @tc.name      : getPhotoIndex_callback_001
     * @tc.desc      : getPhotoIndex getPhotoIndex in a favorite type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_001', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_001';
      const albumSubType = albumSubtype.FAVORITE;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack(done, testNum, albumSubType, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0200
     * @tc.name      : getPhotoIndex_callback_002
     * @tc.desc      : getPhotoIndex in a video type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_002', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_002';
      const albumSubType = albumSubtype.VIDEO;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack(done, testNum, albumSubType, fetchOpForGetIndex);
    });

	  /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0300
     * @tc.name      : getPhotoIndex_callback_003
     * @tc.desc      : getPhotoIndex in a screenshot type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_003', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_003';
      const albumSubType = albumSubtype.SCREENSHOT;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack(done, testNum, albumSubType, fetchOpForGetIndex);
    });

	  /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0400
     * @tc.name      : getPhotoIndex_callback_004
     * @tc.desc      : getPhotoIndex in a trash type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_004', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_004';
      const albumSubType = albumSubtype.TRASH;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack(done, testNum, albumSubType, fetchOpForGetIndex);
    });

  	/**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0500
     * @tc.name      : getPhotoIndex_callback_005
     * @tc.desc      : getPhotoIndex in a camera type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_005', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_005';
      const albumSubType = albumSubtype.CAMERA;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack(done, testNum, albumSubType, fetchOpForGetIndex);
    });

	  /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0600
     * @tc.name      : getPhotoIndex_callback_006
     * @tc.desc      : getPhotoIndex in a hidden type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_006', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_006';
      const albumSubType = albumSubtype.HIDDEN;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack(done, testNum, albumSubType, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0700
     * @tc.name      : getPhotoIndex_callback_007
     * @tc.desc      : getPhotoIndex by no album type and Sort queries in desc order using the keyword 'add_modified'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_007', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_007';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByDesc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0800
     * @tc.name      : getPhotoIndex_callback_008
     * @tc.desc      : getPhotoIndex by no album type and Sort queries in asc order using the keyword 'date_added'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_008', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_008';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_added");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_0900
     * @tc.name      : getPhotoIndex_callback_009
     * @tc.desc      : getPhotoIndex by no album type and Sort queries in asc order and some fetchColumn args
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_009', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_009';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [
          photoKeys.SIZE,
          photoKeys.TITLE,
          photoKeys.POSITION,
          photoKeys.DATE_TRASHED,
        ],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestCallBack1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_01000
     * @tc.name      : getPhotoIndex_callback_0010
     * @tc.desc      : getPhotoIndex by no album type and no sorting method
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_0010', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_0010';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestAbnormalCallBack(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GETPHOTOINDEX_01100
     * @tc.name      : getPhotoIndex_callback_0011
     * @tc.desc      : getPhotoIndex by no album type and more sorting method
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_callback_0011', 2, async function (done) {
      const testNum = 'getPhotoIndex_callback_0011';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_added");
      predicatesForGetIndex.and().orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestAbnormalCallBack(done, testNum, fetchOpForGetIndex);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0000
     * @tc.name      : getPhotoIndex_Promise_000
     * @tc.desc      : getPhotoIndex by no album type and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPhotoIndex_Promise_000', 0, async function (done) {
      const testNum = 'getPhotoIndex_Promise_000';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0100
     * @tc.name      : getPhotoIndex_Promise_001
     * @tc.desc      : getPhotoIndex getPhotoIndex in a favorite type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_001', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_001';
      const albumSubType = albumSubtype.FAVORITE;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise(done, testNum, albumSubType, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0200
     * @tc.name      : getPhotoIndex_Promise_002
     * @tc.desc      : getPhotoIndex getPhotoIndex in a video type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_002', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_002';
      const albumSubType = albumSubtype.VIDEO;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise(done, testNum, albumSubType, fetchOpForGetIndex);
    });

	  /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0300
     * @tc.name      : getPhotoIndex_Promise_003
     * @tc.desc      : getPhotoIndex getPhotoIndex in a screenshot type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_003', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_003';
      const albumSubType = albumSubtype.SCREENSHOT;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise(done, testNum, albumSubType, fetchOpForGetIndex);
    });

	  /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0400
     * @tc.name      : getPhotoIndex_Promise_004
     * @tc.desc      : getPhotoIndex getPhotoIndex in a trash type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_004', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_004';
      const albumSubType = albumSubtype.TRASH;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise(done, testNum, albumSubType, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0500
     * @tc.name      : getPhotoIndex_Promise_005
     * @tc.desc      : getPhotoIndex getPhotoIndex in a camera type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_005', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_005';
      const albumSubType = albumSubtype.CAMERA;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise(done, testNum, albumSubType, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0600
     * @tc.name      : getPhotoIndex_Promise_006
     * @tc.desc      : getPhotoIndex getPhotoIndex in a hidden type album and sort queries in asc order
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_006', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_006';
      const albumSubType = albumSubtype.HIDDEN;
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise(done, testNum, albumSubType, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0700
     * @tc.name      : getPhotoIndex_Promise_007
     * @tc.desc      : getPhotoIndex by no album type and Sort queries in desc order using the keyword 'add_modified'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_007', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_007';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByDesc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0800
     * @tc.name      : getPhotoIndex_Promise_008
     * @tc.desc      : getPhotoIndex by no album type and Sort queries in asc order using the keyword 'date_added'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_008', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_008';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_added");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_0900
     * @tc.name      : getPhotoIndex_Promise_009
     * @tc.desc      : getPhotoIndex by no album type and Sort queries in asc order and some fetchColumn args
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_009', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_009';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      let fetchOpForGetIndex = {
        fetchColumns: [
          photoKeys.SIZE,
          photoKeys.TITLE,
          photoKeys.POSITION,
          photoKeys.DATE_TRASHED,
        ],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestPromise1(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_01000
     * @tc.name      : getPhotoIndex_Promise_0010
     * @tc.desc      : getPhotoIndex by no album type and no sorting method
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_0010', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_0010';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestAbnormalPromise(done, testNum, fetchOpForGetIndex);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GETPHOTOINDEX_01100
     * @tc.name      : getPhotoIndex_Promise_0011
     * @tc.desc      : getPhotoIndex by no album type and more sorting method
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getPhotoIndex_Promise_0011', 2, async function (done) {
      const testNum = 'getPhotoIndex_Promise_0011';
      let predicatesForGetIndex = new dataSharePredicates.DataSharePredicates();
      predicatesForGetIndex.orderByAsc("date_modified");
      predicatesForGetIndex.and().orderByAsc("date_added");
      let fetchOpForGetIndex = {
        fetchColumns: [],
        predicates: predicatesForGetIndex
      };
      await getPhotoIndexTestAbnormalPromise(done, testNum, fetchOpForGetIndex);
    });
  })
}