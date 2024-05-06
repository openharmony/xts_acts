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
import { describe, it, expect } from "@ohos/hypium";
import display from '@ohos.display';
import screen from '@ohos.screen';
import screenshot from '@ohos.screenshot';

export default function displayManagerInterfaceTest() {
  describe('display_manager_interface_test', function () {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    function checkIsCaptured()
    {
      let status = false;
      try {
        status = display.isCaptured();
        console.log('checkIsCaptured status:' + status); 
      } catch (exception) {
        console.error('checkIsCaptured Failed to unregister callback: ' + JSON.stringify(exception));
      }
      return status;
    }

    /**
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5100
     * @tc.name   : testFoldAngleChange_On_Off
     * @tc.desc   : register and unregister fold angle changes
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testFoldAngleChange_On_Off', 0, async () => {
      let caseName = 'testFoldAngleChange_On_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<Array<number>> = (angles:Array<number>) => {
        console.info(msgStr + 'Listening enabled. angles length: ' + angles.length);
        let angleLen = angles.length;
        for (let i = 0; i < angleLen; i++) {
            console.info(msgStr + 'Listening enabled. angles[' + i + ']=' + angles[i]);
        }
      };
      try {
       display.on('foldAngleChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldAngleChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })

    /**
     * @tc.number : SUB_BASIC_WMS_DMS_XTS_DISPLAY_JS_API_5110
     * @tc.name   : testFoldAngleChange_ON_Off_Off
     * @tc.desc   : repeat unregister fold angle changes
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testFoldAngleChange_ON_Off_Off', 0, async () => {
      let caseName = 'testFoldAngleChange_ON_Off_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<Array<number>> = (angles:Array<number>) => {
        console.info(msgStr + 'Listening enabled. angles length: ' + angles.length);
        let angleLen = angles.length;
        for (let i = 0; i < angleLen; i++) {
            console.info(msgStr + 'Listening enabled. angles[' + i + ']=' + angles[i]);
        }
      };
      try {
        display.on('foldAngleChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldAngleChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldAngleChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })

    /**
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5120
     * @tc.name   : testFoldAngleChange_Off
     * @tc.desc   : unregister of the fold angle changes without register
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testFoldAngleChange_Off', 0, async () => {
      let caseName = 'testFoldAngleChange_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("foldAngleChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })

    /**
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5130
     * @tc.name   : testCaptureStatusChange_On_Off
     * @tc.desc   : register and unregister capture status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testCaptureStatusChange_On_Off', 0, async () => {
      let caseName = 'testCaptureStatusChange_On_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<boolean> = (status: boolean) => {
        console.info(msgStr + 'capture status: ' + status);
      };
      try {
        display.on('captureStatusChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("captureStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })

    /**
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5140
     * @tc.name   : testCaptureStatusChange_On_Off_Off
     * @tc.desc   : repeat unregister capture status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testCaptureStatusChange_On_Off_Off', 0, async () => {
      let caseName = 'testCaptureStatusChange_On_Off_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<boolean> = (status: boolean) => {
        console.info(msgStr + 'capture status: ' + status);
      };
      try {
        display.on('captureStatusChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("captureStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("captureStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })

    /**
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5150
     * @tc.name   : testCaptureStatusChange_Off
     * @tc.desc   : unregister the capture status of the device without register
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testCaptureStatusChange_Off', 0, async () => {
      let caseName = 'testCaptureStatusChange_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("captureStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })

    /**
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5160
     * @tc.name   : testIsCaptured
     * @tc.desc   : check current device capture status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testIsCaptured', 0, async () => {
      let caseName = 'testIsCaptured';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        let status = display.isCaptured();
        console.log(msgStr + 'status:' + status);	
        expect(status).assertFalse();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })

    /**
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5170
     * @tc.name   : testIsCaptured_createVirtualScreen
     * @tc.desc   : check current device capture status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testIsCaptured_createVirtualScreen', 0, async () => {
      let caseName = 'testIsCaptured_createVirtualScreen';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        class VirtualScreenOption {
          name : string = '';
          width : number =  0;
          height : number = 0;
          density : number = 0;
          surfaceId : string = '';
        }
        let screenClass: screen.Screen | null = null;
        let option : VirtualScreenOption = { 
          name: 'captureScreen',
          width: 1080,
          height: 2340,
          density: 2,
          surfaceId: ''
        };
        screen.createVirtualScreen(option, (err: BusinessError, data: screen.Screen) => {
          screenClass = data;
          console.info('create the virtual screen. Data: ' + JSON.stringify(data));
        });
        await sleep(1500);
        expect(checkIsCaptured()).assertTrue();
        screen.destroyVirtualScreen(screenClass.id, (err: BusinessError) => {
          console.info('destroy the virtual screen.');
        });
        await sleep(1500);
        expect(checkIsCaptured()).assertFalse();
      } catch (exception) {
        console.error('Failed to create the virtual screen. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      };
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5180
     * @tc.name      : testIsCaptured_screenshot
     * @tc.desc      : check current device capture status
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsCaptured_screenshot', 0, async () => {
      let caseName = 'testIsCaptured_screenshot';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      let callback: Callback<boolean> = (status: boolean) => {
        console.info(msgStr + 'capture status: ' + status);
        expect(status).assertTrue();
      };
      try {
        display.on('captureStatusChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        screenshot.save((err: BusinessError, pixelMap: image.PixelMap) => {
          if (err) {
            console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
            expect().assertFail();
          }
          console.log('Succeeded in saving screenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
          pixelMap.release();
        });
      } catch (exception) {
        console.error('Failed to save screenshot. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      };
      await sleep(2000);
      try {
        display.off("captureStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
  })
}
