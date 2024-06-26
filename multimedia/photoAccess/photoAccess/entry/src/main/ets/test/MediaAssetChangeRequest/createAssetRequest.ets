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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect } from 'deccjsunit/index'
import { BusinessError } from '@ohos.base'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { sleep, getPermission, fetchOption, photoKeys, pushCreateAsset } from '../../../../../../../common'

export default function createAssetRequestTest() {

  describe('createAssetRequestTest', function () {
    beforeAll(async function () {
        console.info('beforeAll case');
        await getPermission();
        await sleep()
    });

    const context = globalThis.abilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(context);

    async function saveCameraPhotoByExistPhotoAsset(done: function, testNum: string) {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['date_added', 'date_modified'],
            predicates: predicates
        };
        try {
            let flag: number = 2;
            let photoAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined = undefined;
            let date_added_before: number = 0;
	        let date_modified_before: number = 0;
            let assetCount = 0;
            while(flag > 0) {
                fetchResult = await helper.getAssets(fetchOptions);
                if (fetchResult !== undefined && fetchResult.getCount() > 0) {
                   console.log(`${testNum} :: assetCount == ${fetchResult.getCount()}`);
                   photoAsset = await fetchResult.getFirstObject();
                   console.log(`${testNum} :: assetCount == ${fetchResult.getCount()}`);
                   break;
                } else {
                   const fileNameList = ["testSaveCameraPhoto.jpg"];
                   await pushCreateAsset(fileNameList);
                   continue;
                }
            }
            // before
            date_added_before = photoAsset.get(photoKeys.DATE_ADDED);
            date_modified_before = photoAsset.get(photoKeys.DATE_MODIFIED);
            assetCount = fetchResult.getCount();
            console.log(`${testNum} :: Before applyChanges saveCameraPhoto :: date_added is ${date_added_before}, date_modified is ${date_modified_before}, assetCount is ${assetCount}`);
            // saveCameraPhoto applyChanges, then query
            let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
            assetChangeRequest.saveCameraPhoto();
            await helper.applyChanges(assetChangeRequest);
            console.info(`${testNum} :: apply saveCameraPhoto successfully`);
            let fetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
            let asset = await fetchResult2.getFirstObject();
            // after
	        let date_added_after = asset.get(photoKeys.DATE_ADDED);
	        let date_modified_after = asset.get(photoKeys.DATE_MODIFIED);
            let count = fetchResult2.getCount();
            console.log(`${testNum} :: After applyChanges saveCameraPhoto :: date_added is ${date_added_after}, date_modified is ${date_modified_after}, assetCount is ${count}`);
            expect(count).assertEqual(assetCount);
            expect(date_added_after).assertEqual(date_added_before);
	        expect(date_modified_after).assertEqual(date_modified_before);
            done();
        } catch(error: BusinessError) {
           console.error(`${testNum} :: saveCameraPhotoByExistPhotoAsset failed with error: ${error.code}, ${error.message}`);
           expect(false).assertTrue();
           done();
        }

    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0000
     * @tc.name      : create_asset_request_000
     * @tc.desc      : create image without options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('create_asset_request_000', 0, async function (done) {
      let testNum = 'create_asset_request_000';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create image without options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0100
     * @tc.name      : create_asset_request_001
     * @tc.desc      : create image with options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('create_asset_request_001', 2, async function (done) {
      let testNum = 'create_asset_request_001';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testImage'
        }
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create image with options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0200
     * @tc.name      : create_asset_request_002
     * @tc.desc      : create video without options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('create_asset_request_002', 2, async function (done) {
      let testNum = 'create_asset_request_002';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = 'mp4';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(4096));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create video without options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_0300
     * @tc.name      : create_asset_request_003
     * @tc.desc      : create video with options
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('create_asset_request_003', 2, async function (done) {
      let testNum = 'create_asset_request_003';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testVideo'
        }
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(4096));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to create video with options`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_PhotoAccess_Helper_Save_Camera_Photo_001
     * @tc.name      : save_camera_photo_by_exist_photo_asset_001
     * @tc.desc      : add existing photoAsset as param to saveCameraPhoto interface
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('save_camera_photo_by_exist_photo_asset_001', 0, async function (done) {
      let testNum = 'save_camera_photo_by_exist_photo_asset_001';
      saveCameraPhotoByExistPhotoAsset(done, testNum);
    })

  })
}