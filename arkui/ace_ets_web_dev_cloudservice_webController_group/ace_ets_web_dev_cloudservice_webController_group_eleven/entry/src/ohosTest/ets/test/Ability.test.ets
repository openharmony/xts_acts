/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Driver, ON, Component, MatchPattern } from '@ohos.UiTest'

import { router } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default function abilityTest() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()

  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_0001
     * @tc.name testWebView_ResumePlayer0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_ResumePlayer0001", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_BFCACHE_0001 start')
      console.info('SUB_ACE_WEB_BFCACHE_0001 start')
      let controller: webview.WebviewController = new webview.WebviewController()
      let nativePlayer: webview.NativeMediaPlayerBridge

      class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge {
        // 实现NativeMediaPlayerBridge里的接口方法
        constructor(handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) {
          this.resumePlayer()
        }

        updateRect(x: number, y: number, width: number, height: number) {
        }

        play() {
        }

        pause() {
        }

        seek() {
        }

        release() {
        }

        setVolume() {
        }

        setMuted() {
        }

        setPlaybackRate() {
        }

        enterFullscreen() {
        }

        exitFullscreen() {
        }

        resumePlayer(): void {
        }

        suspendPlayer(): void {
        }
      }

      try {
        controller.onCreateNativeMediaPlayer((handler: webview.NativeMediaPlayerHandler,
          mediaInfo: webview.MediaInfo) => {
          nativePlayer = new NativeMediaPlayerImpl(handler, mediaInfo);
          if (nativePlayer !== undefined) {
          }
          return nativePlayer;
        });
      } catch (e) {
        console.log("err.code" + e.code)
      }
      console.info('SUB_ACE_WEB_BFCACHE_0001 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_BFCACHE_0001 end')
      done()
    })

    /**
     * @tc.number SUB_ACE_WEB_BFCACHE_0002
     * @tc.name testWebView_SusPendPlayer0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_SusPendPlayer0001", 0, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_BFCACHE_0002 start')
      console.info('SUB_ACE_WEB_BFCACHE_0002 start')
      let controller: webview.WebviewController = new webview.WebviewController()
      let nativePlayer: webview.NativeMediaPlayerBridge | undefined

      class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge {
        // 实现NativeMediaPlayerBridge里的接口方法
        constructor(handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) {
          this.resumePlayer()
        }

        updateRect(x: number, y: number, width: number, height: number) {
        }

        play() {
        }

        pause() {
        }

        seek() {
        }

        release() {
        }

        setVolume() {
        }

        setMuted() {
        }

        setPlaybackRate() {
        }

        enterFullscreen() {
        }

        exitFullscreen() {
        }

        resumePlayer(): void {
        }

        suspendPlayer(): void {
        }
      }

      try {
        controller.onCreateNativeMediaPlayer((handler: webview.NativeMediaPlayerHandler,
          mediaInfo: webview.MediaInfo) => {
          nativePlayer = new NativeMediaPlayerImpl(handler, mediaInfo);
          if (nativePlayer !== undefined) {
          } else {
            console.log("nativePlayer is undefined")
          }
          return nativePlayer;
        });
      } catch (e) {
        console.log("err.code" + e.code)
      }
      console.info('SUB_ACE_WEB_BFCACHE_0002 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_BFCACHE_0002 end')
      done()
    })


    /**
     * @tc.number SUB_ACE_WEB_THREAT_0100
     * @tc.name testWebView_onSafeBrowsingCheckResult_THREAT_ILLEGAL
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_onSafeBrowsingCheckResult_THREAT_ILLEGAL", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0100 start')
      console.info('SUB_ACE_WEB_THREAT_0100 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('illegalBrowser'));
      await accept2.click();
      await driver.delayMs(3000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(500);
      console.info('SUB_ACE_WEB_THREAT_0100 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0100 end')
      done();

    })


    /**
     * @tc.number SUB_ACE_WEB_THREAT_0200
     * @tc.name testWebView_onSafeBrowsingCheckResult_THREAT_FRAUD
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_onSafeBrowsingCheckResult_THREAT_FRAUD", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0200 start')
      console.info('SUB_ACE_WEB_THREAT_0200 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('fraudBrowser'));
      await accept2.click();
      await driver.delayMs(3000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(500);
      console.info('SUB_ACE_WEB_THREAT_0200 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0200 end')
      done();
    })


    /**
     * @tc.number SUB_ACE_WEB_THREAT_0300
     * @tc.name testWebView_onSafeBrowsingCheckResult_THREAT_RISK
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_onSafeBrowsingCheckResult_THREAT_RISK", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0300 start')
      console.info('SUB_ACE_WEB_THREAT_0300 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('riskBrowser'));
      await accept2.click();
      await driver.delayMs(3000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(500);
      console.info('SUB_ACE_WEB_THREAT_0300 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0300 end')
      done();
    })


    /**
     * @tc.number SUB_ACE_WEB_THREAT_0400
     * @tc.name testWebView_onSafeBrowsingCheckResult_THREAT_WARNING
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_onSafeBrowsingCheckResult_THREAT_WARNING", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0400 start')
      console.info('SUB_ACE_WEB_THREAT_0400 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('warningBrowser'));
      await accept2.click();
      await driver.delayMs(3000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(500);
      console.info('SUB_ACE_WEB_THREAT_0400 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0400 end')
      done();
    })


    /**
     * @tc.number SUB_ACE_WEB_THREAT_0500
     * @tc.name testWebView_onSafeBrowsingCheckResult_THREAT_UNKOWN
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_onSafeBrowsingCheckResult_THREAT_UNKOWN", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0500 start')
      console.info('SUB_ACE_WEB_THREAT_0500 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('safeBrowser'));
      await accept2.click();
      await driver.delayMs(3000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(500);
      console.info('SUB_ACE_WEB_THREAT_0500 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_THREAT_0500 end')
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_JSANR_INTERFACE_0001
     * @tc.name testWebView_enableBackForwardCache0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_enableBackForwardCache0001", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_JSANR_INTERFACE_0001 start')
      console.info('SUB_ACE_WEB_JSANR_INTERFACE_0001 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('RenderProcess'));
      await accept2.click();
      await driver.delayMs(3000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(500);
      console.info('SUB_ACE_WEB_JSANR_INTERFACE_0001 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_JSANR_INTERFACE_0001 end')
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_JSANR_INTERFACE_0002
     * @tc.name testWebView_enableBackForwardCache0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebView_enableBackForwardCache0002", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_JSANR_INTERFACE_0002 start')
      console.info('SUB_ACE_WEB_JSANR_INTERFACE_0002 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('RenderProcess'));
      await accept2.click();
      await driver.delayMs(3000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(500);
      console.info('SUB_ACE_WEB_JSANR_INTERFACE_0002 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_JSANR_INTERFACE_0002 end')
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_enableNativeEmbedMode_0100
     * @tc.name testWebVeiw_enableNativeEmbedMode
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testWebVeiw_enableNativeEmbedMode", 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_enableNativeEmbedMode_0100 start')
      console.info('SUB_ACE_WEB_enableNativeEmbedMode_0100 start')
      let driver = Driver.create();

      let accept2 = await driver.findComponent(ON.id('safeBrowser'));
      await accept2.click();
      await driver.delayMs(1000);

      let accept1 = await driver.findComponent(ON.id('back'));
      await accept1.click();
      await driver.delayMs(1000);
      console.info('SUB_ACE_WEB_enableNativeEmbedMode_0100 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_enableNativeEmbedMode_0100 end')
      done();
    })
  })
}