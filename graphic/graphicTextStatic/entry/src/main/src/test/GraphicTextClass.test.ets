/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import image from "@ohos.multimedia.image";
import drawing from "@ohos.graphics.drawing";
import { buildParagraph } from '../model/Utils';
import common2D from '@ohos.graphics.common2D';

export default function GraphicTextClass() {

  describe('GraphicTextClass', () => {
    let pixel: image.PixelMap;
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100, width: 100//100为创建的PixelMap的宽高
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })

    /**
     * @tc.number    : testLayoutSyncStatic
     * @tc.name      : testLayoutSyncStatic
     * @tc.desc      : To test Paragraph layoutSyncSync interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLayoutSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let msg = "testLayoutSync"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
        paragraph.layoutSync(100);
      } catch (err) {
        console.info(msg + 'layoutSync error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : testPaintStatic
     * @tc.name      : testPaintStatic
     * @tc.desc      : To test Paragraph Paint interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPaintStatic_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const msg = 'testCanvasConstructorNormalStatic';
        let canvas = new drawing.Canvas(pixel)
        let paragraph: text.Paragraph = buildParagraph();
        try {
          paragraph.paint(canvas, 10, 10);
          console.info(msg + 'canvasConstructor successed');
          expect(true).assertTrue();
        } catch (e: BusinessError) {
          console.info(msg + `canvasConstructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_021
     * @tc.name      : testParagraphBuilder_AonstructorAndAddText
     * @tc.desc      : Constructs a ParagraphBuilder object and calls its methods
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testParagraphBuilder_AonstructorAndAddText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let msg = "testParagraphBuilder_AonstructorAndAddText"
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };

      let myTextStyleTwo: text.TextStyle = {
        color : {alpha: 255, red: 255, green: 0, blue: 0},
        fontSize : 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle : myTextStyle,
        align: text.TextAlign.JUSTIFY,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
      try {
        paragraphGraphBuilder.pushStyle(myTextStyle);
        console.info(msg + 'pushStyle successed');
      } catch (err) {
        console.info(msg + 'first pushStyle error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.addText("123666");
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'first addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.pushStyle(myTextStyleTwo);
        console.info(msg + 'pushStyle successed second');
      } catch (err) {
        console.info(msg + 'second pushStyle error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.popStyle();
        console.info(msg + 'popStyle successed');
      } catch (err) {
        console.info(msg + 'popStyle error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.addText("1235555");
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        let paragraph = paragraphGraphBuilder.build();
        console.info(msg + 'build successed');
      } catch (err) {
        console.info(msg + 'build error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_005
     * @tc.name      : testParagraph_GetLongestLine_Parameter
     * @tc.desc      : To test Paragraph GetLongestLine interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetLongestLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let msg = "testGetLongestLine"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
        let line = paragraph.getLongestLine();
        expect(line != null).assertTrue();
      } catch (err) {
        console.info(msg + 'getLongestLine error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    })


  })
}
