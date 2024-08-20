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

import { describe, it, expect, beforeAll} from '@ohos/hypium'
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import mediaLibrary from "libphotoAccessHelperTest.so";
import {
  photoKeys,
  getPermission,
  photoFetchOption,
  getFileAsset,
  getAssetId,
  isNum,
  photoType,
} from '../../../../../../../common'

const TAG = "MEDIA_LIBRARY_LOGTAG_NATIVE";
const MEDIA_LIBRARY_OK = 0;
const MEDIA_LIBRARY_PARAMETER_ERROR = 401;

export default function PhotoAccessHelperNativeTest() {

  describe('PhotoAccessHelperNativeTest', () => {
    beforeAll(async () => {
      await getPermission();
    })

    /**
     * @tc.number     : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_URI_NATIVE_0000
     * @tc.name       : TestMediaAssetGetUri0000
     * @tc.desc       : image get photoKeys.URI
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('TestMediaAssetGetUri0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetGetUri0000';
        let ret = mediaLibrary.testMediaAssetGetUri(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DISPLAY_NAME_NATIVE_0000
     * @tc.name      : TestMediaAssetGetDisplayName0000
     * @tc.desc      : image get photoKeys.DISPLAY_NAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetDisplayName0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetGetDisplayName0000';
        let ret = mediaLibrary.testMediaAssetGetDisplayName(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_SIZE_NATIVE_0000
     * @tc.name      : TestMediaAssetGetSize0000
     * @tc.desc      : image get photoKeys.SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetSize0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetGetSize0000';
        let ret = mediaLibrary.testMediaAssetGetSize(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_MODIFIED_MS_NATIVE_0000
     * @tc.name      : TestMediaAssetGetDateModifiedMs0000
     * @tc.desc      : image get photoKeys.DATE_MODIFIED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('TestMediaAssetGetDateModifiedMs0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetGetDateModifiedMs0000';
        let ret = mediaLibrary.testMediaAssetGetDateModifiedMs(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_WIDTH_NATIVE_0000
     * @tc.name      : TestMediaAssetGetWidth0000
     * @tc.desc      : image get photoKeys.WIDTH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetWidth0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetGetWidth0000';
        let ret = mediaLibrary.testMediaAssetGetWidth(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_HEIGHT_NATIVE_0000
     * @tc.name      : TestMediaAssetGetHeight0000
     * @tc.desc      : image get photoKeys.HEIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetHeight0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetGetHeight0000';
        let ret = mediaLibrary.testMediaAssetGetHeight(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_ORIENTATION_NATIVE_0000
     * @tc.name      : TestMediaAssetGetOrientation0000
     * @tc.desc      : image get photoKeys.ORIENTATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetOrientation0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetGetOrientation0000';
        let ret = mediaLibrary.testMediaAssetGetOrientation(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_RELEASE_NATIVE_0000
     * @tc.name      : TestMediaAssetRelease0000
     * @tc.desc      : release media asset object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetRelease0000', 2, () => {
      try {
        let testNum = 'TestMediaAssetRelease0000';
        let ret = mediaLibrary.testMediaAssetRelease(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0000
     * @tc.name      : TestChangeRequestAddResourceWithBuffer0000
     * @tc.desc      : add resource by ArrayBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestAddResourceWithBuffer0000', 2, () => {
      try {
        let testNum = 'TestChangeRequestAddResourceWithBuffer0000';
        let ret = mediaLibrary.testChangeRequestAddResourceWithBuffer(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_NATIVE_0000
     * @tc.name      : TestChangeRequestSaveCameraPhoto0000
     * @tc.desc      : save camera photo
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestSaveCameraPhoto0000', 2, () => {
      try {
        let testNum = 'TestChangeRequestSaveCameraPhoto0000';
        let ret = mediaLibrary.testChangeRequestSaveCameraPhoto(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_DISCARD_CAMERA_PHOTO_NATIVE_0000
     * @tc.name      : TestChangeRequestDiscardCameraPhoto0000
     * @tc.desc      : discard camera photo
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestDiscardCameraPhoto0000', 2, () => {
      try {
        let testNum = 'TestChangeRequestDiscardCameraPhoto0000';
        let ret = mediaLibrary.testChangeRequestDiscardCameraPhoto(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_RELEASE_NATIVE_0000
     * @tc.name      : testChangeRequestRelease0000
     * @tc.desc      : release media asset change request object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testChangeRequestRelease0000', 2, () => {
      try {
        let testNum = 'testChangeRequestRelease0000';
        let ret = mediaLibrary.testChangeRequestRelease(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0000
     * @tc.name      : TestManagerRequestImage0000
     * @tc.desc      : request image resource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestManagerRequestImage0000', 2, () => {
      try {
        let testNum = 'TestManagerRequestImage0000';
        let ret = mediaLibrary.testManagerRequestImage(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_APPLY_CHANGES_NATIVE_0000
     * @tc.name      : TestMediaAccessHelperApplyChanges0000
     * @tc.desc      : apply changes
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAccessHelperApplyChanges0000', 2, () => {
      try {
        let testNum = 'TestMediaAccessHelperApplyChanges0000';
        let ret = mediaLibrary.testMediaAccessHelperApplyChanges(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  });
}