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
import { getPermission } from '../../../../../../common'

export default function getPhotoAccessHelperAsyncTest () {
  describe('getPhotoAccessHelperAsyncTest', function () {
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission();
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_ASYNC_CALLBACK_0000
     * @tc.name      : getPhotoAccessHelperAsyncCallback_000
     * @tc.desc      : Obtains a photoAccess instance async
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPhotoAccessHelperAsyncCallback_000', 0, async function (done) {
      photoAccessHelper.getPhotoAccessHelperAsync(globalThis.abilityContext, (err, helper) => {
        if (err === undefined) {
          expect(helper !== undefined).assertTrue();
          done();
        } else {
          console.info(`getPhotoAccessHelperAsyncCallback_000 failed, error: ${err}`);
          expect(false).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_ASYNC_PROMISE_0000
     * @tc.name      : getPhotoAccessHelperAsyncPromise_000
     * @tc.desc      : Obtains a photoAccess instance async
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPhotoAccessHelperAsyncPromise_000', 0, async function (done) {
      try {
        const helper = await photoAccessHelper.getPhotoAccessHelperAsync(globalThis.abilityContext);
        expect(helper !== undefined).assertTrue();
        done();
      } catch (error) {
        console.info(`getPhotoAccessHelperAsyncPromise_000 failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}