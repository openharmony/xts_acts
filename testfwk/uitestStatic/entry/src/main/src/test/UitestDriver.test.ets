/**
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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, loadAndSetUpUiTest } from '@ohos.UiTest'
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs: int = 1000;
const DeviceErrorCode: string = "17000005";

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

function sleep(numberMillis: int) {
  const exitTime = new Date().getTime() + numberMillis;
  while (new Date().getTime() < exitTime) { }
  return
}

export default function uitestDriverTest() {
  describe('uitestDriverTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverTest loadup start!!!!!")
      await Utils.loadAndSetUpUiTest();
      await Utils.msSleep(2000)
      hilog.info(domain, tag, "uitestDriverTest loadup over!!!!!")
    })
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    it('testDriverWakeUpDisplay',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDriverWakeUpDisplay Start`);
      try {
       let driver = Driver.create();
       await driver.wakeUpDisplay();
      } catch (error : Error) {
        hilog.info(domain, tag, `testDriverWakeUpDisplay error: ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testDriverWakeUpDisplay end`);
    })

    it('testDriverForComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testDriverForComponent Start!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      let button = await driver.waitForComponent(ON.text('next page'), 1000);
      hilog.info(domain, tag, `testDriverForComponent waitForComponent button: ${ JSON.stringify(button) }`);
      expect(button != null).assertTrue()
      if (button != null) {
        let msg = await button.getText();
        hilog.info(domain, tag, `testDriverForComponent msg: ${ JSON.stringify(msg) }`);
        expect(msg).assertEqual('next page');
      } else {
        hilog.info(domain, tag, `testDriverForComponent waitForComponent not find`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "waitForComponent over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testPressBack',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPressBack Start!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('next page'));
      if (button != null) {
        await button.click();
      }
      await driver.delayMs(waitUiReadyMs);
      await driver.pressBack();
      await driver.delayMs(waitUiReadyMs);
      let button_ori = await driver.findComponent(ON.text('next page'));
      expect(button_ori != null).assertTrue();
      if (button_ori != null) {
        let btnMsg = await button_ori.getText();
        expect(btnMsg == 'next page').assertTrue();
      }

      hilog.info(domain, tag, "testPressBack over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testPressHome',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPressHome Start!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs * 5);
        await driver.pressHome();
        await driver.delayMs(waitUiReadyMs * 5);
        let button = await driver.findComponent(ON.text('next page'))
        expect(button == null).assertTrue();
      }catch(error) {
        hilog.info(domain, tag, `testPressHome error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }

      hilog.info(domain, tag, "testPressHome over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testFindComponent',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindComponent Start!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        hilog.info(domain, tag, `testFindComponent startAbility`);
        await driver.delayMs(waitUiReadyMs);
        hilog.info(domain, tag, `testFindComponent delayMs`);
        let button = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testFindComponent button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue();
        hilog.info(domain, tag, `testFindComponent 00000`);
        if (button != null) {
          let msg = await button.getText();
          hilog.info(domain, tag, `testFindComponent msg, ${ JSON.stringify(msg) }`);
          expect(msg == 'next page').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindComponent error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindComponent over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts')
    })
    it('testFindComponents',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindComponents Start!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let buttons:Array<Component>|null = await driver.findComponents(ON.type('Button'));
      hilog.info(domain, tag, `testFindComponents findComponent buttons , ${ JSON.stringify(buttons)  }`);
      expect(buttons != null).assertTrue();
      if (buttons != null) {
        let btn = buttons[0] as Component;
        let msg = await btn.getText();
        expect(msg != null).assertTrue();
      }
      hilog.info(domain, tag, "testFindComponents over!!!!!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testPenLongClick',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPenLongClick start!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let button = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testPenLongClick button success, ${  JSON.stringify(button) }`);
        expect(button != null).assertTrue();
        if (button != null) {
          let btnPoint = await button.getBoundsCenter();
          hilog.info(domain, tag, `testPenLongClick btnPoint success, ${  JSON.stringify(btnPoint) }`);
          await driver.penLongClick(btnPoint, 0.5);
          hilog.info(domain, tag, `testPenLongClick penLongClick success`);
          await driver.delayMs(waitUiReadyMs);
          let newButton = await driver.findComponent(ON.text('longClick'));
          expect(newButton != null).assertTrue();
          if (newButton != null) {
            let text = await newButton.getText();
            expect(text == 'longClick').assertTrue();
            await newButton.click();
            await driver.delayMs(waitUiReadyMs);
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testPenLongClick error, ${ JSON.stringify(error)} `);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "testPenLongClick end!!!!");
    })

    it('testPenDoubleClick',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testPenDoubleClick start`);
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let btnCom = await driver.findComponent(ON.text('Click twice'));
        hilog.info(domain, tag, `testPenDoubleClick create Driver success, ${ JSON.stringify(btnCom)}`);
        await driver.delayMs(1000);
        expect(btnCom != null).assertTrue();
        if (btnCom != null) {
          let btnPoint = await btnCom.getBoundsCenter();
          hilog.info(domain, tag, `testPenDoubleClickbtnPoint success, ${ JSON.stringify(btnPoint)}`);
          await driver.penDoubleClick(btnPoint);
          hilog.info(domain, tag, `testPenDoubleClickbtnPoint penDoubleClick success`);
        }
        await driver.delayMs(1000);
        let newButton = await driver.findComponent(ON.text('doubleClick'));
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          hilog.info(domain, tag, `testPenDoubleClick newButton success, ${ JSON.stringify(newButton)}`);
          let text = await newButton.getText();
          hilog.info(domain, tag, `testPenDoubleClick text success, ${ JSON.stringify(text)}`);
          expect(text == 'doubleClick').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testPenDoubleClick error, ${ JSON.stringify(error)} }`);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "testPenDoubleClick over!!!!")
    })

    it('testPenClick',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPenClick start!!!!")
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的next page 按钮。
      try {
        let btnCom = await driver.findComponent(ON.text('next page'));
        await driver.delayMs(waitUiReadyMs);
        expect(btnCom != null).assertTrue();
        if (btnCom != null) {
          let btnPoint = await btnCom.getBoundsCenter();
          hilog.info(domain, tag, `testPenClick penLongClick success`);
          await driver.penClick(btnPoint);
          await driver.delayMs(waitUiReadyMs);
        }
        let strCom = await driver.findComponent(ON.text('back to index'));
        await driver.delayMs(waitUiReadyMs);
        expect(strCom != null).assertTrue();
        if (strCom != null) {
          let strText = await strCom.getText();
          await driver.delayMs(waitUiReadyMs);
          expect(strText).assertEqual('back to index');
          await strCom.click();
          await driver.delayMs(waitUiReadyMs);
        }

      } catch(error: Error) {
        hilog.info(domain, tag, `testPenClick penLongClick error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      //  hilog.info(domain, tag, `testPenClick penLongClick error, ${ error.code }`);
      //  expect(JSON.stringify(error.code)).assertEqual('17000005');
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "testPenClick over!!!!")
    })

    it('testMouseScroll',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let btn = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseScroll btn success, ${  JSON.stringify(btn) }`);
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click();
          hilog.info(domain, tag, `testMouseScroll btn click`);
        }
        await driver.delayMs(1000);
        let img1 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
        hilog.info(domain, tag, `testMouseScroll img1 success, ${  JSON.stringify(img1) }`);
        expect(img1 != null).assertTrue();
        if (img1 != null) {
          let bounds1 = await img1.getBounds();
          hilog.info(domain, tag, `testMouseScroll bounds1 success, ${  JSON.stringify(bounds1) }`);
          let center1 = await img1.getBoundsCenter();
          hilog.info(domain, tag, `testMouseScroll center1 success, ${  JSON.stringify(center1) }`);
          await driver.click(center1.x, center1.y);
          hilog.info(domain, tag, `testMouseScroll btn click`);
          await driver.delayMs(1000);
          await driver.mouseScroll(center1,false,5,2072,0);
          hilog.info(domain, tag, `testMouseScroll mouseScroll`);
          await driver.delayMs(1000);
          let img2 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'));
          hilog.info(domain, tag, `testMouseScroll img2 success, ${  JSON.stringify(img2) }`);
          expect(img2 != null).assertTrue();
          if (img2 != null) {
            let bounds2 = await img2.getBounds();
            hilog.info(domain, tag, `testMouseScroll bounds2 success, ${  JSON.stringify(bounds2) }`);
            expect(bounds1 != bounds2).assertTrue()
          }
          await driver.pressBack();
          hilog.info(domain, tag, `testMouseScroll pressBack`);
          await driver.delayMs(1000);
          let scroll = await driver.findComponent(ON.text('1'))
          hilog.info(domain, tag, `testMouseScroll scroll success, ${  JSON.stringify(scroll) }`);
          expect(scroll != null).assertTrue();
          if (scroll != null) {
            let center = await scroll.getBoundsCenter();
            hilog.info(domain, tag, `testMouseScroll center success, ${  JSON.stringify(center) }`);
            await driver.mouseScroll(center,true,30);
            await driver.delayMs(1000);
          }
        }
        let button1 = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testMouseScroll button1 , ${  JSON.stringify(button1) }`);
        expect(button1 == null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testMouseScroll error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseScroll over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testDriverClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let Button = await driver.findComponent(ON.text('next page'))
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter()
        await driver.click(center.x, center.y)
        await driver.delayMs(waitUiReadyMs)
      }
      let newButton = await driver.findComponent(ON.text('back to index'))
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText()
        expect(text == 'back to index').assertTrue()
        await newButton.click()
      }
      await stopApplication('com.uitestScene.acts')
    })

    it('testUiDriverDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      const driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.text('Click twice'))
      if (button == null) {
        let scorll = await driver.findComponent(ON.type('Scroll'))
        if (scorll != null) {
          button = await scorll.scrollSearch(ON.text('Click twice'))
        }
      }
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter()
        await driver.doubleClick(center.x, center.y)
        await driver.delayMs(waitUiReadyMs)
      }

      let button1 = await driver.findComponent(ON.text('doubleClick'))
      expect(button1 != null).assertTrue();
      if (button1 != null) {
        let text = await button1.getText()
        expect(text == 'doubleClick').assertTrue()
        await button1.click()
      }
      await stopApplication('com.uitestScene.acts')
    })

    it('testLongClick',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('next page'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver.longClick(center.x, center.y)
        await driver.delayMs(waitUiReadyMs);
        let newButton = await driver.findComponent(ON.text('longClick'));
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText();
          expect(text == 'longClick').assertTrue();
          await newButton.click();
        }
      }
      hilog.info(domain, tag, "testLongClick over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testMouseClick_RIGHT',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (): Promise<void> => {
      hilog.info(domain, tag, `testMouseClick_RIGHT start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs);

      // 点击页面中的jump 按钮。
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseClick_RIGHT button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_RIGHT);
          await driver.delayMs(waitUiReadyMs);
        }
        await driver.delayMs(waitUiReadyMs);
        let button1 = await driver.findComponent(ON.text('right'));
        hilog.info(domain, tag, `testMouseClick_RIGHT button1, ${ JSON.stringify(button1)}`);
        expect(button1 != null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testMouseClick_RIGHT error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseClick_RIGHT over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testMouseClick_MIDDLE',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的jump 按钮。
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseClick_MIDDLE button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_MIDDLE,2072,2045);
          await driver.delayMs(waitUiReadyMs);
          let button2 = await driver.findComponent(ON.text('middle'));
          hilog.info(domain, tag, `testMouseClick_MIDDLE button2, ${ JSON.stringify(button2)}`);
          expect(button2 != null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseClick_MIDDLE mouseClick error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseClick_MIDDLE over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testMouseClick_LEFT',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseClick_LEFT start!!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      // 点击页面中的jump 按钮。
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseClick_LEFT button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_LEFT);
          await driver.delayMs(waitUiReadyMs * 3);
          let Button3 = await driver.findComponent(ON.id('jump'));
          hilog.info(domain, tag, `testMouseClick_LEFT Button3, ${ JSON.stringify(Button3)}`);
          expect(Button3 == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseClick_LEFT error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseClick_LEFT over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testMouseDoubleClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('Click twice'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT,0 , 0);
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('doubleClick'));
        expect(button != null).assertTrue();
        if (button != null) {
          let text = await button.getText();
          expect(text == 'doubleClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })
    it('testMouseDoubleClick_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('Click twice'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0);
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('doubleClick'));
        expect(button != null).assertTrue();
        if (button != null) {
          let text = await button.getText();
          expect(text == 'doubleClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })
    it('testMouseDoubleClick_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('Click twice'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT);
        await driver.delayMs(waitUiReadyMs)
        let button = await driver.findComponent(ON.text('doubleClick'));
        expect(button != null).assertTrue();
        if (button != null) {
          let text = await button.getText();
          expect(text == 'doubleClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })
    it('testMouseLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
        await driver.delayMs(waitUiReadyMs);
        let newButton = await driver.findComponent(ON.text('longClick'));
        expect(newButton != null).assertTrue();
        if (newButton != null) {
          let text = await newButton.getText();
          expect(text == 'longClick').assertTrue();
        }
      }
      await stopApplication('com.uitestScene.acts');
    })
    it('testMouseLongClick_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0);
        await driver.delayMs(waitUiReadyMs);
      }
      let newButton = await driver.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
    })
    it('testMouseLongClick_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Button = await driver.findComponent(ON.text('next page'));
      expect(Button != null).assertTrue();
      if (Button != null) {
        let center = await Button.getBoundsCenter();
        await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT);
        await driver.delayMs(waitUiReadyMs);
      }
      let newButton = await driver.findComponent(ON.text('longClick'));
      expect(newButton != null).assertTrue();
      if (newButton != null) {
        let text = await newButton.getText();
        expect(text == 'longClick').assertTrue();
      }
      await stopApplication('com.uitestScene.acts');
    })
    it('testAssertComponentExist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      await driver.assertComponentExist(ON.text('next page'))
      await stopApplication('com.uitestScene.acts')
    })
    it('testGetDisplayRotation',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let rotation = await driver.getDisplayRotation();
        hilog.info(domain, tag, `testGetDisplayRotation success, ${JSON.stringify(rotation)}`);
        expect(rotation != null).assertTrue();
      }catch( error) {
        hilog.info(domain, tag, `testGetDisplayRotation error is, ${ JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testGetDisplayRotation over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testGetDisplayDensity',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testGetDisplayDensity start !!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        let density = await driver.getDisplayDensity();
        hilog.info(domain, tag, `testGetDisplayDensity getDisplayRotation success, ${JSON.stringify(density)}`);
        expect(density.x != 0).assertTrue()
        expect(density.y != 0).assertTrue()
      }catch( error) {
        hilog.info(domain, tag, `testGetDisplayDensity error is, ${ JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testGetDisplayDensity over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testUIEventObserverToast',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let callback = (uiElementInfo : UIElementInfo): void => {
          try {
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo, ${ JSON.stringify(uiElementInfo) }`);
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo bundleName , ${ uiElementInfo.bundleName }`);
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo bundleName length , ${ uiElementInfo.bundleName.length }`);
            expect(uiElementInfo.bundleName == "com.uitestScene.acts").assertTrue();
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo text , ${ uiElementInfo.text }`);
            expect(uiElementInfo.text == 'toastShow').assertTrue();
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo type , ${ uiElementInfo.type }`);
            expect(uiElementInfo.type == 'Toast').assertTrue();
          } catch (err) {
            hilog.info(domain, tag, `testUIEventObserverToast callback error, ${ JSON.stringify(err) }`);
          }
        }
        let observer = driver.createUIEventObserver();
        hilog.info(domain, tag, `testUIEventObserverToast createUIEventObserver success, ${JSON.stringify(observer)}`);
        observer.once('toastShow', callback);
        hilog.info(domain, tag, `testUIEventObserverToast once toastShow success`);
        // 点击toast按钮
        let btn = await driver.findComponent(ON.text('toast'));
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click()
        }
        await driver.delayMs(3000);
      } catch(error) {
        hilog.info(domain, tag, `testUIEventObserverToast error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "testUIEventObserverToast over!!!!")
      await stopApplication('com.uitestScene.acts');
    })
    it('testUIEventObserverDialog',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let callback = (uiElementInfo : UIElementInfo): void => {
          try {
            hilog.info(domain, tag, `testUIEventObserverDialog UIElementInfo, ${ JSON.stringify(uiElementInfo) }`);
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo bundleName , ${ uiElementInfo.bundleName }`);
            expect(uiElementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo text , ${ uiElementInfo.text }`);
            expect(uiElementInfo.type == 'AlertDialog').assertTrue()
            hilog.info(domain, tag, `testUIEventObserverToast UIElementInfo type , ${ uiElementInfo.type }`);
            expect(uiElementInfo.text == 'dialogShow').assertTrue()
          } catch (err) {
            hilog.info(domain, tag, `testUIEventObserverDialog callback error, ${ JSON.stringify(err) }`);
          }
        }
        let observer = driver.createUIEventObserver();
        hilog.info(domain, tag, `testUIEventObserverDialog createUIEventObserver success, ${JSON.stringify(observer)}`);
        observer.once('dialogShow', callback);
        hilog.info(domain, tag, `testUIEventObserverDialog dialogShow success`);
        // 点击toast按钮
        let btn = await driver.findComponent(ON.text('dialog'));
        expect(btn != null).assertTrue();
        if (btn != null) {
          await btn.click()
        }
        await driver.delayMs(3000);
        hilog.info(domain, tag, `testUIEventObserverDialog click success`);
      } catch(error) {
        hilog.info(domain, tag, `testUIEventObserverDialog error, ${ JSON.stringify(error) }`);
      }
      hilog.info(domain, tag, "testUIEventObserverDialog over!!!!")
      await stopApplication('com.uitestScene.acts');
    })
    it('testPenSwipe',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testPenSwipe start !!!!")
      try {
        let driver = Driver.create()
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        // 垂直滑动
        await driver.penSwipe({x: 500, y: 1100},
          {x: 500, y: 300 },600, 0.5);
        let text = await driver.findComponent(ON.text('toast'));
        await driver.delayMs(waitUiReadyMs);
        expect(text == null).assertTrue();
        await driver.delayMs(waitUiReadyMs);
        let pressureCom = await driver.findComponent(ON.id('pressure'));
        await driver.delayMs(waitUiReadyMs);
        expect(pressureCom != null).assertTrue();
        if (pressureCom != null) {
          let pressure = await pressureCom.getText();
          await driver.delayMs(waitUiReadyMs);
          expect(pressure).assertEqual('0.5');
        }
      } catch(error) {
        hilog.info(domain, tag, `testPenSwipe error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "testPenSwipe over!!!!")
      await stopApplication('com.uitestScene.acts')
    })
    it('testFling',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFling start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        // 垂直滑动
        await driver.fling({x:500, y:1100},{x:500, y:300}, 20, 600);
        await driver.delayMs(waitUiReadyMs);
        let text = await driver.findComponent(ON.text('toast'));
        expect(text == null).assertTrue();
        hilog.info(domain, tag, `testFling fling success`);
      } catch(error) {
        hilog.info(domain, tag, `testFling error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFling over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testFling_d', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      // let d = await display.getDefaultDisplaySync();
      // if (d.id == 999) {
      //   console.info('Can not create full screen application scene')
      //   return
      // }
      let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
      // try {
      //   if (window != null) {
      //     await window.maximize();
      //     await driver.delayMs(500);
      //   }
      // } catch (error) {
      //   console.info('It is already a Fullscreen window')
      // }
      await driver.fling(UiDirection.DOWN, 39000)
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponents(ON.text('next page'))
      expect (button == null).assertTrue();
      await driver.fling(UiDirection.LEFT, 39000)
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponents(ON.text('1'))
      expect (text == null).assertTrue();
      await driver.fling(UiDirection.RIGHT, 39000)
      await driver.delayMs(waitUiReadyMs)
      let text2 = await driver.findComponents(ON.text('1'))
      expect (text2 == null).assertTrue();
      await driver.fling(UiDirection.UP, 39000)
      await driver.delayMs(2000)
      let button2 = await driver.findComponents(ON.text('bottom'))
      expect (button2 == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
    })
    it('testDrag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(ON.id('jump'))
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
        await driver.delayMs(waitUiReadyMs);
      }
      let text1 = await driver.findComponent(ON.text('one'))
      let text2 = await driver.findComponent(ON.text('two'))
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter()
        let point2 = await text2.getBoundsCenter()
        await driver.drag(point1.x, point1.y, point2.x, point2.y)
        await driver.delayMs(waitUiReadyMs)
      }
      let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
    })
    it('testScreenCap',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testScreenCap start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create()
        await driver.delayMs(1000);
        let savePath = '/data/storage/el2/base/cache/1.png';
        let success = await driver.screenCap(savePath);
        hilog.info(domain, tag, `testScreenCap screenCap , ${ success }`);
        expect(success == true).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testScreenCap error, ${ JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "testScreenCap over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testGetDisplaySize',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetDisplaySize start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let test = await driver.getDisplaySize();
        hilog.info(domain, tag, `testGetDisplaySize test, ${JSON.stringify(test)}`);
        expect(test.x != 0).assertTrue();
        expect(test.y != 0).assertTrue();
      } catch (error : Error) {
        hilog.info(domain, tag, `testGetDisplaySize error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testGetDisplaySize end`);
    })
    it('testFindWindowBundleName',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowBundleName start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        hilog.info(domain, tag, `testFindWindowBundleName window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let name = await window.getBundleName();
          hilog.info(domain, tag, `testFindWindowBundleName name , ${ name }`);
          expect(name == 'com.uitestScene.acts').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowBundleName error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindow over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testFindWindowActive',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowActive start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({active: true});
        hilog.info(domain, tag, `testFindWindowActive window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let isActive = await window.isActive();
          hilog.info(domain, tag, `testFindWindowActive isActive , ${ isActive }`);
          expect(isActive).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowActive error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindowActive over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testFindWindowFocused',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindowFocused start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({focused: true});
        hilog.info(domain, tag, `testFindWindowFocused window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let isFocused = await window.isFocused();
          hilog.info(domain, tag, `testFindWindowFocused isFocused , ${ isFocused }`);
          expect(isFocused).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindowFocused error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindowFocused over!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    it('testFindWindow',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testFindWindow start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        hilog.info(domain, tag, `testFindWindow window , ${ JSON.stringify(window) }`);
        expect(window != null).assertTrue();
        if (window != null) {
          let name = await window.getBundleName();
          hilog.info(domain, tag, `testFindWindow name , ${ name }`);
          expect(name == 'com.uitestScene.acts').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testFindWindow error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testFindWindow over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testTouchPadMultiFingerSwipe',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (): Promise<void> => {
      hilog.info(domain, tag, `testTouchPadMultiFingerSwipe start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        // 三指上划返回桌面。
        await driver.touchPadMultiFingerSwipe(3, UiDirection.UP);
        hilog.info(domain, tag, `testTouchPadMultiFingerSwipe UiDirection.UP success`);
        await driver.delayMs(1000);
        let mainPageCom = await driver.findComponent(ON.text('MainPage'));
        hilog.info(domain, tag, `testTouchPadMultiFingerSwipe mainPageCom, ${JSON.stringify(mainPageCom)}`);
        expect(mainPageCom == null).assertTrue();
        // 三指下划,应用返回前台
        await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN);
        hilog.info(domain, tag, `testTouchPadMultiFingerSwipe UiDirection.DOWN success`);
        await driver.delayMs(1000);
        let mainPageCom1 = await driver.findComponent(ON.text('MainPage'));
        hilog.info(domain, tag, `testTouchPadMultiFingerSwipe mainPageCom1, ${JSON.stringify(mainPageCom1)}`);
        expect(mainPageCom1 != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, `testTouchPadMultiFingerSwipe error, ${JSON.stringify(error)}`);
       // hilog.info(domain, tag, `testTouchPadMultiFingerSwipe error.code, ${error.code}`);
       // expect(JSON.stringify(error.code)).assertEqual(DeviceErrorCode);
      }
      hilog.info(domain, tag, `testTouchPadMultiFingerSwipe end`);
      await stopApplication('com.uitestScene.acts');

    })
    it('testMouseMoveWithTrack',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseMoveWithTrack start !!!!");
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create()
        await driver.delayMs(waitUiReadyMs);
         let button = await driver.findComponent(ON.id('jump'));
        expect(button != null).assertTrue();
        if (button != null ) {
          let center1 = await button.getBoundsCenter();
          // jump 按钮 349, 472
          await driver.mouseMoveTo(center1);
          hilog.info(domain, tag, `testMouseMoveWithTrack mouseMoveTo success`);
          await driver.delayMs(1000);
          let checkBox = await driver.findComponent(ON.type('Checkbox'));
          expect(checkBox != null).assertTrue();
          if (checkBox != null) {
            let center2 = await checkBox.getBoundsCenter();
            await driver.mouseMoveWithTrack(center1, center2, 600);
            await driver.delayMs(1000);
            await driver.mouseMoveWithTrack(center1, center2);
          }
        }
         let newButton = await driver.findComponent(ON.text('jump'));
         hilog.info(domain, tag, `testMouseMoveWithTrack newButton, ${ JSON.stringify(newButton) }`);
        expect(newButton == null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testMouseMoveWithTrack error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseMoveWithTrack over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testMouseMoveTo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseMoveTo start !!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseMoveWithTrack button success,${JSON.stringify(button)}`);
        await driver.delayMs(1000);
        expect(button != null).assertTrue();
        if (button != null) {
          let center = await button.getBoundsCenter();
          hilog.info(domain, tag, `testMouseMoveWithTrack center success,${JSON.stringify(center)}`);
          // jump 按钮 349, 472
          await driver.mouseMoveTo(center);
          await driver.delayMs(2000);
          let newButton = await driver.findComponent(ON.text('hover'));
          hilog.info(domain, tag, `testMouseMoveWithTrack newButton success,${JSON.stringify(newButton)}`);
          expect(newButton != null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseMoveWithTrack error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseMoveWithTrack over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testMouseDrag',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testMouseDrag start !!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      try {
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testMouseDrag button success,${JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          await button.longClick();
          hilog.info(domain, tag, `testMouseDrag longClick success`);
        }
        await driver.delayMs(1000);
        let text1 = await driver.findComponent(ON.text('one'));
        hilog.info(domain, tag, `testMouseDrag text1 success,${JSON.stringify(text1)}`);
        let text2 = await driver.findComponent(ON.text('two'));
        hilog.info(domain, tag, `testMouseDrag text2 success,${JSON.stringify(text2)}`);
        expect(text1 != null).assertTrue();
        expect(text2 != null).assertTrue();
        if (text1 != null && text2 != null) {
          let center1 = await text1.getBoundsCenter();
          hilog.info(domain, tag, `testMouseDrag center1 success,${JSON.stringify(center1)}`);
          let center2 = await text2.getBoundsCenter();
          hilog.info(domain, tag, `testMouseDrag center2 success,${JSON.stringify(center2)}`);
          await driver.mouseDrag(center1, center2, 600);
          hilog.info(domain, tag, `testMouseDrag mouseDrag success`);
          await driver.delayMs(1000);
          let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
          expect(text == null).assertTrue();
          await driver.mouseDrag(center1, center2);
        }
      } catch(error) {
        hilog.info(domain, tag, `testMouseDrag error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testMouseDrag over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testInjectMultiPointerAction',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): Promise<void> => {
      hilog.info(domain, tag, "testInjectMultiPointerAction start !!!!");
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let pointer = PointerMatrix.create(1,8);
        for (let step = 0; step < 8; step++) {
          hilog.info(domain, tag, `testInjectMultiPointerAction, y: ${1100 - 100 *step}`);
          pointer.setPoint(0, step, {x: 500, y: 1100 - 100 *step});
        }
        hilog.info(domain, tag, `testInjectMultiPointerAction data , ${ JSON.stringify(pointer)}`);
        await driver.injectMultiPointerAction(pointer, 600);
        hilog.info(domain, tag, `testInjectMultiPointerAction successful`);
        await driver.delayMs(waitUiReadyMs);
        let text = await driver.findComponent(ON.text('toast'));
        expect(text == null).assertTrue();
        await driver.delayMs(waitUiReadyMs);
      } catch(error) {
        hilog.info(domain, tag, `testInjectMultiPointerAction error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "testInjectMultiPointerAction over!!!!")
    })
    it('test_injectPenPointAction_function',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "test_injectPenPointAction_function start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let pointer = PointerMatrix.create(1,8);
        hilog.info(domain, tag, `test_injectPenPointAction_function pointer, ${ JSON.stringify(pointer)}`);
        for (let step = 0; step < 8; step++) {
          pointer.setPoint(0, step, {x: 500, y: 1100 - 100 *step});
        }
        await driver.injectPenPointerAction(pointer, 600, 0.5);
        await driver.delayMs(2000);
        let text = await driver.findComponent(ON.text('toast'));
        hilog.info(domain, tag, `test_injectPenPointAction_function text, ${ JSON.stringify(text)}`);
        expect(text == null).assertTrue();
        await driver.delayMs(waitUiReadyMs);
        let pressureCom = await driver.findComponent(ON.id('pressure'));
        hilog.info(domain, tag, `test_injectPenPointAction_function pressureCom, ${ JSON.stringify(pressureCom)}`);
        await driver.delayMs(waitUiReadyMs);
        if (pressureCom != null) {
          let pressure = await pressureCom.getText();
          await driver.delayMs(waitUiReadyMs);
          expect(pressure).assertEqual('0.5');
        }
      } catch(error) {
        hilog.info(domain, tag, `test_injectPenPointAction_function error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      hilog.info(domain, tag, "test_injectPenPointAction_function over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testWaitForIdle',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "waitForIdle start !!!!")
      try {
        let driver = Driver.create();
        let idled = await driver.waitForIdle(4000,5000);
        hilog.info(domain, tag, `waitForIdle waitForIdle success, ${ idled }`);
        expect(idled).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `waitForIdle error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "waitForIdle over!!!!");
    })
    it('testTriggerKey',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testTriggerKey start !!!!")
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        // 点击进入next page
        let keyBack = 2;
        await driver.triggerKey(keyBack);
        hilog.info(domain, tag, `testTriggerKey triggerKey success`);
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testTriggerKey button, ${ JSON.stringify(button) }`);
        expect(button == null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testTriggerKey error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testTriggerKey over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testTriggerCombineKeys',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testTriggerCombineKeys start !!!!")
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `testTriggerCombineKeys text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue();
        if (text != null) {
          await text.clearText();
          await driver.delayMs(1000);
          await text.inputText('123456');
          hilog.info(domain, tag, `testTriggerCombineKeys inputText success`);
          let boundsCenter = await text.getBoundsCenter();
          hilog.info(domain, tag, `testTriggerCombineKeys boundsCenter, ${ JSON.stringify(boundsCenter) }`);
          // 点击输入框中心 360 702
          await driver.click(boundsCenter.x, boundsCenter.y);
        }
        hilog.info(domain, tag, `testTriggerCombineKeys click success`);
        await driver.delayMs(1000);
        hilog.info(domain, tag, `testTriggerCombineKeys delayMs success`);
        await driver.triggerCombineKeys(2072, 2017);
        hilog.info(domain, tag, `testTriggerCombineKeys triggerCombineKeys success`);
        await driver.delayMs(1000);
        hilog.info(domain, tag, `testTriggerCombineKeys delayMs1 success`);
        await driver.triggerCombineKeys(2072, 2019);
        hilog.info(domain, tag, `testTriggerCombineKeys triggerCombineKeys1 success`);
        let text2 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `testTriggerCombineKeys text2 success, ${ JSON.stringify(text2) }`);
        expect(text2 != null).assertTrue();
        if (text2 != null) {
          await text2.clearText();
          hilog.info(domain, tag, `testTriggerCombineKeys clearText success`);
        }
        await driver.delayMs(1000);
        hilog.info(domain, tag, `testTriggerCombineKeys delayMs3 success`);
        await driver.triggerCombineKeys(2072, 2038);
        hilog.info(domain, tag, `testTriggerCombineKeys triggerCombineKeys2 success`);
        await driver.delayMs(1000);
        hilog.info(domain, tag, `testTriggerCombineKeys delayMs4 success`);
        let text3 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `testTriggerCombineKeys text3 success, ${ JSON.stringify(text3) }`);
        expect(text3 != null).assertTrue();
        if (text3 != null) {
          let text3Msg = await text3.getText();
          hilog.info(domain, tag, `testTriggerCombineKeys text3Msg success, ${ JSON.stringify(text3Msg) }`);
          expect(text3Msg == '123456').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testTriggerCombineKeys error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testTriggerCombineKeys over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testDelayMs',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "testDelayMs start !!!!")
      try {
        let driver = Driver.create();
        await driver.delayMs(2000);
        hilog.info(domain, tag, `testDelayMs create delayMs success`);
      } catch(error) {
        hilog.info(domain, tag, `testDelayMs error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testDelayMs over!!!!")
    })
    it('tesInputText',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "tesInputText start !!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `tesInputText text success, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue();
        if (text != null) {
          await text.clearText();
          await driver.delayMs(1000);
          let center = await text.getBoundsCenter();
          hilog.info(domain, tag, `tesInputTextcenter success, ${ JSON.stringify(center) }`);
          await driver.inputText(center, '123456');
        }
        await driver.delayMs(1000);
        let text1 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `tesInputText text1 success, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue();
        if (text1 != null) {
          let inputText = await text1.getText();
          hilog.info(domain, tag, `tesInputText inputText success, ${ JSON.stringify(inputText) }`);
          expect(inputText).assertEqual('123456');
        }
      } catch(error) {
        hilog.info(domain, tag, `tesInputText error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "tesInputText over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testWakeUpDisplay',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWakeUpDisplay start`);
      try {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await driver.wakeUpDisplay();
        hilog.info(domain, tag, `testWakeUpDisplay wakeUpDisplay success`);
      } catch(error) {
        hilog.info(domain, tag, `testWakeUpDisplay error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testWakeUpDisplay end !!!`);
    })
    it('testSwipe',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testSwipe start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        await driver.delayMs(1000);
        let scroll = await driver.findComponent(ON.type('Scroll'));
        hilog.info(domain, tag, `testSwipe scroll success, ${JSON.stringify(scroll)}`);
        expect(scroll != null).assertTrue();
        if (scroll != null ) {
          let rect = await scroll.getBounds();
          hilog.info(domain, tag, `testSwipe getBounds success, ${JSON.stringify(rect)}`);
          let center = await scroll.getBoundsCenter();
          hilog.info(domain, tag, `testSwipe getBoundsCenter success, ${JSON.stringify(center)}`);
          await driver.swipe(500, 1100, 500, 300);
          hilog.info(domain, tag, `testSwipe swipe success`);
          await driver.delayMs(1000);
          hilog.info(domain, tag, `testSwipe create delayMs success`);
          let text = await driver.findComponent(ON.text('toast'));
          expect(text == null).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testSwipe error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testSwipe end !!!`);
      await stopApplication('com.uitestScene.acts');
    })
    it('testSetDisplayRotationEnabled',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testSetDisplayRotationEnabled start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      try {
        let driver = Driver.create();
        await driver.delayMs(1000);
        await driver.setDisplayRotationEnabled(true);
        await driver.delayMs(1000);
        await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
        await driver.delayMs(1000);
        let rotation = await driver.getDisplayRotation();
        hilog.info(domain, tag, `testSetDisplayRotationEnabled getDisplayRotation success,${JSON.stringify(rotation)}`);
        await driver.delayMs(1000);
        if (rotation == DisplayRotation.ROTATION_90) {
          await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
          hilog.info(domain, tag, `testSetDisplayRotationEnabled setDisplayRotation success`);
        } else {
          hilog.info(domain, tag, `testSetDisplayRotationEnabled The device is displayed in vertical on default`);
        }
      } catch(error) {
        hilog.info(domain, tag, `testSetDisplayRotationEnabled error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
    })
    it('testDisplayRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testDisplayRotation start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs)
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
      await driver.delayMs(waitUiReadyMs)
      let rotation = await driver.getDisplayRotation()
      if (rotation == DisplayRotation.ROTATION_90) {
        console.info('The device is displayed in horizontal on default')
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
        await driver.delayMs(waitUiReadyMs)
        let rotation1 = await driver.getDisplayRotation()
        expect(rotation1 == DisplayRotation.ROTATION_0)

        await driver.setDisplayRotation(DisplayRotation.ROTATION_180)
        await driver.delayMs(waitUiReadyMs)
        let rotation2 = await driver.getDisplayRotation()
        expect(rotation2 == DisplayRotation.ROTATION_270)

        await driver.setDisplayRotation(DisplayRotation.ROTATION_270)
        await driver.delayMs(waitUiReadyMs)
        let rotation3 = await driver.getDisplayRotation()
        expect(rotation3 == DisplayRotation.ROTATION_180)

        await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
      } else if (rotation == DisplayRotation.ROTATION_0) {
        console.info('The device is displayed in vertical on default')
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90)
        await driver.delayMs(waitUiReadyMs)
        let rotation1 = await driver.getDisplayRotation()
        expect(rotation1 == DisplayRotation.ROTATION_90)

        await driver.setDisplayRotation(DisplayRotation.ROTATION_180)
        await driver.delayMs(waitUiReadyMs)
        let rotation2 = await driver.getDisplayRotation()
        expect(rotation2 == DisplayRotation.ROTATION_180)

        await driver.setDisplayRotation(DisplayRotation.ROTATION_270)
        await driver.delayMs(waitUiReadyMs)
        let rotation3 = await driver.getDisplayRotation()
        expect(rotation3 == DisplayRotation.ROTATION_270)

        await driver.setDisplayRotation(DisplayRotation.ROTATION_0)
        await driver.delayMs(waitUiReadyMs)
      }
      hilog.info(domain, tag, `testDisplayRotation start`);
      await stopApplication('com.uitestScene.acts');
    })
    it('testScreenCapture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScreenCapture start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(1000);
        hilog.info(domain, tag, `testScreenCapture create Driver success, ${ JSON.stringify(driver) }`);
        await driver.delayMs(1000);
        let savePath = '/data/storage/el2/base/cache/testScreenCapture_1.png'
        let success = await driver.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100});
        hilog.info(domain, tag, `testScreenCapture  success, ${ JSON.stringify(success) }`);
        expect(success == true).assertTrue();
        let savePath1 = '/data/storage/el2/base/cache/testScreenCapture_2.png'
        let success1 = await driver.screenCapture(savePath1);
        hilog.info(domain, tag, `testScreenCapture  success1, ${ JSON.stringify(success1) }`);
        expect(success1 == true).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testScreenCapture error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScreenCapture end`);
      await stopApplication('com.uitestScene.acts');
    })
  })
}