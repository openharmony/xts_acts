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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';

export default function ActsRichEditorTest() {
  describe('ActsRichEditorTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/richeditor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richeditor state success " + JSON.stringify(pages));
        if (!("richeditor" == pages.name)) {
          console.info("get richeditor state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push richeditor page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richeditor page error: " + err);
      }
      done()
    });
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    it('Stage_RichEditor_Test_0100', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0100 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addTextSpan("实例文字0", {
          offset: 5,
          style: {
            fontColor: Color.Red,
            fontSize: 8,
            fontStyle: FontStyle.Italic,
            fontWeight: FontWeight.Lighter,
            fontFamily: "sans-serif",
            decoration: { type: TextDecorationType.None, color: Color.Brown }
          }
        })
        console.info('Stage_Font_0100 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(0)
        console.info('Stage_RichEditor_Test_0100 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0100 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0200', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0200 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addTextSpan("实例文字0")
        console.info('Stage_Font_0200 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(0)
        console.info('Stage_RichEditor_Test_0200 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0200 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0300', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0300 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addTextSpan('')
        console.info('Stage_Font_0300 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0300 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0300 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0400', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0400 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addTextSpan(null)
        console.info('Stage_Font_0400 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0400 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0400 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0500', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0500 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan($r('app.media.icon'), {
          offset: 0,
          imageStyle: {
            size: ["114px", "114px"],
            verticalAlign: ImageSpanAlignment.CENTER,
            objectFit: ImageFit.Cover
          }
        })
        console.info('Stage_Font_0500 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(0)
        console.info('Stage_RichEditor_Test_0500 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0500 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0600', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0600 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan($r('app.media.icon'))
        console.info('Stage_Font_0600 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(0)
        console.info('Stage_RichEditor_Test_0600 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0600 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0700', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0700 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan('')
        console.info('Stage_Font_0600 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0700 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0700 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0800', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0800 START');
      try{
        let controller = new RichEditorController()
        let res = controller.addImageSpan(null)
        console.info('Stage_Font_0800 START  :'+ JSON.stringify(res));
        expect(typeof(res)).assertEqual('number')
        expect(res).assertEqual(-1)
        console.info('Stage_RichEditor_Test_0800 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0800 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_0900', 0, async function (done) {
      console.info('Stage_RichEditor_Test_0900 START');
      try{
        let controller = new RichEditorController()
        let res = controller.updateSpanStyle({
          start: 22,
          end: 25,
          textStyle: {
            fontColor:Color.Blue,
            fontSize:12,
            fontStyle:FontStyle.Italic,
            fontWeight:FontWeight.Bolder,
            fontFamily:"sans-serif",
            decoration: { type: TextDecorationType.Underline, color: Color.Red }
          }
        })
        console.info('Stage_Font_0900 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_0900 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_0900 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1000', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1000 START');
      try{
        let controller = new RichEditorController()
        let res = controller.updateSpanStyle({
          start: 22,
          end: 25,
          imageStyle: {
            size: [ 277, 177 ],
            verticalAlign:ImageSpanAlignment.CENTER,
            objectFit:ImageFit.Fill
          }
        })
        console.info('Stage_Font_1000 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1000 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1000 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1100', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1100 START');
      try{
        let controller = new RichEditorController()
        let res = controller.updateSpanStyle(null)
        console.info('Stage_Font_1100 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1100 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1100 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1200', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1200 START');
      try{
        let controller = new RichEditorController()
        let res = controller.deleteSpans({
          start: 22,
          end: 25
        })
        console.info('Stage_Font_1200 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1200 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1200 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1300', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1300 START');
      try{
        let controller = new RichEditorController()
        let res = controller.deleteSpans()
        console.info('Stage_Font_1300 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1300 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1300 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1400', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1400 START');
      try{
        let controller = new RichEditorController()
        let res = controller.deleteSpans(null)
        console.info('Stage_Font_1400 START  :'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1400 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1400 ERR  '+ JSON.stringify(err));
      }
      done();
    });
    it('Stage_RichEditor_Test_1500', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1500 START');
      try{
        let controller = new RichEditorController();
        let res = controller.getSpans({ start: 0, end: 10 })
        console.info('Stage_RichEditor_Test_1500'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1500 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1500 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1600', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1600 START');
      try{
        let controller = new RichEditorController();
        let res = controller.getSpans()
        console.info('Stage_RichEditor_Test_1600'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1600 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1600 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1700', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1700 START');
      try{
        let controller = new RichEditorController();
        let res = controller.getSpans(null)
        console.info('Stage_RichEditor_Test_1700'+ JSON.stringify(res));
        expect(res).assertUndefined()
        console.info('Stage_RichEditor_Test_1700 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1700 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1800', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1800 START');
      try{
        let controller = new RichEditorController();
        let res = controller.setCaretOffset(5)
        let get = controller.getCaretOffset()
        console.info('Stage_RichEditor_Test_1800'+ JSON.stringify(res));
        console.info('Stage_RichEditor_Test_1800'+ JSON.stringify(get));
        expect(res).assertEqual(false)
        expect(get).assertEqual(-1)
        console.info('Stage_RichEditor_Test_1800 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1800 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_1900', 0, async function (done) {
      console.info('Stage_RichEditor_Test_1900 START');
      try{
        let controller = new RichEditorController();
        let res = controller.setCaretOffset(null)
        let get = controller.getCaretOffset()
        console.info('Stage_RichEditor_Test_1900'+ JSON.stringify(res));
        console.info('Stage_RichEditor_Test_1900'+ JSON.stringify(get));
        expect(res).assertEqual(false)
        expect(get).assertEqual(-1)
        console.info('Stage_RichEditor_Test_1900 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_1900 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_2000', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2000 START');
      try{
        let controller = new RichEditorController();
        let res = controller.setCaretOffset(101010101010101010101010101010101)
        let get = controller.getCaretOffset()
        console.info('Stage_RichEditor_Test_2000'+ JSON.stringify(res));
        console.info('Stage_RichEditor_Test_2000'+ JSON.stringify(get));
        expect(res).assertEqual(false)
        expect(get).assertEqual(-1)
        console.info('Stage_RichEditor_Test_2000 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_RichEditor_Test_2000 ERR  '+ JSON.stringify(err));
      }
      done();
    });

    it('Stage_RichEditor_Test_2100', 0, async function (done) {
      console.info('Stage_RichEditor_Test_2100 START');
      setTimeout(()=>{
        try{
          let InsertValue: RichEditorInsertValue = { insertOffset:10, insertValue:"aaaaaa" }
          let SpanPosition: RichEditorSpanPosition = { spanIndex:10, spanRange:[10,10]}
          let TextSpan: RichEditorTextSpan = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",textStyle:{ }}
          let ImageSpanStyle: RichEditorImageSpanStyle = { size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}
          let TextSpanResult: RichEditorTextSpanResult = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",textStyle:(null),offsetInSpan:[10,100]}
          let ImageSpanStyleResult: RichEditorImageSpanStyleResult = { size:[10,10],verticalAlign:(ImageSpanAlignment.BASELINE),objectFit:(ImageFit.Cover)}
          let ImageSpanResult: RichEditorImageSpanResult = { spanPosition:{ spanIndex:10, spanRange:[10,10]},valuePixelMap:(null),valueResourceStr:("aaa"),imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.TOP),objectFit:(ImageFit.Auto)},offsetInSpan:[10,100]}
          let ImageSpan: RichEditorImageSpan = { spanPosition:{ spanIndex:10, spanRange:[10,10]},value:"aaaaa",imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}}
          let ImageSpanOptions: RichEditorImageSpanOptions = { offset:10,imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}}
          let ImageSpanStyleOptions: RichEditorUpdateImageSpanStyleOptions = { imageStyle:{ size:[10,10],verticalAlign:(ImageSpanAlignment.CENTER),objectFit:(ImageFit.Contain)}}
          let Selection: RichEditorSelection = { selection:[10,10],spans:(null)}
          let DeleteValue: RichEditorDeleteValue = { offset:10,direction:(0),length:10,richEditorDeleteSpans:(null)}
          let DeleteValue1: RichEditorDeleteValue = { offset:10,direction:(1),length:10,richEditorDeleteSpans:(null)}
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(InsertValue))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(SpanPosition))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(TextSpan))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(ImageSpanStyle))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(TextSpanResult))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(ImageSpanStyleResult))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(ImageSpanResult))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(ImageSpan))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(ImageSpanOptions))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(ImageSpanStyleOptions))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(Selection))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(DeleteValue))
          console.info("Stage_RichEditor_Test_2100 InsertValue is: " + JSON.stringify(DeleteValue1))
          expect(typeof InsertValue).assertEqual("object")
          expect(typeof SpanPosition).assertEqual("object")
          expect(typeof TextSpan).assertEqual("object")
          expect(typeof ImageSpanStyle).assertEqual("object")
          expect(typeof TextSpanResult).assertEqual("object")
          expect(typeof ImageSpanStyleResult).assertEqual("object")
          expect(typeof ImageSpanResult).assertEqual("object")
          expect(typeof ImageSpan).assertEqual("object")
          expect(typeof ImageSpanOptions).assertEqual("object")
          expect(typeof ImageSpanStyleOptions).assertEqual("object")
          expect(typeof Selection).assertEqual("object")
          expect(typeof DeleteValue).assertEqual("object")
          expect(typeof DeleteValue1).assertEqual("object")

          console.info('Stage_RichEditor_Test_2100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Stage_RichEditor_Test_2100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });


  })
}

