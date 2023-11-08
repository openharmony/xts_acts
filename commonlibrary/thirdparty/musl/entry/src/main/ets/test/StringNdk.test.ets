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
import string from 'libstringndk.so'

export default function stringNdkTest() {
  describe('MuslStringTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNCMP_0100
     * @tc.name       : testMuslStringStrncmp001
     * @tc.desc       : test strncmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrncmp001',0,async (done:Function) => {
      let a = 'a';
      let b = 'a';
      let c = 1;
      let strncmpResult = string.strncmp(a,b,c);
      console.info("Test strncmpResult= " + strncmpResult);
      expect(strncmpResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNCPY_0100
     * @tc.name       : testMuslStringStrncpy001
     * @tc.desc       : test strncpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrncpy001',0,async (done:Function) => {
      let a = 'GGcdefg';
      let b  = 'ab';
      let c = 2;
      let strncpyResult = string.strncpy(a,b,c);
      console.info("Test strncpyResult= " + strncpyResult);
      expect(strncpyResult).assertEqual('abcdefg');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNCPY_0200
     * @tc.name       : testMuslStringStrncpy002
     * @tc.desc       : test strncpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrncpy002',0,async (done:Function) => {
      let a = 'GGGcdefg';
      let b  = 'ab';
      let c = 3;
      let strncpyResult = string.strncpy(a,b,c);
      console.info("Test strncpyResult= " + strncpyResult);
      expect(strncpyResult).assertEqual('ab');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNCPY_0300
     * @tc.name       : testMuslStringStrncpy003
     * @tc.desc       : test strncpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrncpy003',0,async (done:Function) => {
      let a = 'GGGcdefg';
      let b  = 'ab';
      let c = 1;
      let strncpyResult = string.strncpy(a,b,c);
      console.info("Test strncpyResult= " + strncpyResult);
      expect(strncpyResult).assertEqual('aGGcdefg');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNDUP_0100
     * @tc.name       : testMuslStringStrndup001
     * @tc.desc       : test strndup
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrndup001',0,async (done:Function) => {
      let a = 'abcdefg';
      let b = 3;
      let strndupResult = string.strndup(a,b);
      console.info("Test strndupResult= " + strndupResult);
      expect(strndupResult).assertEqual('abc');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNDUP_0200
     * @tc.name       : testMuslStringStrndup002
     * @tc.desc       : test strndup
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrndup002',0,async (done:Function) => {
      let a = 'abcdefg';
      let b = 10;
      let strndupResult = string.strndup(a,b);
      console.info("Test strndupResult= " + strndupResult);
      expect(strndupResult).assertEqual('abcdefg');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNLEN_0100
     * @tc.name       : testMuslStringStrnlen001
     * @tc.desc       : test strnlen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrnlen001',0,async (done:Function) => {
      let a = 'abcdefg';
      let b = 5;
      let strnlenResult = string.strnlen(a,b);
      console.info("Test strnlenResult= " + strnlenResult);
      expect(strnlenResult).assertEqual(5);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNLEN_0200
     * @tc.name       : testMuslStringStrnlen002
     * @tc.desc       : test strnlen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrnlen002',0,async (done:Function) => {
      let a = 'abcdefg';
      let b = 10;
      let strnlenResult = string.strnlen(a,b);
      console.info("Test strnlenResult= " + strnlenResult);
      expect(strnlenResult).assertEqual(7);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRPBRK_0100
     * @tc.name       : testMuslStringStrpbrk001
     * @tc.desc       : test strpbrk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrpbrk001',0,async (done:Function) => {
      let a = 'abcdefg';
      let b = 'ef';
      let strpbrkResult = string.strpbrk(a,b);
      console.info("Test strpbrkResult= " + strpbrkResult);
      expect(strpbrkResult).assertEqual('efg');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRPBRK_0200
     * @tc.name       : testMuslStringStrpbrk002
     * @tc.desc       : test strpbrk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrpbrk002',0,async (done:Function) => {
      let a = 'abcdefg';
      let b = 'hijk';
      let strpbrkResult = string.strpbrk(a,b);
      console.info("Test strpbrkResult= " + strpbrkResult);
      expect(strpbrkResult).assertUndefined();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRSEP_0100
     * @tc.name       : testMuslStringStrsep001
     * @tc.desc       : test strsep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrsep001',0,async (done:Function) => {
      let a = '01234-56789';
      let b = '-';
      let strsepResult = string.strsep(a,b);
      console.info("Test strsepResult= " + strsepResult);
      expect(strsepResult).assertEqual('01234');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRSPN_0200
     * @tc.name       : testMuslStringStrspn002
     * @tc.desc       : test strspn
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrspn002',0,async (done:Function) => {
      let a = '0123456789';
      let b = 'abcd';
      let strspnResult = string.strspn(a,b);
      console.info("Test strspnResult= " + strspnResult);
      expect(strspnResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRSTR_0100
     * @tc.name       : testMuslStringStrstr001
     * @tc.desc       : test strstr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrstr001',0,async (done:Function) => {
      let a = '0123456789';
      let b = '0';
      let strstrResult = string.strstr(a,b);
      console.info("Test strstrResult= " + strstrResult);
      expect(strstrResult).assertEqual('0123456789');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRSTR_0200
     * @tc.name       : testMuslStringStrstr002
     * @tc.desc       : test strstr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrstr002',0,async (done:Function) => {
      let a = '0123456789';
      let b = 'a';
      let strstrResult = string.strstr(a,b);
      console.info("Test strstrResult= " + strstrResult);
      expect(strstrResult).assertUndefined();
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRTOK_0100
     * @tc.name       : testMuslStringStrtok001
     * @tc.desc       : test strtok
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrtok001',0,async (done:Function) => {
      let a = '01234-56789';
      let b = '-';
      let strtokResult = string.strtok(a,b);
      console.info("Test strtokResult= " + strtokResult);
      expect(strtokResult).assertEqual('01234');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRTOK_0200
     * @tc.name       : testMuslStringStrtok002
     * @tc.desc       : test strtok
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrtok002',0,async (done:Function) => {
      let a = '01234-56789';
      let b = 'a';
      let strtokResult = string.strtok(a,b);
      console.info("Test strtokResult= " + strtokResult);
      expect(strtokResult).assertEqual('01234-56789');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRTOKR_0100
     * @tc.name       : testMuslStringStrtokR001
     * @tc.desc       : test strtok_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrtokR001',0,async (done:Function) => {
      let a = 'ab,cd,ef';
      let b = ',';
      let strtokRResult = string.strtokR(a,b);
      console.info("Test strtokRResult= " + strtokRResult);
      expect(strtokRResult).assertEqual('ab');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRTOKR_0200
     * @tc.name       : testMuslStringStrtokR002
     * @tc.desc       : test strtok_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrtokR002',0,async (done:Function) => {
      let a = 'ab,cd,ef';
      let b = '1';
      let strtokRResult = string.strtokR(a,b);
      console.info("Test strtokRResult= " + strtokRResult);
      expect(strtokRResult).assertEqual('ab,cd,ef');
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRXFRM_0100
     * @tc.name       : testMuslStringStrxfrm001
     * @tc.desc       : test strxfrm
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrxfrm001',0,async (done:Function) => {
      let a = 0;
      let b = 'abcdefg';
      let c = 10;
      let strxfrmResult = string.strxfrm(a,b,c);
      console.info("Test strxfrmResult= " + strxfrmResult);
      expect(strxfrmResult).assertEqual(7);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRXFRM_0200
     * @tc.name       : testMuslStringStrxfrm002
     * @tc.desc       : test strxfrm
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrxfrm002',0,async (done:Function) => {
      let a = 1;
      let b = 'abcdefg';
      let c = 4;
      let strxfrmResult = string.strxfrm(a,b,c);
      console.info("Test strxfrmResult= " + strxfrmResult);
      expect(strxfrmResult).assertEqual(7);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRERROR_L_0100
     * @tc.name       : testMuslStringStrerrorL001
     * @tc.desc       : test strerror_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrerrorL001', 0, async (done: Function) => {
      let a = string.strerror_l(-1);
      let b = (a != null);
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRERROR_L_0200
     * @tc.name       : testMuslStringStrerrorL002
     * @tc.desc       : test strerror_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrerrorL002', 0, async (done: Function) => {
      let a = string.strerror_l(-1);
      let b = (a != null);
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRERROR_L_0300
     * @tc.name       : testMuslStringStrerrorL003
     * @tc.desc       : test strerror_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrerrorL003', 0, async (done: Function) => {
      let a = string.strerror_l(2);
      let b = (a != null);
      expect(b).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRDUP_0100
     * @tc.name       : testMuslStringStrdup001
     * @tc.desc       : test strdup
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrdup001', 0, async (done: Function) => {
      let a = "AB"
      let b = string.strdup(a);
      expect(b).assertEqual(a);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCAT_0100
     * @tc.name       : testMuslStringStrdup001
     * @tc.desc       : test strcat
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcat001', 0, async (done: Function) => {
      let a = "AB"
      let b = "CD"
      let c = string.strcat(a, b);
      let d = "ABCD"
      expect(c).assertEqual(d);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCHR_0100
     * @tc.name       : testMuslStringStrchr001
     * @tc.desc       : test strchr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrchr001', 0, async (done: Function) => {
      let a = "0009876"
      let c = string.strchr(a);
      expect(c).assertEqual("9876");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCMP_0100
     * @tc.name       : testMuslStringStrcmp001
     * @tc.desc       : test strcmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcmp001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "ABCD"
      let c = string.strcmp(a, b);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCMP_0200
     * @tc.name       : testMuslStringStrcmp002
     * @tc.desc       : test strcmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcmp002', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "ABCDE"
      let c = string.strcmp(a, b);
      let d = (c < 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCMP_0300
     * @tc.name       : testMuslStringStrcmp003
     * @tc.desc       : test strcmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcmp003', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "AB"
      let c = string.strcmp(a, b);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCOLL_0100
     * @tc.name       : testMuslStringStrcoll001
     * @tc.desc       : test strcoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcoll001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "ABCD"
      let c = string.strcoll(a, b);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCOLL_0200
     * @tc.name       : testMuslStringStrcoll002
     * @tc.desc       : test strcoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcoll002', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "ABCDE"
      let c = string.strcoll(a, b);
      let d = (c < 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCOLL_0300
     * @tc.name       : testMuslStringStrcoll003
     * @tc.desc       : test strcoll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcoll003', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "AB"
      let c = string.strcoll(a, b);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCOLL_L_0100
     * @tc.name       : testMuslStringStrcoll001
     * @tc.desc       : test strcoll_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcollL001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "ABCD"
      let c = string.strcoll_l(a, b);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCOLL_L_0200
     * @tc.name       : testMuslStringStrcoll002
     * @tc.desc       : test strcoll_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcollL002', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "ABCDE"
      let c = string.strcoll_l(a, b);
      let d = (c < 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRCOLL_L_0300
     * @tc.name       : testMuslStringStrcoll003
     * @tc.desc       : test strcoll_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrcollL003', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "AB"
      let c = string.strcoll_l(a, b);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRLEN_0100
     * @tc.name       : testMuslStringStrlen001
     * @tc.desc       : test strlen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrlen001', 0, async (done: Function) => {
      let a = "ABCD"
      let c = string.strlen(a);
      expect(c).assertEqual(4);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRING_STRNCAT_0100
     * @tc.name       : testMuslStringStrncat001
     * @tc.desc       : test strncat
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringStrncat001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "ABCD"
      let c = string.strncat(a, b, 10);
      expect(c).assertEqual("ABCD");
      done()
    });
  })

}