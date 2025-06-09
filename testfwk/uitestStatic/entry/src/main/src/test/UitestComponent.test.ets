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
import { Component, Driver, ON, On, MatchPattern,Point, Rect, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, loadAndSetUpUiTest } from '@ohos.UiTest'
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs : number = 1000;
const DeviceErrorCode = 17000005;

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

export default function uitestComponentTest() {
  describe('uitestComponentTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestComponentTest loadup start!!!!!")
      await Utils.loadAndSetUpUiTest();
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestComponentTest loadup over!!!!!")
    })
    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    it('testClearText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testClearText start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let textInput = await driver.findComponent(ON.type("TextInput"));
        hilog.info(domain, tag, `testClearText textInput, ${JSON.stringify(textInput)} `);
        await driver.delayMs(1000);
        expect(textInput != null).assertTrue()
        if (textInput != null) {
          await textInput.clearText();
          hilog.info(domain, tag, `testClearText clearText`);
          await driver.delayMs(1000);
        }
        let textInput1 = await driver.findComponent(ON.type("TextInput"));
        hilog.info(domain, tag, `testClearText textInput1, ${JSON.stringify(textInput1)}`);
        await driver.delayMs(1000);
        expect(textInput1 != null).assertTrue()
        if (textInput1 != null) {
          let text1 = await textInput1.getText();
          hilog.info(domain, tag, `testClearText text1, ${JSON.stringify(text1)}`);
          expect(text1).assertEqual('');
        }
      } catch(error) {
        hilog.info(domain, tag, `testClearText error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testClearText end `);
    })
    it('testScrollToBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToBottom Start!!!!!!!!!!!!!!!!!!!!!!!!!！")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testScrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom();
          hilog.info(domain, tag, `testScrollToBottom scrollToBottom success`);
          await driver.delayMs(1000);
        }
        let bottom = await driver.findComponent(ON.text('bottom'));
        hilog.info(domain, tag, `testScrollToBottom bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
      } catch (error : Error) {
        hilog.info(domain, tag, `testScrollToBottom error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testScrollToBottom end !!!!!!!!!!!!!!!!!!!!!!!!!！");
      await stopApplication('com.uitestScene.acts');
    })
    it('testScrollToBottomSpeed',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToBottomSpeed Start!!!!!!!!!!!!!!!!!!!!!!!!!！")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testScrollToBottomSpeed driver, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom(2000);
          hilog.info(domain, tag, `testScrollToBottomSpeed scrollToBottom success`);
        }
        await driver.delayMs(1000);
        let bottom = await driver.findComponent(ON.text('bottom'));
        hilog.info(domain, tag, `testScrollToBottom bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
      } catch (error : Error) {
        hilog.info(domain, tag, `testScrollToBottomSpeed error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "testScrollToBottomSpeed end !!!!!!!!!!!!!!!!!!!!!!!!!！")
    })
    it('testScrollToTop',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToTop Start!!!!!!!!!!!!!!!!!!!!!!!!!！")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testScrollToTop scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom(2000);
          hilog.info(domain, tag, `testScrollToTop scrollToBottom success`);
        }
        await driver.delayMs(1000);
        if (scrollBar != null) {
          await scrollBar.scrollToTop();
          hilog.info(domain, tag, `testScrollToTop scrollToTop success`);
          await driver.delayMs(1000);
        }
        await driver.delayMs(1000);
        let bottom = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testScrollToTop bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, `testScrollToTop error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testScrollToTop end !!!!!!!!!!!!!!!!!!!!!!!!!！");
      await stopApplication('com.uitestScene.acts');
    })
    it('testScrollToTopSpeed',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        hilog.info(domain, tag, "testScrollToTopSpeed Start!!!!!!!!!!!!!!!!!!!!!!!!!！")
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'))
        hilog.info(domain, tag, `testScrollToTopSpeed driver, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await scrollBar.scrollToBottom(2000);
          hilog.info(domain, tag, `testScrollToTopSpeed scrollToBottom success`);
        }
        await driver.delayMs(1000);
        if (scrollBar != null) {
          await scrollBar.scrollToTop(1500);
          hilog.info(domain, tag, `testScrollToTopSpeed scrollToTop success`);
        }
        let bottom = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testScrollToTop bottom, ${JSON.stringify(bottom)} `);
        expect(bottom != null).assertTrue();
      } catch (error : Error) {
        hilog.info(domain, tag, `testScrollToTopSpeed error, ${JSON.stringify(error)} `);
      }
      hilog.info(domain, tag, "testScrollToTopSpeed end !!!!!!!!!!!!!!!!!!!!!!!!!！");
      await stopApplication('com.uitestScene.acts');
    })
    it('testScrollSearch',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScrollSearch start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'));
        hilog.info(domain, tag, `testScrollSearch scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          let button = await scrollBar.scrollSearch(ON.text('next page'));
          hilog.info(domain, tag, `testScrollSearch button, ${JSON.stringify(button)} `);
          expect(button != null).assertTrue()
          if (button != null ) {
            let text = await button.getText();
            hilog.info(domain, tag, `testScrollSearch text, ${JSON.stringify(text)} `);
            expect(text).assertEqual('next page');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testScrollSearch error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScrollSearch end `);
      await stopApplication('com.uitestScene.acts');
    })
    it('testScrollSearchVertical',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScrollSearchVertical start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('scroll'));
        hilog.info(domain, tag, `testScrollSearchVertical button, ${JSON.stringify(button)} `);
        await driver.delayMs(1000);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.click();
        }
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.id('verticalScroll'));
        hilog.info(domain, tag, `testScrollSearchVertical scrollBar, ${JSON.stringify(scrollBar)} `);
        await driver.delayMs(1000);
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          let text1 = await scrollBar.scrollSearch(ON.text('1'), true, 80);
          await driver.delayMs(1000);
          hilog.info(domain, tag, `testScrollSearchVertical text1, ${JSON.stringify(text1)} `);
          expect(text1 != null).assertTrue()
          if (text1 != null) {
            let text1Msg = await text1.getText();
            hilog.info(domain, tag, `testScrollSearchVertical text1Msg, ${JSON.stringify(text1Msg)} `);
            expect(text1Msg).assertEqual('1');
          }
          let text2 = await scrollBar.scrollSearch(ON.text('2'), true);
          hilog.info(domain, tag, `testScrollSearchVertical text2, ${JSON.stringify(text2)} `);
          expect(text2 != null).assertTrue()
          if (text2 != null) {
            let text2Msg = await text2.getText();
            hilog.info(domain, tag, `testScrollSearchVertical text2Msg, ${JSON.stringify(text2Msg)} `);
            expect(text2Msg).assertEqual('2');
          }
          let text3 = await scrollBar.scrollSearch(ON.text('3'));
          hilog.info(domain, tag, `testScrollSearchVertical text3, ${JSON.stringify(text3)} `);
          expect(text3 != null).assertTrue()
          if (text3 != null) {
            let text3Msg = await text3.getText();
            hilog.info(domain, tag, `testScrollSearchVertical text3Msg, ${JSON.stringify(text3Msg)} `);
            expect(text3Msg).assertEqual('3');
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testComponentscrollTo error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScrollSearchVertical end `);
      await stopApplication('com.uitestScene.acts');
    })
    it('testPinch',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testPinch start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testPinch button, ${JSON.stringify(button)} `);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.click();
        }
        await driver.delayMs(1000);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        hilog.info(domain, tag, `testPinch image1, ${JSON.stringify(image1)} `);
        expect(image1 != null).assertTrue()
        if (image1 != null) {
          let bounds1 = await image1.getBounds();
          hilog.info(domain, tag, `testPinch bounds1, ${JSON.stringify(bounds1)} `);
          await image1.pinchIn(0.5);
          await driver.delayMs(1000);
          let image2 = await driver.findComponent(ON.id('test_pict'));
          hilog.info(domain, tag, `testPinch image2, ${JSON.stringify(image2)} `);
          expect(image2 != null).assertTrue()
          if (image2 != null) {
            let bounds2 = await image2.getBounds();
            hilog.info(domain, tag, `testPinch bounds2, ${JSON.stringify(bounds2)} `);
            expect(bounds1 != bounds2).assertTrue();
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testPinch error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testPinch end `);
      await stopApplication('com.uitestScene.acts');
    })
    it('testPinchOut',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testPinchOut start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testPinchOut button, ${JSON.stringify(button)} `);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.click();
        }
        await driver.delayMs(1000);
        let image1 = await driver.findComponent(ON.id('test_pict'));
        hilog.info(domain, tag, `testPinchOut image1, ${JSON.stringify(image1)} `);
        expect(image1 != null).assertTrue()
        if (image1 != null) {
          let bounds1 = await image1.getBounds();
          hilog.info(domain, tag, `testPinchOut bounds1, ${JSON.stringify(bounds1)} `);
          await image1.pinchOut(1.2);
          await driver.delayMs(1000);
          let image2 = await driver.findComponent(ON.id('test_pict'));
          hilog.info(domain, tag, `testPinchOut image2, ${JSON.stringify(image2)} `);
          expect(image2 != null).assertTrue()
          if (image2 != null) {
            let bounds2 = await image2.getBounds();
            hilog.info(domain, tag, `testPinchOut bounds2, ${JSON.stringify(bounds2)} `);
            expect(bounds1 != bounds2).assertTrue();
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testPinchOut end `);
      await stopApplication('com.uitestScene.acts');
    })
    it('testLongClick',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testLongClick start `);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let nextPage = await driver.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testLongClick error, ${JSON.stringify(nextPage)} `);
        expect(nextPage != null).assertTrue()
        if (nextPage != null) {
          let center = await nextPage.getBoundsCenter();
          let test = await nextPage.longClick();
          let newButton = await driver.findComponent(ON.text('longClick'));
          hilog.info(domain, tag, `testLongClick newButton, ${JSON.stringify(newButton)} `);
          expect(newButton != null).assertTrue()
          await driver.delayMs(1000);
          if (newButton != null) {
            let text = await newButton.getText();
            hilog.info(domain, tag, `testLongClick text, ${JSON.stringify(text)} `);
            expect(text == 'longClick').assertTrue();
          }
        }
      } catch (error) {
        hilog.info(domain, tag, `testLongClick error, ${JSON.stringify(error)} `);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testLongClick end `);
      await stopApplication('com.uitestScene.acts');
    })
    it('tesInputText',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, "tesInputText start !!!!")
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `tesInputText text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue()
        if (text != null) {
          let center = await text.getBoundsCenter();
          hilog.info(domain, tag, `tesInputText center, ${ JSON.stringify(center) }`);
          await text.inputText('123456');
        }

        await driver.delayMs(1000);
        let text1 = await driver.findComponent(ON.type('TextInput'));
        hilog.info(domain, tag, `tesInputText text1, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let inputText = await text1.getText();
          hilog.info(domain, tag, `tesInputText inputText, ${ JSON.stringify(inputText) }`);
          expect(inputText).assertEqual('123456');
        }
      } catch(error) {
        hilog.info(domain, tag, `tesInputText error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "tesInputText over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testGetBoundsCenter',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetBoundsCenter start`);
      try {
        const driver1 = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver1.delayMs(1000);
        let button = await driver1.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testGetBoundsCenter button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue()
        if (button != null) {
          let center = await button.getBoundsCenter();
          hilog.info(domain, tag, `testGetBoundsCenter center, ${ JSON.stringify(center) }`);
          expect(center instanceof Point).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testGetBoundsCenter error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testGetBoundsCenter end`);
      await stopApplication('com.uitestScene.acts');
    })
    it('testGetBounds',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetBounds start`);
      try {
        const driver1 = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver1.delayMs(1000);
        let button = await driver1.findComponent(ON.text('next page'));
        hilog.info(domain, tag, `testGetBounds button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue()
        if (button != null) {
          let center = await button.getBounds();
          hilog.info(domain, tag, `testGetBounds center, ${ JSON.stringify(center) }`);
          expect(center instanceof Rect).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testGetBounds error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testGetBounds end`);
      await stopApplication('com.uitestScene.acts');
    })
    it('testDragTo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragTo start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.id('jump'));
        hilog.info(domain, tag, `testDragTo button, ${JSON.stringify(button)}`);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.longClick();
          hilog.info(domain, tag, `testDragTo longClick`);
        }
        await driver.delayMs(1000);
        let text1 = await driver.findComponent(ON.text('one'));
        hilog.info(domain, tag, `testDragTo text1, ${JSON.stringify(text1)}`);
        expect(text1 != null).assertTrue()
        let text2 = await driver.findComponent(ON.text('two'));
        hilog.info(domain, tag, `testDragTo text2, ${JSON.stringify(text2)}`);
        expect(text2 != null).assertTrue()
        if (text1 != null && text2 != null) {
          await text1.dragTo(text2);
          hilog.info(domain, tag, `testDragTo dragTo`);
          let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')));
          hilog.info(domain, tag, `testDragTo text, ${JSON.stringify(text)}`);
          expect(text == null).assertTrue()
        }
        await driver.delayMs(1000);
      } catch(error) {
        hilog.info(domain, tag, `testDragTo error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testDragTo end`);
      await stopApplication('com.uitestScene.acts');
    })
    it('testDoubleClick',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('Click twice'));
        hilog.info(domain, tag, `testDoubleClick button, ${ JSON.stringify(button)}`);
        expect(button != null).assertTrue()
        if (button != null) {
          await button.doubleClick();
          hilog.info(domain, tag, `testDoubleClick longClick`);
          let newButton = await driver.findComponent(ON.text('doubleClick'));
          hilog.info(domain, tag, `testDoubleClick newButton, ${ JSON.stringify(newButton)} }`);
          expect(newButton != null).assertTrue();
          await driver.delayMs(1000);
          if (newButton) {
            let text = await newButton.getText();
            hilog.info(domain, tag, `testDoubleClick text, ${ JSON.stringify(text)} }`);
            expect(text == 'doubleClick').assertTrue();
          }
        }
      } catch(error) {
        hilog.info(domain, tag, `testDoubleClick error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testDoubleClick over!!!!");
      await stopApplication('com.uitestScene.acts');
    })
    it('testClick',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testClick start`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.text('next page'));
        expect(button != null).assertTrue()
        // 点击页面中的next page 按钮。
        if (button != null) {
          await button.click();
          hilog.info(domain, tag, `testClick sccessful`);

        }
        let newButton = await driver.findComponent(ON.text('back to index'));
        hilog.info(domain, tag, `testClick newButton, ${ JSON.stringify(newButton) }`);
        expect(newButton != null);
        if (newButton != null) {
          let text = await newButton.getText();
          hilog.info(domain, tag, `testClick text, ${ JSON.stringify(text) }`);
          expect(text == 'back to index').assertTrue()
        }
      } catch(error) {
        hilog.info(domain, tag, `testClick error, ${ error }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testClick end`);
      await stopApplication('com.uitestScene.acts');
    })
  })
}