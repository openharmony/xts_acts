/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, expect, it } from '@ohos/hypium';

function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans
}

export default function ConsoleTest() {
  describe('ConsoleTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0100
     * @tc.name       : testLoadNativeModule001
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule001', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule("a");
      } catch (e) {
        console.log("flag");
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("a");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0200
     * @tc.name       : testLoadNativeModule002
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule002', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule(undefined);
      } catch (e) {
        console.log("flag");
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("The number of parameters received by loadNativeModule is incorrect");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0300
     * @tc.name       : testLoadNativeModule003
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule003', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule(null);
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("The number of parameters received by loadNativeModule is incorrect");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0400
     * @tc.name       : testLoadNativeModule004
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testLoadNativeModule004', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule("");
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0500
     * @tc.name       : testLoadNativeModule005
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule005', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0600
     * @tc.name       : testLoadNativeModule006
     * @tc.desc       : Test LoadNativeModule.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule006', 0, async (done: Function) => {
      try {
        let flag =
          loadNativeModule("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0700
     * @tc.name       : testLoadNativeModule007
     * @tc.desc       : Test LoadNativeModule with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule007', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule("  !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0800
     * @tc.name       : testLoadNativeModule008
     * @tc.desc       : Test LoadNativeModule with bell character.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule008', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule("\a 响铃");
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("\a 响铃");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_0900
     * @tc.name       : testLoadNativeModule009
     * @tc.desc       : Test LoadNativeModule with backspace.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule009', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\b 退格');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\b 退格');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1000
     * @tc.name       : testLoadNativeModule010
     * @tc.desc       : Test LoadNativeModule with form feed.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule010', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\f 换页');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\f 换页');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1100
     * @tc.name       : testLoadNativeModule011
     * @tc.desc       : Test LoadNativeModule with newline.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule011', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\n 换行');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\n 换行');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1200
     * @tc.name       : testLoadNativeModule012
     * @tc.desc       : Test LoadNativeModule with carriage return.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule012', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\r 回车');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\r 回车');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1300
     * @tc.name       : testLoadNativeModule013
     * @tc.desc       : Test LoadNativeModule with horizontal tab.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule013', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\t 水平制表');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\t 水平制表');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1400
     * @tc.name       : testLoadNativeModule014
     * @tc.desc       : Test LoadNativeModule with vertical tab.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule014', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\v 垂直制表');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\v 垂直制表');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1500
     * @tc.name       : testLoadNativeModule015
     * @tc.desc       : Test LoadNativeModule with backslash.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule015', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\ 反斜杠');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\ 反斜杠');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1600
     * @tc.name       : testLoadNativeModule016
     * @tc.desc       : Test LoadNativeModule with single quote.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule016', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule("\' 单引号");
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("\' 单引号");
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1700
     * @tc.name       : testLoadNativeModule017
     * @tc.desc       : Test LoadNativeModule with double quote.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule017', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\" 双引号');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\" 双引号');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1800
     * @tc.name       : testLoadNativeModule018
     * @tc.desc       : Test LoadNativeModule with question mark.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule018', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\? 问号');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\? 问号');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_1900
     * @tc.name       : testLoadNativeModule019
     * @tc.desc       : Test LoadNativeModule with null character.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule019', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\0 空字符');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\0 空字符');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2000
     * @tc.name       : testLoadNativeModule020
     * @tc.desc       : Test LoadNativeModule with octal number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule020', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\d72 八进制任意数字');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\d72 八进制任意数字');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2100
     * @tc.name       : testLoadNativeModule021
     * @tc.desc       : Test LoadNativeModule with hexadecimal number.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule021', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\x85 十六进制任意数字');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('\x85 十六进制任意数字');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2200
     * @tc.name       : testLoadNativeModule022
     * @tc.desc       : Test LoadNativeModule with pointing up emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule022', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('👆 \ud83d\udc46');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('👆 \ud83d\udc46');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2300
     * @tc.name       : testLoadNativeModule023
     * @tc.desc       : Test LoadNativeModule with angry face emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule023', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('👿 \ud83d\udc7f');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('👿 \ud83d\udc7f');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2400
     * @tc.name       : testLoadNativeModule024
     * @tc.desc       : Test LoadNativeModule with eyes emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule024', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('👀 \ud83d\udc40');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('👀 \ud83d\udc40');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2500
     * @tc.name       : testLoadNativeModule025
     * @tc.desc       : Test LoadNativeModule with 100 points emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule025', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('💯 \ud83d\udcaf');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('💯 \ud83d\udcaf');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2600
     * @tc.name       : testLoadNativeModule026
     * @tc.desc       : Test LoadNativeModule with Santa Claus emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule026', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('🎅 \ud83c\udf85');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🎅 \ud83c\udf85');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2700
     * @tc.name       : testLoadNativeModule027
     * @tc.desc       : Test LoadNativeModule with cat face with wry smile emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule027', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('😼 \ud83d\ude3c');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('😼 \ud83d\ude3c');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2800
     * @tc.name       : testLoadNativeModule028
     * @tc.desc       : Test LoadNativeModule with wrench emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule028', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('🔧 \ud83d\udd27');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🔧 \ud83d\udd27');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_2900
     * @tc.name       : testLoadNativeModule029
     * @tc.desc       : Test LoadNativeModule with haircut emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule029', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('💇 \ud83d\udc87');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('💇 \ud83d\udc87');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3000
     * @tc.name       : testLoadNativeModule030
     * @tc.desc       : Test LoadNativeModule with men wrestling emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule030', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3100
     * @tc.name       : testLoadNativeModule031
     * @tc.desc       : Test LoadNativeModule with oil drum emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule031', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('🛢 \ud83d\udee2');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🛢 \ud83d\udee2');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3200
     * @tc.name       : testLoadNativeModule032
     * @tc.desc       : Test LoadNativeModule with mahjong tile red dragon emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule032', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('🀄 \ud83c\udc04');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🀄 \ud83c\udc04');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3300
     * @tc.name       : testLoadNativeModule033
     * @tc.desc       : Test LoadNativeModule with black flag emoji.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule033', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('🏴 \ud83c\udff4');
      } catch (e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain('🏴 \ud83c\udff4');
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3400
     * @tc.name       : testLoadNativeModule034
     * @tc.desc       : Test LoadNativeModule with custom initialization.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule034', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule(init(200));
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3500
     * @tc.name       : testLoadNativeModule035
     * @tc.desc       : Test LoadNativeModule with object string manipulation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule035', 0, async (done: Function) => {
      try {
        let str = "{k1:value1,k2:value2}";
        let result = str.substring(0, str.length - 2)
        let flag = loadNativeModule(result);
      } catch (e) {
        expect(e.code).assertEqual(10200301);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3600
     * @tc.name       : testLoadNativeModule036
     * @tc.desc       : Test LoadNativeModule with \ud83c.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule036', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\ud83c');
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LOAD_NATIVE_MODULE_3700
     * @tc.name       : testLoadNativeModule037
     * @tc.desc       : Test LoadNativeModule with \u200d\u2642.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadNativeModule037', 0, async (done: Function) => {
      try {
        let flag = loadNativeModule('\u200d\u2642');
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    });
  })
}


