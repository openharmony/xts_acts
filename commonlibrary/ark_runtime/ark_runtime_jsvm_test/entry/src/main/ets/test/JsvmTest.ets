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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"

// @ts-ignore
import napitest from 'libjsvmtest.so'


export default function JsvmJsunit() {

  describe('JsvmTest',() => {
    const empty = 'hh';
    let value;

    async function sleep(time) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          resolve("ok")
        }, time)
      }).then(() => {
        console.info( `sleep ${time} over...`)
      })
    }

    /**
    * run after testcase
    */
    afterEach(async function () {
      console.info('[JsvmTest] after each called')
      value == '';
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0001
     * @tc.name      JsvmTest001
     * @tc.desc      JsvmTest
     */
    it('JsvmTest001', 0, async function (done) {
      console.info('JsvmTest001 START');
      napitest.Add()
      console.info('JsvmTest001 testString result is:'+ value + "--" + JSON.stringify(value) );
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0002
     * @tc.name      JsvmTest002
     * @tc.desc      JsvmTest
     */
    it('JsvmTest002', 0, async function (done) {
      console.info('JsvmTest002 START');
      value = napitest.testEngineAndContext()
      console.info('JsvmTest002 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0003
     * @tc.name      JsvmTest003
     * @tc.desc      JsvmTest
     */
    it('JsvmTest003', 0, async function (done) {
      console.info('JsvmTest003 START');
      value = napitest.testError()
      console.info('JsvmTest003 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0004
     * @tc.name      JsvmTest004
     * @tc.desc      JsvmTest
     */
    it('JsvmTest004', 0, async function (done) {
      console.info('JsvmTest004 START');
      value = napitest.testTypeError()
      console.info('JsvmTest004 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0005
     * @tc.name      JsvmTest005
     * @tc.desc      JsvmTest
     */
    it('JsvmTest005', 0, async function (done) {
      console.info('JsvmTest005 START');
      value = napitest.testRangeError()
      console.info('JsvmTest005 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0006
     * @tc.name      JsvmTest005
     * @tc.desc      JsvmTest
     */
    it('JsvmTest006', 0, async function (done) {
      console.info('JsvmTest006 START');
      value = napitest.testSyntaxError()
      console.info('JsvmTest006 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0007
     * @tc.name      JsvmTest007
     * @tc.desc      JsvmTest
     */
    it('JsvmTest007', 0, async function (done) {
      console.info('JsvmTest007 START');
      value = napitest.testClearError()
      console.info('JsvmTest007 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0008
     * @tc.name      JsvmTest008
     * @tc.desc      JsvmTest
     */
    it('JsvmTest008', 0, async function (done) {
      console.info('JsvmTest008 START');
      value = napitest.testLifeCycle()
      console.info('JsvmTest008 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0009
     * @tc.name      JsvmTest009
     * @tc.desc      JsvmTest
     */
    it('JsvmTest009', 0, async function (done) {
      console.info('JsvmgTest009 START');
      value = napitest.testCreateData1()
      console.info('Jsvm009 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0010
     * @tc.name      JsvmTest010
     * @tc.desc      JsvmTest
     */
    it('JsvmTest010', 0, async function (done) {
      console.info('JsvmTest010 START');
      value = napitest.testCreateData2()
      console.info('JsvmTest010 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0011
     * @tc.name      JsvmTest011
     * @tc.desc      JsvmTest
     */
    it('JsvmTest011', 0, async function (done) {
      console.info('JsvmTest011 START');
      value = napitest.testCreateData3()
      console.info('JsvmTest011 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0012
     * @tc.name      JsvmTest012
     * @tc.desc      JsvmTest
     */
    it('JsvmTest012', 0, async function (done) {
      console.info('JsvmTest012 START');
      value = napitest.testCreateData4()
      console.info('JsvmTest012 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0013
     * @tc.name      JsvmTest013
     * @tc.desc      JsvmTest
     */
    it('JsvmTest013', 0, async function (done) {
      console.info('JsvmTest013 START');
      value = napitest.testCreateData5()
      console.info('JsvmTest013 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0014
     * @tc.name      JsvmTest014
     * @tc.desc      JsvmTest
     */
    it('JsvmTest014', 0, async function (done) {
      console.info('JsvmTest014 START');
      value = napitest.testGetData1()
      console.info('JsvmTest014 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0015
     * @tc.name      JsvmTest015
     * @tc.desc      JsvmTest
     */
    it('JsvmTest015', 0, async function (done) {
      console.info('JsvmTest015 START');
      value = napitest.testGetData2()
      console.info('JsvmTest015 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0016
     * @tc.name      JsvmTest016
     * @tc.desc      JsvmTest
     */
    it('JsvmTest016', 0, async function (done) {
      console.info('JsvmTest016 START');
      value = napitest.testValueOperation()
      console.info('JsvmgTest016 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0017
     * @tc.name      JsvmTest017
     * @tc.desc      JsvmTest
     */
    it('JsvmTest017', 0, async function (done) {
      console.info('JsvmTest017 START');
      value = napitest.testValueOperation2()
      console.info('JsvmTest017 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0018
     * @tc.name      JsvmTest018
     * @tc.desc      JsvmTest
     */
    it('JsvmTest018', 0, async function (done) {
      console.info('JsvmTest018 START');
      value = napitest.testGetPropertyNames()
      console.info('JsvmTest018 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0019
     * @tc.name      JsvmTest019
     * @tc.desc      JsvmTest
     */
    it('JsvmTest019', 0, async function (done) {
      console.info('JsvmTest019 START');
      value = napitest.testGetAllPropertyNames()
      console.info('JsvmTest019 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0020
     * @tc.name      JsvmTest020
     * @tc.desc      JsvmTest
     */
    it('JSvmTest020', 0, async function (done) {
      console.info('JsvmTest020 START');
      value = napitest.testProperty()
      console.info('JsvmTest020 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0021
     * @tc.name      JsvmTest021
     * @tc.desc      JsvmTest
     */
    it('JsvmTest021', 0, async function (done) {
      console.info('JsvmTest021 START');
      value = napitest.testDefineProperties()
      console.info('JsvmTest021 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0022
     * @tc.name      JsvmTest022
     * @tc.desc      JsvmTest
     */
    it('JsvmTest022', 0, async function (done) {
      console.info('JsvmTest022 START');
      value = napitest.testWrap()
      console.info('JsvmTest022 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0023
     * @tc.name      JsvmTest023
     * @tc.desc      JsvmTest
     */
    it('JsvmTest023', 0, async function (done) {
      console.info('JsvmTest023 START');
      value = napitest.testOthers()
      console.info('JsvmTest023 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0024
     * @tc.name      JsvmTest024
     * @tc.desc      JsvmTest
     */
    it('JsvmTest024', 0, async function (done) {
      console.info('JsvmTest024 START');
      value = napitest.Add1()
      console.info('JsvmTest024 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0025
     * @tc.name      JsvmTest025
     * @tc.desc      JsvmTest
     */
    it('JsvmTest025', 0, async function (done) {
      console.info('JsvmTest025 START');
      value = napitest.testSecondOperations()
      console.info('JsvmTest025 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0026
     * @tc.name      JsvmTest026
     * @tc.desc      JsvmTest
     */
    it('JsvmTest026', 0, async function (done) {
      console.info('JsvmTest026 START');
      value = napitest.testDefinePropertyHandle(0)
      console.info('JsvmTest026 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0027
     * @tc.name      JsvmTest027
     * @tc.desc      JsvmTest
     */
    it('JsvmTest027', 0, async function (done) {
      console.info('JsvmTest027 START');
      value = napitest.testDefinePropertyHandle(1)
      console.info('JsvmTest027 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0028
     * @tc.name      JsvmTest028
     * @tc.desc      JsvmTest
     */
    it('JsvmTest028', 0, async function (done) {
      console.info('JsvmTest028 START');
      value = napitest.testDefinePropertyHandle(2)
      console.info('JsvmTest028 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0029
     * @tc.name      JsvmTest029
     * @tc.desc      JsvmTest
     */
    it('JsvmTest029', 0, async function (done) {
      console.info('JsvmTest029 START');
      value = napitest.testDefinePropertyHandle(3)
      console.info('JsvmTest029 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0030
     * @tc.name      JsvmTest030
     * @tc.desc      JsvmTest
     */
    it('JsvmTest030', 0, async function (done) {
      console.info('JsvmTest030 START');
      value = napitest.testDefinePropertyHandle(4)
      console.info('JsvmTest030 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0031
     * @tc.name      JsvmTest031
     * @tc.desc      JsvmTest
     */
    it('JsvmTest031', 0, async function (done) {
      console.info('JsvmTest031 START');
      value = napitest.testDefinePropertyHandle(5)
      console.info('JsvmTest031 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0032
     * @tc.name      JsvmTest032
     * @tc.desc      JsvmTest
     */
    it('JsvmTest032', 0, async function (done) {
      console.info('JsvmTest032 START');
      value = napitest.testDefinePropertyHandle(6)
      console.info('JsvmTest032 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0033
     * @tc.name      JsvmTest033
     * @tc.desc      JsvmTest
     */
    it('JsvmTest033', 0, async function (done) {
      console.info('JsvmTest033 START');
      value = napitest.testDefinePropertyHandle(7)
      console.info('JsvmTest033 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0034
     * @tc.name      JsvmTest034
     * @tc.desc      JsvmTest
     */
    it('JsvmTest034', 0, async function (done) {
      console.info('JsvmTest034 START');
      value = napitest.testDefinePropertyHandle(8)
      console.info('JsvmTest034 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0035
     * @tc.name      JsvmTest035
     * @tc.desc      JsvmTest
     */
    it('JsvmTest035', 0, async function (done) {
      console.info('JsvmTest035 START');
      value = napitest.testDefinePropertyHandle(9)
      console.info('JsvmTest035 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0036
     * @tc.name      JsvmTest036
     * @tc.desc      JsvmTest
     */
    it('JsvmTest036', 0, async function (done) {
      console.info('JsvmTest036 START');
      value = napitest.testDefinePropertyHandle(10)
      console.info('JsvmTest036 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0037
     * @tc.name      JsvmTest037
     * @tc.desc      JsvmTest
     */
    it('JsvmTest037', 0, async function (done) {
      console.info('JsvmTest037 START');
      value = napitest.testDefinePropertyHandle(11)
      console.info('JsvmTest037 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0038
     * @tc.name      JsvmTest038
     * @tc.desc      JsvmTest
     */
    it('JsvmTest038', 0, async function (done) {
      console.info('JsvmTest038 START');
      value = napitest.testDefinePropertyHandle(12)
      console.info('JsvmTest038 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0039
     * @tc.name      JsvmTest039
     * @tc.desc      JsvmTest
     */
    it('JsvmTest039', 0, async function (done) {
      console.info('JsvmTest039 START');
      value = napitest.testDefinePropertyHandle(13)
      console.info('JsvmTest039 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0040
     * @tc.name      JsvmTest040
     * @tc.desc      JsvmTest
     */
    it('JsvmTest040', 0, async function (done) {
      console.info('JsvmTest040 START');
      value = napitest.testDefinePropertyHandle(14)
      console.info('JsvmTest040 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0041
     * @tc.name      JsvmTest041
     * @tc.desc      JsvmTest
     */
    it('JsvmTest041', 0, async function (done) {
      console.info('JsvmTest041 START');
      value = napitest.testDefinePropertyHandle(15)
      console.info('JsvmTest041 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0042
     * @tc.name      JsvmTest042
     * @tc.desc      JsvmTest
     */
    it('JsvmTest042', 0, async function (done) {
      console.info('JsvmTest042 START');
      value = napitest.testDefinePropertyHandle(16)
      console.info('JsvmTest042 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0043
     * @tc.name      JsvmTest043
     * @tc.desc      JsvmTest
     */
    it('JsvmTest043', 0, async function (done) {
      console.info('JsvmTest043 START');
      value = napitest.testDefinePropertyHandle(17)
      console.info('JsvmTest043 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0044
     * @tc.name      JsvmTest044
     * @tc.desc      JsvmTest
     */
    it('JsvmTest044', 0, async function (done) {
      console.info('JsvmTest044 START');
      value = napitest.testDefinePropertyHandle(18)
      console.info('JsvmTest044 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0045
     * @tc.name      JsvmTest045
     * @tc.desc      JsvmTest
     */
    it('JsvmTest045', 0, async function (done) {
      console.info('JsvmTest045 START');
      value = napitest.testDefinePropertyHandle(19)
      console.info('JsvmTest045 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0046
     * @tc.name      JsvmTest046
     * @tc.desc      JsvmTest
     */
    it('JsvmTest046', 0, async function (done) {
      console.info('JsvmTest046 START');
      value = napitest.testDefinePropertyHandle(20)
      console.info('JsvmTest046 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0047
     * @tc.name      JsvmTest047
     * @tc.desc      JsvmTest
     */
    it('JsvmTest047', 0, async function (done) {
      console.info('JsvmTest047 START');
      value = napitest.testDefinePropertyHandle(21)
      console.info('JsvmTest047 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0048
     * @tc.name      JsvmTest048
     * @tc.desc      JsvmTest
     */
    it('JsvmTest048', 0, async function (done) {
      console.info('JsvmTest048 START');
      value = napitest.testValueOperation3()
      console.info('JsvmTest048 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0049
     * @tc.name      JsvmTest049
     * @tc.desc      JsvmTest
     */
    it('JsvmTest049', 0, async function (done) {
      console.info('JsvmTest049 START');
      value = napitest.testValueOperation4()
      console.info('JsvmTest049 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
     /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0050
     * @tc.name      JsvmTest0500
     * @tc.desc      JsvmTest
     */
    it('JsvmTest050', 0, async function (done) {
      console.info('JsvmTest050 START');
      value = napitest.testLifeCycle2()
      console.info('JsvmTest050 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
  })
}

