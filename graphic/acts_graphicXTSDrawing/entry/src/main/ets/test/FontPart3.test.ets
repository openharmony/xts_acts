/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll , afterEach , beforeAll , beforeEach , describe , expect , it } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';
import FaultLogger from '@ohos.faultLogger';
import { getRandomNumber } from './utils';

export default function fontPart3Test() {
  describe('DrawingTsFontPart3Test' , () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2000
     * @tc.name      : testFontTextToGlyphsNormal
     * @tc.desc      : Test for testFontTextToGlyphsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontTextToGlyphsNormal' , DEFAULT , () => {
      const msg = 'testFontTextToGlyphsNormal';
      let font = new drawing.Font();

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好');
        expect(glyphs.length == 17).assertTrue();
        console.info(msg + ' textToGlyphs1 successed,glyphs:' + glyphs.length);
      } catch( e ) {
        console.info(msg + ` textToGlyphs1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好',17);
        expect(glyphs.length == 17).assertTrue();
        console.info(msg + ' textToGlyphs2 successed,glyphs:' + glyphs.length);
      } catch( e ) {
        console.info(msg + ` textToGlyphs2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好',15);
        expect(glyphs.length == 15).assertTrue();
        console.info(msg + ' textToGlyphs3 successed,glyphs:' + glyphs.length);
      } catch( e ) {
        console.info(msg + ` textToGlyphs3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs('奇8龍@Fly#龘2023!*你好',20);
        expect(glyphs.length == 20).assertTrue();
        console.info(msg + ' textToGlyphs4 successed,glyphs:' + glyphs.length);
      } catch( e ) {
        console.info(msg + ` textToGlyphs4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs("", 0);
        console.info(msg + ' textToGlyphs5 successed,glyphs:' + glyphs);
      } catch( e ) {
        console.info(msg + ` textToGlyphs5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let glyphs : number[] = font.textToGlyphs("", -1);
        console.info(msg + ' textToGlyphs6 successed,glyphs:' + glyphs);
      } catch( e ) {
        console.info(msg + ` textToGlyphs6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2001
     * @tc.name      : testFontTextToGlyphsNull
     * @tc.desc      : Test for testFontTextToGlyphsNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontTextToGlyphsNull' , DEFAULT , () => {
      const msg = 'testFontTextToGlyphsNull';
      let font = new drawing.Font();

      try {
        font.textToGlyphs(null, 2);
        console.info(msg + ' textToGlyphs successed');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs('奇8龍@Fly#龘2023!*你好', null);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs(null, 2);
        console.info(msg + ' textToGlyphs successed');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs('奇8龍@Fly#龘2023!*你好', undefined);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2002
     * @tc.name      : testFontTextToGlyphsMismatch
     * @tc.desc      : Test for testFontTextToGlyphsMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontTextToGlyphsMismatch' , DEFAULT , () => {
      const msg = 'testFontTextToGlyphsMismatch';
      let font = new drawing.Font();

      try {
        font.textToGlyphs('奇8龍@Fly#龘2023!*你好', 2, 2);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs(text);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs(111);
        console.info(msg + ' textToGlyphs succeeded');
      } catch( e ) {
        console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2003
     * @tc.name      : testFontTextToGlyphsMultipleCalls
     * @tc.desc      : Test for testFontTextToGlyphsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontTextToGlyphsMultipleCalls' , DEFAULT , () => {
      const msg = 'testFontTextToGlyphsMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomString = Math.random().toString(36).substring(2 , 12);
        try {
          let glyphs : number[] = font.textToGlyphs(randomString, 10);
          expect(glyphs.length == 10).assertTrue();
          console.info(msg + ' textToGlyphs successed,glyphs:' + glyphs.length);
        } catch( e ) {
          console.info(msg + ` textToGlyphs errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2100
     * @tc.name      : testFontGetWidthsNormal
     * @tc.desc      : Test for testFontGetWidthsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontGetWidthsNormal' , DEFAULT , () => {
      const msg = 'testFontGetWidthsNormal';
      let font = new drawing.Font();

      try {
        let widths : number[] = font.getWidths([0]);
        expect(widths.length == 1).assertTrue();
        console.info(msg + ' getWidths successed,widths:' + widths.length);
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let widths : number[] = font.getWidths([]);
        expect(widths == undefined).assertTrue();
        console.info(msg + ' getWidths successed,widths:' + widths);
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2101
     * @tc.name      : testFontGetWidthsNull
     * @tc.desc      : Test for testFontGetWidthsNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontGetWidthsNull' , DEFAULT , () => {
      const msg = 'testFontGetWidthsNull';
      let font = new drawing.Font();

      try {
        font.getWidths(null);
        console.info(msg + ' getWidths successed');
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.getWidths(undefined);
        console.info(msg + ' getWidths succeeded');
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2102
     * @tc.name      : testFontGetWidthsMismatch
     * @tc.desc      : Test for testFontGetWidthsMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontGetWidthsMismatch' , DEFAULT , () => {
      const msg = 'testFontGetWidthsMismatch';
      let font = new drawing.Font();

      try {
        font.getWidths(0,1);
        console.info(msg + ' getWidths succeeded');
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.getWidths();
        console.info(msg + ' getWidths succeeded');
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.textToGlyphs('s');
        console.info(msg + ' getWidths succeeded');
      } catch( e ) {
        console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_2103
     * @tc.name      : testFontGetWidthsMultipleCalls
     * @tc.desc      : Test for testFontGetWidthsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontGetWidthsMultipleCalls' , DEFAULT , () => {
      const msg = 'testFontGetWidthsMultipleCalls';
      let font = new drawing.Font();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          font.getWidths([getRandomNumber(1, 100)]);
          console.info(msg + ' getWidths successed');
        } catch( e ) {
          console.info(msg + ` getWidths errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
  });
}