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
    describe('UiTest_API8', () => {
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
         * @tc.number: uiTest_8001
         * @tc.name: testInputText
         * @tc.desc: inject text to the target UiComponent
         */
        it('testInputText', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let input = await driver.findComponent(BY.type('TextInput'))
            if (input == null) {
                let scorll = await driver.findComponent(BY.type('Scroll'))
                input = await scorll.scrollSearch(BY.type('TextInput'))
            }
            await input.inputText('123')
            await driver.delayMs(2000)
            let input_new = await driver.findComponent(BY.type('TextInput'))
            let text = await input_new.getText()
            console.info("testInputText result :" + text)
            expect(text == '123').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8002
         * @tc.name: testMatchPattern
         * @tc.desc: specifies the string value match pattern.
         */
        it('testMatchPattern', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let Button1 = await driver.findComponent(BY.text('next page', MatchPattern.EQUALS))
            expect(await Button1.getText() == 'next page').assertTrue()
            let Button2 = await driver.findComponent(BY.text('next', MatchPattern.STARTS_WITH))
            expect(await Button2.getText() == 'next page').assertTrue()
            let Button3 = await driver.findComponent(BY.text('xt page', MatchPattern.ENDS_WITH))
            expect(await Button3.getText() == 'next page').assertTrue()
            let Button4 = await driver.findComponent(BY.text('ext', MatchPattern.CONTAINS))
            expect(await Button4.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8003
         * @tc.name: testUiComponentClick
         * @tc.desc: click this UiComponentClick.
         */
        it('testUiComponentClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(BY.text('back to index'))
            let text = await newButton.getText()
            expect(text == 'back to index').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8004
         * @tc.name: testUiComponentDoubleClick
         * @tc.desc: doubleClick this UiComponentClick.
         */
        it('testUiComponentDoubleClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('Click twice'))
            if (button == null) {
                let scorll = await driver.findComponent(BY.type('Scroll'))
                button = await scorll.scrollSearch(BY.text('Click twice'))
            }
            await button.doubleClick()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(BY.text('doubleClick'))
            let text = await newButton.getText()
            expect(text == 'doubleClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8005
         * @tc.name: testUiComponentLongClick
         * @tc.desc: longClick this UiComponentClick.
         */
        it('testUiComponentLongClick', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.longClick()
            await driver.delayMs(waitUiReadyMs)
            let newButton = await driver.findComponent(BY.text('longClick'))
            let text = await newButton.getText()
            expect(text == 'longClick').assertTrue()
            await newButton.click()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8006
         * @tc.name: testKey
         * @tc.desc: find UiComponent by key attribute and get it's key attribute.
         */
        it('testKey', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.key('my-key'))
            expect(await button.getKey() == 'my-key').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8007
         * @tc.name: testId
         * @tc.desc: find UiComponent by id attribute and get it's id attribute.
         */
        it('testId', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            let id = await button.getId()
            let button2 = await driver.findComponent(BY.id(id))
            expect(await button2.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8008
         * @tc.name: testType
         * @tc.desc: find UiComponent by type attribute and get it's type attribute.
         */
        it('testType', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(BY.type('Text'))
            let type = await text.getType()
            expect(type == 'Text').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8009
         * @tc.name: testClickable
         * @tc.desc: find UiComponent by clickable attribute and get it's clickable attribute.
         */
        it('testClickable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').clickable(false))
            let clickable = await button.isClickable()
            expect(clickable == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8010
         * @tc.name: testScrollable
         * @tc.desc: find UiComponent by scrollable attribute and get it's scrollable attribute.
         */
        it('testScrollable', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(BY.type('Scroll'))
            let scrollable = await scrollBar.isScrollable()
            expect(scrollable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8011
         * @tc.name: testEnabled
         * @tc.desc: find UiComponent by enabled attribute and get it's enabled attribute.
         */
        it('testEnabled', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').enabled(true))
            let enable = await button.isEnabled()
            expect(enable == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8012
         * @tc.name: testFocused
         * @tc.desc: find UiComponent by focused attribute and get it's focused attribute.
         */
        it('testFocused', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').focused(false))
            let focused = await button.isFocused()
            expect(focused == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8013
         * @tc.name: testSelected
         * @tc.desc: find UiComponent by selected attribute and get it's selected attribute.
         */
        it('testSelected', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page').selected(false))
            let selected = await button.isSelected()
            expect(selected == false).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8014
         * @tc.name: testPressBack
         * @tc.desc: Press the BACK key.
         */
        it('testPressBack', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            await driver.pressBack()
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(BY.text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8015
         * @tc.name: testFindComponents
         * @tc.desc: find all the matched UiComponents on current UI
         */
        it('testFindComponents', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let buttons = await driver.findComponents(BY.type('Button'))
            expect(await buttons[0].getText() != null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8016
         * @tc.name: testTriggerKey
         * @tc.desc: press the specified key.
         */
        it('testTriggerKey', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.text('next page'))
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let keyBack = 2
            await driver.triggerKey(keyBack)
            await driver.delayMs(waitUiReadyMs)
            let button_ori = await driver.findComponent(BY.text('next page'))
            expect(await button_ori.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8017
         * @tc.name: testScreenCap
         * @tc.desc: capture current screen.
         */
        it('testScreenCap', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let savePath = '/data/storage/el2/base/cache/1.png'
            let success = await driver.screenCap(savePath)
            expect(success == true).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8018
         * @tc.name: testAssertComponentExist
         * @tc.desc:  Assert whether the matched UiComponent exists on current UI;.
         */
        it('testAssertComponentExist', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            await driver.assertComponentExist(BY.text('next page'))
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8019
         * @tc.name: testIsBefore
         * @tc.desc: find uiComponent which is before another UiComponent that specified by given.
         */
        it('testIsBefore', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isBefore(BY.text('next page')).type('Button'))
            expect(await button.getType() == 'Button').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8020
         * @tc.name: testIsAfter
         * @tc.desc: find uiComponent which is after another UiComponent that specified by given.
         */
        it('testIsAfter', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(BY.isAfter(BY.text('dialog')).type('Text'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8021
         * @tc.name: testSwipe
         * @tc.desc: swipe on the screen between the specified points.
         */
        it('testSwipe', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let displayClass = await display.getDefaultDisplay();
            let screenWidth = displayClass.width
            let screenHeight = displayClass.height
            console.info('screenWidth:' + screenWidth + ', screenHeight:' +screenHeight)
            await driver.swipe(Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 + screenHeight / 8),
                Math.floor(screenWidth / 2), Math.floor(screenHeight / 2 - screenHeight / 8))
            await driver.delayMs(waitUiReadyMs)
            let text = await driver.findComponent(BY.text('toast'))
            expect(text == null).assertTrue()
            await stopApplication('com.uitestScene.acts')
        })

        /*
         * @tc.number: uiTest_8022
         * @tc.name: testScrollSearch
         * @tc.desc: scroll on this UiComponent to find matched UiComponent.
         */
        it('testScrollSearch', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = UiDriver.create()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(BY.type('Scroll'))
            let button = await scrollBar.scrollSearch(BY.text('next page'))
            expect(await button.getText() == 'next page').assertTrue()
            await stopApplication('com.uitestScene.acts')
        })
    })
}
