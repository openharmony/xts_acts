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

import { describe, expect, it } from '@ohos/hypium'
import stdlib from 'libstdlibndk.so'

export default function stdlibNdkTest() {
  describe('MuslStdlibTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_0100
     * @tc.name       : testMuslStdlibRand001
     * @tc.desc       : test rand
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRand001', 0, async (done: Function) => {
      let oldData = stdlib.rand();
      let newData = stdlib.rand();
      console.info("Test rand oldData = " + JSON.stringify(oldData));
      console.info("Test rand newData = " + JSON.stringify(newData));
      let result = oldData != newData
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_0200
     * @tc.name       : testMuslStdlibRand002
     * @tc.desc       : test rand
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRand002', 0, async (done: Function) => {
      let oldData = stdlib.rand();
      console.info("Test rand oldData = " + JSON.stringify(oldData));
      let result = oldData != null;
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_R_0100
     * @tc.name       : testMuslStdlibRandR001
     * @tc.desc       : test rand_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandR001', 0, async (done: Function) => {
      let oldData = stdlib.randR();
      let newData = stdlib.randR();
      console.info("Test randR oldData = " + JSON.stringify(oldData));
      console.info("Test randR newData = " + JSON.stringify(newData));
      let result = oldData == newData
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RAND_R_0200
     * @tc.name       : testMuslStdlibRandR002
     * @tc.desc       : test rand_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandR002', 0, async (done: Function) => {
      let oldData = stdlib.randR();
      console.info("Test randR oldData = " + JSON.stringify(oldData));
      let result = oldData != null;
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RANDM_0100
     * @tc.name       : testMuslStdlibRandom001
     * @tc.desc       : test random
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandom001', 0, async (done: Function) => {
      let oldData = stdlib.random();
      let newData = stdlib.random();
      console.info("Test random oldData = " + JSON.stringify(oldData));
      console.info("Test random newData = " + JSON.stringify(newData));
      let result = oldData != newData
      expect(result).assertTrue()
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_RANDM_0200
     * @tc.name       : testMuslStdlibRandom002
     * @tc.desc       : test random
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibRandom002', 0, async (done: Function) => {
      let oldData = stdlib.random();
      console.info("Test random oldData = " + JSON.stringify(oldData));
      let result = oldData != null;
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SEED48_0100
     * @tc.name       : testMuslStdlibSeed48001
     * @tc.desc       : test seed48
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSeed48001', 0, async (done: Function) => {
      let a = stdlib.seed48(0);
      let b = (a != null);
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND_0100
     * @tc.name       : testMuslStdlibSrand001
     * @tc.desc       : test srand
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand001', 0, async (done: Function) =>{
      let a =  stdlib.srand(0);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND_0200
     * @tc.name       : testMuslStdlibSrand002
     * @tc.desc       : test srand
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand002', 0, async (done: Function) =>{
      let a =  stdlib.srand(1);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND_0300
     * @tc.name       : testMuslStdlibSrand003
     * @tc.desc       : test srand
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand003', 0, async (done: Function) =>{
      let a =  stdlib.srand(-1);
      let b = (a > 0)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND48_0100
     * @tc.name       : testMuslStdlibSrand48001
     * @tc.desc       : test srand48
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand48001', 0, async (done: Function) =>{
      let a =  stdlib.srand48(0);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND48_0200
     * @tc.name       : testMuslStdlibSrand48002
     * @tc.desc       : test srand48
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand48002', 0, async (done: Function) =>{
      let a =  stdlib.srand48(1);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRAND48_0300
     * @tc.name       : testMuslStdlibSrand48003
     * @tc.desc       : test srand48
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrand48003', 0, async (done: Function) =>{
      let a =  stdlib.srand48(-1);
      let b = (a > 0)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRANDOM_0100
     * @tc.name       : testMuslStdlibSrandom001
     * @tc.desc       : test srandom
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrandom001', 0, async (done: Function) =>{
      let a =  stdlib.srandom(0);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRANDOM_0200
     * @tc.name       : testMuslStdlibSrandom002
     * @tc.desc       : test srandom
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrandom002', 0, async (done: Function) =>{
      let a =  stdlib.srandom(1);
      let b = (a != null)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SRANDOM_0300
     * @tc.name       : testMuslStdlibSrandom003
     * @tc.desc       : test srandom
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSrandom003', 0, async (done: Function) =>{
      let a =  stdlib.srandom(-1);
      let b = (a > 0)
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_GETLOADAVG_0100
     * @tc.name       : testMuslStdlibGetLoadAvg001
     * @tc.desc       : test getloadavg
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibGetLoadAvg001', 0, async (done: Function) => {
      let a = stdlib.getLoadAvg();
      let b = (a != null);
      expect(b).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOD_0100
     * @tc.name       : testMuslStdlibStrtod001
     * @tc.desc       : test strtod
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtod001',0,async (done:Function) => {
      let a = '12345.6789';
      let strtodResult = stdlib.strtod(a);
      console.info("Test strtodResult= " + strtodResult);
      expect(strtodResult).assertEqual(12345.678900);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOD_0200
     * @tc.name       : testMuslStdlibStrtod002
     * @tc.desc       : test strtod
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtod002',0,async (done:Function) => {
      let a = '-232.23e4';
      let strtodResult = stdlib.strtod(a);
      console.info("Test strtodResult= " + strtodResult);
      expect(strtodResult).assertEqual(-2322300.000000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOF_0100
     * @tc.name       : testMuslStdlibStrtof001
     * @tc.desc       : test strtof
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtof001',0,async (done:Function) => {
      let a = '123.456';
      let strtofResult = stdlib.strtof(a);
      console.info("Test strtofResult= " + strtofResult);
      expect(Number(strtofResult).toFixed(3)).assertEqual("123.456");

      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOF_0200
     * @tc.name       : testMuslStdlibStrtof002
     * @tc.desc       : test strtof
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtof002',0,async (done:Function) => {
      let a = '-123';
      let strtofResult = stdlib.strtof(a);
      console.info("Test strtofResult= " + strtofResult);
      expect(strtofResult).assertEqual(-123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOL_0100
     * @tc.name       : testMuslStdlibStrtol001
     * @tc.desc       : test strtol
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtol001',0,async (done:Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtolResult = stdlib.strtol(a,b);
      console.info("Test strtolResult= " + strtolResult);
      expect(strtolResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOL_0200
     * @tc.name       : testMuslStdlibStrtol002
     * @tc.desc       : test strtol
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtol002',0,async (done:Function) => {
      let a = '123';
      let b = 10;
      let strtolResult = stdlib.strtol(a,b);
      console.info("Test strtolResult= " + strtolResult);
      expect(strtolResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLD_0100
     * @tc.name       : testMuslStdlibStrtold001
     * @tc.desc       : test strtold
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtold001',0,async (done:Function) => {
      let a = '12345.6789';
      let strtoldResult = stdlib.strtold(a);
      console.info("Test strtoldResult= " + strtoldResult);
      expect(strtoldResult).assertEqual(12345.678900);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLD_0200
     * @tc.name       : testMuslStdlibStrtold002
     * @tc.desc       : test strtold
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtold002',0,async (done:Function) => {
      let a = '-232.23e4';
      let strtoldResult = stdlib.strtold(a);
      console.info("Test strtoldResult= " + strtoldResult);
      expect(strtoldResult).assertEqual(-2322300.000000);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLL_0100
     * @tc.name       : testMuslStdlibStrtoll001
     * @tc.desc       : test strtoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoll001',0,async (done:Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtollResult = stdlib.strtoll(a,b);
      console.info("Test strtollResult= " + strtollResult);
      expect(strtollResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOLL_0200
     * @tc.name       : testMuslStdlibStrtoll002
     * @tc.desc       : test strtoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoll002',0,async (done:Function) => {
      let a = '123';
      let b = 10;
      let strtollResult = stdlib.strtoll(a,b);
      console.info("Test strtollResult= " + strtollResult);
      expect(strtollResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOUL_0100
     * @tc.name       : testMuslStdlibStrtoul001
     * @tc.desc       : test strtoul
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoul001',0,async (done:Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtoulResult = stdlib.strtoul(a,b);
      console.info("Test strtoulResult= " + strtoulResult);
      expect(strtoulResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOUL_0200
     * @tc.name       : testMuslStdlibStrtoul002
     * @tc.desc       : test strtoul
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoul002',0,async (done:Function) => {
      let a = '123';
      let b = 10;
      let strtoulResult = stdlib.strtoul(a,b);
      console.info("Test strtoulResult= " + strtoulResult);
      expect(strtoulResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOULL_0100
     * @tc.name       : testMuslStdlibStrtoull001
     * @tc.desc       : test strtoull
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoull001',0,async (done:Function) => {
      let a = '123AB_20';
      let b = 10;
      let strtoullResult = stdlib.strtoull(a,b);
      console.info("Test strtoullResult= " + strtoullResult);
      expect(strtoullResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_STRTOULL_0200
     * @tc.name       : testMuslStdlibStrtoull002
     * @tc.desc       : test strtoull
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibStrtoull002',0,async (done:Function) => {
      let a = '123';
      let b = 10;
      let strtoullResult = stdlib.strtoull(a,b);
      console.info("Test strtoullResult= " + strtoullResult);
      expect(strtoullResult).assertEqual(123);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SETENV_0100
     * @tc.name       : testMuslStdlibSetenv001
     * @tc.desc       : test setenv
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSetenv001', 0, async (done: Function) => {
      let b = "TEST"
      let c = "2"
      let d = 0
      let a = stdlib.setenv(b,c,d);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDLIB_SETENV_0200
     * @tc.name       : testMuslStdlibSetenv002
     * @tc.desc       : test setenv
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibSetenv002', 0, async (done: Function) => {
      let b = ""
      let c = "2"
      let d = 0
      let a = stdlib.setenv(b,c,d);
      expect(a).assertEqual(-1);
      done()
    });

  })
}