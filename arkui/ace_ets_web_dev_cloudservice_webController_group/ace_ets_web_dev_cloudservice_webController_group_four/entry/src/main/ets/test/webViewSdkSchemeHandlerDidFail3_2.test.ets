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

export default function ActsAceWebViewSdkSchemeHandlerDidFail3_2() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail3_2', () => {
      
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
