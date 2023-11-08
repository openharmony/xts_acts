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
import strings from 'libstringsndk.so'

export default function stringsNdkTest() {
  describe('MuslStringsTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0100
     * @tc.name       : testMuslStringsStrcasecmp001
     * @tc.desc       : test strcasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmp001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "abcd"
      let c = strings.strcasecmp(a, b);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0200
     * @tc.name       : testMuslStringsStrcasecmp002
     * @tc.desc       : test strcasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmp002', 0, async (done: Function) => {
      let a = "AB"
      let b = "abcd"
      let c = strings.strcasecmp(a, b);
      let d = (c < 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMP_0300
     * @tc.name       : testMuslStringsStrcasecmp003
     * @tc.desc       : test strcasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmp003', 0, async (done: Function) => {
      let a = "efg"
      let b = "abcd"
      let c = strings.strcasecmp(a, b);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0100
     * @tc.name       : testMuslStringsStrcasecmpL001
     * @tc.desc       : test strcasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmpL001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "abcd"
      let c = strings.strcasecmp_l(a, b);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0200
     * @tc.name       : testMuslStringsStrcasecmpL002
     * @tc.desc       : test strcasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmpL002', 0, async (done: Function) => {
      let a = "AB"
      let b = "abcd"
      let c = strings.strcasecmp_l(a, b);
      let d = (c < 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCASECMPL_0300
     * @tc.name       : testMuslStringsStrcasecmpL003
     * @tc.desc       : test strcasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcasecmpL003', 0, async (done: Function) => {
      let a = "efg"
      let b = "abcd"
      let c = strings.strcasecmp_l(a, b);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0100
     * @tc.name       : testMuslStringsStrncasecmp001
     * @tc.desc       : test strncasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "abcd"
      let c = strings.strncasecmp(a, b, 10);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0200
     * @tc.name       : testMuslStringsStrncasecmp002
     * @tc.desc       : test strncasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp002', 0, async (done: Function) => {
      let a = "AB"
      let b = "abcd"
      let c = strings.strncasecmp(a, b, 10);
      let d = (c < 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0300
     * @tc.name       : testMuslStringsStrncasecmp003
     * @tc.desc       : test strncasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp003', 0, async (done: Function) => {
      let a = "AB"
      let b = "abcd"
      let c = strings.strncasecmp(a, b, 2);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_0400
     * @tc.name       : testMuslStringsStrncasecmp004
     * @tc.desc       : test strncasecmp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmp004', 0, async (done: Function) => {
      let a = "efg"
      let b = "abcd"
      let c = strings.strncasecmp(a, b, 10);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0100
     * @tc.name       : testMuslStringsStrncasecmpL001
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "abcd"
      let c = strings.strncasecmp_l(a, b, 10, 0);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0200
     * @tc.name       : testMuslStringsStrncasecmpL002
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL002', 0, async (done: Function) => {
      let a = "AB"
      let b = "abcd"
      let c = strings.strncasecmp_l(a, b, 10, 0);
      let d = (c < 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0300
     * @tc.name       : testMuslStringsStrncasecmpL003
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL003', 0, async (done: Function) => {
      let a = "AB"
      let b = "abcd"
      let c = strings.strncasecmp_l(a, b, 2, 0);
      let d = (c == 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0400
     * @tc.name       : testMuslStringsStrncasecmpL004
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL004', 0, async (done: Function) => {
      let a = "efg"
      let b = "abcd"
      let c = strings.strncasecmp_l(a, b, 10, 0);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRNCASECMP_L_0500
     * @tc.name       : testMuslStringsStrncasecmpL005
     * @tc.desc       : test strncasecmp_l
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrncasecmpL005', 0, async (done: Function) => {
      let a = "efg"
      let b = "abcd"
      let c = strings.strncasecmp_l(a, b, 10, -1);
      let d = (c > 0);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STPCPY_0100
     * @tc.name       : testMuslStringsStpcpy001
     * @tc.desc       : test stpcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStpcpy001', 0, async (done: Function) => {
      let a = "ABCD"
      let c = strings.stpcpy(a);
      expect(c).assertEqual(a);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STPCPY_0200
     * @tc.name       : testMuslStringsStpcpy002
     * @tc.desc       : test stpcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStpcpy002', 0, async (done: Function) => {
      let a = "ABCDEFG"
      let c = strings.stpcpy(a);
      expect(c).assertEqual(a);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCPY_0100
     * @tc.name       : testMuslStringsStrcpy001
     * @tc.desc       : test strcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcpy001', 0, async (done: Function) => {
      let a = "AB"
      let c = strings.strcpy(a);
      expect(a).assertEqual(c);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCPY_0200
     * @tc.name       : testMuslStringsStrcpy002
     * @tc.desc       : test strcpy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcpy002', 0, async (done: Function) => {
      let a = "ABCDEF"
      let c = strings.strcpy(a);
      expect(c).assertEqual(a);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCSPN_0100
     * @tc.name       : testMuslStringsStrcspn001
     * @tc.desc       : test strcspn
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcspn001', 0, async (done: Function) => {
      let a = "ABCD"
      let b = "AB"
      let c = strings.strcspn(a, b);
      expect(c).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STRINGS_STRCSPN_0200
     * @tc.name       : testMuslStringsStrcspn002
     * @tc.desc       : test strcspn
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStringsStrcspn002', 0, async (done: Function) => {
      let a = "ABCDEF"
      let b = "G"
      let c = strings.strcspn(a, b);
      expect(c).assertEqual(6);
      done()
    });
  })
}