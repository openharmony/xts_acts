/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
     * @tc.level     : Level 0
     */
    it('subRequestConstant0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0001 is starting-----------------------");
      expect(typeof request.EXCEPTION_PERMISSION == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0002
     * *@tc.name     subRequestConstant0002
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0002 is starting-----------------------");
      expect(typeof request.EXCEPTION_PARAMCHECK == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0003
     * *@tc.name     subRequestConstant0003
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0003', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0003 is starting-----------------------");
      expect(typeof request.EXCEPTION_UNSUPPORTED == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0004
     * *@tc.name     subRequestConstant0004
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0004', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0004 is starting-----------------------");
      expect(typeof request.EXCEPTION_FILEIO == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0005
     * *@tc.name     subRequestConstant0005
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0005', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0005 is starting-----------------------");
      expect(typeof request.EXCEPTION_FILEPATH == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0006
     * *@tc.name     subRequestConstant0006
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0006', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0006 is starting-----------------------");
      expect(typeof request.EXCEPTION_SERVICE == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0007
     * *@tc.name     subRequestConstant0007
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0007', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0007 is starting-----------------------");
      expect(typeof request.EXCEPTION_OTHERS == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0008
     * *@tc.name     subRequestConstant0008
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0008', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0008 is starting-----------------------");
      expect(typeof request.NETWORK_MOBILE == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0009
     * *@tc.name     subRequestConstant0009
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0009', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0009 is starting-----------------------");
      expect(typeof request.NETWORK_WIFI == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0010
     * *@tc.name     subRequestConstant0010
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0010', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0010 is starting-----------------------");
      expect(typeof request.ERROR_CANNOT_RESUME == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0011
     * *@tc.name     subRequestConstant0011
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0011', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0011 is starting-----------------------");
      expect(typeof request.ERROR_DEVICE_NOT_FOUND == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0012
     * *@tc.name     subRequestConstant0012
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0012', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0012 is starting-----------------------");
      expect(typeof request.ERROR_FILE_ALREADY_EXISTS == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0013
     * *@tc.name     subRequestConstant0013
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0013', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0013 is starting-----------------------");
      expect(typeof request.ERROR_FILE_ERROR == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0014
     * *@tc.name     subRequestConstant0014
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0014', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0014 is starting-----------------------");
      expect(typeof request.ERROR_HTTP_DATA_ERROR == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0015
     * *@tc.name     subRequestConstant0015
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0015', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0015 is starting-----------------------");
      expect(typeof request.ERROR_INSUFFICIENT_SPACE == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0016
     * *@tc.name     subRequestConstant0016
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0016', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0016 is starting-----------------------");
      expect(typeof request.ERROR_TOO_MANY_REDIRECTS == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0017
     * *@tc.name     subRequestConstant0017
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0017', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0017 is starting-----------------------");
      expect(typeof request.ERROR_UNHANDLED_HTTP_CODE == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0018
     * *@tc.name     subRequestConstant0018
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0018', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0018 is starting-----------------------");
      expect(typeof request.ERROR_UNKNOWN == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0019
     * *@tc.name     subRequestConstant0019
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0019', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0019 is starting-----------------------");
      expect(typeof request.ERROR_OFFLINE == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0020
     * *@tc.name     subRequestConstant0020
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0020', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0020 is starting-----------------------");
      expect(typeof request.ERROR_UNSUPPORTED_NETWORK_TYPE == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0021
     * *@tc.name     subRequestConstant0021
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0021', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0021 is starting-----------------------");
      expect(typeof request.PAUSED_QUEUED_FOR_WIFI == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0022
     * *@tc.name     subRequestConstant0022
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0022', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0022 is starting-----------------------");
      expect(typeof request.PAUSED_WAITING_FOR_NETWORK == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0023
     * *@tc.name     subRequestConstant0023
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0023', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0023 is starting-----------------------");
      expect(typeof request.PAUSED_WAITING_TO_RETRY == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0024
     * *@tc.name     subRequestConstant0024
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0024', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0024 is starting-----------------------");
      expect(typeof request.PAUSED_BY_USER == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0025
     * *@tc.name     subRequestConstant0025
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0025', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0025 is starting-----------------------");
      expect(typeof request.PAUSED_UNKNOWN == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0026
     * *@tc.name     subRequestConstant0026
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0026', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0026 is starting-----------------------");
      expect(typeof request.SESSION_SUCCESSFUL == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0027
     * *@tc.name     subRequestConstant0027
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0027', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0027 is starting-----------------------");
      expect(typeof request.SESSION_RUNNING == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0028
     * *@tc.name     subRequestConstant0028
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0028', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0028 is starting-----------------------");
      expect(typeof request.SESSION_PENDING == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0029
     * *@tc.name     subRequestConstant0029
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0029', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0029 is starting-----------------------");
      expect(typeof request.SESSION_PAUSED == 'number').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_CONSTANT_0030
     * *@tc.name     subRequestConstant0030
     * @tc.desc      Test constants of the request module.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('subRequestConstant0030', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CONSTANT_0030 is starting-----------------------");
      expect(typeof request.SESSION_FAILED == 'number').assertTrue();
      done();
    });

  })
}
