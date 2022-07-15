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
import { UiDriver, BY, ResizeDirection, MatchPattern } from '@ohos.uitest'
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
    it('UiComponent.InputText', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let input = await driver.findComponent(BY.type('TextInput'))
      await input.inputText('123')
      await driver.delayMs(waitUiReadyMs)
      let input_new = await driver.findComponent(BY.type('TextInput'))
      let text = await input_new.getText()
      expect(text == '123').assertTrue()
    })

    it('UiComponent.ClearText', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let input = await driver.findComponent(BY.type('TextInput'))
      await input.clearText()
      await driver.delayMs(waitUiReadyMs)
      let input_new = await driver.findComponent(BY.type('TextInput'))
      let text = await input_new.getText()
      expect(text).assertEqual('')
    })

    it('checkable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.checkable(true).type('Checkbox'))
      let checkable = await button.isCheckable()
      expect(typeof (checkable) == 'boolean').assertTrue()
    })

    it('checked', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.checked(false).type('Checkbox'))
      let checked = await button.isChecked()
      expect(typeof (checked) == 'boolean').assertTrue()
    })

    it('UiDriver.click', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      await driver.click(350, 90)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('back to index'))
      let text = await newButton.getText()
      expect(text == 'back to index').assertTrue()
      await newButton.click()
    })

    it('UiDriver.LongClick', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      await driver.longClick(350, 90)
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('longClick'))
      let text = await newButton.getText()
      expect(text == 'longClick').assertTrue()
      await newButton.click()
    })

    it('key', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.key('my-key'))
      expect(await button.getKey() == 'my-key').assertTrue()
    })

    it('UiComponent.Click', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page', MatchPattern.EQUALS))
      await button.click()
      await driver.delayMs(waitUiReadyMs)
      let newButton = await driver.findComponent(BY.text('back to index'))
      let text = await newButton.getText()
      expect(text == 'back to index').assertTrue()
      await newButton.click()
    })

    it('UiComponent.LongClick', 0, async function () {
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

    it('UiComponent.getType', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(BY.type('Text'))
      let type = await text.getType()
      expect(type == 'Text').assertTrue()
    })

    it('UiComponent.getText', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      let text = await button.getText()
      expect(text == 'next page').assertTrue()
    })

    it('UiComponent.isClickable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').clickable(false))
      let clickable = await button.isClickable()
      expect(typeof (clickable) == 'boolean').assertTrue()
    })

    it('UiComponent.isLongClickable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').longClickable(false))
      let longClickable = await button.isLongClickable()
      expect(typeof (longClickable) == 'boolean').assertTrue()
    })

    it('UiComponent.isScrollable', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(BY.type('Scroll').scrollable(false))
      let scrollable = await scrollBar.isScrollable()
      expect(typeof (scrollable) == 'boolean').assertTrue()
    })

    it('UiComponent.isEnabled', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').enabled(true))
      let enable = await button.isEnabled()
      expect(enable).assertEqual(true)
    })

    it('UiComponent.isFocused', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').focused(false))
      let focused = await button.isFocused()
      expect(typeof (focused) == 'boolean').assertTrue()
    })

    it('UiComponent.isSelected', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page').selected(false))
      let selected = await button.isSelected()
      expect(typeof (selected) == 'boolean').assertTrue()
    })

    it('UiComponent.scrollToBottom', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(BY.type('Scroll'))
      expect(scrollBar != null).assertTrue()
      await scrollBar.scrollToBottom()
      let button = await driver.findComponent(BY.text('bottom'))
      expect(await button.getText() == 'bottom').assertTrue()
      await scrollBar.scrollToTop()
    })

    it('UiComponent.scrollToTop', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      await driver.swipe(100, 200, 100, 100)
      await driver.delayMs(waitUiReadyMs)
      let scrollBar = await driver.findComponent(BY.type('Scroll'))
      expect(scrollBar !== null).assertTrue()
      await scrollBar.scrollToTop()
      let button = await driver.findComponent(BY.text('next page'))
      expect(await button.getText() == 'next page').assertTrue()
    })

    it('UiDriver.assertComponentExist', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      await driver.assertComponentExist(BY.text('next page'))
    })

    it('UiDriver.pressBack', 0, async function () {
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

    it('UiDriver.findComponents', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let buttons = await driver.findComponents(BY.type('Button'))
      expect(await buttons[0].getText() != null).assertTrue()
    })

    it('UiDriver.triggerKey', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      await button.click()
      await driver.delayMs(waitUiReadyMs)
      await driver.triggerKey(2)
      await driver.delayMs(waitUiReadyMs)
      let button_ori = await driver.findComponent(BY.text('next page'))
      expect(await button_ori.getText() == 'next page').assertTrue()
    })

    it('getUiComponentBounds', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let text = await driver.findComponent(BY.text('next page'))
      expect(text !== null).assertTrue()
      let bounds = await text.getBounds();
      console.info(`UiTestCase, bounds=${bounds}, type=${typeof (bounds)}`)
      console.info(bounds.rightX.toString())
      console.info(bounds.leftX.toString())
      console.info(bounds.topY.toString())
      console.info(bounds.bottomY.toString())
      expect(bounds !== null).assertTrue()
      expect(bounds.rightX).assertLarger(bounds.leftX)
      expect(bounds.bottomY).assertLarger(bounds.topY)
    })

    it('getUiComponentBoundsCenter', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.text('next page'))
      let point = await button.getBoundsCenter()
      expect(point!== null).assertTrue()
    })

    it('UiDriver.waitForComponent', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.waitForComponent(BY.text('next page'), waitUiReadyMs)
      expect(button !== null).assertTrue()
    })

    it('UiDriver.screenCap', 0, async function () {
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let path = '/data/local/tmp/1.png'
      let success = await driver.screenCap(path)
      expect(typeof (success) == 'boolean').assertTrue()
    })

    it('By.isBefore', 0, async function () {
      await startAbility('com.ohos.settings', 'com.ohos.settings.MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.isBefore(BY.text('显示与亮度')).text('移动数据'))
      expect(await button.getText() == '移动数据').assertTrue()
    })

    it('By.isAfter', 0, async function () {
      await startAbility('com.ohos.settings', 'com.ohos.settings.MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let button = await driver.findComponent(BY.isAfter(BY.text('显示与亮度')).text('声音'))
      expect(await button.getText() == '声音').assertTrue()
    })

    it('window.resize', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.resume()
      await driver.delayMs(waitUiReadyMs)
      let window1 = await driver.findWindow({bundleName:'com.example.windows'})
      await window1.moveTo(100,100)
      await driver.delayMs(waitUiReadyMs)
      let window2 = await driver.findWindow({bundleName:'com.example.windows'})
      await window2.resize(600, 600,7)
      await stopApplication('com.example.windows')
      })

    it('window.maximize', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.resume()
      let window2 = await driver.findWindow({bundleName:'com.example.windows'})
      await window2.maximize()
      await stopApplication('com.example.windows')
    })

    it('window.minimize', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.minimize()
      await stopApplication('com.example.windows')
    })

    it('window.close', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.close()
    })

    it('window.split', 0, async function () {
      await startAbility('com.example.windows', 'MainAbility')
      let driver = UiDriver.create()
      await driver.delayMs(waitUiReadyMs)
      let window = await driver.findWindow({bundleName:'com.example.windows'})
      await window.split()
      await stopApplication('com.example.windows')
    })

    })



    afterAll(function () {
      console.info(`uitestApiStatistic::Start runnig afterAll`)
      try {
        let mod = globalThis.requireInternal('uitest')
        // collect all functions
        let objects = {
          'By': mod.By, 'UiDriver': mod.UiDriver, 'UiComponent': mod.UiComponent
        }
        let allApis = []
        for (let name in objects) {
          let object = objects[name]
          Object.getOwnPropertyNames(object).forEach(pn => {
            if (pn != 'constructor' && typeof (object[pn]) == 'function') {
              allApis.push(name + '.' + pn)
            }
          })

          Object.getOwnPropertyNames(object.prototype).forEach(pn => {
            if (pn != 'constructor' && typeof (object.prototype[pn]) == 'function') {
              allApis.push(name + '.' + pn)
            }
          })
        }

        let calledApis: Array<string> = mod.getCalledJsApis()
        calledApis.forEach(name => console.info(`uitestApiStatistic::CoveredApi: ${name}`))
        let missedApis = allApis.filter(value =>!calledApis.includes(value))
        console.info(`uitestApiStatistic::Total ${allApis.length}, coverd ${calledApis.length}, missed ${missedApis.length}`)
        missedApis.forEach(name => console.warn(`uitestApiStatistic::NotCoveredApi: ${name}`))
      } catch (e) {
        console.error(`uitestApiStatistic::Runnig afterAll failed: ${e}`)
      } finally {
        console.info(`uitestApiStatistic::End runnig afterAll`)
      }
    })
  }
