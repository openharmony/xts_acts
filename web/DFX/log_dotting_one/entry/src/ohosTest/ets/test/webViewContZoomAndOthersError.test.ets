/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitZoomInitErr";

export default function webViewContZoomAndOthersError() {
  describe('ActsAceWebDevWebViewContZoomAndOthersErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContZoomAndOthersError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContZoomAndOthersError state success " + JSON.stringify(pages));
        if (!("webViewContZoomAndOthersError" == pages.name)) {
          console.info("get webViewContZoomAndOthersError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContZoomAndOthersError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContZoomAndOthersError page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webViewContZoomAndOthersError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContZoomAndOthersError afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3300
     *tc.name testZoomInitErr
     *tc.desc test interface of zoom with not been associated with specific Web Components
     */
    it('testZoomInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomEnableErr";
      Utils.registerEvent("testZoomInitErr", "17100001", 664, done);
      Utils.registerEvent("testZoomInitErr", "Init error. The WebviewController must be associated with a Web component", 665, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3400
     *tc.name testZoomEnableErr
     *tc.desc test interface of zoom with not been enabled
     */
    it('testZoomEnableErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSearchAllAsyncInitErr";
      Utils.registerEvent("testZoomEnableErr", "17100004", 666, done);
      Utils.registerEvent("testZoomEnableErr", "Function not enabled.", 667, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3500
     *tc.name testSearchAllAsyncInitErr
     *tc.desc test interface of searchAllAsync with not been associated with specific Web Components
     */
    it('testSearchAllAsyncInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearMatchesInitErr";
      Utils.registerEvent("testSearchAllAsyncInitErr", "17100001", 668, done);
      Utils.registerEvent("testSearchAllAsyncInitErr", "Init error. The WebviewController must be associated with a Web component", 669, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3600
     *tc.name testClearMatchesInitErr
     *tc.desc test interface of clearMatches with not been associated with specific Web Components
     */
    it('testClearMatchesInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSearchNextInitErr";
      Utils.registerEvent("testClearMatchesInitErr", "17100001", 670, done);
      Utils.registerEvent("testClearMatchesInitErr", "Init error. The WebviewController must be associated with a Web component", 671, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3700
     *tc.name testSearchNextInitErr
     *tc.desc test interface of searchNext with not been associated with specific Web Components
     */
    it('testSearchNextInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearSslCacheInitErr";
      Utils.registerEvent("testSearchNextInitErr", "17100001", 672, done);
      Utils.registerEvent("testSearchNextInitErr", "Init error. The WebviewController must be associated with a Web component", 673, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3800
     *tc.name testClearSslCacheInitErr
     *tc.desc test interface of clearSslCache with not been associated with specific Web Components
     */
    it('testClearSslCacheInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearClientAuthenticationCacheInitErr";
      Utils.registerEvent("testClearSslCacheInitErr", "17100001", 674, done);
      Utils.registerEvent("testClearSslCacheInitErr", "Init error. The WebviewController must be associated with a Web component", 675, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3900
     *tc.name testClearClientAuthenticationCacheInitErr
     *tc.desc test interface of clearClientAuthenticationCache with not been associated with specific Web Components
     */
    it('testClearClientAuthenticationCacheInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitCreateWebMessagePortsInitErr";
      Utils.registerEvent("testClearClientAuthenticationCacheInitErr", "17100001", 676, done);
      Utils.registerEvent("testClearClientAuthenticationCacheInitErr", "Init error. The WebviewController must be associated with a Web component", 677, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4000
     *tc.name testCreateWebMessagePortsInitErr
     *tc.desc test interface of createWebMessagePorts with not been associated with specific Web Components
     */
    it('testCreateWebMessagePortsInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRequestFocusInitErr";
      Utils.registerEvent("testCreateWebMessagePortsInitErr", "17100001", 678, done);
      Utils.registerEvent("testCreateWebMessagePortsInitErr", "Init error. The WebviewController must be associated with a Web component", 679, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4100
     *tc.name testRequestFocusInitErr
     *tc.desc test interface of requestFocus with not been associated with specific Web Components
     */
    it('testRequestFocusInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomInInitErr";
      Utils.registerEvent("testRequestFocusInitErr", "17100001", 680, done);
      Utils.registerEvent("testRequestFocusInitErr", "Init error. The WebviewController must be associated with a Web component", 681, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4200
     *tc.name testZoomInInitErr
     *tc.desc test interface of zoomIn with not been associated with specific Web Components
     */
    it('testZoomInInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomInEnableErr";
      Utils.registerEvent("testZoomInInitErr", "17100001", 682, done);
      Utils.registerEvent("testZoomInInitErr", "Init error. The WebviewController must be associated with a Web component", 683, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4300
     *tc.name testZoomInEnableErr
     *tc.desc test interface of zoomIn with not been enabled
     */
    it('testZoomInEnableErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomOutInitErr";
      Utils.registerEvent("testZoomInEnableErr", "17100004", 684, done);
      Utils.registerEvent("testZoomInEnableErr", "Function not enabled.", 685, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4400
     *tc.name testZoomOutInitErr
     *tc.desc test interface of zoomOut with not been associated with specific Web Components
     */
    it('testZoomOutInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomOutEnableErr";
      Utils.registerEvent("testZoomOutInitErr", "17100001", 686, done);
      Utils.registerEvent("testZoomOutInitErr", "Init error. The WebviewController must be associated with a Web component", 687, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4500
     *tc.name testZoomOutEnableErr
     *tc.desc test interface of zoomOut with not been enabled
     */
    it('testZoomOutEnableErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetHitTestValueInitErr";
      Utils.registerEvent("testZoomOutEnableErr", "17100004", 688, done);
      Utils.registerEvent("testZoomOutEnableErr", "Function not enabled.", 689, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4600
     *tc.name testGetHitTestValueInitErr
     *tc.desc test interface of getHitTestValue with not been associated with specific Web Components
     */
    it('testGetHitTestValueInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetWebIdInitErr";
      Utils.registerEvent("testGetHitTestValueInitErr", "17100001", 690, done);
      Utils.registerEvent("testGetHitTestValueInitErr", "Init error. The WebviewController must be associated with a Web component", 691, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4700
     *tc.name testGetWebIdInitErr
     *tc.desc test interface of getWebId with not been associated with specific Web Components
     */
    it('testGetWebIdInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetUserAgentInitErr";
      Utils.registerEvent("testGetWebIdInitErr", "17100001", 692, done);
      Utils.registerEvent("testGetWebIdInitErr", "Init error. The WebviewController must be associated with a Web component", 639, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4800
     *tc.name testGetUserAgentInitErr
     *tc.desc test interface of getUserAgent with not been associated with specific Web Components
     */
    it('testGetUserAgentInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetTitleInitErr";
      Utils.registerEvent("testGetUserAgentInitErr", "17100001", 694, done);
      Utils.registerEvent("testGetUserAgentInitErr", "Init error. The WebviewController must be associated with a Web component", 695, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_4900
     *tc.name testGetTitleInitErr
     *tc.desc test interface of getTitle with not been associated with specific Web Components
     */
    it('testGetTitleInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetPageHeightInitErr";
      Utils.registerEvent("testGetTitleInitErr", "17100001", 696, done);
      Utils.registerEvent("testGetTitleInitErr", "Init error. The WebviewController must be associated with a Web component", 697, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5000
     *tc.name testGetPageHeightInitErr
     *tc.desc test interface of getPageHeight with not been associated with specific Web Components
     */
    it('testGetPageHeightInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetPageHeightInitErr";
      Utils.registerEvent("testGetPageHeightInitErr", "17100001", 698, done);
      Utils.registerEvent("testGetPageHeightInitErr", "Init error. The WebviewController must be associated with a Web component", 699, done);
      sendEventByKey('webViewContZoomAndOthersError', 10, '');
    })
  })
}