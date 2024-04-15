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
    let currentDeviceIsPC = false
    beforeAll(() => {
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsRk = deviceTypeInfo === 'default' ? true : false;
      currentDeviceIsPC = deviceTypeInfo === '2in1' ? true : false;
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
        try{
          if(currentDeviceIsPC){
              let promise = wnd.recover();
              console.log(msgStr + "after recover")
              promise.then(() => {
                console.info(msgStr + 'Succeeded in recovering the window.');
                expect(true).assertTrue()
                done()
              }).catch((err: BusinessError) => {
                console.error(msgStr + 'Failed to recover the window. 01Cause: ' + JSON.stringify(err));
                expect().assertFail()
                done()
              });
          } else {
              console.log(msgStr + ' The current device type not supported window.recover, the current type: ' + deviceInfo.deviceType)
              expect(deviceInfo.deviceType).assertEqual(deviceInfo.deviceType);
              done();
          }
        } catch(err) {
          console.error(msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3940
     * @tc.name      : testMaximize
     * @tc.desc      : test the function of Maximize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMaximize', 0, async (done: Function) => {
      let msgStr = 'testMaximize';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        let promise = wnd.recover();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in maximizing the window.');
          let currentWnd = wnd.maximize()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from recovering to maximizing the window ')
            expect(true).assertTrue()
            done()
          }).catch((err) => {
            if( err.code == 801 ){
              console.log(msgStr + ' The current device type does not support calling maximize ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if( err.code == 801 ){
            console.log(msgStr + ' The current device type does not support calling recover ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      }).catch(err => {
        console.error(msgStr + ' Failed to getLastWindow. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3950
     * @tc.name      : testMaximizeToRecover
     * @tc.desc      : test the function of MaximizeToRecover
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMaximizeToRecover', 0, async (done: Function) => {
      let msgStr = 'testMaximizeToRecover';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        let promise = wnd.maximize();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in maximizing the window.');
          let currentWnd = wnd.recover()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from maximizing to recovering the window ')
            expect(true).assertTrue()
            done()
          }).catch((err) => {
            if( err.code == 801 ){
              console.log(msgStr + ' The current device type does not support calling recover ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if( err.code == 801 ){
            console.log(msgStr + ' The current device type does not support calling maximize ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      }).catch(err => {
        console.error(msgStr + ' Failed to getLastWindow. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4280
     * @tc.name      : testMaximizeToMinimize
     * @tc.desc      : test the function of MaximizeToMinimize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMaximizeToMinimize', 0, async (done: Function) => {
      let msgStr = 'testMaximizeToMinimize';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        let promise = wnd.maximize();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in maximizing the window.');
          let currentWnd = wnd.minimize()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from maximizing to minimizing the window ')
            expect(true).assertTrue()
            done()
          }).catch((err) => {
            if( err.code == 801 ){
              console.log(msgStr + ' The current device type does not support calling minimize ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to minimize the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if( err.code == 801 ){
            console.log(msgStr + ' The current device type does not support calling maximize ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      }).catch(err => {
        console.error(msgStr + ' Failed to getLastWindow. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4290
     * @tc.name      : testMinimizeToMaximize
     * @tc.desc      : test the function of MinimizeToMaximize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testMinimizeToMaximize', 0, async (done: Function) => {
      let msgStr = 'testMinimizeToMaximize';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        let promise = wnd.minimize();
        promise.then(() => {
          console.info(msgStr + 'Succeeded in minimizing the window.');
          let currentWnd = wnd.maximize()
          currentWnd.then(() => {
            console.info(msgStr + ' Succeeded from minimizing to maximizing the window ')
            expect(true).assertTrue()
            done()
          }).catch((err) => {
            if( err.code == 801 ){
              console.log(msgStr + ' The current device type does not support calling maximize ')
              expect(true).assertTrue()
              done();
            } else {
              console.error(msgStr + ' Failed to maximize the window. 03Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
          })
        }).catch((err: BusinessError) => {
          if( err.code == 801 ){
            console.log(msgStr + ' The current device type does not support calling minimize ')
            expect(true).assertTrue()
            done();
          } else {
            console.error(msgStr + ' Failed to minimize the window. 03Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      }).catch(err => {
        console.error(msgStr + ' Failed to getLastWindow. 04Cause: ' + JSON.stringify(err))
        expect().assertFail();
        done();
      })
    })
  })
}
