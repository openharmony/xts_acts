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
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix, UiComponent } from '@ohos.UiTest'
import Ability from '@ohos.app.ability.Ability';
import { BusinessError, Callback } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';

function unexpectedError(error: BusinessError, caseName: string, apiName: string, TRUE_FLAG: boolean, done: Function) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  expect(TRUE_FLAG).assertFail();
  done();
}

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

export default function windowInterfaceOptionalParameterTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('windowInterface_optionalParameter_test', () => {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG: boolean = true;
    let currentDeviceIsPC = false;
    beforeAll(async () => {
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsPC = deviceTypeInfo === '2in1' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0340
     * @tc.name      : testDisplay_off_add_Deregister_All_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_add_Deregister_All_Listeners', 0, async (done: Function) => {
      let caseName: string = 'testDisplay_off_add_Deregister_All_Listeners';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      let firstCall = () => {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      let secondCall = () => {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }

      display.on("add", firstCall);
      display.on("add", secondCall);
      let screenClass: screen.Screen | void = await screen.createVirtualScreen({
        name: 'add01',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await sleep(1000);
      display.off('add')
      firstListenFlag = false
      secondListenFlag = false
      await screen.destroyVirtualScreen((screenClass as screen.Screen).id)
      let screenClass_two: screen.Screen | void = await screen.createVirtualScreen({
        name: 'add001',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass_two as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        await screen.destroyVirtualScreen((screenClass_two as screen.Screen).id)
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0350
     * @tc.name      : testDisplay_off_add_Deregister_FirstCall_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_add_Deregister_FirstCall_Listeners', 0, async (done: Function) => {
      let caseName: string = 'testDisplay_off_add_Deregister_FirstCall_Listeners';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false
      let firstCall: Callback<number> = () => {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      let secondCall: Callback<number> = () => {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      display.on("add", firstCall);
      display.on("add", secondCall);
      let screenClass: screen.Screen | void = await screen.createVirtualScreen({
        name: 'add02',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await sleep(1000);
      display.off("add", firstCall)
      firstListenFlag = false
      secondListenFlag = false
      await screen.destroyVirtualScreen((screenClass as screen.Screen).id)
      let screenClass_two: screen.Screen | void = await screen.createVirtualScreen({
        name: 'add002',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass_two as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await sleep(1000);
      await screen.destroyVirtualScreen((screenClass_two as screen.Screen).id)
      display.off("add")
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0380
     * @tc.name      : testDisplay_off_remove_Deregister_All_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_remove_Deregister_All_Listeners', 0, async (done: Function) => {
      let caseName: string = 'testDisplay_off_remove_Deregister_All_Listeners';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      let firstCall: Callback<number> = () => {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      let secondCall: Callback<number> = () => {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }

      display.on('remove', firstCall);
      display.on('remove', secondCall);
      let screenClass: screen.Screen | void = await screen.createVirtualScreen({
        name: 'remove01',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await screen.destroyVirtualScreen((screenClass as screen.Screen).id)
      await sleep(1000);
      display.off('remove')
      firstListenFlag = false
      secondListenFlag = false
      let screenClass_two: screen.Screen | void = await screen.createVirtualScreen({
        name: 'remove001',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass_two as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await screen.destroyVirtualScreen((screenClass_two as screen.Screen).id)
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0390
     * @tc.name      : testDisplay_off_remove_Deregister_FirstCall_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_remove_Deregister_FirstCall_Listeners', 0, async (done: Function) => {
      let caseName: string = 'testDisplay_off_remove_Deregister_FirstCall_Listeners';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      let firstCall: Callback<number> = () => {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      let secondCall: Callback<number> = () => {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      display.on('remove', firstCall);
      display.on('remove', secondCall);
      let screenClass: screen.Screen | void = await screen.createVirtualScreen({
        name: 'remove02',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await screen.destroyVirtualScreen((screenClass as screen.Screen).id)
      await sleep(1000);
      display.off('remove', firstCall)
      firstListenFlag = false
      secondListenFlag = false
      let screenClass_two: screen.Screen | void = await screen.createVirtualScreen({
        name: 'remove002',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', TRUE_FLAG, done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
        screenId: 0, startX: 0, startY: 0
      }, {
        screenId: (screenClass_two as screen.Screen).id, startX: 1080, startY: 0
      }]).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'screen.makeExpand', TRUE_FLAG, done);
      });
      await screen.destroyVirtualScreen((screenClass_two as screen.Screen).id)
      await sleep(1000);
      display.off('remove')
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0360
     * @tc.name      : testDisplay_off_change_Deregister_All_Listeners
     * @tc.desc      : Enable monitoring of screen status changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_change_Deregister_All_Listeners', 0, async (done: Function) => {
      let caseName: string = 'testDisplay_off_change_Deregister_All_Listeners';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      let firstCall: Callback<number> = () => {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      let secondCall: Callback<number> = () => {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }

      display.on('change', firstCall);
      display.on('change', secondCall);
      let mainWindow: ohosWindow.Window | void;
      mainWindow = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
      });
      expect(!!mainWindow).assertTrue();
      await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.PORTRAIT_INVERTED)
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(1000);
      display.off('change')
      firstListenFlag = false
      secondListenFlag = false
      await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED)
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect(TRUE_FLAG).assertFail();
          done();
        });
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0370
     * @tc.name      : testDisplay_off_change_Deregister_FirstCall_Listeners
     * @tc.desc      : Enable monitoring of screen status changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_change_Deregister_FirstCall_Listeners', 0, async (done: Function) => {
      let caseName: string = 'testDisplay_off_change_Deregister_FirstCall_Listeners';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      let firstCall = () => {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      let secondCall = () => {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      display.on('change', firstCall);
      display.on('change', secondCall);
      let mainWindow: ohosWindow.Window | void
      mainWindow = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
      });
      expect(!!mainWindow).assertTrue();
      await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.PORTRAIT_INVERTED)
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(1000);
      display.off('change', firstCall)
      firstListenFlag = false
      secondListenFlag = false
      await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED)
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(1000);
      display.off('change')
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
  })
}
