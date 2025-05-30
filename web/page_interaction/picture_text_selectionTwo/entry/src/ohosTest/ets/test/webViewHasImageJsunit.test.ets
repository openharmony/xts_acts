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
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitHasImagePm";
// import router from '@system.router';


export default function webViewHasImageJsunit() {
  describe('ActsAcewebViewHasImageJsunitTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webViewHasImageJsunit"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewHasImage state success " + JSON.stringify(pages));
        if (!("webViewHasImage" == pages.name)) {
          console.info("get webViewHasImage state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewHasImage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewHasImage page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("web afterEach start:"+emitKey);
      try {
            let backData: events_emitter.EventData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent: events_emitter.InnerEvent = {
                eventId:10,
                priority:events_emitter.EventPriority.LOW
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
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0100
      * tc.name testHasImagePm
      * tc.desc There are offline images in the H5 page that are loaded using the img tag, and the interface
      * hasImage:Promise results in true
    */
    it('testHasImagePm',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitHasImagePmSvg";
      Utils.registerEvent("testHasImagePm",true,202,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0200
      * tc.name testHasImagePmSvg
      * tc.desc There is no image loaded using the img tag in the H5 page, only svg, and the interface
      * hasImage:Promise result is false
    */
    it('testHasImagePmSvg',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitHasImagePmOnline";
      Utils.registerEvent("testHasImageSvg",false,204,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0300
      * tc.name testHasImagePmOnline
      * tc.desc The H5 page has an online web page loaded using the img tag, and the interface
      * hasImage:Promise result is false
    */
    it('testHasImagePmOnline',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitHasImageCb";
      Utils.registerEvent("testHasImagePmOnline",false,206,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0400
      * tc.name testHasImageCb
      * tc.desc There are offline images in the H5 page that are loaded using the img tag, and the interface
      * hasImage:Callback results in true
    */
    it('testHasImageCb',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitHasImageCbSvg";
      Utils.registerEvent("testHasImageCb",true,208,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0500
     * tc.name testHasImageCbSvg
     * tc.desc There is no image loaded using the img tag in the H5 page, only svg, and the interface
     * hasImage:Callback result is false
   */
    it('testHasImageCbSvg',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitHasImageCbOnline";
      Utils.registerEvent("testHasImageCbSvg",false,210,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0600
     * tc.name testHasImageCbOnline
     * tc.desc The H5 page has an online web page loaded using the img tag, and the interface
     * hasImage:Callback result is false
   */
    it('testHasImageCbOnline',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="emitHasImageCbOnline";
      Utils.registerEvent("testHasImageCbOnline",false,212,done);
      sendEventByKey('webImagecomponent',10,'');
    })
  })
}
