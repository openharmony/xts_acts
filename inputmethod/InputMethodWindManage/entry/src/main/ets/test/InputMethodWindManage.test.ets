/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import deviceinfo from '@ohos.deviceInfo';
import {Driver, ON, MatchPattern, Component, UiWindow, DisplayRotation } from '@ohos.UiTest'
import { BusinessError} from '@ohos.base'

export default function inputMethodWindManageAbility() {
  describe('inputMethodWindManageTest', function () {
    let driver = Driver.create();
    let textArea: Component;
    let rectInfo;

    beforeAll(async (done)=>{
      console.info('====>beforeAll inputMethod_enable start!')
      try{
        if(deviceinfo.deviceType != 'default'){
          let displayClass: display.Display;
          displayClass = display.getDefaultDisplaySync();
          console.info('====>displayClass Info: ' + JSON.stringify(displayClass));
          let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
          let cmd = 'aa start -a com.huawei.hmos.settings.MainAbility -b com.huawei.hmos.settings';
          abilityDelegator.executeShellCommand(cmd);
          await sleep(2000)
          console.info(`====>inputMethod_enable deviceinfo.deviceType: ${deviceinfo.deviceType}`);
          let settingList = await driver.waitForComponent(ON.type('List').isBefore(ON.text('蓝牙')), 3000);
          console.info(`====>inputMethod_enable settingList: ${settingList}`);
          if(deviceinfo.deviceType === '2in1'){
            console.info('====> 2in1');
            let systemAndUpdate: Component = await settingList.scrollSearch(ON.text('系统和更新', MatchPattern.CONTAINS));
            console.info(`====>inputMethod_enable systemAndUpdate: ${systemAndUpdate}`);
            await systemAndUpdate.click();
          } else if(deviceinfo.deviceType === 'tablet'){
            console.info('====> tablet');
            // 未锁定情况下,旋转为竖屏
            await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
            await settingList.scrollToBottom();
            let common_text: Component = await driver.waitForComponent(ON.text('通用', MatchPattern.CONTAINS), 3000);
            console.info(`====>inputMethod_enable common_text: ${common_text}`);
            // 适配横屏下模拟人工滑动
            if (common_text == null){
              console.info(`====>start swipe`);
              if(displayClass.rotation == 0){
                await driver.swipe(displayClass.width * 0.2, displayClass.height * 0.9, 
                displayClass.width * 0.2, displayClass.height * 0.5, 10000);
              }else{
                await driver.swipe(displayClass.height * 0.2, displayClass.width * 0.9, 
                displayClass.height * 0.2, displayClass.width
                 * 0.5, 10000);
              }              
              common_text = await driver.waitForComponent(ON.text('通用', MatchPattern.CONTAINS), 3000);
              console.info(`====>inputMethod_enable swipe common_text: ${common_text}`);
            }
            await common_text.click();
          } else {
            console.info('====> other');
            await driver.swipe(600, 2500, 600, 1000, 15000);
            let common_text: Component = await driver.waitForComponent(ON.text('通用', MatchPattern.CONTAINS), 3000);
            console.info(`====>inputMethod_enable common_text: ${common_text}`);
            await common_text.click();
          }
          await driver.delayMs(500);
          let inputMethod_Setting: Component = await driver.waitForComponent(ON.text('输入法', MatchPattern.CONTAINS), 3000);
          console.info(`====>inputMethod_enable inputMethod_Setting: ${inputMethod_Setting}`);
          await inputMethod_Setting.click();
          await driver.delayMs(500);
          let checkList: Array<Component> = await driver.findComponents(ON.type('Checkbox'));
          console.info(`====>inputMethod_enable checkList: ${checkList}`);
          for(let index=0; index<checkList.length; index++){
            let checkStatus = await checkList[index].isChecked();
            console.info(`====>inputMethod_enable checkStatus: ${checkStatus}`);
            if(JSON.stringify(checkStatus) === 'false'){
              await checkList[index].click();
              await driver.delayMs(500);
            }
          }
          if(deviceinfo.deviceType === '2in1'){
            console.info('====> 2in1 start close settings window');
            let window: UiWindow = await driver.findWindow({bundleName: "com.huawei.hmos.settings"});
            console.info(`====>inputMethod_enable window: ${window}`);
            await window.close();
          }else{
            console.info('====> other start close settings window and start test window');
            abilityDelegator.executeShellCommand("aa force-stop com.huawei.hmos.settings");
            abilityDelegator.executeShellCommand("aa start -d 0 -a com.acts.inputmethodwidmanage.test.MainAbility -b com.acts.inputmethodwidmanage.test");
          }
          await driver.delayMs(5000);
        }

        let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
        let result: boolean = await inputMethodSetting.showOptionalInputMethods();
        console.info('====>beforeAll inputMethodSwitch showOptionalInputMethods result: ' + JSON.stringify(result));
        let inputMethodList = await driver.waitForComponent(ON.type('List'), 3000);
        console.info('====>beforeAll inputMethodSwitch inputMethodList: ' + JSON.stringify(inputMethodList));
        if (JSON.stringify(inputMethodList) === 'null') {
          await driver.delayMs(200);
          inputMethodList = await driver.findComponent(ON.type('List'));
          console.info('====>beforeAll inputMethodSwitch inputMethodList second: ' + JSON.stringify(inputMethodList));
        }
        await driver.delayMs(1000);
        if(deviceinfo.deviceType === '2in1'){
          let inputMethod_name: Component = await driver.waitForComponent(ON.text('widmanage', MatchPattern.CONTAINS), 2000);
          await inputMethod_name.click();
          await driver.delayMs(500);
        }else{
          let inputMethod_name: Component = await inputMethodList.scrollSearch(ON.text('widmanage', MatchPattern.CONTAINS));
          console.info('====>beforeAll inputMethodSwitch inputMethod_name: ' + JSON.stringify(inputMethod_name));
          if (JSON.stringify(inputMethod_name) === 'null') {
            await driver.delayMs(200);
            inputMethod_name = await inputMethodList.scrollSearch(ON.text('widmangae', MatchPattern.CONTAINS));
            console.info('====>beforeAll inputMethodSwitch inputMethod_name second: ' + JSON.stringify(inputMethod_name));
          }
          await inputMethod_name.click();
        }
        console.info('====>beforeAll inputMethodSwitch done');
        await driver.delayMs(1000);
        if(deviceinfo.deviceType === '2in1'){
          let testWindow: UiWindow = await driver.findWindow({bundleName: "com.acts.inputmethodwidmanage.test"});
          console.info('====>beforeAll inputMethodSwitch switch window: ' + JSON.stringify(testWindow));
          await testWindow.focus();
          await driver.delayMs(1000);
        }
        textArea = await driver.findComponent(ON.type('TextArea'));
        console.info('====>beforeAll inputMethodSwitch window textArea:' + JSON.stringify(textArea))
        rectInfo = await textArea.getBounds();
        console.info('====>beforeAll inputMethodSwitch textArea rectInfo:' + JSON.stringify(rectInfo))
        await driver.delayMs(1000);
        await runCmd();
        await driver.delayMs(1000);
        done();
      }catch(err){
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message))
        done();
      }
    })

    afterAll(async (done) => {
      done();
    })

    let sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    async function runCmd(){
      let cursor_x = rectInfo.left + Math.floor(Math.random() * (rectInfo.right - rectInfo.left) * 0.9);
      let cursor_y = rectInfo.top + Math.floor(Math.random() * (rectInfo.bottom - rectInfo.top) * 0.9);
      console.info(`====>start click x: ${cursor_x}  y: ${cursor_y}`)
      await driver.click(cursor_x, cursor_y)
    }

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelCallback_0010
    * @tc.name   Sub_Misc_inputMethod_Panel_createPanelCallback_0010
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_createPanelCallback_0010']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 subscribe finish====');

        var commonEventPublishData = {
          code: 10
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_createPanelPromise_0020
    * @tc.name   Sub_Misc_inputMethod_Panel_createPanelPromise_0020
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_createPanelPromise_0020']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 subscribe finish====');

        var commonEventPublishData = {
          code: 20
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030
    * @tc.name   Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 subscribe finish====');

        var commonEventPublishData = {
          code: 30
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040
    * @tc.name   Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 subscribe finish====');

        var commonEventPublishData = {
          code: 40
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentCallback_0050
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentCallback_0050
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentCallback_0050']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 subscribe finish====');

        var commonEventPublishData = {
          code: 50
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentPromise_0060
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentPromise_0060
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentPromise_0060']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 subscribe finish====');

        var commonEventPublishData = {
          code: 60
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentCallback_0070
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentCallback_0070
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentCallback_0070']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 subscribe finish====');

        var commonEventPublishData = {
          code: 70
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_setUiContentPromise_0080
    * @tc.name   Sub_Misc_inputMethod_Panel_setUiContentPromise_0080
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_setUiContentPromise_0080']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 subscribe finish====');

        var commonEventPublishData = {
          code: 80
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_resizeCallback_0090
    * @tc.name   Sub_Misc_inputMethod_Panel_resizeCallback_0090
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_resizeCallback_0090', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_resizeCallback_0090']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 subscribe finish====');

        var commonEventPublishData = {
          code: 90
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_resizePromise_0100
    * @tc.name   Sub_Misc_inputMethod_Panel_resizePromise_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_resizePromise_0100', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_resizePromise_0100']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 subscribe finish====');

        var commonEventPublishData = {
          code: 100
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_moveToCallback_0110
    * @tc.name   Sub_Misc_inputMethod_Panel_moveToCallback_0110
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_moveToCallback_0110', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_moveToCallback_0110']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 subscribe finish====');

        var commonEventPublishData = {
          code: 110
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_moveToPromise_0120
    * @tc.name   Sub_Misc_inputMethod_Panel_moveToPromise_0120
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_moveToPromise_0120', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_moveToPromise_0120']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 subscribe finish====');

        var commonEventPublishData = {
          code: 120
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_showCallback_0130
    * @tc.name   Sub_Misc_inputMethod_Panel_showCallback_0130
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_showCallback_0130', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_showCallback_0130']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 subscribe finish====');

        var commonEventPublishData = {
          code: 130
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_hideCallback_0150
    * @tc.name   Sub_Misc_inputMethod_Panel_hideCallback_0150
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_hideCallback_0150', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_hideCallback_0150']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 subscribe finish====');

        var commonEventPublishData = {
          code: 150
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_showPromise_0140
    * @tc.name   Sub_Misc_inputMethod_Panel_showPromise_0140
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_showPromise_0140', 0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      await inputMethod.getController().attach(false, ATTRIBUTE);
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_showPromise_0140']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 subscribe finish====');

        var commonEventPublishData = {
          code: 140
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_hidePromise_0160
    * @tc.name   Sub_Misc_inputMethod_Panel_hidePromise_0160
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_hidePromise_0160', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_hidePromise_0160']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 subscribe finish====');

        var commonEventPublishData = {
          code: 160
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_onShow_0170
    * @tc.name  Sub_Misc_inputMethod_Panel_onShow_0170
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_onShow_0170', 0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      await inputMethod.getController().attach(false, ATTRIBUTE);
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_onShow_0170']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 subscribe finish====');

        var commonEventPublishData = {
          code: 170
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_onHide_0180
    * @tc.name  Sub_Misc_inputMethod_Panel_onHide_0180
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_onHide_0180', 0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      await inputMethod.getController().attach(false, ATTRIBUTE);
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_onHide_0180']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 subscribe finish====');

        var commonEventPublishData = {
          code: 180
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_offShow_0190
    * @tc.name  Sub_Misc_inputMethod_Panel_offShow_0190
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_offShow_0190', 0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      await inputMethod.getController().attach(false, ATTRIBUTE);
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_offShow_0190']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_offShow_0190 subscribe finish====');

        var commonEventPublishData = {
          code: 190
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_offHide_0200
    * @tc.name  Sub_Misc_inputMethod_Panel_offHide_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_offHide_0200', 0, async function (done) {
      const ATTRIBUTE:any = {inputAttribute:{textInputType:0,enterKeyType:0}}
      await inputMethod.getController().attach(false, ATTRIBUTE);
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_offHide_0200']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_offHide_0200 subscribe finish====');

        var commonEventPublishData = {
          code: 200
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_inputWindowInfo_0201
    * @tc.name  Sub_Misc_inputMethod_inputWindowInfo_0201
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_inputWindowInfo_0201', 0, async function (done) {
      let inputWindowInfo: inputMethod.InputWindowInfo = {
        name: 'inputWindowInfo_0201/99',
        left: 100,
        top: 607,
        width: 720,
        height: 601,
      }
      try {
        console.info('====>Sub_Misc_inputMethod_inputWindowInfo_0201 inputWindowInfo: ' + JSON.stringify(inputWindowInfo));
        expect(inputWindowInfo.name).assertEqual('inputWindowInfo_0201/99')
        expect(inputWindowInfo.left).assertEqual(100)
        expect(inputWindowInfo.top).assertEqual(607)
        expect(inputWindowInfo.width).assertEqual(720)
        expect(inputWindowInfo.height).assertEqual(601)
        done();
      } catch (err) {
        console.info('====>Sub_Misc_inputMethod_inputWindowInfo_0201 fail: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_changeFlag_0210
    * @tc.name  Sub_Misc_inputMethod_Panel_changeFlag_0210
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_changeFlag_0210', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 unSubscriberCallback finsh');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_changeFlag_0210']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 subscribe finish====');

        var commonEventPublishData = {
          code: 210
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_Panel_changeFlag_0211
    * @tc.name  Sub_Misc_inputMethod_Panel_changeFlag_0211
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Panel_changeFlag_0211', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 unSubscriberCallback finish');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_Misc_inputMethod_Panel_changeFlag_0211']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 subscribe finish====');

        var commonEventPublishData = {
          code: 211
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IMF_panelInfo_0400
    * @tc.name  SUB_InputMethod_IMF_panelInfo_0400
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   2
    */
    it('SUB_InputMethod_IMF_panelInfo_0400', 0,  async function (done) {
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 start');
      let panel:PanelInfo;
      panel = {
        type: 1,
        flag: 0
      }
      let FLAG_FLOATING = PanelFlag.FLAG_FLOATING
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 FLAG_FLOATING: ' + FLAG_FLOATING);
      expect(FLAG_FLOATING === 1).assertTrue();
      let FLAG_FIXED = PanelFlag.FLAG_FIXED
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 FLAG_FIXED: ' + FLAG_FIXED);
      expect(FLAG_FIXED === 0).assertTrue();

      let FLAG_CANDIDATE = PanelFlag.FLAG_CANDIDATE
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 FLAG_CANDIDATE: ' + FLAG_CANDIDATE);
      expect(FLAG_CANDIDATE === 2).assertTrue();

      let SOFT_KEYBOARD = PanelType.SOFT_KEYBOARD
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 SOFT_KEYBOARD: ' + SOFT_KEYBOARD);
      expect(SOFT_KEYBOARD === 0).assertTrue();

      let STATUS_BAR = PanelType.STATUS_BAR
      console.info('====>SUB_InputMethod_IMF_panelInfo_0400 STATUS_BAR: ' + STATUS_BAR);
      expect(STATUS_BAR === 1).assertTrue();
      done();
    });

    /**
     * @tc.number   Sub_InputMethod_IMF_SecurityKeyboard_0600
     * @tc.name     Sub_InputMethod_IMF_SecurityKeyboard_0600
     * @tc.desc     setPrivacyMode(),parameter is true
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0600', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 unSubscriberCallback finish');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_SecurityKeyboard_0600']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 subscribe finish====');

        var commonEventPublishData = {
          code: 212
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /**
     * @tc.number   Sub_InputMethod_IMF_SecurityKeyboard_0700
     * @tc.name     Sub_InputMethod_IMF_SecurityKeyboard_0700
     * @tc.desc     setPrivacyMode(),parameter is false
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0700', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 unSubscriberCallback finish');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_SecurityKeyboard_0700']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 subscribe finish====');

        var commonEventPublishData = {
          code: 213
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /**
     * @tc.number   Sub_InputMethod_IMF_SecurityKeyboard_0800
     * @tc.name     Sub_InputMethod_IMF_SecurityKeyboard_0800
     * @tc.desc     setPrivacyMode(),parameter is undefined
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('Sub_InputMethod_IMF_SecurityKeyboard_0800', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 unSubscriberCallback finish');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_SecurityKeyboard_0800']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 subscribe finish====');

        var commonEventPublishData = {
          code: 214
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

    /**
     * @tc.number   Sub_InputMethod_IMF_getSecurityMode_0100
     * @tc.name     Sub_InputMethod_IMF_getSecurityMode_0100
     * @tc.desc     getSecurityMode()
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('Sub_InputMethod_IMF_getSecurityMode_0100', 0, async function (done) {
      function unSubscriberCallback(err) {
        console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 unSubscriberCallback start');
        if (err) {
          console.error('====>Sub_InputMethod_IMF_getSecurityMode_0100 unSubscriberCallback failed: ' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 unSubscriberCallback finish');
        }
      }

      function subscriberCallback(err, data) {
        console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 subscriberCallback data: ' + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual('SUCCESS');
            console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 success end<====');
            clearTimeout(t);
            done();
          } catch (err) {
            console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 catch end<====' + JSON.stringify(err));
            clearTimeout(t)
            done();
          }
        }, 500)
      }

      async function publishCallback(err) {
        if (err) {
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 end<====' + JSON.stringify(err));
        } else {
          console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 success ====' );
        }
      }

      var commonEventSubscribeInfo = {
        events: ['Sub_InputMethod_IMF_getSecurityMode_0100']
      }
      var subscriber;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
        subscriber = data;
        console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 subscribe data: ' + JSON.stringify(data));
        commonEventManager.subscribe(subscriber, subscriberCallback);
        console.info('====>Sub_InputMethod_IMF_getSecurityMode_0100 subscribe finish====');

        var commonEventPublishData = {
          code: 215
        }
        commonEventManager.publish('test', commonEventPublishData, publishCallback);
      })
    });

  });
};
