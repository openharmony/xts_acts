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
import { fetchOption, photoKeys } from '../../../../../../../common'

export default function createAssetRequestTest() {
  describe('createAssetRequestTest', function () {
    const context = globalThis.abilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(context);

    async function createAssertPromise(done: function, testNum: string) {
        console.log(`${testNum}:: start to create asset`);
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension:string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
            title: 'testSaveCameraPhoto'
        }
        helper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info(`${testNum}::createAsset successfully`);
          } else {
            console.error(`${testNum} :: createAsset failed, error: ${err.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        });
    }

    async function saveCameraPhotoByExistPhotoAsset(done: function, testNum: string) {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
        };
        try {
            let flag: number = 2;
            let photoAsset: photoAccessHelper.PhotoAsset = undefined;
            let assetCount = 0;
            while(flag > 0) {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                if (fetchResult !== undefined) {
                   console.info(`${testNum} :: fetchResult success`);
                   photoAsset = await fetchResult.getFirstObject();
                   if (photoAsset == undefined) {
                      await createAssertPromise(done, testNum);
                      flag = flag - 1;
                      continue;
                   }
                }
                assetCount = fetchResult.getCount();
                console.log(`${testNum} :: assetCount = ${assetCount}`);
                break;
            }
            let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
            assetChangeRequest.saveCameraPhoto();
            await phAccessHelper.applyChanges(assetChangeRequest);
            console.info(`${testNum} :: apply saveCameraPhoto successfully`);
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let count = fetchResult.getCount();
            expect(count).assertEqual(assetCount);
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