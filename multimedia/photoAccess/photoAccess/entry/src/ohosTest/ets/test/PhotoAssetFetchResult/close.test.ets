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
import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import {
  fetchOption,
  photoType,
  photoKeys, getPermission, driveFn, sleep
} from '../common'
import common from '@ohos.app.ability.common';

export default function assetCloseTest () {
  describe('assetCloseTest', ()=>{

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext)

    let closeCallbackTest = async (done:Function, testNum:string, fetchOps:ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.close();
        let testCount = 0;
        let count = 0;
        try {
          testCount++;
          fetchResult.getCount();
        } catch (error) {
          console.info(`${testNum} getCount failed; error: ${error}`);
          count++;
        }
        try {
          testCount++;
          await fetchResult.getFirstObject();
        } catch (error) {
          console.info(`${testNum} getFirstObject failed; error: ${error}`);
          count++;
        }
        try {
          testCount++;
          await fetchResult.getNextObject();
        } catch (error) {
          console.info(`${testNum} getNextObject failed; error: ${error}`);
          count++;
        }
        try {
          testCount++;
          await fetchResult.getLastObject();
        } catch (error) {
          console.info(`${testNum} getLastObject failed; error: ${error}`);
          count++;
        }
        try {
          testCount++;
          await fetchResult.getObjectByPosition(0);
        } catch (error) {
          console.info(`${testNum} getObjectByPosition failed; error: ${error}`);
          count++;
        }
        try {
          testCount++;
          await fetchResult.getAllObjects();
        } catch (error) {
          console.info(`${testNum} getAllObjects failed; error: ${error}`);
          count++;
        }
        try {
          testCount++;
          fetchResult.isAfterLast();
        } catch (error) {
          console.info(`${testNum} isAfterLast failed; error: ${error}`);
          count++;
        }
        expect(count).assertEqual(testCount);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_FIRST_OBJECT_0000
     * @tc.name      : close_callback_000
     * @tc.desc      : close image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_callback_000', Level.LEVEL0, async  (done:Function)=> {
      const testNum = 'close_callback_000';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await closeCallbackTest(done, testNum, fetchOps);
    });

    //video
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_FIRST_OBJECT_0100
     * @tc.name      : close_callback_001
     * @tc.desc      : close video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_callback_001', Level.LEVEL0, async  (done:Function)=> {
      const testNum = 'close_callback_001';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await closeCallbackTest(done, testNum, fetchOps);
    });
  })
}
