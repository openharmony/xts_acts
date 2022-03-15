/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index.ets';
import Utils from './Utils';
import Bundle from '@ohos.bundle';

const BUNDLE_NAME = 'com.open.harmony.packagemag'
const OTHER_BUNDLE_NAME = 'com.ohos.acepackage'
const BUNDLE_NAME_ERROR = 'com.ohos.acepackage.error'

export default function bundleGidsJsUnit() {
  describe('context_getBundleGids_test', function () {
    beforeEach(async function (done) {
      console.info('context_getBundleGids_test before each called');
      done()
    });

    afterEach(async function () {
      await Utils.sleep(2000);
      console.info('context_getBundleGids_test after each called');
    });

    /*
     * @tc.number: context_getBundleGids_test_0100
     * @tc.name: getBundleGids : Gets the lists of bundle with gids
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    it('context_getBundleGids_test_0100', 0, async function (done) {
      console.info('[context_getBundleGids_test_0100] promise START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      let mData;
      await Bundle.getBundleGids(BUNDLE_NAME)
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('[context_getBundleGids_test_0100]', timeOldStamp, timeNewStamp);
          mData = data;
          console.info('[context_getBundleGids_test_0100]  promise data is: ' + JSON.stringify(data));
        })
        .catch((error) => {
          console.info('[context_getBundleGids_test_0100]  promise error is: ' + error);
        });
      getGidsSuccess('[context_getBundleGids_test_0100]', mData);
      done();
    });

    /*
     * @tc.number: context_getBundleGids_test_0200
     * @tc.name: getBundleGids : Gets the lists of bundle with gids
     * @tc.desc: Check the return value of the interface (by callback)
     * @tc.level   0
     */
    it('context_getBundleGids_test_0200', 0, async function (done) {
      console.info('[context_getBundleGids_test_0200] callBack START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      let mData;
      Bundle.getBundleGids(BUNDLE_NAME, (error, data) => {
        var timeNewStamp = Utils.getNowTime();
        Utils.getDurationTime('[context_getBundleGids_test_0200]', timeOldStamp, timeNewStamp);
        mData = data;
        console.info('[context_getBundleGids_test_0200]  callBack in');
        console.info('[context_getBundleGids_test_0200]  callBack error: ' + error);
        console.info('[context_getBundleGids_test_0200]  callBack data is:' + JSON.stringify(data));
      });
      await Utils.sleep(2000);
      getGidsSuccess('[context_getBundleGids_test_0200]', mData);
      done();
    });

    /*
     * @tc.number: context_getBundleGids_test_0300
     * @tc.name: getBundleGids : Gets the lists of bundle with gids
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    it('context_getBundleGids_test_0300', 0, async function (done) {
      console.info('[context_getBundleGids_test_0300] promise START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      let mError;
      await Bundle.getBundleGids(BUNDLE_NAME_ERROR)
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('[context_getBundleGids_test_0300]', timeOldStamp, timeNewStamp);
          console.info('[context_getBundleGids_test_0300]  promise data is: ' + JSON.stringify(data));
        })
        .catch((error) => {
          var timeNewStamp = Utils.getNowTime();
          mError = error;
          Utils.getDurationTime('[context_getBundleGids_test_0300]', timeOldStamp, timeNewStamp);
          console.info('[context_getBundleGids_test_0300]  promise error is: ' + error);
        });
      getGidsFailure('[context_getBundleGids_test_0300]', mError);
      done();
    });

    /*
     * @tc.number: context_getBundleGids_test_0400
     * @tc.name: getBundleGids : Gets the lists of bundle with gids
     * @tc.desc: Check the return value of the interface (by callback)
     * @tc.level   0
     */
    it('context_getBundleGids_test_0400', 0, async function (done) {
      console.info('[context_getBundleGids_test_0400] callBack START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      let mError;
      Bundle.getBundleGids(BUNDLE_NAME_ERROR, (error, data) => {
        var timeNewStamp = Utils.getNowTime();
        Utils.getDurationTime('[context_getBundleGids_test_0400]', timeOldStamp, timeNewStamp);

        mError = error;
        console.info('[context_getBundleGids_test_0400]  callBack in');
        console.info('[context_getBundleGids_test_0400]  callBack error: ' + error);
        console.info('[context_getBundleGids_test_0400]  callBack data is:' + JSON.stringify(data));
      });
      await Utils.sleep(2000);
      getGidsFailure('[context_getBundleGids_test_0400]', mError);
      done();
    });

    /*
     * @tc.number: context_getBundleGids_test_0500
     * @tc.name: getBundleGids : Gets the lists of bundle with gids
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
    it('context_getBundleGids_test_0500', 0, async function (done) {
      console.info('[context_getBundleGids_test_0500] promise START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      let mData;
      let mError;
      await Bundle.getBundleGids(OTHER_BUNDLE_NAME)
        .then((data) => {
          var timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('[context_getBundleGids_test_0500]', timeOldStamp, timeNewStamp);
          mData = data;
          console.info('[context_getBundleGids_test_0500]  promise data is: ' + JSON.stringify(data));
        })
        .catch((error) => {
          mError = error;
          console.info('[context_getBundleGids_test_0500]  promise error is: ' + error);
        });
      if (mError != null) {
        getGidsFailure('[context_getBundleGids_test_0500]', mError);
      } else {
        getGidsSuccess('[context_getBundleGids_test_0500]', mData);
      }
      done();
    });

    /*
     * @tc.number: context_getBundleGids_test_0600
     * @tc.name: getBundleGids : Gets the lists of bundle with gids
     * @tc.desc: Check the return value of the interface (by callback)
     * @tc.level   0
     */
    it('context_getBundleGids_test_0600', 0, async function (done) {
      console.info('[context_getBundleGids_test_0600] callBack START');
      await Utils.sleep(1000);
      var timeOldStamp = await Utils.getNowTime();
      let mData;
      let mError = null;
      Bundle.getBundleGids(OTHER_BUNDLE_NAME, (error, data) => {
        var timeNewStamp = Utils.getNowTime();
        Utils.getDurationTime('[context_getBundleGids_test_0600]', timeOldStamp, timeNewStamp);
        mData = data;
        mError = error;
        console.info('[context_getBundleGids_test_0600]  callBack in');
        console.info('[context_getBundleGids_test_0600]  callBack error: ' + error);
        console.info('[context_getBundleGids_test_0600]  callBack data is:' + JSON.stringify(data));
      });
      await Utils.sleep(2000);
      if (mError != null) {
        getGidsFailure('[context_getBundleGids_test_0600]', mError);
      } else {
        getGidsSuccess('[context_getBundleGids_test_0600]', mData);
      }
      done();
    });

    function getGidsSuccess(msg, data) {
      console.log(msg + ' start  ' + JSON.stringify(data));
      for (var j = 0; j < data.length; j++) {
        console.log(msg + 'data[' + j + '] : ' + data[j]);
        expect((data[j] > 0)).assertEqual(true);
      }
      expect(Array.isArray(data)).assertEqual(true);
    }

    function getGidsFailure(msg, error) {
      console.log(msg + ' Failure  ');
      expect(typeof (error)).assertEqual('number');
    }
  })
}