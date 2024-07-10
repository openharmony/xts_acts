/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSdkSchemeHandlerDidFail3() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail3', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSdkSchemeHandlerDidFail3',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerDidFail3" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerDidFail3 page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        await Utils.sleep(2000);
        done();
    })

      afterEach(async (done: Function) => {
        try {
            let backData: events_emitter.EventData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent : events_emitter.InnerEvent = {
                eventId: 10,
                priority: events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
        } catch (err) {
            console.error("emit emitKey error:" + JSON.stringify(err));
        }
        await Utils.sleep(1000);
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0001
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -173
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative173', 0, async (done: Function) => {
        emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative173"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative173", 'success', 11173, done);
        sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0002
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -174
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative174', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative174"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative174", 'success', 11174, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0003
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -176
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative176', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative176"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative176", 'success', 11176, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0004
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -177
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative177', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative177"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative177", 'success', 11177, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0005
     *@tc.name testWebViewSdkSchemeHandlerDidFail
     *@tc.desc test SdkSchemeHandler didFail code -178
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative178', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative178"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative178", 'success', 11178, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0006
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -179
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative179', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative179"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative179", 'success', 11179, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0007
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -180
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative180', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative180"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative180", 'success', 11180, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0008
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -181
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative181', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative181"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative181", 'success', 11181, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0009
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -182
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative182', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative182"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative182", 'success', 11182, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0010
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -183
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative183', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative183"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative183", 'success', 11183, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0011
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -184
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative184', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative184"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative184", 'success', 11184, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0012
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -200
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative200', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative200"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative200", 'success', 11200, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0013
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -201
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative201', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative201"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative201", 'success', 11201, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0014
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -202
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative202', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative202"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative202", 'success', 11202, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0015
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -203
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative203', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative203"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative203", 'success', 11203, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0016
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -204
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative204', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative204"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative204", 'success', 11204, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0017
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -205
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative205', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative205"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative205", 'success', 11205, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0018
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -206
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative206', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative206"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative206", 'success', 11206, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0019
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -207
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative207', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative207"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative207", 'success', 11207, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0020
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -208
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative208', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative208"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative208", 'success', 11208, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0021
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -210
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative210', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative210"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative210", 'success', 11210, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0022
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -211
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative211', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative211"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative211", 'success', 11211, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0023
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -212
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative212', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative212"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative212", 'success', 11212, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0024
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -213
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative213', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative213"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative213", 'success', 11213, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0025
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -214
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative214', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative214"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative214", 'success', 11214, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0026
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -215
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative215', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative215"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative215", 'success', 11215, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0027
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -217
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative217', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative217"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative217", 'success', 11217, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0028
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -218
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative218', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative218"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative218", 'success', 11218, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0029
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -219
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative219', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative219"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative219", 'success', 11219, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0030
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -300
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative300', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative300"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative300", 'success', 11300, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0031
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -301
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative301', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative301"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative301", 'success', 11301, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0032
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -302
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative302', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative302"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative302", 'success', 11302, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0033
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -303
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative303', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative303"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative303", 'success', 11303, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0034
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -310
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative310', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative310"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative310", 'success', 11310, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0035
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -311
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative311', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative311"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative311", 'success', 11311, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0036
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -312
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative312', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative312"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative312", 'success', 11312, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0037
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -320
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative320', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative320"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative320", 'success', 11320, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0038
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -321
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative321', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative321"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative321", 'success', 11321, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0039
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -322
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative322', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative322"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative322", 'success', 11322, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0040
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -323
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative323', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative323"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative323", 'success', 11323, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0041
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -324
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative324', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative324"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative324", 'success', 11324, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0042
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -325
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative325', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative325"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative325", 'success', 11325, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0043
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -327
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative327', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative327"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative327", 'success', 11327, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0044
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -328
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative328', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative328"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative328", 'success', 11328, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0045
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -329
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative329', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative329"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative329", 'success', 11329, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0046
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -330
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative330', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative330"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative330", 'success', 11330, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0047
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -331
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative331', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative331"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative331", 'success', 11331, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0048
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -332
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative332', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative332"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative332", 'success', 11332, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0049
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -333
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative333', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative333"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative333", 'success', 11333, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0050
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -334
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative334', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative334"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative334", 'success', 11334, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0051
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -336
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative336', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative336"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative336", 'success', 11336, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0052
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -337
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative337', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative337"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative337", 'success', 11337, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0053
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -338
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative338', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative338"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative338", 'success', 11338, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0054
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -339
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative339', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative339"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative339", 'success', 11339, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0055
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -340
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative340', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative340"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative340", 'success', 11340, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0056
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -341
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative341', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative341"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative341", 'success', 11341, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0057
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -342
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative342', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative342"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative342", 'success', 11342, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0058
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -343
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative343', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative343"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative343", 'success', 11343, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0059
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -344
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative344', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative344"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative344", 'success', 11344, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0060
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -345
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative345', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative345"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative345", 'success', 11345, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0061
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -346
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative346', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative346"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative346", 'success', 11346, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0062
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -347
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative347', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative347"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative347", 'success', 11347, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0063
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -348
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative348', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative348"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative348", 'success', 11348, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0064
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -349
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative349', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative349"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative349", 'success', 11349, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0065
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -350
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative350', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative350"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative350", 'success', 11350, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0066
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -351
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative351', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative351"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative351", 'success', 11351, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0067
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -352
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative352', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative352"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative352", 'success', 11352, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0068
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -354
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative354', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative354"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative354", 'success', 11354, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0069
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -355
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative355', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative355"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative355", 'success', 11355, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0070
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -356
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative356', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative356"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative356", 'success', 11356, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0071
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -357
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative357', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative357"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative357", 'success', 11357, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    /*
    *@tc.number SUB_ACE_WEB_SdkSchemeHandler_didFail_API_0072
    *@tc.name testWebViewSdkSchemeHandlerDidFail
    *@tc.desc test SdkSchemeHandler didFail code -358
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative358', 0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative358"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative358", 'success', 11358, done);
      sendEventByKey('webViewSdkSchemeHandlerDidFail3Button', 10, '');
    })
    
  })
}
