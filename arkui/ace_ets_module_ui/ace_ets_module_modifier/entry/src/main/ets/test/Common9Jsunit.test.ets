
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import Utils from './Utils';

export default function common9Jsunit() {
  describe('common_part2Test', function () {
    beforeEach(async function (done) {
      console.info("common_Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/common_9',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get common_Jsunit state pages: " + JSON.stringify(pages));
        if (!("common_9" == pages.name)) {
          console.info("get common_Jsunit state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push common_Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push common_Jsunit page error: " + err);
      }
      done();
    });

    beforeEach(async function () {
      await Utils.sleep(100);
      console.info("common_Jsunit before each called");
    })

    /**
     * @tc.number common_0001
     * @tc.name   Test the properties of components
     * @tc.desc   Set focusable values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_focusable', 0, async function (done) {
      console.info('[common_focusable] START');
      let strJson = getInspectorByKey('buttonModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_focusable] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.focusable).assertEqual(false);
      console.info('[common_focusable] END');
      done();
    });

    /**
     * @tc.number common_0002
     * @tc.name   Test the properties of components
     * @tc.desc   Set tabIndex values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_tabIndex', 0, async function (done) {
      console.info('[common_tabIndex] START');
      let strJson = getInspectorByKey('buttonModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_tabIndex] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.tabIndex).assertEqual(3);
      console.info('[common_tabIndex] END');
      done();
    });

    /**
     * @tc.number common_0003
     * @tc.name   Test the properties of components
     * @tc.desc   Set defaultFocus values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_defaultFocus', 0, async function (done) {
      console.info('[common_defaultFocus] START');
      let strJson = getInspectorByKey('buttonModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_defaultFocus] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.defaultFocus).assertEqual(true);
      console.info('[common_defaultFocus] END');
      done();
    });

    /**
     * @tc.number common_0004
     * @tc.name   Test the properties of components
     * @tc.desc   Set groupDefaultFocus values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_groupDefaultFocus', 0, async function (done) {
      console.info('[common_groupDefaultFocus] START');
      let strJson = getInspectorByKey('buttonModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_groupDefaultFocus] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.groupDefaultFocus).assertEqual(false);
      console.info('[common_groupDefaultFocus] END');
      done();
    });

    /**
     * @tc.number common_0005
     * @tc.name   Test the properties of components
     * @tc.desc   Set focusOnTouch values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_focusOnTouch', 0, async function (done) {
      console.info('[common_focusOnTouch] START');
      let strJson = getInspectorByKey('buttonModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_focusOnTouch] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.focusOnTouch).assertEqual(true);
      console.info('[common_focusOnTouch] END');
      done();
    });

    /**
     * @tc.number common_0006
     * @tc.name   Test the properties of components
     * @tc.desc   Set brightness values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_brightness', 0, async function (done) {
      console.info('[common_brightness] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_brightness] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.brightness).assertEqual(1);
      console.info('[common_brightness] END');
      done();
    });

    /**
    * @tc.number common_0007
    * @tc.name   Test the properties of components
    * @tc.desc   Set contrast values
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  0
    */
    it('common_contrast', 0, async function (done) {
      console.info('[common_contrast] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_contrast] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.contrast).assertEqual(1);
      console.info('[common_contrast] END');
      done();
    });

    /**
     * @tc.number common_0008
     * @tc.name   Test the properties of components
     * @tc.desc   Set grayscale values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_grayscale', 0, async function (done) {
      console.info('[common_grayscale] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_grayscale] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.grayscale).assertEqual(1);
      console.info('[common_grayscale] END');
      done();
    });

    /**
      * @tc.number common_0009
      * @tc.name   Test the properties of components
      * @tc.desc   Set colorBlend values
      * @tc.size   MediumTest
      * @tc.type   Function
      * @tc.level  0
      */
    it('common_colorBlend', 0, async function (done) {
      console.info('[common_colorBlend] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_colorBlend] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.colorBlend).assertEqual('#FFFFA500');
      console.info('[common_colorBlend] END');
      done();
    });

    /**
     * @tc.number common_0010
     * @tc.name   Test the properties of components
     * @tc.desc   Set saturate values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_saturate', 0, async function (done) {
      console.info('[common_saturate] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_saturate] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.saturate).assertEqual(2);
      console.info('[common_saturate] END');
      done();
    });

    /**
     * @tc.number common_0011
     * @tc.name   Test the properties of components
     * @tc.desc   Set foregroundColor values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_foregroundColor', 0, async function (done) {
      console.info('[common_foregroundColor] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_foregroundColor] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.foregroundColor).assertEqual('#FF0000FF');
      console.info('[common_foregroundColor] END');
      done();
    });
    
    /**
     * @tc.number common_0012
     * @tc.name   Test the properties of components
     * @tc.desc   Set borderImage values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_borderImage', 0, async function (done) {
      console.info('[common_borderImage] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_borderImage] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.borderImage).assertEqual('{\"source\":\"\",\"slice\":\"0.00px\",\"width\":\"0.00px\",\"outset\":\"0.00px\",\"repeat\":\"RepeatMode.Stretch\",\"fill\":\"false\"}');
      console.info('[common_borderImage] END');
      done();
    });

    /**
     * @tc.number common_0013
     * @tc.name   Test the properties of components
     * @tc.desc   Set borderWidth values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_borderWidth', 0, async function (done) {
      console.info('[common_borderWidth] START');
      let strJson = getInspectorByKey('textModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_borderWidth] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.borderWidth.left).assertEqual('3.00vp');
      expect(obj.$attrs.borderWidth.top).assertEqual('3.00vp');
      expect(obj.$attrs.borderWidth.bottom).assertEqual('3.00vp');
      expect(obj.$attrs.borderWidth.right).assertEqual('3.00vp');
      console.info('[common_borderWidth] END');
      done();
    });

    /**
     * @tc.number common_0014
     * @tc.name   Test the properties of components
     * @tc.desc   Set borderColor values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_borderColor', 0, async function (done) {
      console.info('[common_borderColor] START');
      let strJson = getInspectorByKey('textModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_borderColor] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.borderColor.left).assertEqual('#FFFF0000');
      expect(obj.$attrs.borderColor.right).assertEqual('#FFFF0000');
      expect(obj.$attrs.borderColor.top).assertEqual('#FFFF0000');
      expect(obj.$attrs.borderColor.bottom).assertEqual('#FFFF0000');
      console.info('[common_borderColor] END');
      done();
    });

    /**
     * @tc.number common_0015
     * @tc.name   Test the properties of components
     * @tc.desc   Set borderStyle values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_borderStyle', 0, async function (done) {
      console.info('[common_borderStyle] START');
      let strJson = getInspectorByKey('textModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_borderStyle] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.borderStyle).assertEqual('BorderStyle.Dotted');
      console.info('[common_borderStyle] END');
      done();
    });

    /**
     * @tc.number common_0016
     * @tc.name   Test the properties of components
     * @tc.desc   Set borderRadius values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_borderRadius', 0, async function (done) {
      console.info('[common_borderRadius] START');
      let strJson = getInspectorByKey('textModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_borderRadius] obj is : " + JSON.stringify(obj.$attrs));
      let borderRadius = obj.$attrs.borderRadius;
      expect(borderRadius.topLeft).assertEqual('30.00vp');
      expect(borderRadius.topRight).assertEqual('30.00vp');
      expect(borderRadius.bottomLeft).assertEqual('30.00vp');
      expect(borderRadius.bottomRight).assertEqual('30.00vp');
      console.info('[common_borderRadius] END');
      done();
    });

    /**
     * @tc.number common_0017
     * @tc.name   Test the properties of components
     * @tc.desc   Set border values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_border', 0, async function (done) {
      console.info('[common_border] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj = JSON.parse(strJson);
      console.info("[common_border] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.border).assertEqual("{\"style\":{\"left\":\"BorderStyle.Dashed\",\"top\":\"BorderStyle.Solid\",\"right\":\"BorderStyle.Dotted\",\"bottom\":\"BorderStyle.Dashed\"},\"color\":{\"left\":\"#FF000000\",\"right\":\"#FF000000\",\"top\":\"#FF0F0F0F\",\"bottom\":\"#FFF0F0F0\"},\"width\":{\"left\":\"3.00vp\",\"top\":\"10.00vp\",\"right\":\"6.00vp\",\"bottom\":\"15.00vp\"},\"radius\":{\"topLeft\":\"10.00vp\",\"topRight\":\"20.00vp\",\"bottomLeft\":\"40.00vp\",\"bottomRight\":\"80.00vp\"}}");
      console.info('[common_border] END');
      done();
    });

    /**
     * @tc.number common_0018
     * @tc.name   Test the properties of components
     * @tc.desc   Set backgroundBlurStyle values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_backgroundBlurStyle', 0, async function (done) {
      console.info('[common_backgroundBlurStyle] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj = JSON.parse(strJson);
      console.info("[common_backgroundBlurStyle] obj is : " + JSON.stringify(obj.$attrs));
      let mbackgroundBlurStyle = obj.$attrs.backgroundBlurStyle;
      expect(mbackgroundBlurStyle.value).assertEqual("BlurStyle.Thin");
      expect(mbackgroundBlurStyle.options.colorMode).assertEqual("ThemeColorMode.System");
      console.info('[common_backgroundBlurStyle] END');
      done();
    });    

    /**
     * @tc.number common_0019
     * @tc.name   Test the properties of components
     * @tc.desc   Set monopolizeEvents values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_monopolizeEvents', 0, async function (done) {
      console.info('[common_monopolizeEvents] START');
      let strJson = getInspectorByKey('imageModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_monopolizeEvents] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.monopolizeEvents).assertEqual(false);
      console.info('[common_monopolizeEvents] END');
      done();
    });

    /**
     * @tc.number common_0020
     * @tc.name   Test the properties of components
     * @tc.desc   Set backgroundImage values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_backgroundImage', 0, async function (done) {
      console.info('[common_backgroundImage] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_backgroundImage] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.backgroundImage).assertEqual("resource:///16777260.png, ImageRepeat.X");
      console.info('[common_backgroundImage] END');
      done();
    });

    /**
     * @tc.number common_0021
     * @tc.name   Test the properties of components
     * @tc.desc   Set backgroundImageSize values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_backgroundImageSize', 0, async function (done) {
      console.info('[common_backgroundImageSize] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_backgroundImageSize] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.backgroundImageSize).assertEqual('{\"width\":\"150.00px\",\"height\":\"150.00px\"}');
      console.info('[common_backgroundImageSize] END');
      done();
    });

    /**
     * @tc.number common_0022
     * @tc.name   Test the properties of components
     * @tc.desc   Set backgroundImagePosition values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_backgroundImagePosition', 0, async function (done) {
      console.info('[common_backgroundImagePosition] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_backgroundImagePosition] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.backgroundImagePosition).assertEqual("{\"x\":144,\"y\":144}");
      console.info('[common_backgroundImagePosition] END');
      done();
    });
   
    /**
     * @tc.number common_0023
     * @tc.name   Test the properties of components
     * @tc.desc   Set size values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_size', 0, async function (done) {
      console.info('[common_size] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_size] obj is : " + JSON.stringify(obj.$attrs));
      let mSize = obj.$attrs.size;
      expect(mSize.width).assertEqual("144.00vp");
      expect(mSize.height).assertEqual("144.00vp");
      console.info('[common_size] END');
      done();
    });

    
    /**
     * @tc.number common_0024
     * @tc.name   Test the properties of components
     * @tc.desc   Set pixelStretchEffect values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_pixelStretchEffect', 0, async function (done) {
      console.info('[common_pixelStretchEffect] START');
      let strJson = getInspectorByKey('textModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_pixelStretchEffect] obj is : " + JSON.stringify(obj.$attrs));
      let mPixelStretchEffect = obj.$attrs.pixelStretchEffect;
      expect(mPixelStretchEffect.left).assertEqual("5.00vp");
      expect(mPixelStretchEffect.right).assertEqual("5.00vp");
      expect(mPixelStretchEffect.top).assertEqual("5.00vp");
      expect(mPixelStretchEffect.bottom).assertEqual("5.00vp");
      console.info('[common_pixelStretchEffect] END');
      done();
    });
    
    /**
     * @tc.number common_0025
     * @tc.name   Test the properties of components
     * @tc.desc   Set backgroundBrightness values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_backgroundBrightness', 0, async function (done) {
      console.info('[common_backgroundBrightness] START');
      let strJson = getInspectorByKey('textModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_backgroundBrightness] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.backgroundBrightness).assertEqual(undefined);
      console.info('[common_backgroundBrightness] END');
      done();
    });
    
    /**
     * @tc.number common_0026
     * @tc.name   Test the properties of components
     * @tc.desc   Set dragPreviewOptions values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_dragPreviewOptions', 0, async function (done) {
      console.info('[common_dragPreviewOptions] START');
      let strJson = getInspectorByKey('textModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_dragPreviewOptions] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.dragPreviewOptions).assertEqual(undefined);
      console.info('[common_dragPreviewOptions] END');
      done();
    });
    
    /**
     * @tc.number common_0027
     * @tc.name   Test the properties of components
     * @tc.desc   Set layoutWeight values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_layoutWeight', 0, async function (done) {
      console.info('[common_layoutWeight] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj = JSON.parse(strJson);
      console.info("[common_layoutWeight] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.layoutWeight).assertEqual(2);
      console.info('[common_layoutWeight] END');
      done();
    });
    
    /**
     * @tc.number common_0028
     * @tc.name   Test the properties of components
     * @tc.desc   Set constraintSize values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_constraintSize', 0, async function (done) {
      console.info('[common_constraintSize] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj = JSON.parse(strJson);
      console.info("[common_constraintSize] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.constraintSize).assertEqual( "{\"minWidth\":\"10.00vp\",\"minHeight\":\"15.00vp\",\"maxWidth\":\"20.00vp\",\"maxHeight\":\"30.00vp\"}");
      console.info('[common_constraintSize] END');
      done();
    });
    
    /**
     * @tc.number common_0029
     * @tc.name   Test the properties of components
     * @tc.desc   Set useEffect values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_useEffect', 0, async function (done) {
      console.info('[common_useEffect] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj = JSON.parse(strJson);
      console.info("[common_useEffect] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.useEffect).assertEqual(undefined);
      console.info('[common_useEffect] END');
      done();
    });
    
    /**
     * @tc.number common_0030
     * @tc.name   Test the properties of components
     * @tc.desc   Set sphericalEffect values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_sphericalEffect', 0, async function (done) {
      console.info('[common_sphericalEffect] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj = JSON.parse(strJson);
      console.info("[common_sphericalEffect] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.sphericalEffect).assertEqual(1);
      console.info('[common_sphericalEffect] END');
      done();
    });
    
    /**
     * @tc.number common_0031
     * @tc.name   Test the properties of components
     * @tc.desc   Set hitTestBehavior values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_hitTestBehavior', 0, async function (done) {
      console.info('[common_hitTestBehavior] START');
      let strJson = getInspectorByKey('buttonModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_hitTestBehavior] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.hitTestBehavior).assertEqual('HitTestMode.Default');
      console.info('[common_hitTestBehavior] END');
      done();
    });


    /**
     * @tc.number common_0032
     * @tc.name   Test the properties of components
     * @tc.desc   Set lightUpEffect values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_lightUpEffect', 0, async function (done) {
      console.info('[common_lightUpEffect] START');
      let strJson = getInspectorByKey('textModifier3');
      let obj = JSON.parse(strJson);
      console.info("[common_lightUpEffect] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.lightUpEffect).assertEqual(1);
      console.info('[common_lightUpEffect] END');
      done();
    });
    
    /**
     * @tc.number common_0033
     * @tc.name   Test the properties of components
     * @tc.desc   Set width values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_width', 0, async function (done) {
      console.info('[common_width] START');
      let strJson = getInspectorByKey('imageModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_width] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.width).assertEqual("144.00vp");
      console.info('[common_width] END');
      done();
    });
    
    /**
     * @tc.number common_0034
     * @tc.name   Test the properties of components
     * @tc.desc   Set height values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_height', 0, async function (done) {
      console.info('[common_height] START');
      let strJson = getInspectorByKey('imageModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_height] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.height).assertEqual("144.00vp");
      console.info('[common_height] END');
      done();
    });
    
    /**
     * @tc.number common_0035
     * @tc.name   Test the properties of components
     * @tc.desc   Set expandSafeArea values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_expandSafeArea', 0, async function (done) {
      console.info('[common_expandSafeArea] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_expandSafeArea] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.expandSafeArea).assertEqual(undefined);
      console.info('[common_expandSafeArea] END');
      done();
    });
    
    /**
     * @tc.number common_0036
     * @tc.name   Test the properties of components
     * @tc.desc   Set responseRegion values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_responseRegion', 0, async function (done) {
      console.info('[common_responseRegion] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_responseRegion] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.responseRegion[0]).assertEqual("{\"x\":\"0.00vp\",\"y\":\"0.00vp\",\"width\":\"50.00%\",\"height\":\"100.00%\"}");
      console.info('[common_responseRegion] END');
      done();
    });

    /**
     * @tc.number common_0037
     * @tc.name   Test the properties of components
     * @tc.desc   Set visibility values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_visibility', 0, async function (done) {
      console.info('[common_visibility] START');
      let strJson = getInspectorByKey('buttonModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_visibility] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
      console.info('[common_visibility] END');
      done();
    });

    /**
     * @tc.number common_0038
     * @tc.name   Test the properties of components
     * @tc.desc   Set opacity values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_opacity', 0, async function (done) {
      console.info('[common_opacity] START');
      let strJson = getInspectorByKey('buttonModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_opacity] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info('[common_opacity] END');
      done();
    });

    /**
     * @tc.number common_0039
     * @tc.name   Test the properties of components
     * @tc.desc   Set margin values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_margin', 0, async function (done) {
    console.info('[common_margin] START');
    let strJson = getInspectorByKey('buttonModifier2');
    let obj = JSON.parse(strJson);
    console.info("[common_margin] obj is : " + JSON.stringify(obj.$attrs));
    expect(obj.$attrs.margin).assertEqual("20.00vp");
    console.info('[common_margin] END');
    done();
    });

    /**
     * @tc.number common_0040
     * @tc.name   Test the properties of components
     * @tc.desc   Set padding values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_padding', 0, async function (done) {
      console.info('[common_padding] START');
      let strJson = getInspectorByKey('buttonModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_padding] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.padding).assertEqual("1.00vp");
      console.info('[common_padding] END');
      done();
    });

    /**
     * @tc.number common_0041
     * @tc.name   Test the properties of components
     * @tc.desc   Set backgroundColor values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_backgroundColor', 0, async function (done) {
      console.info('[common_backgroundColor] START');
      let strJson = getInspectorByKey('buttonModifier2');
      let obj = JSON.parse(strJson);
      console.info("[common_backgroundColor] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.backgroundColor).assertEqual("#FFFF0000");
      console.info('[common_backgroundColor] END');
      done();
    });

    /**
     * @tc.number common_0042
     * @tc.name   Test the properties of components
     * @tc.desc   Set linearGradient values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_linearGradient', 0, async function (done) {
      console.info('[common_linearGradient] START');
      let strJson = getInspectorByKey('imageModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_linearGradient] obj is : " + JSON.stringify(obj.$attrs));
      let mLinearGradient = obj.$attrs.linearGradient;
      expect(mLinearGradient.direction).assertEqual("GradientDirection.Left");
      console.info('[common_linearGradient] END');
      done();
    });

    /**
     * @tc.number common_0043
     * @tc.name   Test the properties of components
     * @tc.desc   Set linearGradientBlur values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_linearGradientBlur', 0, async function (done) {
      console.info('[common_linearGradientBlur] START');
      let strJson = getInspectorByKey('imageModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_linearGradientBlur] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.linearGradientBlur).assertEqual(undefined);
      console.info('[common_linearGradientBlur] END');
      done();
    });

    /**
     * @tc.number common_0044
     * @tc.name   Test the properties of components
     * @tc.desc   Set blendMode values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_blendMode', 0, async function (done) {
      console.info('[common_blendMode] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_blendMode] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.blendMode).assertEqual(16);
      console.info('[common_blendMode] END');
      done();
    });
    /**
     * @tc.number common_0045
     * @tc.name   Test the properties of components
     * @tc.desc   Set accessibilityLevel values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_accessibilityLevel', 0, async function (done) {
      console.info('[common_accessibilityLevel] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_accessibilityLevel] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.accessibilityLevel).assertEqual(undefined);
      console.info('[common_accessibilityLevel] END');
      done();
    });
    /**
     * @tc.number common_0046
     * @tc.name   Test the properties of components
     * @tc.desc   Set accessibilityDescription values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_accessibilityDescription', 0, async function (done) {
      console.info('[common_accessibilityDescription] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_accessibilityDescription] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.accessibilityDescription).assertEqual(undefined);
      console.info('[common_accessibilityDescription] END');
      done();
    });

    /**
     * @tc.number common_0047
     * @tc.name   Test the properties of components
     * @tc.desc   Set accessibilityText values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_accessibilityText', 0, async function (done) {
      console.info('[common_accessibilityText] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_accessibilityText] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.accessibilityText).assertEqual(undefined);
      console.info('[common_accessibilityText] END');
      done();
    });

    /**
     * @tc.number common_0048
     * @tc.name   Test the properties of components
     * @tc.desc   Set accessibilityGroup values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_accessibilityGroup', 0, async function (done) {
      console.info('[common_accessibilityGroup] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_accessibilityGroup] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.accessibilityGroup).assertEqual(undefined);
      console.info('[common_accessibilityGroup] END');
      done();
    });

    /**
     * @tc.number common_0049
     * @tc.name   Test the properties of components
     * @tc.desc   Set restoreId values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_restoreId', 0, async function (done) {
      console.info('[common_restoreId] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_restoreId] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.restoreId).assertEqual(undefined);
      console.info('[common_restoreId] END');
      done();
    });

    /**
     * @tc.number common_0050
     * @tc.name   Test the properties of components
     * @tc.desc   Set allowDrop values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_allowDrop', 0, async function (done) {
      console.info('[common_allowDrop] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_allowDrop] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.allowDrop).assertEqual(undefined);
      console.info('[common_allowDrop] END');
      done();
    });

    /**
     * @tc.number common_0051
     * @tc.name   Test the properties of components
     * @tc.desc   Set alignRules values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_alignRules', 0, async function (done) {
      console.info('[common_alignRules] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_alignRules] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.alignRules).assertEqual(undefined);
      console.info('[common_alignRules] END');
      done();
    });

    /**
     * @tc.number common_0052
     * @tc.name   Test the properties of components
     * @tc.desc   Set foregroundBlurStyle values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('common_foregroundBlurStyle', 0, async function (done) {
      console.info('[common_foregroundBlurStyle] START');
      let strJson = getInspectorByKey('rowModifier');
      let obj = JSON.parse(strJson);
      console.info("[common_foregroundBlurStyle] obj is : " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.foregroundBlurStyle).assertEqual(undefined);
      console.info('[common_foregroundBlurStyle] END');
      done();
    });
  })
}
