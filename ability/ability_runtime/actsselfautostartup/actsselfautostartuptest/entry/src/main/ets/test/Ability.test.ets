/*
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    let applicationContext = globalThis.context.getApplicationContext();

    /*
     * @tc.number: Acts_SelfAutoStartup_1200
     * @tc.name: Provide the application with power-on and self-start capability.
     * @tc.desc: Call related api with invalid parameters
     */
    it('Acts_SelfAutoStartup_1200', 0, function (done) {
      console.info('====> Acts_SelfAutoStartup_1200 start');

      try {
        applicationContext.setAutoStartup(null, (err, data) => {
          console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup UI Callback OK + err: ' +
          JSON.stringify(err) + ' data: ' + JSON.stringify(data));
        })
      } catch (err) {
        console.info('====>  Acts_SelfAutoStartup_1200 setAutoStartup UI Callback  catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.setAutoStartup(undefined, (err, data) => {
          console.info('====> setAutoStartup UI Callback OK + err: ' + JSON.stringify(err) + ' data: ' +
          JSON.stringify(data));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup UI Callback catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.setAutoStartup(null).then((data) => {
          console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup Service Promise OK + data: ' +
          JSON.stringify(data));
        }).catch((err) => {
          console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup Service Promise OK + err: ' +
          JSON.stringify(err));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup Service Promise catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.setAutoStartup(undefined).then((data) => {
          console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup Service Promise OK + data: ' +
          JSON.stringify(data));
        }).catch((err) => {
          console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup Service Promise OK + err: ' +
          JSON.stringify(err));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 setAutoStartup Service Promise catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.cancelAutoStartup(null, (err, data) => {
          console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Callback OK + err: ' +
          JSON.stringify(err) + ' data: ' + JSON.stringify(data));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Callback catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.cancelAutoStartup(undefined, (err, data) => {
          console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Callback OK + err: ' +
          JSON.stringify(err) + ' data: ' + JSON.stringify(data));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Callback catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.cancelAutoStartup(null).then((data) => {
          console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Promise OK + data: ' +
          JSON.stringify(data));
        }).catch((err) => {
          console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Promise OK + err: ' +
          JSON.stringify(err));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200  cancelAutoStartup Promise catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.cancelAutoStartup(undefined).then((data) => {
          console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Promise OK + data: ' +
          JSON.stringify(data));
        }).catch((err) => {
          console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Promise OK + err: ' +
          JSON.stringify(err));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 cancelAutoStartup Service Promise catch ERR + err: ' +
        JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.isAutoStartup(null, (err, data) => {
          console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup1 ok err ' + JSON.stringify(err) + ' data ' +
          JSON.stringify(data));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup1 catch err ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.isAutoStartup(undefined, (err, data) => {
          console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup1 ok err ' + JSON.stringify(err) + ' data ' +
          JSON.stringify(data));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup1 ok err ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.isAutoStartup(null).then((data) => {
          console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup UI Promise OK data: ' + JSON.stringify(data));
        }).catch((err) => {
          console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup UI Promise OK err: ' + JSON.stringify(err));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup UI Promise catch ERR err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }

      try {
        applicationContext.isAutoStartup(undefined).then((data) => {
          console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup UI Promise OK data: ' + JSON.stringify(data));
        }).catch((err) => {
          console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup UI Promise OK err: ' + JSON.stringify(err));
        })
      } catch (err) {
        console.info('====> Acts_SelfAutoStartup_1200 isAutoStartup UI Promise catch ERR err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })
  })
}