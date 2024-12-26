/*
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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webController page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webController beforeEach start");
      done();
    })



    /*
    * @tc.number     : SUB_WEB_IMAGEACCESS_0100
    * @tc.name       : testImageAccess001
    * @tc.desc       : test imageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testImageAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testImageAccess001", "null", 33023, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_IMAGEACCESS_0200
    * @tc.name       : testImageAccess002
    * @tc.desc       : test imageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAccess002', 0, async (done: Function) => {
      Utils.emitEvent("testImageAccess002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testImageAccess002", "\"load complete\"", 33024, done);
      sendEventByKey('WebControllerButton', 10, '');
    })



    /*
    * @tc.number     : SUB_WEB_ONLINEIMAGEACCESS_0100
    * @tc.name       : testOnlineImageAccess001
    * @tc.desc       : test onlineImageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnlineImageAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnlineImageAccess001", "null", 33027, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ONLINEIMAGEACCESS_0200
    * @tc.name       : testOnlineImageAccess002
    * @tc.desc       : test onlineImageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnlineImageAccess002', 0, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testImageAccess002", "\"load image complete\"", 33028, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILEACCESS_0100
    * @tc.name       : testFileAccess001
    * @tc.desc       : test fileAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileAccess001', 0, async (done: Function) => {
      Utils.emitEvent("testFileAccess001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileAccess001", "\"second\"", 33029, done);
      sendEventByKey('WebControllerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_FILEACCESS_0200
    * @tc.name       : testFileAccess002
    * @tc.desc       : test fileAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileAccess002', 0, async (done: Function) => {
      Utils.emitEvent("testFileAccess002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testFileAccess002", "\"second\"", 100070, done);
      sendEventByKey('WebControllerButton', 10, '');
    })


  })
}
