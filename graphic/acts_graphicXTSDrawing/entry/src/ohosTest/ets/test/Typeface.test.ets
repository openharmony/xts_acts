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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';

export default function typefaceTest() {
  describe('DrawingTsTypeFaceTest', () => {
    const DEFAULT = 0;
    const FONT_PATH = "/system/fonts/Harmon" + "yOS_Sans_Italic.ttf";

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0100
     * @tc.name      : testTypeFaceGetFamilyNameNormal
     * @tc.desc      : Test for testTypeFaceGetFamilyNameNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTypeFaceGetFamilyNameNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTypeFaceGetFamilyNameNormal';
      try {
        let font = new drawing.Font();
        let typeface = font.getTypeface();
        typeface.getFamilyName();
        console.info(msg + ' getFamilyName successed');
      } catch (e) {
        console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0102
     * @tc.name      : testTypeFaceGetFamilyNameMultipleCalls
     * @tc.desc      : Test for testTypeFaceGetFamilyNameMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceGetFamilyNameMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceGetFamilyNameMultipleCalls';

      let font = new drawing.Font();
      let typeface = font.getTypeface();
      for (let i = 0; i < 20; i++) {
        try {
          typeface.getFamilyName();
          console.info(msg + ' getFamilyName successed');
        } catch (e) {
          console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0200
     * @tc.name      : testTypeFaceMakeFromFileNormal
     * @tc.desc      : testTypeFaceMakeFromFileNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTypeFaceMakeFromFileNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTypeFaceMakeFromFileNormal';
      let font = new drawing.Font();

      try {
        let str = FONT_PATH;
        let mytypeface = drawing.Typeface.makeFromFile(str);

        mytypeface = drawing.Typeface.makeFromFile("");

        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0202
     * @tc.name      : testTypeFaceMakeFromFileMultipleCalls
     * @tc.desc      : testTypeFaceMakeFromFileMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromFileMultipleCalls';
      let font = new drawing.Font();

      try {
        for (let i = 0; i < 20; i += 1) {
          let str = FONT_PATH;
          const mytypeface = drawing.Typeface.makeFromFile(str);
        }

        console.info(msg + ' test succeeded.');
      } catch (e) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0203
     * @tc.name      : testTypeFaceMakeFromFileAbnormal
     * @tc.desc      : testTypeFaceMakeFromFileAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromFileAbnormal';

      try {
        const mytypeface = drawing.Typeface.makeFromFile("hello_world");
        console.info(msg + ' test failed.');
      } catch (e) {
        console.info(msg + ` test succeeded, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        const mytypeface = drawing.Typeface.makeFromFile("/system/fonts/FakePath.ttf");
        console.info(msg + ' test failed.');
      } catch (e) {
        console.info(msg + ` test succeeded, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0302
     * @tc.name      : testTypeFaceMakeFromRawFileAbnormal
     * @tc.desc      : testTypeFaceMakeFromRawFileAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileAbnormal';
      try {
        const mytypeface:drawing.Typeface = drawing.Typeface.makeFromRawFile($rawfile('image.png'));
        console.info(msg + ' makeFromRawFile image.png success' + JSON.stringify(mytypeface));
        expect(mytypeface == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeFromRawFile image.png errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0301
     * @tc.name      : testTypeFaceMakeFromRawFileMultipleCalls
     * @tc.desc      : testTypeFaceMakeFromRawFileMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileMultipleCalls';
      try {
        for (let i = 0; i < 20; i += 1) {
          let mytypeface:drawing.Typeface = drawing.Typeface.makeFromRawFile($rawfile('HarmonyOS_Sans_Condensed.ttf'));
          console.info(msg + ' makeFromRawFile HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface));
          expect(!!mytypeface).assertTrue();
        }
      } catch (e) {
        console.info(msg + ` makeFromRawFile HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0300
     * @tc.name      : testTypeFaceMakeFromRawFileNormal
     * @tc.desc      : testTypeFaceMakeFromRawFileNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileNormal';
      try {
        let mytypeface:drawing.Typeface = drawing.Typeface.makeFromRawFile($rawfile('HarmonyOS_Sans_Condensed.ttf'));
        console.info(msg + ' makeFromRawFile HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface));
        expect(!!mytypeface).assertTrue();
      } catch (e) {
        console.info(msg + ` makeFromRawFile HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let mytypeface2:drawing.Typeface = drawing.Typeface.makeFromRawFile($rawfile('ttf/HarmonyOS_Sans_Condensed.ttf'));
        console.info(msg + ' makeFromRawFile ttf/HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface2));
        expect(!!mytypeface2).assertTrue();
      } catch (e) {
        console.info(msg + ` makeFromRawFile ttf/HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0303
     * @tc.name      : testTypeFaceMakeFromRawFileNull
     * @tc.desc      : testTypeFaceMakeFromRawFileNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileNull';
      try {
        drawing.Typeface.makeFromRawFile(null);
        console.info(msg + ' makeFromRawFile null success');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromRawFile null errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        drawing.Typeface.makeFromRawFile(undefined);
        console.info(msg + ' makeFromRawFile undefined success');
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromRawFile undefined errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0400
     * @tc.name      : testTypeFaceMakeFromFileWithArgumentsNormal
     * @tc.desc      : testTypeFaceMakeFromFileWithArgumentsNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeFaceMakeFromFileWithArgumentsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTypeFaceMakeFromFileWithArgumentsNormal';
      let str = "/system/fonts/HarmonyOS_Sans_Italic.ttf";
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface = drawing.Typeface.makeFromFileWithArguments(str, typeFaceArgument);
        console.info(msg + ' makeFromFileWithArguments successed');
        expect(mytypeface != null || mytypeface != undefined).assertTrue()
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0401
     * @tc.name      : testTypeFaceMakeFromFileWithArgumentsMultipleCalls
     * @tc.desc      : testTypeFaceMakeFromFileWithArgumentsMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileWithArgumentsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromFileWithArgumentsMultipleCalls';
      for (let i = 0; i < 20; i++) {
        let str = "/system/fonts/HarmonyOS_Sans_Italic.ttf";
        try {
          let typeFaceArgument = new drawing.TypefaceArguments();
          let mytypeface = drawing.Typeface.makeFromFileWithArguments(str, typeFaceArgument);
          console.info(msg + ' makeFromFileWithArguments successed step: ' + i );
          expect(mytypeface != null || mytypeface != undefined).assertTrue()
        } catch (e) {
          console.info(msg + ` makeFromFileWithArguments errorCode is:  ${e.code}, errorMessage is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0402
     * @tc.name      : testTypeFaceMakeFromFileWithArgumentsNull
     * @tc.desc      : testTypeFaceMakeFromFileWithArgumentsNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileWithArgumentsNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromFileWithArgumentsNull';
      let str = "/system/fonts/HarmonyOS_Sans_Italic.ttf";
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface = drawing.Typeface.makeFromFileWithArguments(null, typeFaceArgument);
        console.info(msg + ` makeFromFileWithArguments mytypeface success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface2 = drawing.Typeface.makeFromFileWithArguments(undefined, typeFaceArgument);
        console.info(msg + ` makeFromFileWithArguments mytypeface2 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface3 = drawing.Typeface.makeFromFileWithArguments(str, null);
        console.info(msg + ` makeFromFileWithArguments mytypeface3 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface3 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface4 = drawing.Typeface.makeFromFileWithArguments(str, undefined);
        console.info(msg + ` makeFromFileWithArguments mytypeface4 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface4 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        let mytypeface5 = drawing.Typeface.makeFromFileWithArguments("", typeFaceArgument);
        console.info(msg + ` makeFromFileWithArguments mytypeface5 success`);
        expect(mytypeface5).assertEqual(undefined);
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface5 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0403
     * @tc.name      : testTypeFaceMakeFromFileWithArgumentsAbnormal
     * @tc.desc      : testTypeFaceMakeFromFileWithArgumentsAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileWithArgumentsAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromFileWithArgumentsAbnormal';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        let mytypeface1 = drawing.Typeface.makeFromFileWithArguments('testTypeFaceMakeFromFileWithArgumentsAbnormal', typeFaceArgument);
        console.info(msg + ` makeFromFileWithArguments mytypeface1 success`);
        expect(mytypeface1).assertEqual(undefined);
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface1 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let mytypeface2 = drawing.Typeface.makeFromFileWithArguments('/system/fonts', typeFaceArgument);
        console.info(msg + ` makeFromFileWithArguments mytypeface2 success`);
        expect(mytypeface2).assertEqual(undefined);
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0500
     * @tc.name      : testTypeFaceMakeFromCurrentNormal
     * @tc.desc      : testTypeFaceMakeFromCurrentNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeFaceMakeFromCurrentNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTypeFaceMakeFromCurrentNormal';
      let typeArguments = new drawing.TypefaceArguments();
      let myTypeFace = drawing.Typeface.makeFromFile("/system/fonts/HarmonyOS_Sans_SC.ttf");
      try {
        let  typeFace1 = myTypeFace.makeFromCurrent(typeArguments);
        console.info(msg + ' makeFromCurrent typeFace1 successed');
        expect(typeFace1 != null || typeFace1 != undefined).assertTrue()
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments typeFace1 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      typeArguments.addVariation("wght", 100);
      try {
        let  typeFace2 = myTypeFace.makeFromCurrent(typeArguments);
        console.info(msg + ' makeFromCurrent typeFace2 successed');
        expect(typeFace2 != null || typeFace2 != undefined).assertTrue()
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments typeFace2  errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0501
     * @tc.name      : testTypeFaceMakeFromCurrentMultipleCalls
     * @tc.desc      : testTypeFaceMakeFromCurrentMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromCurrentMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromCurrentMultipleCalls';
      for (let i = 0; i < 20; i++) {
        let typeArguments = new drawing.TypefaceArguments();
        let myTypeFace = drawing.Typeface.makeFromFile("/system/fonts/HarmonyOS_Sans_SC.ttf");
        try {
          let  typeFace1 = myTypeFace.makeFromCurrent(typeArguments)
          console.info(msg + ' makeFromCurrent successed step: ' + i );
          expect(typeFace1 != null || typeFace1 != undefined).assertTrue()
        } catch (e) {
          console.info(msg + ` makeFromCurrent errorCode is:  ${e.code}, errorMessage is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0502
     * @tc.name      : testTypeFaceMakeFromCurrentNull
     * @tc.desc      : testTypeFaceMakeFromCurrentNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromCurrentNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromCurrentNull';
      let typeArguments = new drawing.TypefaceArguments();
      let myTypeFace = drawing.Typeface.makeFromFile("/system/fonts/HarmonyOS_Sans_SC.ttf");
      try {
        let typeFace1 = myTypeFace.makeFromCurrent(null);
        console.info(msg + ` makeFromCurrent typeFace1 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromCurrent typeFace1 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let typeFace2 = myTypeFace.makeFromCurrent(undefined);
        console.info(msg + ` makeFromCurrent typeFace2 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromCurrent typeFace2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0600
     * @tc.name      : testTypeFaceMakeFromRawFileWithArgumentsNormal
     * @tc.desc      : testTypeFaceMakeFromRawFileWithArgumentsNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeFaceMakeFromRawFileWithArgumentsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTypeFaceMakeFromRawFileWithArgumentsNormal';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        let myTypeFace = drawing.Typeface.makeFromRawFileWithArguments($rawfile('HarmonyOS_Sans_Condensed.ttf'), typeFaceArgument);
        console.info(msg + ' makeFromRawFileWithArguments myTypeFace successed');
        expect(myTypeFace != null || myTypeFace != undefined).assertTrue()
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments myTypeFace errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let myTypeFace2 = drawing.Typeface.makeFromRawFileWithArguments($rawfile('ttf/HarmonyOS_Sans_Condensed.ttf'), typeFaceArgument);
        console.info(msg + ' makeFromRawFileWithArguments myTypeFace2 successed');
        expect(myTypeFace2 != null || myTypeFace2 != undefined).assertTrue()
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments myTypeFace2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0601
     * @tc.name      : testTypeFaceMakeFromRawFileWithArgumentsMultipleCalls
     * @tc.desc      : testTypeFaceMakeFromRawFileWithArgumentsMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileWithArgumentsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileWithArgumentsMultipleCalls';
      for (let i = 0; i < 20; i++) {
        try {
          let typeFaceArgument = new drawing.TypefaceArguments();
          let myTypeFace = drawing.Typeface.makeFromRawFileWithArguments($rawfile('HarmonyOS_Sans_Condensed.ttf'), typeFaceArgument)
          console.info(msg + ' makeFromRawFileWithArguments successed step: ' + i );
          expect(myTypeFace != null || myTypeFace != undefined).assertTrue()
        } catch (e) {
          console.info(msg + ` makeFromRawFileWithArguments errorCode is:  ${e.code}, errorMessage is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0602
     * @tc.name      : testTypeFaceMakeFromRawFileWithArgumentsNull
     * @tc.desc      : testTypeFaceMakeFromRawFileWithArgumentsNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileWithArgumentsNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileWithArgumentsNull';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        let myTypeFace = drawing.Typeface.makeFromRawFileWithArguments(null, typeFaceArgument);
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let myTypeFace2 = drawing.Typeface.makeFromRawFileWithArguments(undefined, typeFaceArgument);
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace2 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let myTypeFace3 = drawing.Typeface.makeFromRawFileWithArguments($rawfile('HarmonyOS_Sans_Condensed.ttf'), null);
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace3 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace3 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
      try {
        let myTypeFace4 = drawing.Typeface.makeFromRawFileWithArguments($rawfile('HarmonyOS_Sans_Condensed.ttf'), undefined);
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace4 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromRawFileWithArguments myTypeFace4 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_0603
     * @tc.name      : testTypeFaceMakeFromRawFileWithArgumentsAbnormal
     * @tc.desc      : testTypeFaceMakeFromRawFileWithArgumentsAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileWithArgumentsAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileWithArgumentsAbnormal';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        let myTypeFace = drawing.Typeface.makeFromRawFileWithArguments($rawfile('image.png'), typeFaceArgument);
        console.info(msg + ` makeFromFileWithArguments myTypeFace success`);
        expect(myTypeFace).assertEqual(undefined)
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments myTypeFace errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let myTypeFace2 = drawing.Typeface.makeFromRawFileWithArguments($r('app.boolean.apptest1'), typeFaceArgument);
        console.info(msg + ` makeFromFileWithArguments myTypeFace2 success`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` makeFromFileWithArguments mytypeface2 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    });
  })
}