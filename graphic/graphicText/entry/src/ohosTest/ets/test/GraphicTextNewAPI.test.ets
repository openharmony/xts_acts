/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, 
WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import { text, drawing, common2D } from "@kit.ArkGraphics2D"

export default function graphicTextNewAPI() {
  describe('graphicTextNewAPI', () => {
    beforeEach(async (done: Function) => {
      done();
    });

    /**
     * @tc.number    : graphicTextNewAPI_0100
     * @tc.name      : graphicTextNewAPI_0100
     * @tc.desc      : text newAPI
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('graphicTextNewAPI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0100===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_BADGE_NONE
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: true,
          trailingSpaceOptimized: true
        }
        interface Params {
          str?: string;
          str_color?: common2D.Color;
          backgroundRect?: text.RectStyle;
          Decoration_textDecoration?: text.TextDecorationType;
          Decoration_color?: common2D.Color;
          Decoration_decorationStyle?: text.TextDecorationStyle;
          Decoration_decorationThicknessScale?: number;
          textShadowsData: Array<text.TextShadow>;
        }
        let params: Params = {
          str: "",
          str_color: {
            alpha: 255,
            red: 0,
            green: 0,
            blue: 0
          },
          Decoration_textDecoration: text.TextDecorationType.NONE,
          Decoration_color: {
            alpha: 255,
            red: 255,
            green: 0,
            blue: 0
          },
          Decoration_decorationStyle: text.TextDecorationStyle.SOLID,
          Decoration_decorationThicknessScale: 1.0,
          textShadowsData: new Array()
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        expect().assertTrue();
        let paragraph: text.Paragraph = paragraphBuilder.build();
        params.backgroundRect = {
          color: {
            alpha: 255,
            red: 137,
            green: 137,
            blue: 120
          },
          leftTopRadius: 1,
          rightTopRadius: 1,
          rightBottomRadius: 1,
          leftBottomRadius: 1,
        }
        paragraph.updateColor(params.Decoration_color);
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.OVERLINE,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.WAVY,
          decorationThicknessScale: 2.0,
        });
        paragraph.layoutSync(600);
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : graphicTextNewAPI_0200
     * @tc.name      : graphicTextNewAPI_0200
     * @tc.desc      : text newAPI
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('graphicTextNewAPI_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0200===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_SUPERSCRIPT
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: false,
          trailingSpaceOptimized: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        expect(true).assertTrue();
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.updateColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.LINE_THROUGH,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.DOTTED,
          decorationThicknessScale: 1.0,
        });
        paragraph.layoutSync(600);
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : graphicTextNewAPI_0300
     * @tc.name      : graphicTextNewAPI_0300
     * @tc.desc      : text newAPI
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('graphicTextNewAPI_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0300===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_SUBSCRIPT
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: true,
          trailingSpaceOptimized: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        expect(true).assertTrue();
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.updateColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.UNDERLINE,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.DASHED,
          decorationThicknessScale: 1.5,
        });
        paragraph.layoutSync(600);
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : graphicTextNewAPI_0400
     * @tc.name      : graphicTextNewAPI_0400
     * @tc.desc      : text newAPI
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('graphicTextNewAPI_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0400===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        expect(true).assertTrue();
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);
          expect(true).assertTrue();
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : graphicTextNewAPI_0500
     * @tc.name      : graphicTextNewAPI_0500
     * @tc.desc      : text newAPI
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('graphicTextNewAPI_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0500===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        expect(true).assertTrue();
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_APP_DISABLE_HIGH_CONTRAST);
          expect(true).assertTrue();
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : graphicTextNewAPI_0600
     * @tc.name      : graphicTextNewAPI_0600
     * @tc.desc      : text newAPI
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('graphicTextNewAPI_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0500===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        expect(true).assertTrue();
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_APP_ENABLE_HIGH_CONTRAST);
          expect(true).assertTrue();
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

  })
}