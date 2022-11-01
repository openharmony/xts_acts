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

function sleep(time) {
  return new Promise < void> ((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  })
}

export default function abilityTest() {
  describe('ActsAppSelectorPCTest', function () {
    beforeAll(async (done) => {
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      driver = await UiDriver.create()
      await sleep(2000);
      done();
    })

    afterEach(async (done) => {
      abilityDelegator.executeShellCommand(cmdUninstall,
        async (err: any, d: any) => {
          console.log('ACTS_AppSelectorTest cmdUninstall executeShellCommand : err : ' + JSON.stringify(err));
          console.log('ACTS_AppSelectorTest cmdUninstall executeShellCommand : stdResult : ' + d.stdResult);
          console.log('ACTS_AppSelectorTest cmdUninstall executeShellCommand : exitCode : ' + d.exitCode);
          await sleep(4000);
          done();
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1100
     * @tc.name: Install one image type matching app
     * @tc.desc: Install one image type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_1100', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1100 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActstextARelyHap.hap';
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n textarelyhap.com.example";

      console.log('ACTS_AppSelectorTest_1100 cmd = ' + cmdInstall);
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
          console.debug("ACTS_AppSelectorTest_1100 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1100 startAbility end");
        })
      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      commonEvent.subscribe(subscriber, SubscribeCallBack)

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_1100 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_1100 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_1100 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_1100 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_1100 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagearelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_1100 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1200
     * @tc.name: Install one image type matching app
     * @tc.desc: Install one image type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_1200', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1200 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActstextARelyHap.hap';
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;" +
        "bm uninstall -n textarelyhap.com.example";

      console.log('ACTS_AppSelectorTest_1200 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);

      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {

          console.debug("ACTS_AppSelectorTest_1200 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1200 startAbility end");

          commonEvent.subscribe(subscriber, SubscribeCallBack)

          await sleep(4000);
          console.log("ACTS_AppSelectorTest_1200 findComponent");
          let button = await driver.findComponent(BY.text('imagearelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_1200 button " + JSON.stringify(button));
          await sleep(4000);
          await button.click();
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_1200 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_1200 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_1200 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_1200 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_1200 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagearelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_1200 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1300
     * @tc.name: Install one image type matching app
     * @tc.desc: Install one image type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_1300', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1300 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActsImageCEntryRelyHap.hap;bm install -p /data/ActsImageDRelyHap.hap;' +
        'bm install -p /data/ActstextARelyHap.hap';
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;" +
        "bm uninstall -n imagecrelyhap;bm uninstall -n imagedrelyhap;" +
        "bm uninstall -n textarelyhap.com.example"

      console.log('ACTS_AppSelectorTest_1300 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);

      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_1300 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1300 startAbility end");

          commonEvent.subscribe(subscriber, SubscribeCallBack)

          await sleep(2000);
          console.log("ACTS_AppSelectorTest_1300 findComponent");
          let button = await driver.findComponent(BY.text('imagearelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_1300 button " + JSON.stringify(button));
          await sleep(4000);
          await button.click();
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_1300 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_1300 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_1300 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_1300 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_1300 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagearelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_1300 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1400
     * @tc.name: Install one image type matching app
     * @tc.desc: Install one image type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_1400', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1400 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;' +
        'bm install -p /data/ActsImageCEntryRelyHap.hap;bm install -p /data/ActsImageDRelyHap.hap;' +
        'bm install -p /data/ActsImageERelyHap.hap;bm install -p /data/ActsImageFRelyHap.hap;bm install -p /data/ActsImageGRelyHap.hap;' +
        'bm install -p /data/ActsImageHRelyHap.hap;bm install -p /data/ActsImageIRelyHap.hap;'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;bm uninstall -n imagecrelyhap;" +
        "bm uninstall -n imagedrelyhap;bm uninstall -n imageerelyhap;bm uninstall -n imagefrelyhap;bm uninstall -n imagegrelyhap;" +
        "bm uninstall -n imagehrelyhap;bm uninstall -n imageirelyhap;"

      console.log('ACTS_AppSelectorTest_1400 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);

      let subscriber = await commonEvent.createSubscriber(subscriberInfo);

      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_1400 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1400 startAbility end");

          await sleep(2000);
          commonEvent.subscribe(subscriber, SubscribeCallBack)
          await sleep(4000);
          await driver.swipe(529, 921, 185, 921)
          await sleep(4000);
          await driver.click(142,749);
          await sleep(2000);
        })
      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_1400 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_1400 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_1400 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_1400 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_1400 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility");
        expect(data.parameters.bundleName).assertEqual("imagehrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_1400 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1500
     * @tc.name: Install one image type matching app
     * @tc.desc: Install one image type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_1500', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1500 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;"

      console.log('ACTS_AppSelectorTest_1500 cmd = ' + cmdInstall);
      await abilityDelegator.executeShellCommand(cmdInstall);

      let subscriber = await commonEvent.createSubscriber(subscriberInfo);
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_1500 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1500 startAbility end");
          await sleep(2000);
          commonEvent.subscribe(subscriber, SubscribeCallBack)
          let button1 = await driver.findComponent(BY.text('使用以下方式打开').enabled(true))
          console.log("ACTS_AppSelectorTest_1500 rectSerial " + JSON.stringify(button1));
          await sleep(4000);
          let button2 = await driver.findComponent(BY.text('imagebrelyhap').enabled(true))
          console.log("ACTS_AppSelectorTest_1500 rectSerial " + JSON.stringify(button2));

          await sleep(4000);
          await button1.click();
          await sleep(4000);
          await button2.click();
          await sleep(2000);
        })

      async function SubscribeCallBack(err, data) {
        console.log('ACTS_AppSelectorTest_1500 bundleName = ' + data.parameters.bundleName);
        console.log('ACTS_AppSelectorTest_1500 abilityName = ' + data.parameters.abilityName);
        console.log('ACTS_AppSelectorTest_1500 type = ' + data.parameters.type);
        console.log('ACTS_AppSelectorTest_1500 uri = ' + data.parameters.uri);
        console.log('ACTS_AppSelectorTest_1500 event = ' + data.event);
        expect(data.event).assertEqual("AppSelector");
        expect(data.parameters.abilityName).assertEqual("MainAbility1");
        expect(data.parameters.bundleName).assertEqual("imagebrelyhap");
        expect(data.parameters.type).assertEqual("image/png");
        expect(data.parameters.uri).assertEqual("filePath");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallBack)
      }

      function UnSubscribeCallBack() {
        console.log("ACTS_AppSelectorTest_1500 UnSubscribeCallBack");
        done();
      }
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1600
     * @tc.name: Install one image type matching app
     * @tc.desc: Install one image type matching app,no application selection box pops up, the app is pulled up
     */
    it('ACTS_AppSelectorTest_1600', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1600 --- start")
      cmdInstall = 'bm install -p /data/ActsImageAEntryRelyHap.hap;bm install -p /data/ActsImageBFeatureRelyHap.hap;'
      cmdUninstall = "bm uninstall -n imagearelyhap;bm uninstall -n imagebrelyhap;"

      console.log('ACTS_AppSelectorTest_1600 cmd = ' + cmdInstall);
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
          console.debug("ACTS_AppSelectorTest_1600 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1600 startAbility end");

          await sleep(2000);
          console.log("ACTS_AppSelectorTest_1600 findComponent");
          let button = await driver.findComponent(BY.text('取消').enabled(true))
          console.log("ACTS_AppSelectorTest_1600 button " + JSON.stringify(button));
          await sleep(4000);
          await button.click();

          try {
            await sleep(2000);
            let close = await driver.findComponent(BY.text('取消').enabled(true))
            console.log("ACTS_AppSelectorTest_1600 close " + JSON.stringify(close));
            expect(close == null).assertTrue();
            done();
          } catch (err) {
            console.debug("ACTS_AppSelectorTest_1600 catch err: " + JSON.stringify(err));
            console.debug("ACTS_AppSelectorTest_1600 catch err: " + err);
            expect(err.code).assertEqual("INTERNAL_ERROR");
            done();
          }
        })
    })

    /*
     * @tc.number: ACTS_AppSelectorTest_1700
     * @tc.name: Do not install matching apps
     * @tc.desc: Do not install matching apps,"can't open this file" popup
     */
    it('ACTS_AppSelectorTest_1700', 0, async function (done) {
      console.log("ACTS_AppSelectorTest_1700 --- start")
      await sleep(2000);
      cmdInstall = 'bm install -p /data/ActsImageJRelyHap.hap'
      cmdUninstall = "bm uninstall -n imagejrelyhap";
      globalThis.abilityContext.startAbility(
        {
          action: "ohos.want.action.viewData",
          type: "image/png",
          parameters: {
            uri: "filePath"
          }
        }, async (error, data) => {
          console.debug("ACTS_AppSelectorTest_1700 startAbility " +
            JSON.stringify(error) + "," + JSON.stringify(data));
          console.debug("ACTS_AppSelectorTest_1700 startAbility end");

          try {
            await sleep(2000);
            console.log("ACTS_AppSelectorTest_1700 findComponent");
            let cantOpen1 = await driver.findComponent(BY.text('无法打开此文件').enabled(true))
            console.log("ACTS_AppSelectorTest_1700 cantOpen1 " + JSON.stringify(cantOpen1));
            expect(cantOpen1 != null).assertTrue();
            let button = await driver.findComponent(BY.text('知道了').enabled(true))
            console.debug("ACTS_AppSelectorTest_1700 button: " + JSON.stringify(button))
            await sleep(4000);
            await button.click();
            await sleep(2000);

            await sleep(1000);
            console.debug("ACTS_AppSelectorTest_1700 findComponent");
            let cantOpen2 = await driver.findComponent(BY.text('无法打开此文件').enabled(true))
            console.log("ACTS_AppSelectorTest_1700 cantOpen2 " + JSON.stringify(cantOpen2));
            expect(cantOpen2 == null).assertTrue();
            done();
          } catch (err) {
            console.debug("ACTS_AppSelectorTest_1700 catch err: " + JSON.stringify(err));
            console.debug("ACTS_AppSelectorTest_1700 catch err: " + err);
            expect(err.code).assertEqual("INTERNAL_ERROR");
            done();
          }
        })
    })
  })
}