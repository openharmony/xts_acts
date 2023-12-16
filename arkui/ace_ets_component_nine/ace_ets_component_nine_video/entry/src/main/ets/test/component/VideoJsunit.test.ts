// @ts-nocheck
/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function VideoJsunit() {
  describe('videoTest', function () {
    beforeEach(async function (done) {
      console.info("video beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/videoPage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get video state pages: " + JSON.stringify(pages));
        if (!("videoPage" == pages.name)) {
          console.info("get video pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push video page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push video page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("video after each called");
    })

   
    /**
     * @tc.number testVideoMuted01
     * @tc.name   Test the mute property of the video component
     * @tc.desc   set the mute property value is false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testVideoMuted01', 0, async function (done) {
      var tagName = 'testVideoMuted01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keykeyvideo');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      // expect(obj.$attrs.muted).assertEqual("false");

      // try {
      //   var eventData = {
      //     data: {
      //       "isMuted": true,
      //     }
      //   }
      //   var innerEvent = {
      //     eventId: 301,
      //     priority: events_emitter.EventPriority.LOW
      //   }
      //   console.info('[' + tagName + '] start to publish emit');
      //   events_emitter.emit(innerEvent, eventData);
      // } catch (err) {
      //   console.log('[' + tagName + '] change component data error: ' + err.message);
      // }
      // await Utils.sleep(2000);
      // let strJsonNew = getInspectorByKey('keykeyvideo');
      // let objNew = JSON.parse(strJsonNew);
      // console.info('[' + tagName + '] component objNew is: ' + strJsonNew);// JSON.stringify(objNew));
      
      // expect(objNew.$attrs.muted).assertEqual("true");

      
      console.info('[' + tagName + '] video muted: ' + obj.$attrs.muted);
      console.info('[' + tagName + '] video autoPlay: ' + obj.$attrs.autoPlay);
      console.info('[' + tagName + '] video controls: ' + obj.$attrs.controls);
      console.info('[' + tagName + '] video objectFit: ' + obj.$attrs.objectFit);
      console.info('[' + tagName + '] video loop: ' + obj.$attrs.loop);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
  })
}
