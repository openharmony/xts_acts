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
import wchar from 'libwcharndk.so'

export default function wcharNdkTest() {
  describe('MuslWcharTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCPCPY_0100
     * @tc.name       : testMuslWcharWcpcpy001
     * @tc.desc       : test wcpcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcpcpy001', 0, async (done: Function) => {
      let result: number = wchar.wcpcpy();
      console.info("Test wcpcpy result = " + JSON.stringify(result));
      expect(result).assertEqual(6);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCAT_0100
     * @tc.name       : testMuslWcharWcscat001
     * @tc.desc       : test wcscat
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcscat001', 0, async (done: Function) => {
      let result: number = wchar.wcscat();
      console.info("Test wcscat result = " + JSON.stringify(result));
      expect(result).assertEqual(8);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCHR_0100
     * @tc.name       : testMuslWcharWcschr001
     * @tc.desc       : test wcschr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcschr001', 0, async (done: Function) => {
      let result: number = wchar.wcschr();
      console.info("Test wcscat result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCMP_0100
     * @tc.name       : testMuslWcharWcscmp001
     * @tc.desc       : test wcscmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcscmp001', 0, async (done: Function) => {
      let result: number = wchar.wcscmp();
      console.info("Test wcsncmp result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCOLL_0100
     * @tc.name       : testMuslWcharWcscoll001
     * @tc.desc       : test wcscoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcscoll001', 0, async (done: Function) => {
      let result: number = wchar.wcscoll();
      console.info("Test wcscoll result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCPY_0100
     * @tc.name       : testMuslWcharWcscpy001
     * @tc.desc       : test wcscpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcscpy001', 0, async (done: Function) => {
      let result: number = wchar.wcscpy();
      console.info("Test wcscpy result = " + JSON.stringify(result));
      expect(result).assertEqual(6);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCSPN_0100
     * @tc.name       : testMuslWcharWcscspn001
     * @tc.desc       : test wcscspn
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcscspn001', 0, async (done: Function) => {
      let result: number = wchar.wcscspn();
      console.info("Test wcscspn result = " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSDUP_0100
     * @tc.name       : testMuslWcharWcsdup001
     * @tc.desc       : test wcsdup
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcsdup001', 0, async (done: Function) => {
      let result: number = wchar.wcsdup();
      console.info("Test wcsdup result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSLEN_0100
     * @tc.name       : testMuslWcharWcslen001
     * @tc.desc       : test wcslen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcslen001', 0, async (done: Function) => {
      let result: number = wchar.wcslen();
      console.info("Test wcslen result = " + JSON.stringify(result));
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCAT_0100
     * @tc.name       : testMuslWcharWcsncat001
     * @tc.desc       : test wcsncat
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcsncat001', 0, async (done: Function) => {
      let result: number = wchar.wcsncat();
      console.info("Test wcslen result = " + JSON.stringify(result));
      expect(result).assertEqual(4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCMP_0100
     * @tc.name       : testMuslWcharWcsncmp001
     * @tc.desc       : test wcsncmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcsncmp001', 0, async (done: Function) => {
      let param = 3;
      let result: number = wchar.wcsncmp(param);
      console.info("Test wcsncmp result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCMP_0200
     * @tc.name       : testMuslWcharWcsncmp002
     * @tc.desc       : test wcsncmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcsncmp002', 0, async (done: Function) => {
      let param = 4;
      let answer: number = wchar.wcsncmp(param);
      console.info("Test wcsncmp result = " + JSON.stringify(answer));
      let result: boolean = answer > 0
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNLEN_0100
     * @tc.name       : testMuslWcharWcsnlen001
     * @tc.desc       : test wcsnlen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcsnlen001', 0, async (done: Function) => {
      let param = 3;
      let result: number = wchar.wcsnlen(param);
      console.info("Test wcsnlen result = " + JSON.stringify(result));
      expect(result).assertEqual(param);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNLEN_0200
     * @tc.name       : testMuslWcharWcsnlen002
     * @tc.desc       : test wcsnlen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcsnlen002', 0, async (done: Function) => {
      let param = 10;
      let result: number = wchar.wcsnlen(param);
      console.info("Test wcsnlen result = " + JSON.stringify(result));
      expect(result).assertEqual(5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSPBRK_0100
     * @tc.name       : testMuslWcharWcspbrk001
     * @tc.desc       : test wcspbrk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcspbrk001', 0, async (done: Function) => {
      let result: number = wchar.wcspbrk();
      console.info("Test wcsnlen result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_SWPRINTF_0100
     * @tc.name       : testMuslWcharSwprintf001
     * @tc.desc       : test swprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharSwprintf001', 0, async (done: Function) => {
      let result: number = wchar.swprintf();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_SWSCANF_0100
     * @tc.name       : testMuslWcharSwscanf001
     * @tc.desc       : test wcspbrk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharSwscanf001', 0, async (done: Function) => {
      let result: number = wchar.swscanf();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WSCANF_0100
     * @tc.name       : testMuslWcharWscanf001
     * @tc.desc       : test wscanf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWscanf001', 0, async (done: Function) => {
      let result: number = wchar.wscanf();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_VWSCANF_0100
     * @tc.name       : testMuslWcharVwscanf001
     * @tc.desc       : test vwscanf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharVwscanf001', 0, async (done: Function) => {
      let result: number = wchar.vwscanf();
      expect(result).assertEqual(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WHAR_VFWPRINTF_0100
     * @tc.name       : testMuslWcharVfwprintf001
     * @tc.desc       : test vfwprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharVfwprintf001', 0, async (done: Function) => {
      let a: number = wchar.vfwprintf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WHAR_VSWPRINTF_0100
     * @tc.name       : testMuslWcharVswprintf001
     * @tc.desc       : test vswprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharVswprintf001', 0, async (done: Function) => {
      let a: number = wchar.vswprintf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WHAR_VWPRINTF_0100
     * @tc.name       : testMuslWcharVwprintf001
     * @tc.desc       : test vwprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharVwprintf001', 0, async (done: Function) => {
      let a: number = wchar.vwprintf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWLOWER_0100
     * @tc.name       : testMuslWcharTowlower001
     * @tc.desc       : test towlower
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowlower001', 0, async (done: Function) => {
      let param = 0;
      let towlowerResult: number = wchar.towlower(param);
      console.info("Test towlowerResult= " + towlowerResult);
      expect(towlowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWLOWER_0200
     * @tc.name       : testMuslWcharTowlower002
     * @tc.desc       : test towlower
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowlower002', 0, async (done: Function) => {
      let param = 1;
      let towlowerResult: number = wchar.towlower(param);
      console.info("Test towlowerResult= " + towlowerResult);
      expect(towlowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWLOWER_0300
     * @tc.name       : testMuslWcharTowlower003
     * @tc.desc       : test towlower
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowlower003', 0, async (done: Function) => {
      let param = 2;
      let towlowerResult: number = wchar.towlower(param);
      console.info("Test towlowerResult= " + towlowerResult);
      expect(towlowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWLOWER_0400
     * @tc.name       : testMuslWcharTowlower004
     * @tc.desc       : test towlower
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowlower004', 0, async (done: Function) => {
      let param = -1;
      let towlowerResult: number = wchar.towlower(param);
      console.info("Test towlowerResult= " + towlowerResult);
      expect(towlowerResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWUPPER_0100
     * @tc.name       : testMuslWcharTowupper001
     * @tc.desc       : test towupper
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowupper001', 0, async (done: Function) => {
      let param = 0;
      let towupperResult: number = wchar.towupper(param);
      console.info("Test towupperResult= " + towupperResult);
      expect(towupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWUPPER_0200
     * @tc.name       : testMuslWcharTowupper002
     * @tc.desc       : test towupper
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowupper002', 0, async (done: Function) => {
      let param = 1;
      let towupperResult: number = wchar.towupper(param);
      console.info("Test towupperResult= " + towupperResult);
      expect(towupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWUPPER_0300
     * @tc.name       : testMuslWcharTowupper003
     * @tc.desc       : test towupper
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowupper003', 0, async (done: Function) => {
      let param = 2;
      let towupperResult: number = wchar.towupper(param);
      console.info("Test towupperResult= " + towupperResult);
      expect(towupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_TOWUPPER_0400
     * @tc.name       : testMuslWcharTowupper004
     * @tc.desc       : test towupper
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharTowupper004', 0, async (done: Function) => {
      let param = -1;
      let towupperResult: number = wchar.towupper(param);
      console.info("Test towupperResult= " + towupperResult);
      expect(towupperResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCPNCPY_0100
     * @tc.name       : testMuslWcharWcpncpy001
     * @tc.desc       : test wcpncpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcpncpy001', 0, async (done: Function) => {
      let param = 13;
      let wcpncpyResult: number = wchar.wcpncpy(param);
      console.info("Test wcpncpyResult = " + JSON.stringify(wcpncpyResult));
      expect(wcpncpyResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCPNCPY_0200
     * @tc.name       : testMuslWcharWcpncpy002
     * @tc.desc       : test wcpncpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcpncpy002', 0, async (done: Function) => {
      let param = 2;
      let wcpncpyResult: number = wchar.wcpncpy(param);
      console.info("Test wcpncpyResult = " + JSON.stringify(wcpncpyResult));
      expect(wcpncpyResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCRTOMB_0100
     * @tc.name       : testMuslWcharWcrtomb001
     * @tc.desc       : test wrtomb
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcrtomb001', 0, async (done: Function) => {
      let wcrtombResult: number = wchar.wcrtomb();
      console.info("Test wcrtombResult = " + JSON.stringify(wcrtombResult));
      expect(wcrtombResult).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMP_0100
     * @tc.name       : testMuslWcharWcscasecmp001
     * @tc.desc       : test wcscasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscasecmp001', 0, async (done: Function) => {
      let param = 0;
      let wcscasecmpResult: number = wchar.wcscasecmp(param);
      console.info("Test wcscasecmpResult = " + JSON.stringify(wcscasecmpResult));
      expect(wcscasecmpResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMP_0200
     * @tc.name       : testMuslWcharWcscasecmp002
     * @tc.desc       : test wcscasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscasecmp002', 0, async (done: Function) => {
      let param = 1;
      let wcscasecmpResult: number = wchar.wcscasecmp(param);
      console.info("Test wcscasecmpResult = " + JSON.stringify(wcscasecmpResult));
      expect(wcscasecmpResult).assertEqual(97);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMP_0300
     * @tc.name       : testMuslWcharWcscasecmp003
     * @tc.desc       : test wcscasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscasecmp003', 0, async (done: Function) => {
      let param = -1;
      let wcscasecmpResult: number = wchar.wcscasecmp(param);
      console.info("Test wcscasecmpResult = " + JSON.stringify(wcscasecmpResult));
      expect(wcscasecmpResult).assertEqual(-97);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMPL_0100
     * @tc.name       : testMuslWcharWcscasecmpL001
     * @tc.desc       : test wcscasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscasecmpL001', 0, async (done: Function) => {
      let param = 0;
      let wcscasecmpLResult: number = wchar.wcscasecmpL(param);
      console.info("Test wcscasecmpLResult = " + JSON.stringify(wcscasecmpLResult));
      expect(wcscasecmpLResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMPL_0200
     * @tc.name       : testMuslWcharWcscasecmpL002
     * @tc.desc       : test wcscasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscasecmpL002', 0, async (done: Function) => {
      let param = 1;
      let wcscasecmpLResult: number = wchar.wcscasecmpL(param);
      console.info("Test wcscasecmpLResult = " + JSON.stringify(wcscasecmpLResult));
      expect(wcscasecmpLResult).assertEqual(97);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCASECMPL_0300
     * @tc.name       : testMuslWcharWcscasecmpL003
     * @tc.desc       : test wcscasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscasecmpL003', 0, async (done: Function) => {
      let param = -1;
      let wcscasecmpLResult: number = wchar.wcscasecmpL(param);
      console.info("Test wcscasecmpLResult = " + JSON.stringify(wcscasecmpLResult));
      expect(wcscasecmpLResult).assertEqual(-97);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSFTIME_0100
     * @tc.name       : testMuslWcharWcsftime001
     * @tc.desc       : test wcsftime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsftime001', 0, async (done: Function) => {
      let wcsftimeResult: number = wchar.wcsftime();
      console.info("Test wcsftimeResult = " + JSON.stringify(wcsftimeResult));
      expect(wcsftimeResult).assertEqual(4);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSFTIMEL_0100
     * @tc.name       : testMuslWcharWcsftimeL001
     * @tc.desc       : test wcsftime_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsftimeL001', 0, async (done: Function) => {
      let wcsftimeLResult: number = wchar.wcsftimeL();
      console.info("Test wcsftimeLResult = " + JSON.stringify(wcsftimeLResult));
      expect(wcsftimeLResult).assertEqual(4);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCOLLL_0100
     * @tc.name       : testMuslWcharWcscollL001
     * @tc.desc       : test wcscoll_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscollL001', 0, async (done: Function) => {
      let param = 0;
      let wcscollResult: number = wchar.wcscollL(param);
      console.info("Test wcscollResult = " + JSON.stringify(wcscollResult));
      expect(wcscollResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCOLLL_0200
     * @tc.name       : testMuslWcharWcscollL002
     * @tc.desc       : test wcscoll_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscollL002', 0, async (done: Function) => {
      let param = 1;
      let wcscollResult: number = wchar.wcscollL(param);
      console.info("Test wcscollResult = " + JSON.stringify(wcscollResult));
      expect(wcscollResult).assertEqual(65);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSCOLLL_0300
     * @tc.name       : testMuslWcharWcscollL003
     * @tc.desc       : test wcscoll_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcscollL003', 0, async (done: Function) => {
      let param = -1;
      let wcscollResult: number = wchar.wcscollL(param);
      console.info("Test wcscollResult = " + JSON.stringify(wcscollResult));
      expect(wcscollResult).assertEqual(-65);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMP_0100
     * @tc.name       : testMuslWcharWcsncasecmp001
     * @tc.desc       : test wcsncasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncasecmp001', 0, async (done: Function) => {
      let param = 0;
      let wcsncasecmpResult: number = wchar.wcsncasecmp(param);
      console.info("Test wcsncasecmpResult = " + JSON.stringify(wcsncasecmpResult));
      expect(wcsncasecmpResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMP_0200
     * @tc.name       : testMuslWcharWcsncasecmp002
     * @tc.desc       : test wcsncasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncasecmp002', 0, async (done: Function) => {
      let param = 1;
      let wcsncasecmpResult: number = wchar.wcsncasecmp(param);
      console.info("Test wcsncasecmpResult = " + JSON.stringify(wcsncasecmpResult));
      expect(wcsncasecmpResult).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMP_0300
     * @tc.name       : testMuslWcharWcsncasecmp003
     * @tc.desc       : test wcsncasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncasecmp003', 0, async (done: Function) => {
      let param = -1;
      let wcsncasecmpResult: number = wchar.wcsncasecmp(param);
      console.info("Test wcsncasecmpResult = " + JSON.stringify(wcsncasecmpResult));
      expect(wcsncasecmpResult).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMPL_0100
     * @tc.name       : testMuslWcharWcsncasecmpL001
     * @tc.desc       : test wcsncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncasecmpL001', 0, async (done: Function) => {
      let param = 0;
      let wcsncasecmpLResult: number = wchar.wcsncasecmpL(param);
      console.info("Test wcsncasecmpLResult = " + JSON.stringify(wcsncasecmpLResult));
      expect(wcsncasecmpLResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMPL_0200
     * @tc.name       : testMuslWcharWcsncasecmpL002
     * @tc.desc       : test wcsncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncasecmpL002', 0, async (done: Function) => {
      let param = 1;
      let wcsncasecmpLResult: number = wchar.wcsncasecmpL(param);
      console.info("Test wcsncasecmpLResult = " + JSON.stringify(wcsncasecmpLResult));
      expect(wcsncasecmpLResult).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCASECMPL_0300
     * @tc.name       : testMuslWcharWcsncasecmpL003
     * @tc.desc       : test wcsncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncasecmpL003', 0, async (done: Function) => {
      let param = -1;
      let wcsncasecmpLResult: number = wchar.wcsncasecmpL(param);
      console.info("Test wcsncasecmpLResult = " + JSON.stringify(wcsncasecmpLResult));
      expect(wcsncasecmpLResult).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCPY_0100
     * @tc.name       : testMuslWcharWcsncpy001
     * @tc.desc       : test wcsncpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncpy001', 0, async (done: Function) => {
      let param = 1;
      let wcsncpyResult: number = wchar.wcsncpy(param);
      console.info("Test wcsncpyResult = " + JSON.stringify(wcsncpyResult));
      expect(wcsncpyResult).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNCPY_0200
     * @tc.name       : testMuslWcharWcsncpy002
     * @tc.desc       : test wcsncpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsncpy002', 0, async (done: Function) => {
      let param = -1;
      let wcsncpyResult: number = wchar.wcsncpy(param);
      console.info("Test wcsncpyResult = " + JSON.stringify(wcsncpyResult));
      expect(wcsncpyResult).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSRCHR_0100
     * @tc.name       : testMuslWcharWcsrchr001
     * @tc.desc       : test wcsrchr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsrchr001', 0, async (done: Function) => {
      let param = 0;
      let wcsrchrResult: number = wchar.wcsrchr(param);
      console.info("Test wcsrchrResult = " + JSON.stringify(wcsrchrResult));
      expect(wcsrchrResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSRCHR_0200
     * @tc.name       : testMuslWcharWcsrchr002
     * @tc.desc       : test wcsrchr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsrchr002', 0, async (done: Function) => {
      let param = 2;
      let wcsrchrResult: number = wchar.wcsrchr(param);
      console.info("Test wcsrchrResult = " + JSON.stringify(wcsrchrResult));
      expect(wcsrchrResult).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSRTOMBS_0100
     * @tc.name       : testMuslWcharWcsrtombs001
     * @tc.desc       : test wcsrtombs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsrtombs001', 0, async (done: Function) => {
      let param = 0;
      let wcsrtombsResult: number = wchar.wcsrtombs(param);
      console.info("Test wcsrtombsResult = " + JSON.stringify(wcsrtombsResult));
      expect(wcsrtombsResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSRTOMBS_0200
     * @tc.name       : testMuslWcharWcsrtombs002
     * @tc.desc       : test wcsrtombs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsrtombs002', 0, async (done: Function) => {
      let param = 10;
      let wcsrtombsResult: number = wchar.wcsrtombs(param);
      console.info("Test wcsrtombsResult = " + JSON.stringify(wcsrtombsResult));
      expect(wcsrtombsResult).assertEqual(7);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSSPN_0100
     * @tc.name       : testMuslWcharWcsspn001
     * @tc.desc       : test wcsspn
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsspn001', 0, async (done: Function) => {
      let param = 0;
      let wcsspnResult: number = wchar.wcsspn(param);
      console.info("Test wcsspnResult = " + JSON.stringify(wcsspnResult));
      expect(wcsspnResult).assertEqual(3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSSPN_0200
     * @tc.name       : testMuslWcharWcsspn002
     * @tc.desc       : test wcsspn
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsspn002', 0, async (done: Function) => {
      let param = 10;
      let wcsspnResult: number = wchar.wcsspn(param);
      console.info("Test wcsspnResult = " + JSON.stringify(wcsspnResult));
      expect(wcsspnResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSSTR_0100
     * @tc.name       : testMuslWcharWcsstr001
     * @tc.desc       : test wcsstr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsstr001', 0, async (done: Function) => {
      let param = 0;
      let wcsstrResult: number = wchar.wcsstr(param);
      console.info("Test wcsstrResult = " + JSON.stringify(wcsstrResult));
      expect(wcsstrResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSSTR_0200
     * @tc.name       : testMuslWcharWcsstr002
     * @tc.desc       : test wcsstr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsstr002', 0, async (done: Function) => {
      let param = 10;
      let wcsstrResult: number = wchar.wcsstr(param);
      console.info("Test wcsstrResult = " + JSON.stringify(wcsstrResult));
      expect(wcsstrResult).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOD_0100
     * @tc.name       : testMuslWcharWcstod001
     * @tc.desc       : test wcstod
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstod001', 0, async (done: Function) => {
      let param = 0;
      let wcstodResult: number = wchar.wcstod(param);
      console.info("Test wcstodResult = " + JSON.stringify(wcstodResult));
      expect(wcstodResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOD_0200
     * @tc.name       : testMuslWcharWcstod002
     * @tc.desc       : test wcstod
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstod002', 0, async (done: Function) => {
      let param = 10;
      let wcstodResult: number = wchar.wcstod(param);
      console.info("Test wcstodResult = " + JSON.stringify(wcstodResult));
      expect(wcstodResult).assertEqual(95.6);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOF_0100
     * @tc.name       : testMuslWcharWcstof001
     * @tc.desc       : test wcstof
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstof001', 0, async (done: Function) => {
      let param = 0;
      let wcstofResult: number = wchar.wcstof(param);
      console.info("Test wcstofResult = " + JSON.stringify(wcstofResult));
      expect(wcstofResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOF_0200
     * @tc.name       : testMuslWcharWcstof002
     * @tc.desc       : test wcstof
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstof002', 0, async (done: Function) => {
      let param = 10;
      let wcstofResult: number = wchar.wcstof(param);
      console.info("Test wcstofResult = " + JSON.stringify(wcstofResult));
      expect(Number(wcstofResult).toFixed(1)).assertEqual("95.6");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOK_0100
     * @tc.name       : testMuslWcharWcstok001
     * @tc.desc       : test wcstok
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcstok001', 0, async (done: Function) => {
      let param = 0;
      let wcstokResult: number = wchar.wcstok(param);
      console.info("Test wcstokResult = " + JSON.stringify(wcstokResult));
      expect(wcstokResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOK_0200
     * @tc.name       : testMuslWcharWcstok002
     * @tc.desc       : test wcstok
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcstok002', 0, async (done: Function) => {
      let param = -1;
      let wcstokResult: number = wchar.wcstok(param);
      console.info("Test wcstokResult = " + JSON.stringify(wcstokResult));
      expect(wcstokResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOL_0100
     * @tc.name       : testMuslWcharWcstol001
     * @tc.desc       : test wcstol
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstol001', 0, async (done: Function) => {
      let param = 0;
      let wcstolResult: number = wchar.wcstol(param);
      console.info("Test wcstolResult = " + JSON.stringify(wcstolResult));
      expect(wcstolResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOL_0200
     * @tc.name       : testMuslWcharWcstol002
     * @tc.desc       : test wcstol
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstol002', 0, async (done: Function) => {
      let param = -1;
      let wcstolResult: number = wchar.wcstol(param);
      console.info("Test wcstolResult = " + JSON.stringify(wcstolResult));
      expect(wcstolResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOLD_0100
     * @tc.name       : testMuslWcharWcstold001
     * @tc.desc       : test wcstold
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstold001', 0, async (done: Function) => {
      let param = 0;
      let wcstoldResult: number = wchar.wcstold(param);
      console.info("Test wcstoldResult = " + JSON.stringify(wcstoldResult));
      expect(wcstoldResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOLD_0200
     * @tc.name       : testMuslWcharWcstold002
     * @tc.desc       : test wcstold
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstold002', 0, async (done: Function) => {
      let param = -1;
      let wcstoldResult: number = wchar.wcstold(param);
      console.info("Test wcstoldResult = " + JSON.stringify(wcstoldResult));
      expect(wcstoldResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOLL_0100
     * @tc.name       : testMuslWcharWcstoll001
     * @tc.desc       : test wcstoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstoll001', 0, async (done: Function) => {
      let param = 0;
      let wcstollResult: number = wchar.wcstoll(param);
      console.info("Test wcstollResult = " + JSON.stringify(wcstollResult));
      expect(wcstollResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOLL_0200
     * @tc.name       : testMuslWcharWcstoll002
     * @tc.desc       : test wcstoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstoll002', 0, async (done: Function) => {
      let param = -1;
      let wcstollResult: number = wchar.wcstoll(param);
      console.info("Test wcstollResult = " + JSON.stringify(wcstollResult));
      expect(wcstollResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOMBS_0100
     * @tc.name       : testMuslWcharWcstombs001
     * @tc.desc       : test wcstombs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstombs001', 0, async (done: Function) => {
      let param = 3;
      let wcstombsResult: number = wchar.wcstombs(param);
      console.info("Test wcstombsResult = " + JSON.stringify(wcstombsResult));
      expect(wcstombsResult).assertEqual(3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOMBS_0200
     * @tc.name       : testMuslWcharWcstombs002
     * @tc.desc       : test wcstombs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstombs002', 0, async (done: Function) => {
      let param = 10;
      let wcstombsResult: number = wchar.wcstombs(param);
      console.info("Test wcstombsResult = " + JSON.stringify(wcstombsResult));
      expect(wcstombsResult).assertEqual(10);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOMBS_0300
     * @tc.name       : testMuslWcharWcstombs003
     * @tc.desc       : test wcstombs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstombs003', 0, async (done: Function) => {
      let param = 50;
      let wcstombsResult: number = wchar.wcstombs(param);
      console.info("Test wcstombsResult = " + JSON.stringify(wcstombsResult));
      expect(wcstombsResult).assertEqual(10);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOUL_0100
     * @tc.name       : testMuslWcharWcstoul001
     * @tc.desc       : test wcstoul
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstoul001', 0, async (done: Function) => {
      let param = 0;
      let wcstoulResult: number = wchar.wcstoul(param);
      console.info("Test wcstoulResult = " + JSON.stringify(wcstoulResult));
      expect(wcstoulResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOUL_0200
     * @tc.name       : testMuslWcharWcstoul002
     * @tc.desc       : test wcstoul
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstoul002', 0, async (done: Function) => {
      let param = -1;
      let wcstoulResult: number = wchar.wcstoul(param);
      console.info("Test wcstoulResult = " + JSON.stringify(wcstoulResult));
      expect(wcstoulResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOULL_0100
     * @tc.name       : testMuslWcharWcstoull001
     * @tc.desc       : test wcstoull
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstoull001', 0, async (done: Function) => {
      let param = 0;
      let wcstoullResult: number = wchar.wcstoull(param);
      console.info("Test wcstoullResult = " + JSON.stringify(wcstoullResult));
      expect(wcstoullResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSTOULL_0200
     * @tc.name       : testMuslWcharWcstoull002
     * @tc.desc       : test wcstoull
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcstoull002', 0, async (done: Function) => {
      let param = -1;
      let wcstoullResult: number = wchar.wcstoull(param);
      console.info("Test wcstoullResult = " + JSON.stringify(wcstoullResult));
      expect(wcstoullResult).assertEqual(123);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSWIDTH_0100
     * @tc.name       : testMuslWcharWcswidth001
     * @tc.desc       : test wcswidth
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcswidth001', 0, async (done: Function) => {
      let param = 0;
      let wcswidthResult: number = wchar.wcswidth(param);
      console.info("Test wcswidthResult = " + JSON.stringify(wcswidthResult));
      expect(wcswidthResult).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSWIDTH_0200
     * @tc.name       : testMuslWcharWcswidth002
     * @tc.desc       : test wcswidth
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcswidth002', 0, async (done: Function) => {
      let param = -1;
      let wcswidthResult: number = wchar.wcswidth(param);
      console.info("Test wcswidthResult = " + JSON.stringify(wcswidthResult));
      expect(wcswidthResult).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSXFRM_0100
     * @tc.name       : testMuslWcharWcsxfrm001
     * @tc.desc       : test wcsxfrm
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsxfrm001', 0, async (done: Function) => {
      let param = 10;
      let wcsxfrmResult: number = wchar.wcsxfrm(param);
      console.info("Test wcsxfrmResult= " + wcsxfrmResult);
      expect(wcsxfrmResult).assertEqual(7);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSXFRM_0200
     * @tc.name       : testMuslWcharWcsxfrm002
     * @tc.desc       : test wcsxfrm
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsxfrm002', 0, async (done: Function) => {
      let param = 4;
      let wcsxfrmResult: number = wchar.wcsxfrm(param);
      console.info("Test wcsxfrmResult= " + wcsxfrmResult);
      expect(wcsxfrmResult).assertEqual(7);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNRTOMBS_0100
     * @tc.name       : testMuslWcharWcsnrtombs001
     * @tc.desc       : test wcsnrtombs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsnrtombs001', 0, async (done: Function) => {
      let param = 0;
      let wcsnrtombsResult: number = wchar.wcsnrtombs(param);
      console.info("Test wcsnrtombsResult = " + JSON.stringify(wcsnrtombsResult));
      expect(wcsnrtombsResult).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSNRTOMBS_0200
     * @tc.name       : testMuslWcharWcsnrtombs002
     * @tc.desc       : test wcsnrtombs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsnrtombs002', 0, async (done: Function) => {
      let param = 10;
      let wcsnrtombsResult: number = wchar.wcsnrtombs(param);
      console.info("Test wcsnrtombsResult = " + JSON.stringify(wcsnrtombsResult));
      expect(wcsnrtombsResult).assertEqual(7);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSXFRML_0100
     * @tc.name       : testMuslWcharWcsxfrmL001
     * @tc.desc       : test wcsxfrm_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsxfrmL001', 0, async (done: Function) => {
      let param = 10;
      let result: number = wchar.wcsxfrmL(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(7);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSXFRML_0200
     * @tc.name       : testMuslWcharWcsxfrmL002
     * @tc.desc       : test wcsxfrm_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcsxfrmL002', 0, async (done: Function) => {
      let param = 4;
      let result: number = wchar.wcsxfrmL(param);
      console.info("Test result= " + result);
      expect(result).assertEqual(7);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCTOB_0100
     * @tc.name       : testMuslWcharWctob001
     * @tc.desc       : test wctob
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWctob001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wctob(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCTOB_0200
     * @tc.name       : testMuslWcharWctob002
     * @tc.desc       : test wctob
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWctob002', 0, async (done: Function) => {
      let param = -1;
      let result: number = wchar.wctob(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCTOMB_0100
     * @tc.name       : testMuslWcharWctomb001
     * @tc.desc       : test wctomb
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWctomb001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wctomb(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCTOMB_0200
     * @tc.name       : testMuslWcharWctomb002
     * @tc.desc       : test wctomb
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWctomb002', 0, async (done: Function) => {
      let param = 1;
      let result: number = wchar.wctomb(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCTOMB_0300
     * @tc.name       : testMuslWcharWctomb003
     * @tc.desc       : test wctomb
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWctomb003', 0, async (done: Function) => {
      let param = 2;
      let result: number = wchar.wctomb(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCTOMB_0400
     * @tc.name       : testMuslWcharWctomb004
     * @tc.desc       : test wctomb
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWctomb004', 0, async (done: Function) => {
      let param = -1;
      let result: number = wchar.wctomb(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCWIDTH_0100
     * @tc.name       : testMuslWcharWcwidth001
     * @tc.desc       : test wcwidth
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcwidth001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wcwidth(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCWIDTH_0200
     * @tc.name       : testMuslWcharWcwidth002
     * @tc.desc       : test wcwidth
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWcwidth002', 0, async (done: Function) => {
      let param = 1;
      let result: number = wchar.wcwidth(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCHR_0100
     * @tc.name       : testMuslWcharWmemchr001
     * @tc.desc       : test wmemchr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWmemchr001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wmemchr(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCHR_0200
     * @tc.name       : testMuslWcharWmemchr002
     * @tc.desc       : test wmemchr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWmemchr002', 0, async (done: Function) => {
      let param = 1;
      let result: number = wchar.wmemchr(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCHR_0300
     * @tc.name       : testMuslWcharWmemchr003
     * @tc.desc       : test wmemchr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWmemchr003', 0, async (done: Function) => {
      let param = -1;
      let result: number = wchar.wmemchr(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCMP_0100
     * @tc.name       : testMuslWcharWmemcmp001
     * @tc.desc       : test wmemcmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWmemcmp001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wmemcmp(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCMP_0200
     * @tc.name       : testMuslWcharWmemcmp002
     * @tc.desc       : test wmemcmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWmemcmp002', 0, async (done: Function) => {
      let param = 1;
      let result: number = wchar.wmemcmp(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCMP_0300
     * @tc.name       : testMuslWcharWmemcmp003
     * @tc.desc       : test wmemcmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWmemcmp003', 0, async (done: Function) => {
      let param = 2;
      let result: number = wchar.wmemcmp(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCMP_0400
     * @tc.name       : testMuslWcharWmemcmp004
     * @tc.desc       : test wmemcmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharWmemcmp004', 0, async (done: Function) => {
      let param = -1;
      let result: number = wchar.wmemcmp(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCPY_0100
     * @tc.name       : testMuslWcharWmemcpy001
     * @tc.desc       : test wmemcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWmemcpy001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wmemcpy(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCPY_0200
     * @tc.name       : testMuslWcharWmemcpy002
     * @tc.desc       : test wmemcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWmemcpy002', 0, async (done: Function) => {
      let param = 1;
      let result: number = wchar.wmemcpy(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMCPY_0300
     * @tc.name       : testMuslWcharWmemcpy003
     * @tc.desc       : test wmemcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWmemcpy003', 0, async (done: Function) => {
      let param = -1;
      let result: number = wchar.wmemcpy(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMMOVE_0100
     * @tc.name       : testMuslWcharWmemmove001
     * @tc.desc       : test wmemmove
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWmemmove001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wmemmove(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMMOVE_0200
     * @tc.name       : testMuslWcharWmemmove002
     * @tc.desc       : test wmemmove
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWmemmove002', 0, async (done: Function) => {
      let param = 1;
      let result: number = wchar.wmemmove(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WMEMSET_0100
     * @tc.name       : testMuslWcharWmemset001
     * @tc.desc       : test wmemset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWmemset001', 0, async (done: Function) => {
      let result: number = wchar.wmemset();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WPRINTF_0100
     * @tc.name       : testMuslWcharWprintf001
     * @tc.desc       : test wprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWprintf001', 0, async (done: Function) => {
      let result: number = wchar.wprintf();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSWCS_0100
     * @tc.name       : testMuslWcharWcswcs001
     * @tc.desc       : test wcswcs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcswcs001', 0, async (done: Function) => {
      let param = 0;
      let result: number = wchar.wcswcs(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_WCSWCS_0200
     * @tc.name       : testMuslWcharWcswcs002
     * @tc.desc       : test wcswcs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharWcswcs002', 0, async (done: Function) => {
      let param = -1;
      let result: number = wchar.wcswcs(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_UNGETWC_0100
     * @tc.name       : testMuslWcharUngetwc001
     * @tc.desc       : test ungetwc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWcharUngetwc001', 0, async (done: Function) => {
      let b = 97;
      let result: number = wchar.ungetwc(b);
      console.info("Test result = " + result);
      expect(result).assertEqual(97);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_BTOWC_0100
     * @tc.name       : testMuslWcharBtowc001
     * @tc.desc       : test btowc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslWcharBtowc001', 0, async (done: Function) => {
      let param = 0;
      let resultValue = 66;
      let result: number = wchar.btowc(param);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_BTOWC_0200
     * @tc.name       : testMuslWcharBtowc002
     * @tc.desc       : test btowc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslWcharBtowc002', 0, async (done: Function) => {
      let param = 2;
      let resultValue = 111;
      let result: number = wchar.btowc(param);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_FWIDE_0100
     * @tc.name       : testMuslWcharFwide001
     * @tc.desc       : test fwide
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslWcharFwide001', 0, async (done: Function) => {
      let resultValue = 1;
      let result: number = wchar.fwide();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_FPUTWC_0100
     * @tc.name       : testMuslWcharFputwc001
     * @tc.desc       : test fputwc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslWcharFputwc001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = wchar.fputwc();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_FPUTWS_0100
     * @tc.name       : testMuslWcharFputws001
     * @tc.desc       : test fputws
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslWcharFputws001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = wchar.fputws();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_WCHAR_GETWCHAR_0100
     * @tc.name     : testMuslWcharGetwchar001
     * @tc.desc     : test getwchar
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslWcharGetwchar001', 0, async (done: Function) => {
      let result: number = wchar.getwchar();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_WCHAR_PUTWC_0100
     * @tc.name     : testMuslWcharPutwc001
     * @tc.desc     : test putwc
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslWcharPutwc001', 0, async (done: Function) => {
      let result: number = wchar.putwc();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_WCHAR_PUTWCHAR_0100
     * @tc.name     : testMuslWcharPutWChar001
     * @tc.desc     : test putwchar
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslWcharPutWChar001', 0, async (done: Function) => {
      let result: number = wchar.putWChar();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_OPEN_WMEMSTREAM_0100
     * @tc.name       : testMuslWcharOpenWmemstream001
     * @tc.desc       : test open_wmemstream
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharOpenWmemstream001', 0, async (done: Function) => {
      let data:number = wchar.openWmemstream();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_MBRTOWC_0100
     * @tc.name       : testMuslWcharMbrtowc001
     * @tc.desc       : test mbrtowc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharMbrtowc001', 0, async (done: Function) => {
      let data:number = wchar.mbrtowc();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_MBSINIT_0100
     * @tc.name       : testMuslWcharMbsinit001
     * @tc.desc       : test mbsinit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharMbsinit001', 0, async (done: Function) => {
      let data:number = wchar.mbsinit();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_MBSNRTOWCS_0100
     * @tc.name       : testMuslWcharMbsnrtowcs001
     * @tc.desc       : test mbsnrtowcs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharMbsnrtowcs001', 0, async (done: Function) => {
      let data:number = wchar.mbsnrtowcs();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_MBSRTOWCS_0100
     * @tc.name       : testMuslWcharMbsrtowcs001
     * @tc.desc       : test mbsrtowcs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharMbsrtowcs001', 0, async (done: Function) => {
      let data:number = wchar.mbsrtowcs();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_MBSTOWCS_0100
     * @tc.name       : testMuslWcharMbstowcs001
     * @tc.desc       : test mbstowcs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharMbstowcs001', 0, async (done: Function) => {
      let data:number = wchar.mbstowcs();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WCHAR_MBTOWC_0100
     * @tc.name       : testMuslWcharMbtowc001
     * @tc.desc       : test mbtowc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWcharMbtowc001', 0, async (done: Function) => {
      let data:number = wchar.mbtowc();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
  })
}