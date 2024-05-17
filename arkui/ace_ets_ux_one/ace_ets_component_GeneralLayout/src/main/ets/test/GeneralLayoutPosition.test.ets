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

export default function GeneralLayoutPositionTest() {
  describe('GeneralLayoutPositionTest', () => {

    let screenWidth = display.getDefaultDisplaySync().width;
    let screenHeight = display.getDefaultDisplaySync().height;
    let original_rect_left: number;
    let original_rect_top: number;
    let original_rect_bottom: number;
    let original_rect_right: number;
    let mirror_rect_left: number;
    let mirror_rect_top: number;
    let mirror_rect_bottom: number;
    let mirror_rect_right: number;

    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/Index',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done();
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0100
     *@tc.name       : ArkUIHDS_General_Layout_0100
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0100', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0100 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0100_ButtonA');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0100_ButtonA');
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            let strJson2 = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(original_rect_right).assertEqual(screenWidth - vp2px(100));
            expect(mirror_rect_right).assertEqual(screenWidth - original_rect_left);
            expect(original_rect_top - top).assertEqual(vp2px(100));
            expect(mirror_rect_top - top).assertEqual(vp2px(100));
            console.info('ArkUIHDS_General_Layout_0100 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0100 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0200
     *@tc.name       : ArkUIHDS_General_Layout_0200
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0200', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0200 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0200_TextA');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0200_TextA');
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            let strJson2 = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(original_rect_left).assertEqual(100);
            expect(mirror_rect_right).assertEqual(screenWidth - original_rect_left);
            expect(original_rect_top - top).assertEqual(100);
            expect(mirror_rect_top - top).assertEqual(100);
            console.info('ArkUIHDS_General_Layout_0200 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0200 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0300
     *@tc.name       : ArkUIHDS_General_Layout_0300
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0300', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0300 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0300_ImageA');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0300_ImageA');
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            mirror_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[1];
            let strJson2 = getInspectorByKey('bottom');
            let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(original_rect_left).assertEqual(fp2px(300));
            expect(mirror_rect_right).assertEqual(screenWidth - original_rect_left);
            expect(bottom - original_rect_bottom).assertEqual(fp2px(300));
            expect(bottom - mirror_rect_bottom).assertEqual(fp2px(300));
            console.info('ArkUIHDS_General_Layout_0300 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0300 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0400
     *@tc.name       : ArkUIHDS_General_Layout_0400
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0400', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0400 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0400_TextB');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0400_TextB');
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            mirror_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[1];
            let strJson2 = getInspectorByKey('bottom');
            let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(screenWidth - original_rect_right).assertEqual(lpx2px(400));
            expect(mirror_rect_right).assertEqual(screenWidth - original_rect_left);
            expect(bottom - original_rect_bottom).assertEqual(lpx2px(400));
            expect(bottom - mirror_rect_bottom).assertEqual(lpx2px(400));
            console.info('ArkUIHDS_General_Layout_0400 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0400 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0500
     *@tc.name       : ArkUIHDS_General_Layout_0500
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0500', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0500 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0500_ButtonB');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0500_ButtonB');
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            let strJson2 = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(original_rect_left).assertEqual(0);
            expect(mirror_rect_right).assertEqual(screenWidth - original_rect_left);
            expect(original_rect_top - top).assertEqual(0);
            expect(mirror_rect_top - top).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_0500 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0500 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0600
     *@tc.name       : ArkUIHDS_General_Layout_0600
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0600', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0600 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0600_ImageB');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0600_ImageB');
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            mirror_rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[1];
            let strJson2 = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            let strJson3 = getInspectorByKey('bottom');
            let bottom: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson3).$rect + ']')[0] + ']')[1];
            expect(screenWidth - original_rect_right).assertEqual(screenWidth / 2);
            expect(mirror_rect_right).assertEqual(screenWidth - original_rect_left);
            expect(original_rect_bottom).assertEqual((top + bottom) / 2);
            expect(mirror_rect_bottom).assertEqual((top + bottom) / 2);
            console.info('ArkUIHDS_General_Layout_0600 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0600 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0700
     *@tc.name       : ArkUIHDS_General_Layout_0700
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0700', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0700 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0700_TextC');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0700_TextC');
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson2 = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(original_rect_left).assertEqual(0);
            expect(mirror_rect_left).assertEqual(0);
            expect(original_rect_top - top).assertEqual(0);
            expect(mirror_rect_top - top).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_0700 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0700 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0800
     *@tc.name       : ArkUIHDS_General_Layout_0800
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0800', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0800 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0800_ButtonC');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0800_ButtonC');
            mirror_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            let strJson2 = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(original_rect_left).assertEqual(0);
            expect(mirror_rect_left).assertEqual(0);
            expect(original_rect_top - top).assertEqual(0);
            expect(mirror_rect_top - top).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_0800 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0800 ERR  ' + JSON.stringify(err));
        done();
      }
    });

    /*
     *@tc.number     : ArkUIHDS_General_Layout_0900
     *@tc.name       : ArkUIHDS_General_Layout_0900
     *@tc.desc       : test LengthMetrics type of position
     *@tc.size       : MediumTest
     *@tc.type       : Function
     *@tc.level      : Level 1
     */
    it('ArkUIHDS_General_Layout_0900', 0, async (done: Function) => {
      console.info('ArkUIHDS_General_Layout_0900 START');
      try {
        I18n.System.setSystemLanguage("zh-Hans");
        setTimeout(() => {
          let strJson = getInspectorByKey('0900_ImageC');
          original_rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0];
          original_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1];
          original_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0];
          I18n.System.setSystemLanguage("ar-EG");
          setTimeout(() => {
            let strJson1 = getInspectorByKey('0900_ImageC');
            mirror_rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[1] + ']')[0];
            mirror_rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson1).$rect + ']')[0] + ']')[1];
            let strJson2 = getInspectorByKey('top');
            let top: number = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson2).$rect + ']')[0] + ']')[1];
            expect(original_rect_left).assertEqual(0);
            expect(mirror_rect_right).assertEqual(screenWidth);
            expect(original_rect_top - top).assertEqual(0);
            expect(mirror_rect_top - top).assertEqual(0);
            console.info('ArkUIHDS_General_Layout_0900 END');
            done();
          }, 5000);
        }, 5000);
      } catch (err) {
        expect().assertFail();
        console.info('ArkUIHDS_General_Layout_0900 ERR  ' + JSON.stringify(err));
        done();
      }
    });

  })
}