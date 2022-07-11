// @ts-nocheck
/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function XComponentTestJsunit() {
  describe('XComponentTest', function () {

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("xclog after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0100
     * @tc.name      XComponentTest001
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest001', 0, async function (done) {
      await Utils.sleep(1500);
      console.info('XComponentTest001 START');

      var xcomponentContext2 = globalThis.xcomponentContext2;

      var result;
      if (!xcomponentContext2) {
        console.error('xcomponentContext2 null');
        result = -1;
        expect(result).assertEqual(true);
        done();
      } else {

        result = xcomponentContext2.TestOnSurfaceCreated();
        expect(result).assertEqual(true);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0200
     * @tc.name      XComponentTest002
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest002', 0, async function (done) {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest002 START');    

      var xcomponentContext1 = globalThis.xcomponentContext1;
      var xcomponentId1 = globalThis.xcomponentId1;

      var result;
      if (!xcomponentContext1) {
        console.error('xcomponentContext1 null');
        result = false;
        expect(result).assertEqual(xcomponentId1);
        done();
      }
      else if (xcomponentId1 != 'xcomponentId1'){
        console.error('xcomponentId1 is undefined');
        result = false;
        expect(result).assertEqual(xcomponentId1);
        done();
      }
      else {
        result = xcomponentContext1.TestGetXComponentId();
        expect(result).assertEqual(xcomponentId1);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0300
     * @tc.name      XComponentTest003
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest003', 0, async function (done) {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest003 START');

      var xcomponentContext2 = globalThis.xcomponentContext2;
      var xcomponentId2 = globalThis.xcomponentId2;

      var result;
      if (!xcomponentContext2) {
        console.error('xcomponentContext2 null');
        result = false;
        expect(result).assertEqual(xcomponentId2);
        done();
      }
      else if (xcomponentId2 != 'xcomponentId2'){
        console.error('xcomponentId2 is undefined');
        result = false;
        expect(result).assertEqual(xcomponentId2);
        done();
      }
      else {
        result = xcomponentContext2.TestGetXComponentId();
        expect(result).assertEqual(xcomponentId2);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0400
     * @tc.name      XComponentTest004
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest004', 0, async function (done) {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest004 START');

      var xcomponentContext1 = globalThis.xcomponentContext1;
      var xcomponentHeight= globalThis.xcomponentHeight;
      var xcomponentWidth= globalThis.xcomponentWidth;

      var result_height;
      var result_width;
      var undef;

      if (!xcomponentContext1) {
        console.error('xcomponentContext null');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else if ((xcomponentHeight === undef) || (xcomponentWidth === undef)){
        console.error('xcomponentHeight and xcomponentWidth are undefined');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else {
        result_height = xcomponentContext1.TestGetXComponentSize_Height();
        result_width  = xcomponentContext1.TestGetXComponentSize_Width();
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0500
     * @tc.name      XComponentTest005
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest005', 0, async function (done) {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest005 START');


      var xcomponentContext2 = globalThis.xcomponentContext2;
      var xcomponentHeight = globalThis.xcomponentHeight;
      var xcomponentWidth = globalThis.xcomponentWidth;

      var result_height;
      var result_width;
      var undef;

      if (!xcomponentContext2) {
        console.error('xcomponentContext2 null');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else if ((xcomponentHeight === undef) || (xcomponentWidth === undef)) {
        console.error('xcomponentHeight and xcomponentWidth are undefined');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else {
        result_height = xcomponentContext2.TestGetXComponentSize_Height();
        result_width = xcomponentContext2.TestGetXComponentSize_Width();
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
    });

  })
}
