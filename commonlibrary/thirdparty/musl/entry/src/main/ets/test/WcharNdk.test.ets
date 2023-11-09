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
      let result = wchar.wcpcpy();
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
      let result = wchar.wcscat();
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
      let result = wchar.wcschr();
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
      let result = wchar.wcscmp();
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
      let result = wchar.wcscoll();
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
      let result = wchar.wcscpy();
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
      let result = wchar.wcscspn();
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
      let result = wchar.wcsdup();
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
      let result = wchar.wcslen();
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
      let result = wchar.wcsncat();
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
      let result = wchar.wcsncmp(param);
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
      let answer = wchar.wcsncmp(param);
      console.info("Test wcsncmp result = " + JSON.stringify(answer));
      let result = answer > 0
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
      let result = wchar.wcsnlen(param);
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
      let result = wchar.wcsnlen(param);
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
      let result = wchar.wcspbrk();
      console.info("Test wcsnlen result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });


  })
}