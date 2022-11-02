/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestDownloadJSUnit() {
  describe('requestDownloadJSUnit', function () {
    console.info('################################request download Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info('beforeAll: Prerequisites are executed.');
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info('beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('afterAll: Test suite-level cleanup condition is executed');
    });

    let downloadTask;
    let downloadConfig = {
      url: 'http://download.ci.openharmony.cn/version/Daily_Version/',
      header: {
        headers: 'http'
      },
      enableMetered: false,
      enableRoaming: false,
      description: 'XTS download test!',
      networkType: request.NETWORK_WIFI,
      filePath: 'internal://cache/test.txt',
      title: 'XTS download test!',
      background: true
    }

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_STAGE_API_CALLBACK_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_STAGE_API_CALLBACK_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_DOWNLOAD_STAGE_API_CALLBACK_0001 is starting-----------------------");
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      try {
        request.download(context, downloadConfig, (data)=>{
          downloadTask = data;
          console.info("SUB_REQUEST_DOWNLOAD_STAGE_API_CALLBACK_0001 downloadTask: " + downloadTask);
          expect(true).assertEqual(downloadTask != undefined);
        });
      } catch (err) {
        console.error("SUB_REQUEST_DOWNLOAD_STAGE_API_CALLBACK_0001 error: " + err);
        expect().assertFail();
      }
      console.info("-----------------------SUB_REQUEST_DOWNLOAD_STAGE_API_CALLBACK_0001 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_STAGE_API_PROMISE_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_STAGE_API_PROMISE_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_DOWNLOAD_STAGE_API_PROMISE_0001 is starting-----------------------");
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      request.download(context, downloadConfig).then(data => {
        downloadTask = data;
        console.info("SUB_REQUEST_DOWNLOAD_STAGE_API_PROMISE_0001 downloadTask: " + downloadTask);
        expect(true).assertEqual(downloadTask != undefined);
      }).catch(err => {
        console.error("SUB_REQUEST_DOWNLOAD_STAGE_API_PROMISE_0001 error: " + err);
        expect().assertFail();
      })
      console.info("-----------------------SUB_REQUEST_DOWNLOAD_STAGE_API_PROMISE_0001 end-----------------------");
      done();
    });
  });
}