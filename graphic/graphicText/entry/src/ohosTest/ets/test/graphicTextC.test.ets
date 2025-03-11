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
        let promise = text.getFontDescriptorByFullName("Noto Sans Pau Cin Hau Regular", fontType)
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

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_068
     * @tc.name      : testWordBreak
     * @tc.desc      : Enumeration of the word breaking policy.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWordBreak', 2, async (done:Function)=> {
      let msg = "====testWordBreak===="
      console.info(msg + ' begin ');
      try {
        console.info(msg + ' Succeeded in SystemFontType.');
        expect(text.WordBreak.BREAK_HYPHEN == 3).assertTrue()
        expect(true).assertTrue()
        done()
      } catch (err) {
        console.log(msg + " Faild in text.WordBreak " + JSON.stringify(err))
        console.log(msg + " Faild in text.WordBreak " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_069
     * @tc.name      : testWordBreak_write
     * @tc.desc      : Enumeration of the word breaking policy.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWordBreak_write', 2, async (done:Function)=> {
      let msg = "testWordBreak_write"
      console.info(msg + 'begin');
      let decoration : text.Decoration = {
        textDecoration: text.TextDecorationType.UNDERLINE,
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        decorationStyle : text.TextDecorationStyle.SOLID,
        decorationThicknessScale : 20
      };
      try {
        let myTextStyle : text.TextStyle = {
          decoration: decoration,
          color: {
            alpha: 255, red: 255, green: 0, blue: 0
          },
          fontWeight : text.FontWeight.W100,
          fontStyle : text.FontStyle.ITALIC,
          baseline : text.TextBaseline.ALPHABETIC,
          fontFamilies : Array<string>("123"),
          fontSize : 30,
          letterSpacing : 20,
          wordSpacing : 20,
          heightScale : 20,
          halfLeading : true,
          heightOnly : true,
          ellipsis : "456",
          ellipsisMode : text.EllipsisMode.START,
          locale : "789"
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          align: 3,
          wordBreak: text.WordBreak.BREAK_HYPHEN
        };
        try {
          let fontCollection = text.FontCollection.getGlobalInstance();
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
            console.log(msg + ' Succeed in text.ParagraphBuilder')
            expect(true).assertTrue()
            done()
          } catch (err) {
            console.info(msg + ' Failed in fontCollection.ParagraphBuilder.    Cause: ' + JSON.stringify(err));
            console.info(msg + ' Failed in fontCollection.ParagraphBuilder.    Cause: ' + err);
            expect().assertFail();
            done()
          }
        } catch (err) {
          console.info(msg + ' Failed in fontCollection.loadFontSync.    Cause: ' + JSON.stringify(err));
          console.info(msg + ' Failed in fontCollection.loadFontSync.    Cause: ' + err);
          expect().assertFail();
          done()
        }
      } catch (err) {
        console.info(msg + 'test TextStyle error ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })
  })
}
