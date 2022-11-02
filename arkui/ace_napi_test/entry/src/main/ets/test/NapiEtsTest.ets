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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import napitest from 'libnapitest.so'

export default function aceNapiEtsTest() {
  describe('aceNapiEtsTest', function () {

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0100
    * @tc.name      aceNapiTest001
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest001', 0, async function (done) {
      console.info('aceNapiTest001 START');
      napitest.add_returned_status()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0110
    * @tc.name      aceNapiTest002
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest002', 0, async function (done) {
      console.info('aceNapiTest002 START');
      napitest.add_last_status()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0120
    * @tc.name      aceNapiTest003
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest003', 0, async function (done) {
      console.info('aceNapiTest003 START');
      napitest.getLastErrorInfo()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0130
    * @tc.name      aceNapiTest004
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest004', 0, async function (done) {
      console.info('aceNapiTest004 START');
      napitest.cleanUpErrorInfo()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0140
    * @tc.name      aceNapiTest005
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest005', 0, async function (done) {
      console.info('aceNapiTest005 START');
      napitest.throwExistingError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0150
    * @tc.name      aceNapiTest006
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest006', 0, async function (done) {
      console.info('aceNapiTest006 START');
      napitest.throwError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0160
    * @tc.name      aceNapiTest007
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest007', 0, async function (done) {
      console.info('aceNapiTest007 START');
      napitest.throwTypeError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0170
    * @tc.name      aceNapiTest008
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest008', 0, async function (done) {
      console.info('aceNapiTest008 START');
      napitest.throwRangeError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0180
    * @tc.name      aceNapiTest009
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest009', 0, async function (done) {
      console.info('aceNapiTest009 START');
      napitest.isError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0190
    * @tc.name      aceNapiTest010
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest010', 0, async function (done) {
      console.info('aceNapiTest010 START');
      napitest.createError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0200
    * @tc.name      aceNapiTest011
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest011', 0, async function (done) {
      console.info('aceNapiTest011 START');
      napitest.createTypeError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0210
    * @tc.name      aceNapiTest012
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest012', 0, async function (done) {
      console.info('aceNapiTest012 START');
      napitest.createRangeError()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0220
    * @tc.name      aceNapiTest013
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest013', 0, async function (done) {
      console.info('aceNapiTest013 START');
      napitest.getAndClearLastException()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0230
    * @tc.name      aceNapiTest014
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest014', 0, async function (done) {
      console.info('aceNapiTest014 START');
      napitest.isExceptionPending()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0240
    * @tc.name      aceNapiTest015
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest015', 0, async function (done) {
      console.info('aceNapiTest015 START');
      napitest.openAndCloseHandleScope()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0250
    * @tc.name      aceNapiTest016
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest016', 0, async function (done) {
      console.info('aceNapiTest016 START');
      napitest.openAndCloseEscapableHandleScope()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0260
    * @tc.name      aceNapiTest017
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest017', 0, async function (done) {
      console.info('aceNapiTest017 START');
      napitest.createReference()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0270
    * @tc.name      aceNapiTest018
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest018', 0, async function (done) {
      console.info('aceNapiTest018 START');
      napitest.deleteReference()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0280
    * @tc.name      aceNapiTest019
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest019', 0, async function (done) {
      console.info('aceNapiTest019 START');
      napitest.referenceRef()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0290
    * @tc.name      aceNapiTest020
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest020', 0, async function (done) {
      console.info('aceNapiTest020 START');
      napitest.referenceUnref()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0300
    * @tc.name      aceNapiTest021
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest021', 0, async function (done) {
      console.info('aceNapiTest021 START');
      napitest.getReferenceValue()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0310
    * @tc.name      aceNapiTest022
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest022', 0, async function (done) {
      console.info('aceNapiTest022 START');
      napitest.createArrayAndGetLength()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0320
    * @tc.name      aceNapiTest023
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest023', 0, async function (done) {
      console.info('aceNapiTest023 START');
      napitest.getArrayWithLength()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0330
    * @tc.name      aceNapiTest024
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest024', 0, async function (done) {
      console.info('aceNapiTest024 START');
      napitest.finalizer()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0340
    * @tc.name      aceNapiTest025
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest025', 0, async function (done) {
      console.info('aceNapiTest025 START');
      napitest.createExternal()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0350
    * @tc.name      aceNapiTest026
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest026', 0, async function (done) {
      console.info('aceNapiTest026 START');
      napitest.createExternalArraybuffer()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0360
    * @tc.name      aceNapiTest027
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest027', 0, async function (done) {
      console.info('aceNapiTest027 START');
      napitest.createObject()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0370
    * @tc.name      aceNapiTest028
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest028', 0, async function (done) {
      console.info('aceNapiTest028 START');
      napitest.createSymbol()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0380
    * @tc.name      aceNapiTest029
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest029', 0, async function (done) {
      console.info('aceNapiTest029 START');
      napitest.createTypeArray()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0390
    * @tc.name      aceNapiTest030
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest030', 0, async function (done) {
      console.info('aceNapiTest030 START');
      napitest.createDataView()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0400
    * @tc.name      aceNapiTest031
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest031', 0, async function (done) {
      console.info('aceNapiTest031 START');
      napitest.createAndGetInt32()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0410
    * @tc.name      aceNapiTest032
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest032', 0, async function (done) {
      console.info('aceNapiTest032 START');
      napitest.createAndGetUInt32()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0420
    * @tc.name      aceNapiTest033
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest033', 0, async function (done) {
      console.info('aceNapiTest033 START');
      napitest.createAndGetInt64()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0430
    * @tc.name      aceNapiTest034
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest034', 0, async function (done) {
      console.info('aceNapiTest034 START');
      napitest.createDouble()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0440
    * @tc.name      aceNapiTest035
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest035', 0, async function (done) {
      console.info('aceNapiTest035 START');
      napitest.createAndGetStringLatin1()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0450
    * @tc.name      aceNapiTest036
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest036', 0, async function (done) {
      console.info('aceNapiTest036 START');
      napitest.createAndGetStringUtf8()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0460
    * @tc.name      aceNapiTest037
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest037', 0, async function (done) {
      console.info('aceNapiTest037 START');
      napitest.getPrototype()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0470
    * @tc.name      aceNapiTest038
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest038', 0, async function (done) {
      console.info('aceNapiTest038 START');
      napitest.getTypedArrayInfo()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0480
    * @tc.name      aceNapiTest039
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest039', 0, async function (done) {
      console.info('aceNapiTest039 START');
      napitest.getDataViewInfo()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0490
    * @tc.name      aceNapiTest040
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest040', 0, async function (done) {
      console.info('aceNapiTest040 START');
      napitest.getValueBool()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0500
    * @tc.name      aceNapiTest041
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest041', 0, async function (done) {
      console.info('aceNapiTest041 START');
      napitest.getValueDouble()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0510
    * @tc.name      aceNapiTest042
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest042', 0, async function (done) {
      console.info('aceNapiTest042 START');
      napitest.getValueExternal()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0520
    * @tc.name      aceNapiTest043
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest043', 0, async function (done) {
      console.info('aceNapiTest043 START');
      napitest.getNull()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0530
    * @tc.name      aceNapiTest044
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest044', 0, async function (done) {
      console.info('aceNapiTest044 START');
      napitest.getUndefined()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0540
    * @tc.name      aceNapiTest045
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest045', 0, async function (done) {
      console.info('aceNapiTest045 START');
      napitest.coerceToBool()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0550
    * @tc.name      aceNapiTest046
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest046', 0, async function (done) {
      console.info('aceNapiTest046 START');
      napitest.coerceToNumber()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0560
    * @tc.name      aceNapiTest047
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest047', 0, async function (done) {
      console.info('aceNapiTest047 START');
      napitest.coerceToObject()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0570
    * @tc.name      aceNapiTest048
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest048', 0, async function (done) {
      console.info('aceNapiTest048 START');
      napitest.coerceToString()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0580
    * @tc.name      aceNapiTest049
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest049', 0, async function (done) {
      console.info('aceNapiTest049 START');
      napitest.instanceOf()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0590
    * @tc.name      aceNapiTest050
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest050', 0, async function (done) {
      console.info('aceNapiTest050 START');
      napitest.isArray()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0600
    * @tc.name      aceNapiTest051
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest051', 0, async function (done) {
      console.info('aceNapiTest051 START');
      napitest.isDate()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0610
    * @tc.name      aceNapiTest052
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest052', 0, async function (done) {
      console.info('aceNapiTest052 START');
      napitest.strictEquals()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0620
    * @tc.name      aceNapiTest053
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest053', 0, async function (done) {
      console.info('aceNapiTest053 START');
      napitest.getPropertyNames()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0630
    * @tc.name      aceNapiTest054
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest054', 0, async function (done) {
      console.info('aceNapiTest054 START');
      napitest.setProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0640
    * @tc.name      aceNapiTest055
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest055', 0, async function (done) {
      console.info('aceNapiTest055 START');
      napitest.getProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0650
    * @tc.name      aceNapiTest056
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest056', 0, async function (done) {
      console.info('aceNapiTest056 START');
      napitest.hasProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0660
    * @tc.name      aceNapiTest057
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest057', 0, async function (done) {
      console.info('aceNapiTest057 START');
      napitest.deleteProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0670
    * @tc.name      aceNapiTest058
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest058', 0, async function (done) {
      console.info('aceNapiTest058 START');
      napitest.hasOwnProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0680
    * @tc.name      aceNapiTest059
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest059', 0, async function (done) {
      console.info('aceNapiTest059 START');
      napitest.setNamedProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0690
    * @tc.name      aceNapiTest060
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest060', 0, async function (done) {
      console.info('aceNapiTest060 START');
      napitest.getNamedProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0700
    * @tc.name      aceNapiTest061
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest061', 0, async function (done) {
      console.info('aceNapiTest061 START');
      napitest.hasNamedProperty()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0710
    * @tc.name      aceNapiTest062
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest062', 0, async function (done) {
      console.info('aceNapiTest062 START');
      napitest.setElement()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0720
    * @tc.name      aceNapiTest063
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest063', 0, async function (done) {
      console.info('aceNapiTest063 START');
      napitest.getElement()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0730
    * @tc.name      aceNapiTest064
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest064', 0, async function (done) {
      console.info('aceNapiTest064 START');
      napitest.hasElement()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0740
    * @tc.name      aceNapiTest065
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest065', 0, async function (done) {
      console.info('aceNapiTest065 START');
      napitest.deleteElement()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0750
    * @tc.name      aceNapiTest066
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest066', 0, async function (done) {
      console.info('aceNapiTest066 START');
      napitest.defineProperties()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0760
    * @tc.name      aceNapiTest067
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest067', 0, async function (done) {
      console.info('aceNapiTest067 START');
      napitest.getNewTarget()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0770
    * @tc.name      aceNapiTest068
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest068', 0, async function (done) {
      console.info('aceNapiTest068 START');
      napitest.wrap()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0780
    * @tc.name      aceNapiTest069
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest069', 0, async function (done) {
      console.info('aceNapiTest069 START');
      napitest.unwrap()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0790
    * @tc.name      aceNapiTest070
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest070', 0, async function (done) {
      console.info('aceNapiTest070 START');
      napitest.removeWrap()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0800
    * @tc.name      aceNapiTest071
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest071', 0, async function (done) {
      console.info('aceNapiTest071 START');
      napitest.getVersion()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0810
    * @tc.name      aceNapiTest072
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest072', 0, async function (done) {
      console.info('aceNapiTest072 START');
      napitest.createPromise()
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0820
    * @tc.name      aceNapiTest073
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest073', 0, async function (done) {
      console.info('aceNapiTest073 START');
      napitest.resolveAndRejectDeferred()
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0830
    * @tc.name      aceNapiTest074
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest074', 0, async function (done) {
      console.info('aceNapiTest074 START');
      napitest.isPromise()
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0840
    * @tc.name      aceNapiTest075
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest075', 0, async function (done) {
      console.info('aceNapiTest075 START');
      napitest.runScript()
      done();
    });
  })
}