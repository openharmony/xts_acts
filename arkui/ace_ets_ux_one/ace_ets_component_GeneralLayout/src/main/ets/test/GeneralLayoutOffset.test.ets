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
import router from '@ohos.router';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import I18n from '@ohos.i18n';
import display from '@ohos.display';

export default function GeneralLayoutOffsetTest() {
  describe('GeneralLayoutOffsetTest', () => {

    let screenWidth = display.getDefaultDisplaySync().width;
    let screenHeight = display.getDefaultDisplaySync().height;
    let original_rect_left: number;
    let original_rect_top: number;
    let original_rect_right: number;
    let mirror_rect_left: number;
    let mirror_rect_top: number;
    let mirror_rect_right: number;

    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/IndexOff',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IndexOff state success " + JSON.stringify(pages));
        if (!("IndexOff" == pages.name)) {
          console.info("get IndexOff state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push IndexOff page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndexOff page error: " + err);
      }
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_1900
     *@tc.name       : ArkUIHDS_General_Layout_1900
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_1900', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_1900 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0100_Text');
          console.info('0100_Text START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0100_Text');
            console.info('0100_Text START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(screenWidth - original_rect_right);
            expect(original_rect_top - top).assertEqual(100);
            expect(mirror_rect_top - top).assertEqual(100);
            expect(screenWidth / 2 - (mirror_rect_left + mirror_rect_right) / 2).assertEqual(100)
            console.info('ArkUIHDS_General_Layout_1900 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_1900 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2000
     *@tc.name       : ArkUIHDS_General_Layout_2000
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2000', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2000 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0200_Button');
          console.info('0200_Button START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0200_Button');
            console.info('0200_Button START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_right).assertEqual(screenWidth - original_rect_left);
            expect(original_rect_top - top - 30).assertEqual(vp2px(120));
            expect(mirror_rect_top - top - 30).assertEqual(vp2px(120));
            expect((mirror_rect_left + mirror_rect_right) / 2 - screenWidth / 2).assertEqual(vp2px(100));
            console.info('ArkUIHDS_General_Layout_2000 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2000 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2100
     *@tc.name       : ArkUIHDS_General_Layout_2100
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2100', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2100 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0300_Image');
          console.info('0300_Image START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0300_Image');
            console.info('0300_Image START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(screenWidth - original_rect_right);
            expect(original_rect_top - top - 60).assertEqual(fp2px(200));
            expect(mirror_rect_top - top - 60).assertEqual(fp2px(200));
            expect(screenWidth / 2 - (mirror_rect_left + mirror_rect_right) / 2).assertEqual(fp2px(100));
            console.info('ArkUIHDS_General_Layout_2100 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2100 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2200
     *@tc.name       : ArkUIHDS_General_Layout_2200
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2200', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2200 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0400_Text');
          console.info('0400_Text START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0400_Text');
            console.info('0400_Text START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(screenWidth - original_rect_right);
            expect(original_rect_top - top - 90).assertEqual(lpx2px(400));
            expect(mirror_rect_top - top - 90).assertEqual(lpx2px(400));
            expect((mirror_rect_left + mirror_rect_right) / 2 - screenWidth / 2).assertEqual(lpx2px(100));
            console.info('ArkUIHDS_General_Layout_2200 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2200 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2300
     *@tc.name       : ArkUIHDS_General_Layout_2300
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2300', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2300 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0500_Button');
          console.info('0500_Button START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0500_Button');
            console.info('0500_Button START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(screenWidth - original_rect_right);
            expect(original_rect_top - top - 120).assertEqual(0);
            expect(mirror_rect_top - top - 120).assertEqual(0);
            expect(screenWidth / 2 - (mirror_rect_left + mirror_rect_right) / 2).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_2300 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2300 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2400
     *@tc.name       : ArkUIHDS_General_Layout_2400
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2400', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2400 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0600_Image');
          console.info('0600_Image START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0600_Image');
            console.info('0600_Image START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            let strJson_bottom = getInspectorByKey('bottom');
            let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_bottom).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(screenWidth - original_rect_right);
            expect(original_rect_top - 150).assertEqual((top + bottom) / 2);
            expect(mirror_rect_top - 150).assertEqual((top + bottom) / 2);
            expect((mirror_rect_left + mirror_rect_right) / 2).assertEqual(screenWidth);
            console.info('ArkUIHDS_General_Layout_2400 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2400 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2500
     *@tc.name       : ArkUIHDS_General_Layout_2500
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2500', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2500 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0700_Image');
          console.info('0700_Image START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0700_Image');
            console.info('0700_Image START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(original_rect_left);
            expect(original_rect_top - top - 180).assertEqual(0);
            expect(mirror_rect_top - top - 180).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_2500 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2500 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2600
     *@tc.name       : ArkUIHDS_General_Layout_2600
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2600', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2600 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0800_Button');
          console.info('0800_Button START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0800_Button');
            console.info('0800_Button START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(original_rect_left);
            expect(original_rect_top - top - 210).assertEqual(0);
            expect(mirror_rect_top - top - 210).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_2600 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2600 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_2700
     *@tc.name       : ArkUIHDS_General_Layout_2700
     *@tc.desc       : test LengthMetrics type of offset
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_2700', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_2700 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0900_Text');
          console.info('0900_Text START  :' + JSON.stringify(strJson));
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0900_Text');
            console.info('0900_Text START  :' + JSON.stringify(strJson1));
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson_top = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson_top).$rect + ']')[0] + ']')[1];
            expect(mirror_rect_left).assertEqual(original_rect_left);
            expect(original_rect_top - top - 240).assertEqual(0);
            expect(mirror_rect_top - top - 240).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_2700 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_2700 ERR  ' + JSON.stringify(err));
        done();
      }
    });

  })
}