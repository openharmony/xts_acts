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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { common } from '@kit.AbilityKit';
import {
  sleep,
  driveFn,
  getPermission,
  fetchAllOption,
  createResource
} from '../../util/common'

export default function getNextObjectTest () {
  describe('getNextObjectTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['nextObj.jpg'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Next_Obj_001
     * @tc.name      : get_next_object_promise_001
     * @tc.desc      : getNextObject
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('get_next_object_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'get_next_object_promise_001';
      try {
        const fetchOption: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        expect(fetchResult !== undefined).assertTrue();
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect(photoAsset !== undefined).assertTrue();
        let photoAsset2: sendablePhotoAccessHelper.PhotoAsset | undefined = undefined;
        if (!fetchResult.isAfterLast()) {
          photoAsset2 = await fetchResult.getNextObject();
          expect(photoAsset2 !== undefined).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
