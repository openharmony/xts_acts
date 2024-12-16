/*
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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { ConfigurationConstant } from '@kit.AbilityKit';

export default function windowTitleBarTest() {
  describe('windowTitleBarTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0100
     * @tc.name      : test_setDecorButtonStyle_null
     * @tc.desc      : test_setDecorButtonStyle_null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_null', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_null';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.setDecorButtonStyle(null);
        console.info(msgStr+ ' Succeeded in setting the style of button.');
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0200
     * @tc.name      : test_getDecorButtonStyle_undifined
     * @tc.desc      : test_getDecorButtonStyle_undifined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_getDecorButtonStyle_undifined', 0, async (done: Function) => {
      let caseName: string = 'test_getDecorButtonStyle_undifined';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(28);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(12);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0300
     * @tc.name      : test_setDecorButtonStyle_colorMode_-2
     * @tc.desc      : test_setDecorButtonStyle_colorMode_-2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_-2', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_-2';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
        try {
          let colorMode : ConfigurationConstant.ColorMode = -2;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
          };
          windowClass.setDecorButtonStyle(style);
          console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
          expect(false).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
          if(exception.code = 801){
            done();
          }else if(exception.code = 401){
            expect(true).assertTrue();
            done();
          }else {
            expect(false).assertTrue();
            done();
          }
        }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0400
     * @tc.name      : test_setDecorButtonStyle_colorMode_-1
     * @tc.desc      : test_setDecorButtonStyle_colorMode_-1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_-1', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_-1';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0500
     * @tc.name      : test_setDecorButtonStyle_colorMode_1
     * @tc.desc      : test_setDecorButtonStyle_colorMode_1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_1', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_1';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0600
     * @tc.name      : test_setDecorButtonStyle_colorMode_0
     * @tc.desc      : test_setDecorButtonStyle_colorMode_0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_0', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_0';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0700
     * @tc.name      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10
     * @tc.desc      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          buttonBackgroundSize: 10,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0800
     * @tc.name      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50
     * @tc.desc      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          buttonBackgroundSize: 50,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0900
     * @tc.name      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20
     * @tc.desc      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          buttonBackgroundSize: 20,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1000
     * @tc.name      : test_setDecorButtonStyle
     * @tc.desc      : test_setDecorButtonStyle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 20
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });

  })
}