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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"

import napitest from 'libnapitest.so'


export default function nativeApiStringJsunit() {

  describe('napiStringTest', function () {
    const empty = 'hh';
    var value;

    async function sleep(time) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          resolve()
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

  })
}
