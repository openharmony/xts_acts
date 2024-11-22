/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text"
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image'

export default function graphicTextCTest() {

  describe('graphicTextC_test', () => {
    beforeAll(() => {
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_065
     * @tc.name      : testGetSystemFontFullNamesByType
     * @tc.desc      : Returns the names of all fonts corresponding to the font type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSystemFontFullNamesByType', 2, async (done:Function)=> {
      let msg = "====testGetSystemFontFullNamesByType===="
      console.info(msg + ' begin ');
      try{
        let fontType:text.SystemFontType = text.SystemFontType.GENERIC
        let promise = text.getSystemFontFullNamesByType(fontType)
        promise.then((data) => {
          console.log(msg + ' Succeed in text.getSystemFontFullNamesByType  ' + JSON.stringify(data) )
          console.log(msg + ' Succeed in text.getSystemFontFullNamesByType  ' + data )
          console.info(msg + ` then font list size: ${data.length}`)
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to get font fullNames by type, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done()
        });
      } catch(err){
        console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + err);
        expect().assertFail();
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_066
     * @tc.name      : testGetFontDescriptorByFullName
     * @tc.desc      : Obtain the corresponding font descriptor based on the font name and font type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetFontDescriptorByFullName', 2, async (done:Function)=> {
      let msg = "====testGetFontDescriptorByFullName===="
      console.info(msg + ' begin ');
      try{
        let fontType:text.SystemFontType = text.SystemFontType.GENERIC
        let promise = text.getFontDescriptorByFullName("HarmonyOS Sans", fontType)
        promise.then((fontdecriptor) => {
          console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + JSON.stringify(fontdecriptor) )
          console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + fontdecriptor )
          console.info(msg + ` desc: ${JSON.stringify(fontdecriptor)}`)
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to get fontDescriptor by fullName, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done()
        });
      } catch(err){
        console.info(msg + ' Failed in text.getFontDescriptorByFullName.  Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in text.getFontDescriptorByFullName.  Cause: ' + err);
        expect().assertFail();
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_067
     * @tc.name      : testMatchFontDescriptors
     * @tc.desc      : Returns all system font descriptors that meet requirements based on the specified font descriptor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMatchFontDescriptors', 2, async (done:Function)=> {
      let msg = "====testMatchFontDescriptors===="
      console.info(msg + ' begin ');
      try{
        let promise = text.matchFontDescriptors({
          weight: text.FontWeight.W400,
        })
        promise.then((data) => {
          console.info(msg + ` Font descriptor array size: ${data.length}`);
          console.info(msg + ` Font descriptor result: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to match the font descriptor, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done()
        });
      } catch(err){
        console.info(msg + ' Failed in text.matchFontDescriptors.  Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in text.matchFontDescriptors.  Cause: ' + err);
        expect().assertFail();
        done()
      }
    })
    
    // /**
    //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_065
    //  * @tc.name      : testGetLineBreak
    //  * @tc.desc      : To test interface clearCaches of FontCollection.
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level3
    //  */
    // it('testGetLineBreak', 2, async (done:Function)=> {
    //   let msg = "====testGetLineBreak===="
    //   console.info(msg + ' begin ');
    //   try {
    //     let myParagraphStyle: text.ParagraphStyle = {
    //       align: text.TextAlign.JUSTIFY,
    //     };
    //     let fontCollection = new text.FontCollection();
    //     let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    //     ParagraphGraphBuilder.addText("123456789");
    //     let lineTypeset = ParagraphGraphBuilder.buildLineTypeset();
    //     console.log(msg + ' Succeed in ParagraphGraphBuilder.buildLineTypeset  ' + JSON.stringify(lineTypeset) )
    //     console.log(msg + ' Succeed in ParagraphGraphBuilder.buildLineTypeset  ' + lineTypeset )
    //     let startIndex = 0;
    //     let width = 100.0;
    //     let count = lineTypeset.getLineBreak(startIndex, width);
    //     console.log(msg + ' Succeed in lineTypeset.getLineBreak.')
    //     expect(true).assertTrue()
    //     done()
    //   } catch (err) {
    //     console.info(msg + ' Failed in lineTypeset.getLineBreak.  Cause: ' + JSON.stringify(err));
    //     console.info(msg + ' Failed in lineTypeset.getLineBreak.  Cause: ' + err);
    //     expect().assertFail();
    //     done()
    //   }
    // })
    
    // /**
    //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_066
    //  * @tc.name      : testCreateLine
    //  * @tc.desc      : To test interface clearCaches of FontCollection.
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level3
    //  */
    // it('testCreateLine', 2, async (done:Function)=> {
    //   let msg = "====testCreateLine===="
    //   console.info(msg + ' begin ');
    //   try {
    //     let myParagraphStyle: text.ParagraphStyle = {
    //       align: text.TextAlign.JUSTIFY,
    //     };
    //     let fontCollection = new text.FontCollection();
    //     let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    //     ParagraphGraphBuilder.addText("123456789");
    //     let lineTypeset = ParagraphGraphBuilder.buildLineTypeset();
    //     console.log(msg + ' Succeed in ParagraphGraphBuilder.buildLineTypeset  ' + JSON.stringify(lineTypeset) )
    //     console.log(msg + ' Succeed in ParagraphGraphBuilder.buildLineTypeset  ' + lineTypeset )
    //     let startIndex = 0;
    //     let width = 100.0;
    //     let count = lineTypeset.getLineBreak(startIndex, width);
    //     let line : text.TextLine = lineTypeset.createLine(startIndex, count);
    //     console.log(msg + ' Succeed in lineTypeset.createLine.')
    //     expect(true).assertTrue()
    //     done()
    //   } catch (err) {
    //     console.info(msg + ' Failed in lineTypeset.createLine.  Cause: ' + JSON.stringify(err));
    //     console.info(msg + ' Failed in lineTypeset.createLine.  Cause: ' + err);
    //     expect().assertFail();
    //     done()
    //   }
    // })
    
    // /**
    //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_067
    //  * @tc.name      : testCreateTruncatedLine
    //  * @tc.desc      : To test interface clearCaches of FontCollection.
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level3
    //  */
    // it('testCreateTruncatedLine', 2, async (done:Function)=> {
    //   let msg = "====testCreateTruncatedLine===="
    //   console.info(msg + ' begin ');
    //   try {
    //     const color: ArrayBuffer = new ArrayBuffer(160000);
    //     let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } }
    //     let pixelmap = image.createPixelMapSync(color, opts);
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + JSON.stringify(pixelmap) )
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + pixelmap )
    //     let canvas = new drawing.Canvas(pixelmap);
    //     let fontCollection: text.FontCollection = new text.FontCollection();
    //     let myTextStyle: text.TextStyle = {
    //       fontFamilies: []
    //     };
    //     let myParagraphStyle: text.ParagraphStyle = {
    //       textStyle: myTextStyle,
    //     }
    //     let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    //     let textData = " Construction line ";
    //     paragraphBuilder.addText(textData);
    //     let paragraph: text.Paragraph = paragraphBuilder.build();
    //     let lines = paragraph.getTextLines();
    //     console.log(msg + " lines: " + lines)
    //     console.log(msg + " lines: " + JSON.stringify(lines))
    //     let truncatedTextLine = lines[0].createTruncatedLine(100, text.EllipsisMode.START, "...");
    //     truncatedTextLine.paint(canvas, 0, 100);
    //     console.log(msg + ' Succeed in lines[0].createTruncatedLine.')
    //     expect(true).assertTrue()
    //     done()
    //   } catch (err) {
    //     console.info(msg + ' Failed in lines[0].createTruncatedLine.  Cause: ' + JSON.stringify(err));
    //     console.info(msg + ' Failed in lines[0].createTruncatedLine.  Cause: ' + err);
    //     expect().assertFail();
    //     done()
    //   }
    // })
    
    // /**
    //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_068
    //  * @tc.name      : testGetTypographicBounds
    //  * @tc.desc      : To test interface clearCaches of FontCollection.
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level3
    //  */
    // it('testGetTypographicBounds', 2, async (done:Function)=> {
    //   let msg = "====testGetTypographicBounds===="
    //   console.info(msg + ' begin ');
    //   try {
    //     const color: ArrayBuffer = new ArrayBuffer(160000);
    //     let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } }
    //     let pixelmap = image.createPixelMapSync(color, opts);
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + JSON.stringify(pixelmap) )
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + pixelmap )
    //     let canvas = new drawing.Canvas(pixelmap);
    //     let fontCollection: text.FontCollection = new text.FontCollection();
    //     let myTextStyle: text.TextStyle = {
    //       fontFamilies: []
    //     };
    //     let myParagraphStyle: text.ParagraphStyle = {
    //       textStyle: myTextStyle,
    //     }
    //     let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    //     let textData = " Construction line ";
    //     paragraphBuilder.addText(textData);
    //     let paragraph: text.Paragraph = paragraphBuilder.build();
    //     let lines = paragraph.getTextLines();
    //     let bounds = lines[0].getTypographicBounds();
    //     console.info(msg + ' textLine ascent:' + bounds.ascent + ', descent:' + bounds.descent + ', leading:' + bounds.leading + ', width:' + bounds.width);
    //     console.log(msg + ' Succeed in lines[0].getTypographicBounds.')
    //     expect(true).assertTrue()
    //     done()
    //   } catch (err) {
    //     console.info(msg + ' Failed in lines[0].getTypographicBounds.  Cause: ' + JSON.stringify(err));
    //     console.info(msg + ' Failed in lines[0].getTypographicBounds.  Cause: ' + err);
    //     expect().assertFail();
    //     done()
    //   }
    // })
    
    // /**
    //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_069
    //  * @tc.name      : testGetTypographicBounds
    //  * @tc.desc      : To test interface clearCaches of FontCollection.
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level3
    //  */
    // it('testGetTypographicBounds', 2, async (done:Function)=> {
    //   let msg = "====testGetTypographicBounds===="
    //   console.info(msg + ' begin ');
    //   try {
    //     const color: ArrayBuffer = new ArrayBuffer(160000);
    //     let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } }
    //     let pixelmap = image.createPixelMapSync(color, opts);
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + JSON.stringify(pixelmap) )
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + pixelmap )
    //     let canvas = new drawing.Canvas(pixelmap);
    //     let fontCollection: text.FontCollection = new text.FontCollection();
    //     let myTextStyle: text.TextStyle = {
    //       fontFamilies: []
    //     };
    //     let myParagraphStyle: text.ParagraphStyle = {
    //       textStyle: myTextStyle,
    //     }
    //     let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    //     let textData = " Construction line ";
    //     paragraphBuilder.addText(textData);
    //     let paragraph: text.Paragraph = paragraphBuilder.build();
    //     let lines = paragraph.getTextLines();
    //     let imageBounds = lines[0].getImageBounds();
    //     console.info(msg + ' textLine left:' + imageBounds.left + ', top:' + imageBounds.top + ', right:' + imageBounds.right + ', bottom:' + imageBounds.bottom);
    //     console.log(msg + ' Succeed in lines[0].getImageBounds.')
    //     expect(true).assertTrue()
    //     done()
    //   } catch (err) {
    //     console.info(msg + ' Failed in lines[0].getImageBounds.  Cause: ' + JSON.stringify(err));
    //     console.info(msg + ' Failed in lines[0].getImageBounds.  Cause: ' + err);
    //     expect().assertFail();
    //     done()
    //   }
    // })
    
    // /**
    //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_070
    //  * @tc.name      : testGetTrailingSpaceWidth
    //  * @tc.desc      : To test interface clearCaches of FontCollection.
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level3
    //  */
    // it('testGetTrailingSpaceWidth', 2, async (done:Function)=> {
    //   let msg = "====testGetTrailingSpaceWidth===="
    //   console.info(msg + ' begin ');
    //   try {
    //     const color: ArrayBuffer = new ArrayBuffer(160000);
    //     let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } }
    //     let pixelmap = image.createPixelMapSync(color, opts);
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + JSON.stringify(pixelmap) )
    //     console.log(msg + ' Succeed in image.createPixelMapSync  ' + pixelmap )
    //     let canvas = new drawing.Canvas(pixelmap);
    //     let fontCollection: text.FontCollection = new text.FontCollection();
    //     let myTextStyle: text.TextStyle = {
    //       fontFamilies: []
    //     };
    //     let myParagraphStyle: text.ParagraphStyle = {
    //       textStyle: myTextStyle,
    //     }
    //     let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
    //     let textData = " Construction line ";
    //     paragraphBuilder.addText(textData);
    //     let paragraph: text.Paragraph = paragraphBuilder.build();
    //     let lines = paragraph.getTextLines();
    //     let trailingSpaceWidth = lines[0].getTrailingSpaceWidth();
    //     console.info(msg + ' textLine trailingSpaceWidth:' + trailingSpaceWidth);
    //     console.log(msg + ' Succeed in lines[0].getTrailingSpaceWidth.')
    //     expect(true).assertTrue()
    //     done()
    //   } catch (err) {
    //     console.info(msg + ' Failed in lines[0].getTrailingSpaceWidth.  Cause: ' + JSON.stringify(err));
    //     console.info(msg + ' Failed in lines[0].getTrailingSpaceWidth.  Cause: ' + err);
    //     expect().assertFail();
    //     done()
    //   }
    // })
    

  })
}
