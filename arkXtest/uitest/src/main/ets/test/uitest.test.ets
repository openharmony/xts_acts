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
import { UiDriver, BY, ResizeDirection, MatchPattern, WindowMode } from '@ohos.uitest'
import ability_featureAbility from '@ohos.ability.featureAbility';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs = 1000;

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`UiTestCase, start abilityFinished: ${result}`)
  }).catch(err => {
    console.error(`UiTestCase, start abilityFailed: ${err}`)
  })
}

async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`UiTestCase, stop application finished: ${result}`)
  }).catch(err => {
    console.error(`UiTestCase,stop application failed: ${err}`)
  })
}

export default function abilityTest() {
  describe('UiTestCase', function () {
    it('testInputNumber', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let input = await driver.findComponent(BY.type('TextInput'))
      await input.inputText('123')
      await driver.delayMs(waitUiReadyMs)
      let input_new = await driver.findComponent(BY.type('TextInput'))
      let text = await input_new.getText()
      expect(text == '123').assertTrue()
    })

    it('testClearText', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let input1 = await driver.findComponent(BY.type('TextInput'))
      await input1.inputText('abc')
      let input2 = await driver.findComponent(BY.type('TextInput'))
      await input2.clearText()
      await driver.delayMs(waitUiReadyMs)
      let input_new = await driver.findComponent(BY.type('TextInput'))
      let text = await input_new.getText()
      expect(text).assertEqual('')
    })

    it('testCheckable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.checkable(true).type('Checkbox'))
      let checkable = await button.isCheckable()
      expect(checkable == true).assertTrue()
    })

    it('testChecked', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.checked(false).type('Checkbox'))
      let checked = await button.isChecked()
      expect(checked == false).assertTrue()
    })

    it('testMatchPattren', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let Button1 = await driver.findComponent(BY.text('next page',MatchPattern.EQUALS))
      expect(await Button1.getText() == 'next page').assertTrue()
      let Button2 = await driver.findComponent(BY.text('next',MatchPattern.STARTS_WITH))
      expect(await Button2.getText() == 'next page').assertTrue()
      let Button3 = await driver.findComponent(BY.text('page',MatchPattern.ENDS_WITH))
      expect(await Button3.getText() == 'next page').assertTrue()
      let Button4 = await driver.findComponent(BY.text('ext',MatchPattern.CONTAINS))
      expect(await Button4.getText() == 'next page').assertTrue()
    })

    it('testClick', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let Button = await driver.findComponent(BY.text('next page'))
      let center = await Button.getBoundsCenter()
      await driver.click(center.X, center.Y)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('back to index'))
      let text = await newButton.getText()
      expect(text == 'back to index').assertTrue()
      await newButton.click()
    })

    it('testDoubleClick', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let Button = await driver.findComponent(BY.text('Click twice'))
      let center = await Button.getBoundsCenter()
      await driver.doubleClick(center.X, center.Y)
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('doubleClick'))
      let text = await button.getText()
      expect(text == 'doubleClick').assertTrue()
      await button.click()
    })

    it('testLongClick', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let Button = await driver.findComponent(BY.text('next page'))
      let center = await Button.getBoundsCenter()
      await driver.longClick(center.X, center.Y)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('longClick'))
      let text = await newButton.getText()
      expect(text == 'longClick').assertTrue()
      await newButton.click()
    })

    it('testUiComponentClick', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      await button.click()
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('back to index'))
      let text = await newButton.getText()
      expect(text == 'back to index').assertTrue()
      await newButton.click()
    })

    it('testUiComponentDoubleClick', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('Click twice'))
      await button.doubleClick()
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('doubleClick'))
      let text = await newButton.getText()
      expect(text == 'doubleClick').assertTrue()
      await newButton.click()
    })

    it('testUiComponentLongClick', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      await button.longClick()
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('longClick'))
      let text = await newButton.getText()
      expect(text == 'longClick').assertTrue()
      await newButton.click()
    })

    it('testKey', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.key('my-key'))
      expect(await button.getKey() == 'my-key').assertTrue()
    })

    it('testId', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      let id = await button.getId()
      let button2 = await driver.findComponent(BY.id(id))
      expect(await button.getText() == 'next page').assertTrue()
    })

    it('testGetType', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(BY.type('Text'))
      let type = await text.getType()
      expect(type == 'Text').assertTrue()
    })

    it('testClickable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').clickable(false))
      let clickable = await button.isClickable()
      expect(clickable == false).assertTrue()
    })

    it('testLongClickable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').longClickable(false))
      let longClickable = await button.isLongClickable()
      expect(longClickable== false).assertTrue()
    })

    it('testScrollable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(BY.type('Scroll').scrollable(false))
      let scrollable = await scrollBar.isScrollable()
      expect(scrollable == false).assertTrue()
    })

    it('testEnabled', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').enabled(true))
      let enable = await button.isEnabled()
      expect(enable == true).assertTrue()
    })

    it('testFocused', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').focused(false))
      let focused = await button.isFocused()
      expect(focused == false).assertTrue()
    })

    it('testSelected', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').selected(false))
      let selected = await button.isSelected()
      expect(selected == false).assertTrue()
    })

    it('testScrollToBottom', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(BY.type('Scroll'))
      expect(scrollBar != null).assertTrue()
      await scrollBar.scrollToBottom()
      let button = await driver.findComponent(BY.text('bottom'))
      expect(await button.getText() == 'bottom').assertTrue()
    })

    it('testScrollToTop', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(BY.type('Scroll'))
      expect(scrollBar !== null).assertTrue()
      await scrollBar.scrollToBottom()
      await scrollBar.scrollToTop()
      let button = await driver.findComponent(BY.text('next page'))
      expect(await button.getText() == 'next page').assertTrue()
    })

    it('testAssertComponentExist', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      await driver.assertComponentExist(BY.text('next page'))
    })

    it('testPressBack', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      await button.click()
      await driver.delayMs(waitUiReadyMs)
      await driver.pressBack()
      await driver.delayMs(waitUiReadyMs)
      let button_ori = await driver.findComponent(BY.text('next page'))
      expect(await button_ori.getText() == 'next page').assertTrue()
    })

    it('testFindComponents', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let buttons = await driver.findComponents(BY.type('Button'))
      expect(await buttons[0].getText() != null).assertTrue()
    })

    it('testTriggerKey', 0, async function () {
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
    })

    it('testGetUiComponentBounds', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(BY.text('next page'))
      expect(text !== null).assertTrue()
      let bounds = await text.getBounds();
      expect(bounds !== null).assertTrue()
      expect(bounds.rightX).assertLarger(bounds.leftX)
      expect(bounds.bottomY).assertLarger(bounds.topY)
    })

    it('testGetUiComponentBoundsCenter', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      let point = await button.getBoundsCenter()
      let bounds = await button.getBounds()
      expect(point!== null).assertTrue()
      expect(point.Y == (bounds.bottomY + bounds.topY)/2).assertTrue()
      expect(point.X == (bounds.rightX + bounds.leftX)/2).assertTrue()
    })

    it('testWaitForComponent', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.waitForComponent(BY.text('next page'), waitUiReadyMs)
      expect(button !== null).assertTrue()
    })

    it('testScreenCap', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let savePath = '/data/local/tmp/1.png'
      let success = await driver.screenCap(savePath)
      expect(success == true).assertTrue()
    })

    it('testIsBefore', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.isBefore(BY.text('Click twice')).type('Button'))
      expect(await button.getType() == 'Button').assertTrue()
    })

    it('testIsAfter', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.isAfter(BY.text('next page')).type('Text'))
      expect(await button.getText() == 'Click twice').assertTrue()
    })

    it('testScrollSearch', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(BY.type('Scroll'))
      let text = await scrollBar.scrollSearch(BY.text('4'))
      await driver.delayMs(waitUiReadyMs)
      expect(text != null).assertTrue()
      await scrollBar.scrollToTop()
    })

    it('testGetWindowMode', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      let mode = await window.getWindowMode()
      expect(mode == WindowMode.FULLSCREEN).assertTrue()
      await stopApplication('com.example.windows')
    })

    it('testWindowMoveTo', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.resume()
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.example.windows'})
      let bounds1 = await window1.getBounds()
      await window1.moveTo(100,100)
      await driver.delayMs(waitUiReadyMs)
      let window2 = await driver.findWindow({bundleName:'com.example.windows'})
      let bounds2 = await window2.getBounds()
      expect(bounds1 != bounds2).assertTrue()
      await stopApplication('com.example.windows')
    })

    it('testWindowResize', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.resume()
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.example.windows'})
      let bounds1 = await window1.getBounds()
      await window1.resize(400,400,ResizeDirection.RIGHT_DOWN)
      await driver.delayMs(waitUiReadyMs)
      let window2 = await driver.findWindow({bundleName:'com.example.windows'})
      let bounds2 = await window2.getBounds()
      expect(bounds1 != bounds2).assertTrue()
      await stopApplication('com.example.windows')
    })

    it('testWindowFocus', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.focus()
      let IsActive = await window.focus()
      expect(IsActive == true).assertTrue()
      await stopApplication('com.example.windows')
    })

    it('testWindowMaximize', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.resume()
      let window2 = await driver.findWindow({bundleName:'com.example.windows'})
      await window2.maximize()
      await driver.delayMs(waitUiReadyMs)
      let window3 = await driver.findWindow({bundleName:'com.example.windows'})
      let mode = await window3.getWindowMode()
      expect(mode == WindowMode.FULLSCREEN).assertTrue()
      await stopApplication('com.example.windows')
    })

    it('testWindowMinimize', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.minimize()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('Clock'))
      expect(button != null).assertTrue()
      await stopApplication('com.example.windows')
    })

    it('testWindowClose', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.close()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('Clock'))
      expect(button != null).assertTrue()
    })

  })

}