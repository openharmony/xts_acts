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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import ability_featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName : string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs : number = 1000;
const TestTag = 'UiTest_API16';
const DeviceErrorCode = 17000005;
const ErrorCode = 401;

async function startAbility(bundleName: string, abilityName: string) {
    await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
        console.info(`UiTestCase, start abilityFinished: ${result}`)
    }).catch((err : BusinessError) => {
        console.error(`UiTestCase, start abilityFailed: ${err}`)
    })
}

async function stopApplication(bundleName: string) {
    await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
        console.info(`UiTestCase, stop application finished: ${result}`)
    }).catch((err : BusinessError) => {
        console.error(`UiTestCase,stop application failed: ${err}`)
    })
}

export default function UiTest() {
    describe('UiTest_API11', () => {
        beforeAll(async (done: Function) => {
            let driver = Driver.create()
            await driver.delayMs(1000)
            await driver.triggerKey(18)
            await driver.delayMs(1000)
            let defaultDisplay = display.getDefaultDisplaySync()
            if (defaultDisplay.state != display.DisplayState.STATE_ON) {
                await driver.wakeUpDisplay()
                await driver.delayMs(1000)
                await driver.swipe(300, 600, 300, 100)
                await driver.delayMs(1000)
            }
            done()
        })

        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
        * @tc.number: uiTest_11001
        * @tc.name: testMouseDoubleClick
        * @tc.desc: doubleClick in the specified location on the screen by mouse.
        */
        it('testMouseDoubleClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver : Driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('Click twice'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('doubleClick'))
            let text = await button.getText()
            expect(text == 'doubleClick').assertTrue()
        })

        /*
        * @tc.number: uiTest_11002
        * @tc.name: testMouseLongClick
        * @tc.desc: longClick in the specified location on the screen by mouse.
        */
        it('testMouseLongClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.text('next page'))
            let center = await Button.getBoundsCenter()
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
        })

        /*
        * @tc.number: uiTest_11003
        * @tc.name: testMouseDrag
        * @tc.desc: drag on the screen between the specified points by mouse.
        */
        it('testMouseDrag', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            await driver.triggerKey(18)
            await driver.delayMs(waitUiReadyMs);
            let defaultDisplay = display.getDefaultDisplaySync()
            if (defaultDisplay.state == display.DisplayState.STATE_ON) {
                return
            } else {
                await driver.wakeUpDisplay()
                await driver.delayMs(waitUiReadyMs)
                await driver.swipe(300, 600, 300, 100)
                await driver.delayMs(waitUiReadyMs)
            }
            let button = await driver.findComponent(ON.id('jump'))
            let center = await button.getBoundsCenter();
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT)
            await driver.delayMs(waitUiReadyMs)
            let text1 = await driver.findComponent(ON.text('two'))
            let text2 = await driver.findComponent(ON.text('three'))
            let point1 = await text1.getBoundsCenter()
            let point2 = await text2.getBoundsCenter()
            await driver.mouseDrag(point1, point2, 600)
            await driver.delayMs(2000)
            let text = await driver.findComponent(ON.text('one').isBefore(ON.text('two')))
            expect(text == null).assertTrue()
        })

        /*
         * @tc.number: uiTest_11004
         * @tc.name: testMouseMoveWithTrack
         * @tc.desc: swipe on the screen between the specified points with mouse.
         */
        it('testMouseMoveWithTrack', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(ON.id('jump'))
            if (Button1 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button1 = await scorll.scrollSearch(ON.id('jump'))
            }
            let Button2 = await driver.findComponent(ON.text('next page'))
            if (Button2 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button2 = await scorll.scrollSearch(ON.id('next page'))
            }
            let center1 = await Button1.getBoundsCenter()
            let center2 = await Button2.getBoundsCenter()
            await driver.mouseMoveTo(center1)
            await driver.delayMs(waitUiReadyMs)
            await driver.mouseMoveWithTrack(center1, center2, 600)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('jump'))
            expect(newButton == null).assertTrue()
        })

        /*
         * @tc.number: uiTest_11005
         * @tc.name: testDriverInputText
         * @tc.desc: inject text on the specified location.
         */
        it('testDriverInputText', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let inputText = await driver.findComponent(ON.type('TextInput'))
            if (inputText == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                inputText = await scorll.scrollSearch(ON.type('TextInput'))
            }
            await inputText.click()
            await driver.delayMs(waitUiReadyMs)
            let permissionBtn = await driver.findComponent(ON.text('同意'))
            if (permissionBtn != null) {
                await permissionBtn.click()
                await driver.delayMs(waitUiReadyMs)
            }
            let input = await driver.findComponent(ON.type('TextInput'))
            await input.clearText()
            await driver.delayMs(waitUiReadyMs)
            let center = await input.getBoundsCenter()
            await driver.inputText(center, '123')
            await driver.delayMs(2000)
            let input_new = await driver.findComponent(ON.type('TextInput'))
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
        })

        /*
         * @tc.number: uiTest_11006
         * @tc.name: testMouseScroll
         * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
         */
        it('testMouseScroll', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.id('jump'))
            if (btn == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn = await scorll.scrollSearch(ON.id('jump'))
            }
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            let img1 = await driver.findComponent(ON.id('test_pict'))
            let bounds1 = await img1.getBounds()
            let center1 = await img1.getBoundsCenter()
            await driver.mouseScroll(center1,false,5,2072,0,20)
            await driver.delayMs(waitUiReadyMs)
            let img2 = await driver.findComponent(ON.id('test_pict'))
            let bounds2 = await img2.getBounds()
            expect(bounds1 != bounds2).assertTrue()

            await driver.pressBack()
            await driver.delayMs(waitUiReadyMs)
            let btn2 = await driver.findComponent(ON.text('1'))
            if (btn2 == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn2 = await scorll.scrollSearch(ON.text('1'))
            }
            let center = await btn2.getBoundsCenter()
            await driver.mouseScroll(center,true,30)
            await driver.delayMs(waitUiReadyMs)
            let button1 = await driver.findComponent(ON.text('next page'))
            expect(button1 == null).assertTrue()
        })

        /*
         * @tc.number: uiTest_11007
         * @tc.name: testWindowAttr
         * @tc.desc: find window by WindowFilter and get it's active status.
         */
        it('testWindowAttr', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let window = await driver.findWindow({bundleName:'com.uitestScene.acts',focused:true,active:true,title:''})
            await window.focus()
            await driver.delayMs(waitUiReadyMs)
            let isActive = await window.isActive()
            expect(isActive == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_11008
         * @tc.name: testDescription
         * @tc.desc: find UiComponent by description attribute and get it's description attribute.
         */
        it('testDescription', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(ON.type('Text').description(''))
            let description = await text.getDescription()
            expect(description == '').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })
    })
}
