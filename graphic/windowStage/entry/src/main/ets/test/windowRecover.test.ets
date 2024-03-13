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
import { describe, beforeAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';


export default function windowRecoverTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('windowRecover_test', () => {
    console.log('describe window_api_test start!!!')
    let systemWindowValueArr: Array<string> = [];
    let systemWindowTypeArr: Array<string> = [];
    let systemWindowTypeDicArr: Array<string> = [];
    let systemWindowTypeDic: Record<string, number> = {
      'TYPE_FLOAT': 8,
    }
    let currentDeviceIsRk = false;
    beforeAll(() => {
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsRk = deviceTypeInfo === 'default' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsunittest beforeall systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowValueArr = Object.keys(systemWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
     * @tc.name      : testRecover
     * @tc.desc      : test the function of Recover
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testRecover', 0, async (done: Function) => {
      let msgStr = 'testRecover';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          let promise = wnd.recover();
          console.log(msgStr + "after recover")
          promise.then(() => {
            console.info(msgStr + 'Succeeded in recovering the window.');
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to recover the window. Cause: ' + JSON.stringify(err));
            if (err.code == 801) {
              expect(true).assertTrue()
              done()
            } else {
              expect().assertFail()
              done()
            }
          });
        } catch (exception) {
          console.error(msgStr + ' Failed to recover the window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      })
    })
  })
}
