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
    describe('UiTest_API10', () =>  {
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

        afterEach(async () => {
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10001
         * @tc.name: testWithIn
         * @tc.desc: find UiComponent inside of the given UiComponent.
         */
        it('testWithIn', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let scroll = await driver.findComponent(ON.type('Scroll'))
            let btn = await driver.findComponent(ON.within(ON.type('Scroll')).text('next page'))
            let bounds1 = await scroll.getBounds()
            let bounds2 = await btn.getBounds()
            expect(bounds1.top <= bounds2.top).assertTrue()
            expect(bounds1.bottom >= bounds2.bottom).assertTrue()
            expect(bounds1.left <= bounds2.right).assertTrue()
            expect(bounds1.right >= bounds2.right).assertTrue()
        })

        /*
         * @tc.number: uiTest_10002
         * @tc.name: testFling
         * @tc.desc: inject fling on the device display.
         */
        it('testFling', 0, async () => {
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
            let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
            try {
                await window.maximize()
                await driver.delayMs(500)
            } catch (error) {
                console.info('It is already a Fullscreen window')
            }
            await driver.fling(UiDirection.DOWN, 39000)
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponents(ON.text('next page'))
            expect (button).assertNull()
            await driver.fling(UiDirection.LEFT, 39000)
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponents(ON.text('1'))
            expect (text).assertNull()
            await driver.fling(UiDirection.RIGHT, 39000)
            await driver.delayMs(waitUiReadyMs)
            let text2 = await driver.findComponents(ON.text('1'))
            expect (text2).assertNull()
            await driver.fling(UiDirection.UP, 39000)
            await driver.delayMs(2000)
            let button2 = await driver.findComponents(ON.text('next page'))
            expect (button2 != null).assertTrue()
        })

        /*
         * @tc.number: uiTest_10003
         * @tc.name: testScreenCapture
         * @tc.desc: capture the specified area of current screen.
         */
        it('testScreenCapture', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCapture(savePath, {left: 0, top: 0, right: 100, bottom: 100})
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10004
         * @tc.name: testMouseClick
         * @tc.desc: click in the specified location on the screen by mouse.
         */
        it('testMouseClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.id('jump'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.id('jump'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_RIGHT)
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(ON.text('right'))
            expect(Button1 != null).assertTrue()
            await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_MIDDLE,2072,2045)
            await driver.delayMs(waitUiReadyMs)
            let Button2 = await driver.findComponent(ON.text('middle'))
            expect(Button2 != null).assertTrue()
            await driver.mouseClick({x:center.x, y:center.y}, MouseButton.MOUSE_BUTTON_LEFT)
            await driver.delayMs(waitUiReadyMs)
            let Button3 = await driver.findComponent(ON.id('jump'))
            expect(Button3 == null).assertTrue()
            await driver.click(center.x, center.y)
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10005
         * @tc.name: testMouseMoveTo
         * @tc.desc: move the mouse cursor to the specified location.
         */
        it('testMouseMoveTo', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button = await driver.findComponent(ON.id('jump'))
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.id('jump'))
            }
            let center = await Button.getBoundsCenter()
            await driver.mouseMoveTo(center)
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(ON.text('hover'))
            expect(newButton != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_10006
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
            let img1 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'))
            let bounds1 = await img1.getBounds()
            let center1 = await img1.getBoundsCenter()
            await driver.click(center1.x, center1.y)
            await driver.delayMs(waitUiReadyMs)
            await driver.mouseScroll(center1,false,5,2072,0)
            await driver.delayMs(waitUiReadyMs)
            let img2 = await driver.findComponent(ON.type('Image').inWindow('com.uitestScene.acts'))
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
         * @tc.number: uiTest_10007
         * @tc.name: testInWindow
         * @tc.desc: scroll the mouse wheel at the specified location to specify the cell.
         */
        it('testInWindow', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let btn = await driver.findComponent(ON.inWindow('com.uitestScene.acts').text('next page'))
            expect(btn != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
        * @tc.number: uiTest_10008
        * @tc.name: testMonitor1
        * @tc.desc: monitor toast appearance.
        */
        it('testMonitor1', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let observer = await driver.createUIEventObserver()
            let callback = (UiElementInfo : UIElementInfo) => {
                try {
                    console.info('UIElementInfo bundleName:'+ UiElementInfo.bundleName)
                    console.info('UIElementInfo text:'+ UiElementInfo.text)
                    console.info('UIElementInfo type:'+ UiElementInfo.type)
                    expect(UiElementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(UiElementInfo.text == 'toastShow').assertTrue()
                    expect(UiElementInfo.type == 'Toast').assertTrue()
                } catch (err) {
                    console.info(err)
                }
            }
            observer.once('toastShow', callback)
            let btn = await driver.findComponent(ON.text('toast'))
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts')
        })

        /*
        * @tc.number: uiTest_10009
        * @tc.name: testMonitor2
        * @tc.desc: monitor dialog appearance.
        */

        it('testMonitor2', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let observer = await driver.createUIEventObserver()
            let callback = (UiElementInfo : UIElementInfo) => {
                try {
                    console.info('UIElementInfo bundleName:'+ UiElementInfo.bundleName)
                    console.info('UIElementInfo text:'+ UiElementInfo.text)
                    console.info('UIElementInfo type:'+ UiElementInfo.type)
                    expect(UiElementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
                    expect(UiElementInfo.text == 'dialogShow').assertTrue()
                    expect(UiElementInfo.type == 'AlertDialog').assertTrue()
                } catch (err) {
                    console.info(err)
                }
            }
            observer.once('dialogShow', callback)
            let btn = await driver.findComponent(ON.text('dialog'))
            await btn.click()
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts')
        })
    })
}
