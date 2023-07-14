/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import request from "@ohos.request";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestUploadJSUnit() {
  describe('requestConstantJSUnit', function () {
    console.info('====>################################request upload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info('====>beforeAll: Prerequisites are executed.');
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0001
     * *@tc.name     subRequestConstant0001
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('subRequestConstant0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0001 is starting-----------------------");
      expect(typeof request.EXCEPTION_PERMISSION == 'number').assertTrue();
      expect(typeof request.EXCEPTION_PARAMCHECK == 'number').assertTrue();
      expect(typeof request.EXCEPTION_UNSUPPORTED == 'number').assertTrue();
      expect(typeof request.EXCEPTION_FILEIO == 'number').assertTrue();
      expect(typeof request.EXCEPTION_FILEPATH == 'number').assertTrue();
      expect(typeof request.EXCEPTION_SERVICE == 'number').assertTrue();
      expect(typeof request.EXCEPTION_OTHERS == 'number').assertTrue();
      expect(typeof request.NETWORK_MOBILE == 'number').assertTrue();
      expect(typeof request.NETWORK_WIFI == 'number').assertTrue();
      expect(typeof request.ERROR_CANNOT_RESUME == 'number').assertTrue();
      expect(typeof request.ERROR_DEVICE_NOT_FOUND == 'number').assertTrue();
      expect(typeof request.ERROR_FILE_ALREADY_EXISTS == 'number').assertTrue();
      expect(typeof request.ERROR_FILE_ERROR == 'number').assertTrue();
      expect(typeof request.ERROR_HTTP_DATA_ERROR == 'number').assertTrue();
      expect(typeof request.ERROR_INSUFFICIENT_SPACE == 'number').assertTrue();
      expect(typeof request.ERROR_TOO_MANY_REDIRECTS == 'number').assertTrue();
      expect(typeof request.ERROR_UNHANDLED_HTTP_CODE == 'number').assertTrue();
      expect(typeof request.ERROR_UNKNOWN == 'number').assertTrue();
      expect(typeof request.ERROR_OFFLINE == 'number').assertTrue();
      expect(typeof request.ERROR_UNSUPPORTED_NETWORK_TYPE == 'number').assertTrue();
      expect(typeof request.PAUSED_QUEUED_FOR_WIFI == 'number').assertTrue();
      expect(typeof request.PAUSED_WAITING_FOR_NETWORK == 'number').assertTrue();
      expect(typeof request.PAUSED_WAITING_TO_RETRY == 'number').assertTrue();
      expect(typeof request.PAUSED_BY_USER == 'number').assertTrue();
      expect(typeof request.PAUSED_UNKNOWN == 'number').assertTrue();
      expect(typeof request.SESSION_SUCCESSFUL == 'number').assertTrue();
      expect(typeof request.SESSION_RUNNING == 'number').assertTrue();
      expect(typeof request.SESSION_PENDING == 'number').assertTrue();
      expect(typeof request.SESSION_PAUSED == 'number').assertTrue();
      expect(typeof request.SESSION_FAILED == 'number').assertTrue();
      done();
    });

  })
}
