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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { photoType, photoKeys, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common';

export default function assetGetNextObjectTest() {
  describe('assetGetNextObjectTest', () => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let getNextObjectCallbackTest = async (done: Function, testNum: string, fetchOps: ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(2);
        await fetchResult.getFirstObject();
        fetchResult.getNextObject((err, asset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getNextObject failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(asset !== undefined).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} getNextObject failed; error: ${error}`);
          }
          fetchResult.close();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getNextObjectPromiseTest = async (done: Function, testNum: string, fetchOps: ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(2);
        let asset = await fetchResult.getFirstObject();
        asset = await fetchResult.getNextObject();
        fetchResult.close();
        expect(asset !== undefined).assertTrue();
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
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_NEXT_OBJECT_0000
     * @tc.name      : getNextObject_callback_000
     * @tc.desc      : getNextObject image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNextObject_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getNextObject_callback_000';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.IMAGE).limit(2, 0);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getNextObjectCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_NEXT_OBJECT_0000
     * @tc.name      : getNextObject_promise_000
     * @tc.desc      : getNextObject image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNextObject_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getNextObject_promise_000';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.IMAGE).limit(2, 0);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getNextObjectPromiseTest(done, testNum, fetchOps);
    });

    //video
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_NEXT_OBJECT_0100
     * @tc.name      : getNextObject_callback_001
     * @tc.desc      : getNextObject video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNextObject_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getNextObject_callback_001';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.VIDEO).limit(2, 0);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getNextObjectCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_NEXT_OBJECT_0100
     * @tc.name      : getNextObject_promise_001
     * @tc.desc      : getNextObject video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNextObject_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getNextObject_promise_001';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.VIDEO).limit(2, 0);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getNextObjectPromiseTest(done, testNum, fetchOps);
    });
  })
}
