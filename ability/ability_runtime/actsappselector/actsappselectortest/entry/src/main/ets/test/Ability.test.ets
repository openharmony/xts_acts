/*
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
import commonEvent from '@ohos.commonEvent'
import { BY, UiDriver, UiComponent, MatchPattern } from '@ohos.uitest'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

var abilityDelegator = undefined;
var driver;
var cmdInstall
var cmdUninstall;
var subscriberInfo = {
  events: ['AppSelector']
};

let paConnect = {
  onConnect: function (elementName, proxy) {
    console.info("AppSelector Service  onConnect called.");
  },
  onDisconnect: function (elementName) {
    console.info("AppSelector Service onDisconnect");
  },
  onFailed: function (code) {
    console.info("AppSelector Service onFailed");
  }
};

function sleep(time) {
  return new Promise < void> ((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  })
}


export default function abilityTest() {
  describe('ActsAppSelectorTest', function () {
    beforeAll(async (done) => {
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      driver = await UiDriver.create()
      await sleep(1000);
      done();
    })

    afterEach(async (done) => {
      abilityDelegator.executeShellCommand(cmdUninstall,
        async (err: any, d: any) => {
          console.info('ACTS_AppSelectorTest cmdUninstall executeShellCommand : err : ' + JSON.stringify(err));
          console.info('ACTS_AppSelectorTest cmdUninstall executeShellCommand : data : ' + d.stdResult);
          console.info('ACTS_AppSelectorTest cmdUninstall executeShellCommand : data : ' + d.exitCode);
          await sleep(6000);
          done();
        })
    })

    /*
       * @tc.number: ACTS_AppSelectorTest_3200
       * @tc.name: Multi-hap application with action and type configured in feature
       * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
       */
    it('ACTS_AppSelectorTest_3200', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3200 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActsImageJRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;bm uninstall -n imagejrelyhap"

      console.log('ACTS_AppSelectorTest_3200 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_3200 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_3200 startAbility end");
          await sleep(4000);
          let button = await driver.findComponent(BY.text('imagearelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_3200 button " + JSON.stringify(button));

          await sleep(1000);
          globalThis.abilityContext.startAbility(
            {
              bundleName: "imagejrelyhap",
              abilityName: "MainAbility",
            }, async (error, data) => {
              console.debug("ACTS_AppSelectorTest_3200 startAbility " +
                JSON.stringify(error) + "," + JSON.stringify(data));
              console.debug("ACTS_AppSelectorTest_3200 startAbility end");

              commonEvent.subscribe(subscriber, SubscribeCallBack)
              await sleep(6000);
              await button.click();
              await sleep(2000);
            })
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_3200 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_3200 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_3200 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_3200 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_3200 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagearelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_3200 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_0100
     * @tc.name: Install one image type matching app
     * @tc.desc: Install one image type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_0100', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0100 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageJRelyHap.hap;' +
        'bm install -p /data/ActstextARelyHap.hap';
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagejrelyhap;" +
        "bm uninstall -n textarelyhap.com.example";

      console.log('ACTS_AppSelectorTest_0100 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.log("ACTS_AppSelectorTest_0100 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.log("ACTS_AppSelectorTest_0100 startAbility end");
        })

      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0100 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0100 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0100 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0100 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0100 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagearelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0100 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_0200
     * @tc.name: Install one text type matching app
     * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_0200', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0200 --- start")
      cmdInstall = 'bm install -p /data/ActstextARelyHap.hap;bm install -p /data/ActstextJRelyHap.hap;' +
        'bm install -p /data/ActsImageAEntryRelyHap.hap ';
      cmdUninstall = "bm uninstall -n textarelyhap.com.example;bm uninstall -n textjrelyhap.com.example;" +
        "bm uninstall -n imagearelyhap";

      console.log('ACTS_AppSelectorTest_0200 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "text/txt",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.debug("ACTS_AppSelectorTest_0200 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_0200 startAbility end");
        })

      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0200 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0200 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0200 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0200 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0200 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("com.example.entry.MainAbility");
        expect(data.parameters.bundleName).assertEqual("textarelyhap.com.example");
        expect(data.parameters.type).assertEqual("text/txt");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0200 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_0300
     * @tc.name: Install one text type matching app
     * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_0300', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0300 --- start")
      let subscriber;
      cmdInstall = 'bm install -p /data/ActstextARelyHap.hap;bm install -p /data/ActstextBRelyHap.hap;' +
        'bm install -p /data/ActstextJRelyHap.hap;bm install -p /data/ActsImageAEntryRelyHap.hap ';
      cmdUninstall = "bm uninstall -n textarelyhap.com.example;bm uninstall -n textbrelyhap.com.example;" +
        "bm uninstall -n textjrelyhap.com.example;bm uninstall -n imagearelyhap";

      console.log('ACTS_AppSelectorTest_0300 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "text/txt",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_0300 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_0300 startAbility end");
        })
      await sleep(2000);
      console.log("ACTS_AppSelectorTest_0300 findComponent");
      await sleep(2000);
      let button = await driver.findComponent(BY.text('textbrelyhap.com.example').enabled(true))
      console.log("ACTS_AppSelectorTest_0300 button " + JSON.stringify(button));
      subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)
      await sleep(4000);
      await button.click();
      await sleep(1000);

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0300 SubscribeCallBack');
        console.log('ACTS_AppSelectorTest_0300 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0300 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0300 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0300 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0300 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("com.example.entry.MainAbility");
        expect(data.parameters.bundleName).assertEqual("textbrelyhap.com.example");
        expect(data.parameters.type).assertEqual("text/txt");
        expect(data.parameters.uri).assertEqual("filePath");

        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0300 UnSubscribeCallBack");
        done();
      }
    })

    /*
   * @tc.number: ACTS_AppSelectorTest_0400
   * @tc.name: Install one text type matching app
   * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
   */
    it('ACTS_AppSelectorTest_0400', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0400 --- start")
      let subscriber;
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActsImageCEntryRelyHap.hap;bm install -p /data/ActsImageDRelyHap.hap;' +
        'bm install -p /data/ActsImageJRelyHap.hap;bm install -p /data/ActstextARelyHap.hap';
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;" +
        "bm uninstall -n imagecrelyhap;bm uninstall -n imagedrelyhap;" +
        "bm uninstall -n imagejrelyhap;bm uninstall -n textarelyhap.com.example"

      console.log('ACTS_AppSelectorTest_0400 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_0400 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_0400 startAbility end");

          subscriber = await commonEvent.createSubscriber(subscriberInfo);
          commonEvent.subscribe(subscriber, SubscribeCallBack)
          await sleep(2000);
          console.log("ACTS_AppSelectorTest_0400 findComponent");
          await sleep(2000);
          let button = await driver.findComponent(BY.text('imagebrelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_0400 button " + JSON.stringify(button));
          await sleep(4000);
          await button.click();
          await sleep(2000);
        })
      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0400 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0400 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0400 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0400 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0400 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility1");
        expect(data.parameters.bundleName).assertEqual("imagebrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0400 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_0500
     * @tc.name: Install one text type matching app
     * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_0500', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0500 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActsImageCEntryRelyHap.hap;bm install -p /data/ActsImageDRelyHap.hap;' +
        'bm install -p /data/ActsImageERelyHap.hap;bm install -p /data/ActsImageGRelyHap.hap;' +
        'bm install -p /data/ActsImageHRelyHap.hap;bm install -p /data/ActsImageIRelyHap.hap;'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;bm uninstall -n imagecrelyhap;" +
        "bm uninstall -n imagedrelyhap;bm uninstall -n imageerelyhap;bm uninstall -n imagegrelyhap;" +
        "bm uninstall -n imagehrelyhap;bm uninstall -n imageirelyhap;"

      console.log('ACTS_AppSelectorTest_0500 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_0500 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_0500 startAbility end");

          commonEvent.subscribe(subscriber, SubscribeCallBack)
          await sleep(2000);
          console.log("ACTS_AppSelectorTest_0500 findComponent");
          await sleep(2000);
          let button = await driver.findComponent(BY.text('imagegrelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_0500 button " + JSON.stringify(button));
          await sleep(4000);
          await button.click();
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0500 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0500 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0500 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0500 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0500 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagegrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");


        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0500 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_0600
     * @tc.name: Install one text type matching app
     * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_0600', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0600 --- start")
      cmdInstall = 'bm install -p /data/ActstextARelyHap.hap;bm install -p /data/ActstextBRelyHap.hap;' +
        'bm install -p /data/ActstextCRelyHap.hap;bm install -p /data/ActstextDRelyHap.hap;' +
        'bm install -p /data/ActstextERelyHap.hap;bm install -p /data/ActstextFRelyHap.hap;' +
        'bm install -p /data/ActstextGRelyHap.hap;bm install -p /data/ActstextHRelyHap.hap;' +
        'bm install -p /data/ActstextIRelyHap.hap;'
      cmdUninstall = "bm uninstall -n textarelyhap.com.example;bm uninstall -n textbrelyhap.com.example;" +
        "bm uninstall -n textcrelyhap.com.example;bm uninstall -n textdrelyhap.com.example;" +
        "bm uninstall -n texterelyhap.com.example;bm uninstall -n textfrelyhap.com.example;" +
        "bm uninstall -n textgrelyhap.com.example;bm uninstall -n texthrelyhap.com.example;" +
        "bm uninstall -n textirelyhap.com.example;"

      console.log('ACTS_AppSelectorTest_0600 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "text/txt",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_0600 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_0600 startAbility end");

          commonEvent.subscribe(subscriber, SubscribeCallBack)
          await sleep(4000);
          await driver.swipe(529, 921, 185, 921)
          await sleep(4000);
          await driver.click(142,749);
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0600 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0600 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0600 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0600 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0600 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("com.example.entry.MainAbility");
        expect(data.parameters.bundleName).assertEqual("textirelyhap.com.example");
        expect(data.parameters.type).assertEqual("text/txt");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0600 UnSubscribeCallBack");
        done();
      }
    })

    /*
    * @tc.number: ACTS_AppSelectorTest_0700
    * @tc.name: Install one text type matching app
    * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
    */
    it('ACTS_AppSelectorTest_0700', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0700 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;"

      console.log('ACTS_AppSelectorTest_0700 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_0700 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_0700 startAbility end");
          commonEvent.subscribe(subscriber, SubscribeCallBack)
          await sleep(4000);
          let button = await driver.findComponent(BY.text('imagebrelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_0700 button " + JSON.stringify(button));
          await sleep(4000);
          let rectSerial = await driver.findComponent(BY.text('使用以下方式打开').enabled(true))
          console.log("ACTS_AppSelectorTest_0700 rectSerial " + JSON.stringify(rectSerial));
          await rectSerial.click();
          await sleep(2000);
          console.log("ACTS_AppSelectorTest_0700 findComponent");

          await sleep(4000);
          await button.click();
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0700 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0700 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0700 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0700 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0700 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility1");
        expect(data.parameters.bundleName).assertEqual("imagebrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0700 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_0800
     * @tc.name: Install one text type matching app
     * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_0800', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0800 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;"

      console.log('ACTS_AppSelectorTest_0800 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_0800 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_0800 startAbility end");
          await sleep(4000);
          console.log("ACTS_AppSelectorTest_0800 findComponent");
          let button = await driver.findComponent(BY.text('取消').enabled(true))
          console.log("ACTS_AppSelectorTest_0800 button " + JSON.stringify(button));
          await sleep(4000);
          await button.click();
          await sleep(2000);
          done();

        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_0900
     * @tc.name: Install one text type matching app
     * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_0900', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_0900 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActstextARelyHap.hap;bm install -p /data/ActstextBRelyHap.hap;' +
        'bm install -p /data/ActsServiceAbilityARelyHap.hap;'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;" +
        "bm uninstall -n textarelyhap.com.example;bm uninstall -n textbrelyhap.com.example;" +
        "bm uninstall -n aserviceabilityrelyhap;"

      console.log('ACTS_AppSelectorTest_0900 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);

      console.info("ACTS_AppSelectorTest_0900 Service  servStart");
      let connectionId;
      let want = {
        "bundleName": "aserviceabilityrelyhap",
        "abilityName": "ServiceAbility"
      };

      connectionId = globalThis.abilityContext.connectAbility(want, paConnect)
      console.info('ACTS_AppSelectorTest_0900 Service connectionId ' + connectionId);

      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)
      await sleep(2000);
      console.log("ACTS_AppSelectorTest_0900 findComponent");
      let button = await driver.findComponent(BY.text('textbrelyhap.com.example').enabled(true))
      console.log("ACTS_AppSelectorTest_0900 button " + JSON.stringify(button));
      await sleep(4000);
      await button.click();
      await sleep(4000);

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_0900 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_0900 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_0900 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_0900 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_0900 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("com.example.entry.MainAbility");
        expect(data.parameters.bundleName).assertEqual("textbrelyhap.com.example");
        expect(data.parameters.type).assertEqual("text/txt");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_0900 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1000
     * @tc.name: Install one text type matching app
     * @tc.desc: Install one text type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_1000', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1000 --- start")
      cmdInstall = 'bm install -p /data/ActstextARelyHap.hap;bm install -p /data/ActstextBRelyHap.hap;'
      cmdUninstall = "bm uninstall -n textarelyhap.com.example;bm uninstall -n textbrelyhap.com.example;"

      console.log('ACTS_AppSelectorTest_1000 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbilityForResult(
        {
          action: "ohos.want.action.viewData",
          type: "text/txt",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.log("ACTS_AppSelectorTest_1000 startAbilityForResult " +
            JSON.stringify(error) + "," + JSON.stringify(data));
        })
      await sleep(4000);
      console.log("ACTS_AppSelectorTest_1000 findComponent");
      let button = await driver.findComponent(BY.text('textbrelyhap.com.example').enabled(true))
      console.log("ACTS_AppSelectorTest_1000 button " + JSON.stringify(button));
      commonEvent.subscribe(subscriber, SubscribeCallBack)
      await sleep(4000);
      await button.click();
      await sleep(2000);

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_1000 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_1000 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_1000 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_1000 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_1000 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("com.example.entry.MainAbility");
        expect(data.parameters.bundleName).assertEqual("textbrelyhap.com.example");
        expect(data.parameters.type).assertEqual("text/txt");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }
      async function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_1000 UnSubscribeCallBack");
        try {
          await sleep(2000);
          let close = await driver.findComponent(BY.text('取消').enabled(true))
          console.log("ACTS_AppSelectorTest_1000 cantOpen2 " + JSON.stringify(close));
          await sleep(4000);
          await close.click();
          await sleep(2000);
          done();
        } catch (err) {
          console.debug("ACTS_AppSelectorTest_1000 catch err: " + JSON.stringify(err));
          console.debug("ACTS_AppSelectorTest_1000 catch err: " + err);
          expect("").assertFail();
          done();
        }
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1800
     * @tc.name: Install action matches but type does not match app
     * @tc.desc: Install action matches but type does not match app,"can't open this file" popup
     */
    it('ACTS_AppSelectorTest_1800', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1800 --- start")
      cmdInstall = 'bm install -p /data/ActstextARelyHap.hap'
      cmdUninstall = "bm uninstall -n textarelyhap.com.example"

      console.log('ACTS_AppSelectorTest_1800 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_1800 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1800 startAbility end");


          await sleep(4000);
          console.log("ACTS_AppSelectorTest_1800 findComponent");
          let cantOpen1 = await driver.findComponent(BY.text('无法打开此文件').enabled(true))
          console.log("ACTS_AppSelectorTest_1800 cantOpen1 " + JSON.stringify(cantOpen1));
          expect(cantOpen1 != null).assertTrue();
          await sleep(4000);
          let button = await driver.findComponent(BY.text('知道了').enabled(true))
          console.debug("ACTS_ANROptimization_1800 button: " + JSON.stringify(button))
          await sleep(4000);
          await button.click();
          await sleep(2000);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1900
     * @tc.name: Install action does not match but type matches app
     * @tc.desc: Install action does not match but type matches app,"can't open this file" popup
     */
    it('ACTS_AppSelectorTest_1900', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1900 --- start")
      cmdInstall = 'bm install -p /data/ActstextKRelyHap.hap'
      cmdUninstall = "bm uninstall -n textkrelyhap.com.example"

      console.log('ACTS_AppSelectorTest_1900 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "text/txt",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_1900 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1900 startAbility end");
          await sleep(4000);
          console.log("ACTS_AppSelectorTest_1900 findComponent");
          let cantOpen1 = await driver.findComponent(BY.text('无法打开此文件').enabled(true))
          console.log("ACTS_AppSelectorTest_1900 cantOpen1 " + JSON.stringify(cantOpen1));
          expect(cantOpen1 != null).assertTrue();
          await sleep(4000);
          let button = await driver.findComponent(BY.text('知道了').enabled(true))
          console.debug("ACTS_AppSelectorTest_1900 button: " + JSON.stringify(button))
          await sleep(4000);
          await button.click();
          await sleep(2000);
          done();
        })
    })

    /*
    * @tc.number: ACTS_AppSelectorTest_2000
    * @tc.name: Implicitly start the interface action and pass in an empty string
    * @tc.desc: Implicitly start the interface action and pass in an empty string,return success
    */
    it('ACTS_AppSelectorTest_2000', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2000 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap"

      console.log('ACTS_AppSelectorTest_2000 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      globalThis.abilityContext.startAbility(
        {
          action: "",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.log("ACTS_AppSelectorTest_2000 startAbility " + JSON.stringify(error));
          expect(error.code).assertEqual(0);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_2100
     * @tc.name: Implicitly start the interface action and pass in null
     * @tc.desc: Implicitly start the interface action and pass in null,return failure
     */
    it('ACTS_AppSelectorTest_2100', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2100 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap"

      console.log('ACTS_AppSelectorTest_2100 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      globalThis.abilityContext.startAbility(
        {
          action: null,
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.log("ACTS_AppSelectorTest_2100 startAbility " + JSON.stringify(error));
          expect(error.code).assertEqual(0);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelector_2200
     * @tc.name: Implicitly start the interface action and pass in undefined
     * @tc.desc: Implicitly start the interface action and pass in undefined,return success
     */
    it('ACTS_AppSelectorTest_2200', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2200 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap"

      console.log('ACTS_AppSelectorTest_2200 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: undefined,
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.log("ACTS_AppSelectorTest_2200 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          expect(error.code).assertEqual(0);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_2300
     * @tc.name: Implicitly start the interface type and pass in an empty string
     * @tc.desc: Implicitly start the interface type and pass in an empty string,return failure
     */
    it('ACTS_AppSelectorTest_2300', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2300 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap"

      console.log('ACTS_AppSelectorTest_2300 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.log("ACTS_AppSelectorTest_2300 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          expect(error.code).assertEqual(16000050);
          await sleep(4000);
          let button = await driver.findComponent(BY.text('知道了').enabled(true))
          console.debug("ACTS_AppSelectorTest_2300 button: " + JSON.stringify(button))
          console.debug("ACTS_AppSelectorTest_2300 click");
          await sleep(4000);
          await button.click();
          await sleep(2000);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_2400
     * @tc.name: Implicitly start the interface type and pass in null
     * @tc.desc: Implicitly start the interface type and pass in null,return failure
     */
    it('ACTS_AppSelectorTest_2400', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2400 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap"

      console.log('ACTS_AppSelectorTest_2400 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: null,
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.log("ACTS_AppSelectorTest_2400 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          expect(error.code).assertEqual(16000050);
          await sleep(4000);
          let button = await driver.findComponent(BY.text('知道了').enabled(true))
          console.debug("ACTS_AppSelectorTest_2400 button: " + JSON.stringify(button))
          console.debug("ACTS_AppSelectorTest_2400 click");
          await sleep(4000);
          await button.click();
          await sleep(2000);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_2500
     * @tc.name: Implicitly start the interface type and pass in undefined
     * @tc.desc: Implicitly start the interface type and pass in undefined,return failure
     */
    it('ACTS_AppSelectorTest_2500', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2500 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap"

      console.log('ACTS_AppSelectorTest_2500 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: undefined,
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.log("ACTS_AppSelectorTest_2500 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          expect(error.code).assertEqual(16000050);
          await sleep(4000);
          let button = await driver.findComponent(BY.text('知道了').enabled(true))
          console.debug("ACTS_AppSelectorTest_2500 button: " + JSON.stringify(button))
          console.debug("ACTS_AppSelectorTest_2500 click");
          await sleep(4000);
          await button.click();
          await sleep(2000);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_2600
     * @tc.name: Multi-hap application with action and type configured in entry
     * @tc.desc: Multi-hap application with action and type configured in entry,MainAbility is pulled up in entry
     */
    it('ACTS_AppSelectorTest_2600', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2600 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageAFeatureRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap"

      console.log('ACTS_AppSelectorTest_2600 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.debug("ACTS_AppSelectorTest_2600 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_2600 startAbility end");
        })
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_2600 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_2600 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_2600 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_2600 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_2600 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagearelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_2600 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_2700
     * @tc.name: Multi-hap application with action and type configured in feature
     * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
     */
    it('ACTS_AppSelectorTest_2700', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2700 --- start")
      cmdInstall = 'bm install -p /data/ActsImageBFeatureRelyHap.hap;bm install -p /data/ActsImageBEntryRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagebrelyhap"

      console.log('ACTS_AppSelectorTest_2700 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.debug("ACTS_AppSelectorTest_2700 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_2700 startAbility end");
        })
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_2700 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_2700 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_2700 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_2700 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_2700 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility1");
        expect(data.parameters.bundleName).assertEqual("imagebrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_2700 UnSubscribeCallBack");
        done();
      }
    })

    /*
    * @tc.number: ACTS_AppSelectorTest_2800
    * @tc.name: Multi-hap application with action and type configured in feature
    * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
    */
    it('ACTS_AppSelectorTest_2800', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2800 --- start")
      cmdInstall = 'bm install -p /data/ActsImageCEntryRelyHap.hap;bm install -p /data/ActsImageCFeatureRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagecrelyhap"

      console.log('ACTS_AppSelectorTest_2800 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_2800 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_2800 startAbility end");
          await sleep(4000);
          console.log("ACTS_AppSelectorTest_2800 findComponent");
          let button = await driver.findComponent(BY.text('imagecrelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_2800 button " + JSON.stringify(button));
          commonEvent.subscribe(subscriber, SubscribeCallBack)
          await sleep(4000);
          await button.click();
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_2800 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_2800 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_2800 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_2800 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_2800 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagecrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_2800 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_2900
     * @tc.name: MainAbility configures multi-ability applications of actions and types
     * @tc.desc: MainAbility configures multi-ability applications of actions and types,mainAbility is pulled up
     */
    it('ACTS_AppSelectorTest_2900', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_2900 --- start")
      cmdInstall = 'bm install -p /data/ActsImageDRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagedrelyhap"

      console.log('ACTS_AppSelectorTest_2900 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.debug("ACTS_AppSelectorTest_2900 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_2900 startAbility end");
        })
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_2900 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_2900 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_2900 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_2900 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_2900 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagedrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_2900 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_3000
     * @tc.name: SecondAbility configures multi-ability applications of actions and types
     * @tc.desc: SecondAbility configures multi-ability applications of actions and types,secondAbility is pulled up
     */
    it('ACTS_AppSelectorTest_3000', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3000 --- start")
      cmdInstall = 'bm install -p /data/ActsImageERelyHap.hap'
      cmdUninstall = "bm uninstall -n imageerelyhap"

      console.log('ACTS_AppSelectorTest_3000 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, (error, data) => {
          console.debug("ACTS_AppSelectorTest_3000 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_3000 startAbility end");
        })
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_3000 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_3000 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_3000 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_3000 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_3000 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("SecondAbility");
        expect(data.parameters.bundleName).assertEqual("imageerelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_3000 UnSubscribeCallBack");
        done();
      }
    })

    /*
    * @tc.number: ACTS_AppSelectorTest_3100
    * @tc.name: Multi-hap application with action and type configured in feature
    * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
    */
    it('ACTS_AppSelectorTest_3100', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3100 --- start")
      cmdInstall = 'bm install -p /data/ActsImageFRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagefrelyhap"

      console.log('ACTS_AppSelectorTest_3100 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_3100 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_3100 startAbility end");
          await sleep(4000);
          console.log("ACTS_AppSelectorTest_3100 findComponent");
          let button = await driver.findComponent(BY.text('imagefrelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_3100 button " + JSON.stringify(button));
          commonEvent.subscribe(subscriber, SubscribeCallBack)
          await sleep(4000);
          await button.click();
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_3100 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_3100 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_3100 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_3100 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_3100 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagefrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_3100 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_3400
     * @tc.name: Multi-hap application with action and type configured in feature
     * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
     */
    it('ACTS_AppSelectorTest_3400', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3400 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap"

      console.log('ACTS_AppSelectorTest_3400 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)
      globalThis.abilityContext.startAbilityWithAccount(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, 100, (error, data) => {
          console.log("ACTS_AppSelectorManual startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
        })
      await sleep(4000);
      console.log("ACTS_AppSelectorTest_3400 findComponent");
      let button = await driver.findComponent(BY.text('imagearelyhap').enabled(true))
      console.log("ACTS_AppSelectorTest_3400 button " + JSON.stringify(button));
      await sleep(4000);
      await button.click();
      await sleep(2000);
      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_3400 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_3400 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_3400 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_3400 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_3400 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagearelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_3400 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_3500
     * @tc.name: Multi-hap application with action and type configured in feature
     * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
     */
    it('ACTS_AppSelectorTest_3500', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3500 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap"

      console.log('ACTS_AppSelectorTest_3500 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)
      globalThis.abilityContext.startAbilityForResultWithAccount(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, 100, (error, data) => {
          console.log("ACTS_AppSelectorManual startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
        })
      await sleep(4000);
      console.log("ACTS_AppSelectorTest_3500 findComponent");
      let button = await driver.findComponent(BY.text('imagebrelyhap').enabled(true))
      console.log("ACTS_AppSelectorTest_3500 button " + JSON.stringify(button));
      await sleep(4000);
      await button.click();
      await sleep(2000);
      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_3500 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_3500 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_3500 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_3500 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_3500 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility1");
        expect(data.parameters.bundleName).assertEqual("imagebrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_3500 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_3600
     * @tc.name: Multi-hap application with action and type configured in feature
     * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
     */
    it('ACTS_AppSelectorTest_3600', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3600 --- start")
      cmdInstall = 'bm install -p /data/ActsServiceAbilityBRelyHap.hap;bm install -p /data/ActsImageKRelyHap.hap'
      cmdUninstall = "bm uninstall -n bserviceabilityrelyhap;bm uninstall -n imagekrelyhap"

      console.log('ACTS_AppSelectorTest_3600 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)
      console.log("ACTS_AppSelectorTest_3600 connectservice")

      let connectionId;
      let want = {
        action: "ohos.want.action.viewData",
        type: "image/png",
        parameters: {
          uri: "filePath"
        },
      };

      connectionId = globalThis.abilityContext.connectAbility(want, paConnect)
      console.info('ACTS_AppSelectorTest_3600 Service connectionId ' + connectionId);

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_3600 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_3600 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_3600 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_3600 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_3600 event = ' + data.event);
        console.log('ACTS_AppSelectorTest_3600 startByService = ' + data.parameters.startByService);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.startByService).assertEqual(true);
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_3600 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_3700
     * @tc.name: Multi-hap application with action and type configured in feature
     * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
     */
    it('ACTS_AppSelectorTest_3700', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3700 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActsAppSelectorRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;" +
        "bm uninstall -n com.example.appselectorrelyhap"

      console.log('ACTS_AppSelectorTest_3700 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(1000);
      globalThis.abilityContext.startAbility(
        {
          bundleName: "com.example.appselectorrelyhap",
          abilityName: "MainAbility",
        }, (error, data) => {
          console.log("ACTS_AppSelectorTest_3700 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
        })
      await sleep(4000);
      let button = await driver.findComponent(BY.text('imagearelyhap').enabled(true))
      console.log("ACTS_AppSelectorTest_3700 button " + JSON.stringify(button));

      var cmd = 'bm uninstall -n com.example.appselectorrelyhap ';
      console.log('ACTS_AppSelectorTest_3700 cmd = ' + cmd);
      abilityDelegator.executeShellCommand(cmd,
        async (err: any, d: any) => {
          console.info('ACTS_AppSelectorTest_3700 executeShellCommand : err : ' + JSON.stringify(err));
          console.info('ACTS_AppSelectorTest_3700 executeShellCommand : stdResult : ' + d.stdResult);
          console.info('ACTS_AppSelectorTest_3700 executeShellCommand : exitCode : ' + d.exitCode);
          await sleep(4000);
          await button.click();
          await sleep(2000);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_3300
     * @tc.name: Multi-hap application with action and type configured in feature
     * @tc.desc: Multi-hap application with action and type configured in feature,mainAbility is pulled up in feature
     */
    it('ACTS_AppSelectorTest_3300', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_3300 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap"
      let subscriber;
      console.log('ACTS_AppSelectorTest_3300 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);
      await sleep(2000);

      for (var i = 0; i < 10; i++) {
        await sleep(2000);
        subscriber = await commonEvent.createSubscriber(subscriberInfo);
        globalThis.abilityContext.startAbility(
          {
            action: "ohos.want.action.viewData",
            type: "image/png",
            parameters: {
              uri: "filePath"
            }
          }, async (error, data) => {
            console.log("ACTS_AppSelectorTest_3300 startAbility " +
              JSON.stringify(error) + "," + JSON.stringify(data));
          })
        
        commonEvent.subscribe(subscriber, SubscribeCallBack);
        await sleep(4000);
        console.log("ACTS_AppSelectorTest_3300 findComponent");
        let button = await driver.findComponent(BY.text('imagearelyhap').enabled(true))
        console.log("ACTS_AppSelectorTest_3300 button " + JSON.stringify(button));
        await sleep(4000);
        await button.click();
        await sleep(2000);

        async function SubscribeCallBack(err, data) {
          console.log('ACTS_AppSelectorTest_3300 bundleName = ' + data.parameters.bundleName);
          console.log('ACTS_AppSelectorTest_3300 abilityName = ' + data.parameters.abilityName);
          console.log('ACTS_AppSelectorTest_3300 type = ' + data.parameters.type);
          console.log('ACTS_AppSelectorTest_3300 uri = ' + data.parameters.uri);
          console.log('ACTS_AppSelectorTest_3300 event = ' + data.event);
          expect(data.event).assertEqual("AppSelector");
          expect(data.parameters.abilityName).assertEqual("MainAbility");
          expect(data.parameters.bundleName).assertEqual("imagearelyhap");
          expect(data.parameters.type).assertEqual("image/png");
          expect(data.parameters.uri).assertEqual("filePath");
        }
      }
      await sleep(2000);
      commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_3300 UnSubscribeCallBack");
        done();
      }
    })
  })
}