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

import napitest from 'libnapitest.so'


export default function nativeApiStringJsunit() {

  describe('napiStringTest', function () {
    const empty = 'hh';
    var value;

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
      console.info('[napiStringTest] after each called')
      value == '';
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0100
     * @tc.name      napiStringTest001
     * @tc.desc      aceNapiEtsTest
     */
    it('napiStringTest001', 0, async function (done) {
      console.info('napiStringTest001 START');
      value = napitest.TestLatin1(empty)
      console.info('napiStringTest001 testString result is: ' + value);
      expect(value).assertEqual(empty)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0200
     * @tc.name      napCreateArrayBuffer
     * @tc.desc      aceNapiEtsTest
     */
    it('napCreateArrayBuffer002', 0, async function (done) {
      console.info('napiCreateArrayBuffer002 START');
      value = napitest.napCreateArrayBuffer();
      console.info('apiCreateArrayBuffer testString result is: ' + JSON.stringify(value));
      expect(value instanceof ArrayBuffer).assertTrue();
      done();
    });

     /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0300
     * @tc.name      naiGetArrayBufferInfo
     * @tc.desc      aceNapiEtsTest
     */
    it('naiGetArrayBufferInfo003', 0, async function (done) {
      console.info('naiGetArrayBufferInfo003 START');
      value = napitest.naiGetArrayBufferInfo();
      console.info('naiGetArrayBufferInfo testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(1024);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0400
     * @tc.name      napiCreateFunction
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateFunction004', 0, async function (done) {
      console.info('napiCreateFunction004 START');
      value = napitest.napiCreateFunction();
      console.info('napiCreateFunction testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(1);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0500
     * @tc.name      napiNewInstance
     * @tc.desc      aceNapiEtsTest
     */

    it('napiNewInstance005', 0, async function (done) {
      console.info(' napiNewInstance005 START');
      value = napitest.napiNewInstance('hello');
      console.info('napiNewInstance testString result is: ' + JSON.stringify(value));
      expect(value == undefined).assertTrue();
      done();
    });

     /**
      * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0600
      * @tc.name      napiDefineClass
      * @tc.desc      aceNapiEtsTest
      */

    it('napiDefineClass006', 0, async function (done) {
      console.info('napiDefineClass006 START');
      value = napitest.napiDefineClass();
      console.info('napiDefineClass testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0700
     * @tc.name      napiCancelAsyncWork
     * @tc.desc      aceNapiEtsTest
    */
    it('napiCancelAsyncWork007', 0, async function (done) {
       console.info('napiCancelAsyncWork007 START');
       value = napitest.napiCancelAsyncWork();
       console.info('napiCancelAsyncWork testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0900
     * @tc.name      napiRunScriptPath
     * @tc.desc      aceNapiEtsTest
     */
    it('napiRunScriptPath009', 0, async function (done) {
       console.info('napiRunScriptPath START');
       value = napitest.napiRunScriptPath();
       console.info('napiRunScriptPath testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0100
     * @tc.name      napiCallThreadsafeFunction
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCallThreadsafeFunction010', 0, async function (done) {
       console.info('napiCallThreadsafeFunction START');
       value = napitest.napiCallThreadsafeFunction();
       console.info('napiCallThreadsafeFunction testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0011
     * @tc.name      napiCreateThreadsafeFunction
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateThreadsafeFunction011', 0, async function (done) {
       console.info('napiCreateThreadsafeFunction START');
       value = napitest.napiCreateThreadsafeFunction();
       console.info('napiCreateThreadsafeFunction testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0012
     * @tc.name      napiRefthreadSafeFunction
     * @tc.desc      aceNapiEtsTest
     */
    it('napiRefthreadSafeFunction012', 0, async function (done) {
       console.info('napiRefthreadSafeFunction START');
       value = napitest.napiRefthreadSafeFunction();
       console.info('napiRefthreadSafeFunction testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0013
     * @tc.name      napiCreateDate
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateDate013', 0, async function (done) {
       console.info('napiCreateDate START');
       value = napitest.napiCreateDate();
       console.info('napiCreateDate testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(1)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0014
     * @tc.name      napiCreateBigintUint64
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateBigintUint64014', 0, async function (done) {
       console.info('napiCreateBigintUint64 START');
       value = napitest.napiCreateBigintUint64();
       console.info('napiCreateBigintUint64 testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(1)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0015
     * @tc.name      napiCreateBigintInt64
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateBigintInt64015', 0, async function (done) {
       console.info('napiCreateBigintInt64 START');
       value = napitest.napiCreateBigintInt64();
       console.info('napiCreateBigintInt64 testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(1)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0016
     * @tc.name      napiCreateBigintWords
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateBigintWords016', 0, async function (done) {
       console.info('napiCreateBigintWords START');
       value = napitest.napiCreateBigintWords();
       console.info('napiCreateBigintWords testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0017
     * @tc.name      napiFatalerror
     * @tc.desc      aceNapiEtsTest
     */
    it('napiFatalerror017', 0, async function (done) {
       console.info('napiFatalerror START');
       value = napitest.napiFatalerror();
       console.info('napiFatalerror testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

     /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0018
     * @tc.name      napiGetCbInfo
     * @tc.desc      aceNapiEtsTest
     */
    it('napiGetCbInfo018', 0, async function (done) {
       console.info('napiGetCbInfo018 START');
       value = napitest.napiGetCbInfo(12.06);
       console.info('napiGetCbInfo018 testString result is: ' + JSON.stringify(value));
       expect(value == 12).assertTrue
       done();
    });

   /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0220
    * @tc.name      aceNapiTest013
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest013', 0, async function (done) {
      console.info('aceNapiTest013 START');
      let value = napitest.getAndClearLastException();
      console.info('aceNapiTest013 testString result is: ' + JSON.stringify(value) + "--" + value);
      expect(value == 0).assertTrue();
      done();
    });

   /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0280
    * @tc.name      aceNapiTest019
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest019', 0, async function (done) {
      console.info('aceNapiTest019 START');
      let value = napitest.referenceRef();
      console.info('napireferenceRef019 testString result is: ' + value + "---" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0370
    * @tc.name      napicreateSymbol028
    * @tc.desc      aceNapiEtsTest
    */
    it('napicreateSymbol028', 0, async function (done) {
      console.info('napicreateSymbol028 START');
      let value = napitest.createSymbol('symbol');
      console.info('napicreateSymbol028 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

   /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0420
    * @tc.name      napicreateAndGetInt033
    * @tc.desc      aceNapiEtsTest
    */
    it('napicreateAndGetInt033', 0, async function (done) {
      console.info('aceNapiTest033 START');
      let value = napitest.createAndGetInt64(6);
      console.info('aceNapiTest033 testString result is: '+ value + "---" + JSON.stringify(value));
      expect(value).assertEqual(6);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0480
    * @tc.name      napigetDataView039
    * @tc.desc      aceNapiEtsTest
    */
    it('napigetDataView039', 0, async function (done) {
      console.info('napigetDataView039 START');
      var buffer = new ArrayBuffer(2);
      let dView = new DataView(buffer).setInt16(0, 256, true);
      let value = napitest.getDataViewInfo(dView);
      console.info('napigetDataView039 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0120
    * @tc.name      aceNapiTest003
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest003', 0, async function (done) {
      console.info('aceNapiTest003 START');
      let value = napitest.getLastErrorInfo();
      console.info('aceNapiTest003 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(6);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0130
    * @tc.name      aceNapiTest004
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest004', 0, async function (done) {
      console.info('aceNapiTest004 START');
      let value = napitest.cleanUpErrorInfo();
      console.info('aceNapiTest004 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0140
    * @tc.name      aceNapiTest005
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest005', 0, async function (done) {
      console.info('aceNapiTest005 START');
      try {
         let value = napitest.throwExistingError();
         console.info('aceNapiTest005 testString result is: ' + value + "--" + JSON.stringify(value));
         expect(value).assertEqual(0);
         done();
      } catch (err) {
        console.info('aceNapiTest005 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er).assertEqual('{"code":"600"}');
        done(); 
      }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0150
    * @tc.name      aceNapiTest006
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest006', 0, async function (done) {
      console.info('aceNapiTest006 START');
      try {
         let value = napitest.throwError();
         console.info('aceNapiTest006 testString result is: ' + value + "--" + JSON.stringify(value));
         expect(value).assertEqual(0);
         done();
      } catch (err) {
        console.info('aceNapiTest006 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er).assertEqual('{"code":"500"}');
        done(); 
      }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0160
    * @tc.name      aceNapiTest007
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest007', 0, async function (done) {
       console.info('aceNapiTest007 START');
       try {
         let value = napitest.throwTypeError();
         console.info('aceNapiTest007 testString result is: ' + value + "--" + JSON.stringify(value));
         expect(value).assertEqual(0);
         done();
       } catch (err) {
         console.info('aceNapiTest007 testString result is err: ' + err + "--" + JSON.stringify(err));
         expect(err instanceof TypeError).assertTrue();
         done(); 
       }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0170
    * @tc.name      aceNapiTest008
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest008', 0, async function (done) {
       console.info('aceNapiTest008 START');
        try {
         let value = napitest.throwRangeError();
         console.info('aceNapiTest008 testString result is: ' + value + "--" + JSON.stringify(value));
         expect(value).assertEqual(0);
         done();
       } catch (err) {
         console.info('aceNapiTest008 testString result is err: ' + err + "--" + JSON.stringify(err));
         expect(err instanceof RangeError).assertTrue();
         done(); 
       }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0180
    * @tc.name      aceNapiTest009
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest009', 0, async function (done) {
       console.info('aceNapiTest009 START');
       let value = napitest.isError(false);
       console.info('aceNapiTest009 testString result is: ' + value + "--" + JSON.stringify(value));
       expect(value).assertFalse();
       done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0190
    * @tc.name      aceNapiTest010
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest010', 0, async function (done) {
       console.info('aceNapiTest010 START');
       let value = napitest.createError();
       console.info('aceNapiTest010 testString result is: ' + value + "--" + JSON.stringify(value));
       expect(value).assertEqual(0);
       done();
    });


     /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0200
     * @tc.name      aceNapiTest011
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest011', 0, async function (done) {
      console.info('aceNapiTest011 START');
      let value = napitest.createTypeError();
      console.info('aceNapiTest011 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0210
    * @tc.name      aceNapiTest012
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest012', 0, async function (done) {
      console.info('aceNapiTest012 START');
      let value = napitest.createRangeError();
      console.info('aceNapiTest012 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0230
    * @tc.name      aceNapiTest014
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest014', 0, async function (done) {
      console.info('aceNapiTest014 START');
      let value = napitest.isExceptionPending();
      console.info('aceNapiTest014 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0240
    * @tc.name      aceNapiTest015
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest015', 0, async function (done) {
      console.info('aceNapiTest015 START');
      let value = napitest.openAndCloseHandleScope();
      console.info('aceNapiTest015 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value == undefined).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0260
    * @tc.name      aceNapiTest017
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest017', 0, async function (done) {
      console.info('aceNapiTest017 START');
      let value = napitest.createReference();
      console.info('aceNapiTest017 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0290
    * @tc.name      aceNapiTest020
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest020', 0, async function (done) {
      console.info('aceNapiTest020 START');
      let value = napitest.referenceUnref();
      console.info('aceNapiTest020 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

     /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0300
    * @tc.name      aceNapiTest021
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest021', 0, async function (done) {
      console.info('aceNapiTest021 START');
      let value = napitest.getReferenceValue();
      console.info('aceNapiTest021 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0310
    * @tc.name      aceNapiTest022
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest022', 0, async function (done) {
      console.info('aceNapiTest022 START');
      var array = [1,2];
      let value = napitest.createArrayAndGetLength(array);
      console.info('aceNapiTest022 testString result is: ' + value + "--" + JSON.stringify(value));
      let obj = JSON.stringify(value);
      expect(obj).assertEqual('[1,2]');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0320
    * @tc.name      aceNapiTest023
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest023', 0, async function (done) {
      console.info('aceNapiTest023 START');
      let value = napitest.getArrayWithLength([1,2]);
      console.info('aceNapiTest023 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0340
    * @tc.name      aceNapiTest025
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest025', 0, async function (done) {
      console.info('aceNapiTest025 START');
      let value = napitest.createExternal();
      console.info('aceNapiTest025 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0350
    * @tc.name      aceNapiTest026
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest026', 0, async function (done) {
      console.info('aceNapiTest026 START');
      let value = napitest.createExternalArraybuffer();
      console.info('aceNapiTest026 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0360
    * @tc.name      aceNapiTest027
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest027', 0, async function (done) {
       console.info('aceNapiTest027 START');
       let value = napitest.createObject();
       console.info('aceNapiTest027 testString result is: ' + value + "--" + JSON.stringify(value));
       expect(value).assertEqual(0);
       done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0370
    * @tc.name      aceNapiTest028
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest028', 0, async function (done) {
      console.info('aceNapiTest028 START');
      let value = napitest.createSymbol("teststr");
      console.info('aceNapiTest028 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0380
    * @tc.name      aceNapiTest029
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest029', 0, async function (done) {
      console.info('aceNapiTest029 START');
      let value = napitest.createTypeArray();
      console.info('aceNapiTest029 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0390
    * @tc.name      aceNapiTest030
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest030', 0, async function (done) {
      console.info('aceNapiTest030 START');
      let value = napitest.createDataView();
      console.info('aceNapiTest030 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0400
    * @tc.name      aceNapiTest031
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest031', 0, async function (done) {
      console.info('aceNapiTest031 START');
      let value = napitest.createAndGetInt32(32);
      console.info('aceNapiTest031 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(32);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0410
    * @tc.name      aceNapiTest032
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest032', 0, async function (done) {
      console.info('aceNapiTest032 START');
      let value = napitest.createAndGetUInt32(12);
      console.info('aceNapiTest032 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(12);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0420
    * @tc.name      aceNapiTest033
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest033', 0, async function (done) {
      console.info('aceNapiTest033 START');
      let value = napitest.createAndGetInt64(23);
      console.info('aceNapiTest033 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(23);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0430
    * @tc.name      aceNapiTest034
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest034', 0, async function (done) {
      console.info('aceNapiTest034 START');
      let value = napitest.createDouble(24.67);
      console.info('aceNapiTest034 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(24.67);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0440
    * @tc.name      aceNapiTest035
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest035', 0, async function (done) {
      console.info('aceNapiTest035 START');
      let value = napitest.createAndGetStringLatin1("tst");
      console.info('aceNapiTest035 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual("tst");
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0450
    * @tc.name      aceNapiTest036
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest036', 0, async function (done) {
      console.info('aceNapiTest036 START');
      let value = napitest.createAndGetStringUtf8('he');
      console.info('aceNapiTest036 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('he');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0460
    * @tc.name      aceNapiTest037
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest037', 0, async function (done) {
      console.info('aceNapiTest037 START');
      let value = napitest.getPrototype();
      console.info('aceNapiTest037 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0490
    * @tc.name      aceNapiTest040
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest040', 0, async function (done) {
      console.info('aceNapiTest040 START');
      let value = napitest.getValueBool(false);
      console.info('aceNapiTest040 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0500
    * @tc.name      aceNapiTest041
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest041', 0, async function (done) {
      console.info('aceNapiTest041 START');
      let value = napitest.getValueDouble(25.0);
      console.info('aceNapiTest041 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(25);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0510
    * @tc.name      aceNapiTest042
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest042', 0, async function (done) {
      console.info('aceNapiTest042 START');
      let value = napitest.getValueExternal();
      console.info('aceNapiTest042 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0520
    * @tc.name      aceNapiTest043
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest043', 0, async function (done) {
      console.info('aceNapiTest043 START');
      let value = napitest.getNull();
      console.info('aceNapiTest043 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0530
    * @tc.name      aceNapiTest044
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest044', 0, async function (done) {
      console.info('aceNapiTest044 START');
      let value = napitest.getUndefined();
      console.info('aceNapiTest044 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0540
    * @tc.name      aceNapiTest045
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest045', 0, async function (done) {
      console.info('aceNapiTest045 START');
      let value = napitest.coerceToBool(false);
      console.info('aceNapiTest045 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0550
    * @tc.name      aceNapiTest046
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest046', 0, async function (done) {
      console.info('aceNapiTest046 START');
      let value = napitest.coerceToNumber(12);
      console.info('aceNapiTest046 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(12);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0560
    * @tc.name      aceNapiTest047
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest047', 0, async function (done) {
      console.info('aceNapiTest047 START');
      let value = napitest.coerceToObject([2,3]);
      console.info('aceNapiTest047 testString result is: ' + value + "--" + JSON.stringify(value));
      let obj = JSON.stringify(value);
      expect(obj).assertEqual('[2,3]');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0570
    * @tc.name      aceNapiTest048
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest048', 0, async function (done) {
      console.info('aceNapiTest048 START');
      let value = napitest.coerceToString("he");
      console.info('aceNapiTest048 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('he');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0580
    * @tc.name      aceNapiTest049
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest049', 0, async function (done) {
      console.info('aceNapiTest049 START');
      let value = napitest.instanceOf();
      console.info('aceNapiTest049 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0590
    * @tc.name      aceNapiTest050
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest050', 0, async function (done) {
      console.info('aceNapiTest050 START');
      let value = napitest.isArray();
      console.info('aceNapiTest050 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

   /* @tc.number    SUB_ACE_BASIC_ETS_NAPI_0600
    * @tc.name      aceNapiTest051
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest051', 0, async function (done) {
      console.info('aceNapiTest051 START');
      let value = napitest.isDate("2023-12-15");
      console.info('aceNapiTest051 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0610
    * @tc.name      aceNapiTest052
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest052', 0, async function (done) {
      console.info('aceNapiTest052 START');
      let value = napitest.strictEquals();
      console.info('aceNapiTest052 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0620
    * @tc.name      aceNapiTest053
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest053', 0, async function (done) {
      console.info('aceNapiTest053 START');
      let value = napitest.getPropertyNames();
      console.info('aceNapiTest053 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0630
    * @tc.name      aceNapiTest054
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest054', 0, async function (done) {
      console.info('aceNapiTest054 START');
      let value = napitest.setProperty();
      console.info('aceNapiTest054 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0640
    * @tc.name      aceNapiTest055
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest055', 0, async function (done) {
      console.info('aceNapiTest055 START');
      let value = napitest.getProperty();
      console.info('aceNapiTest055 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0650
    * @tc.name      aceNapiTest056
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest056', 0, async function (done) {
      console.info('aceNapiTest056 START');
      let value = napitest.hasProperty();
      console.info('aceNapiTest056 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0660
    * @tc.name      aceNapiTest057
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest057', 0, async function (done) {
      console.info('aceNapiTest057 START');
      let value = napitest.deleteProperty([1,2], "hhe");
      console.info('aceNapiTest057 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0670
    * @tc.name      aceNapiTest058
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest058', 0, async function (done) {
      console.info('aceNapiTest058 START');
      let value = napitest.hasOwnProperty([1,2], "hhe");
      console.info('aceNapiTest058 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0680
    * @tc.name      aceNapiTest059
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest059', 0, async function (done) {
      console.info('aceNapiTest059 START');
      let value = napitest.setNamedProperty([1,2], "e", false);
      console.info('aceNapiTest059 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0690
    * @tc.name      aceNapiTest060
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest060', 0, async function (done) {
      console.info('aceNapiTest060 START');
      let obj = {
                 foo: "bar",
                 age: 42,
                 baz: { myProp: 12 },
                };
      let value = napitest.getNamedProperty(obj, "foo");
      console.info('aceNapiTest060 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('bar');
      done();
    });

     /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0700
    * @tc.name      aceNapiTest061
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest061', 0, async function (done) {
      console.info('aceNapiTest061 START');
      let obj = {
                 foo: "bar",
                 age: 42,
                 baz: { myProp: 12 },
                };
      let value = napitest.hasNamedProperty(obj, "foo");
      console.info('aceNapiTest061 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0710
    * @tc.name      aceNapiTest062
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest062', 0, async function (done) {
      console.info('aceNapiTest062 START');
      let value = napitest.setElement();
      console.info('aceNapiTest062 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0720
    * @tc.name      aceNapiTest063
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest063', 0, async function (done) {
      console.info('aceNapiTest063 START');
      let value = napitest.getElement();
      console.info('aceNapiTest063 testString result is: ' + value + "--" + JSON.stringify(value));
      let fi = value.envIsNull;
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0730
    * @tc.name      aceNapiTest064
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest064', 0, async function (done) {
      console.info('aceNapiTest064 START');
      let value = napitest.hasElement();
      console.info('aceNapiTest064 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0740
    * @tc.name      aceNapiTest065
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest065', 0, async function (done) {
      console.info('aceNapiTest065 START');
      let value = napitest.deleteElement();
      console.info('aceNapiTest065 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0750
    * @tc.name      aceNapiTest066
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest066', 0, async function (done) {
      console.info('aceNapiTest066 START');
      let value = napitest.defineProperties();
      console.info('aceNapiTest066 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0770
    * @tc.name      aceNapiTest068
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest068', 0, async function (done) {
      console.info('aceNapiTest068 START');
      let value = napitest.wrap();
      console.info('aceNapiTest068 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0780
    * @tc.name      aceNapiTest069
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest069', 0, async function (done) {
      console.info('aceNapiTest069 START');
      let value = napitest.unwrap();
      console.info('aceNapiTest069 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0790
    * @tc.name      aceNapiTest070
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest070', 0, async function (done) {
      console.info('aceNapiTest070 START');
      let value = napitest.removeWrap();
      console.info('aceNapiTest070 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0800
    * @tc.name      aceNapiTest071
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest071', 0, async function (done) {
      console.info('aceNapiTest071 START');
      let value = napitest.getVersion();
      console.info('aceNapiTest071 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(2147483647 );
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0810
    * @tc.name      aceNapiTest072
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest072', 0, async function (done) {
      console.info('aceNapiTest072 START');
      let value = napitest.createPromise();
      console.info('aceNapiTest072 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0820
    * @tc.name      aceNapiTest073
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest073', 0, async function (done) {
      console.info('aceNapiTest073 START');
      let value = napitest.resolveAndRejectDeferred();
      console.info('aceNapiTest073 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0830
    * @tc.name      aceNapiTest074
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest074', 0, async function (done) {
      console.info('aceNapiTest074 START');
      let value = napitest.isPromise();
      console.info('aceNapiTest074 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0840
    * @tc.name      aceNapiTest075
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest075', 0, async function (done) {
      console.info('aceNapiTest075 START');
      let value = napitest.runScript("25");
      console.info('aceNapiTest075 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value == undefined).assertTrue();
      done();
    });

     
  })
}
