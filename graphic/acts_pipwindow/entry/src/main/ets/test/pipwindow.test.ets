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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import pipWindow from '@ohos.PiPWindow';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';

export default function pipWindowTest(context1) {
  describe('window_pipWindow_test', function () {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;
    let tag = 'pipWindowTest'

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

    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name       : isPiPEnabled_test
     * @tc.desc       : To test the function of isPiPEnabled
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('isPiPEnabled_test', 0, async function (done) {
      console.log('www data isPiPEnabled_test begin')
      try {
        let enable = pipWindow.isPiPEnabled();
        console.info('isPipEnabled:' + enable);
        console.log('www data Succeeded in isPipEnabled ' + enable)
        expect(enable != null).assertTrue();
        done();
      } catch (error) {
        console.log('www data Succeeded in isPipEnabled ' + error)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name       : create_Function_Promise
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise', 0, async function (done) {
      console.log('www data create_Function_Promise begin')
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err));
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' +JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.name       : startPiP_Function_Promise
     * @tc.desc       : To test the function of startPiP
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('startPiP_Function_Promise', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        console.log('www data startPiP_Function_Promise begin')
        let promise = pipController.startPiP();
        promise.then(() => {
          console.log('www data Succeeded in starting pip')
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          console.log('www data Failed1 to start pip. Cause:' +JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.log('www data Failed2 to start pip. Cause:' +JSON.stringify(error));
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.name       : stopPiP_Function_Promise
     * @tc.desc       : To test the function of stopPiP
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('stopPiP_Function_Promise', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        console.log('www data stopPiP_Function_Promise begin ')
        await pipController.startPiP()
        let promise = pipController.stopPiP()
        promise.then(() => {
          console.log('www data Succeeded in stopping pip')
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          if (err.code == 1300015) {
            console.log('www data window is stopping:'+ JSON.stringify(err))
            expect(true).assertTrue()
            done()
          } else {
            console.log('www data Failed1 to stop pip in stopPiP . Cause:' + JSON.stringify(err))
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed2 to stop pip. Cause:' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.name       : setAutoStartEnabled_test
     * @tc.desc       : To test the function of setAutoStartEnabled
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('setAutoStartEnabled_test', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data setAutoStartEnabled_test begin')
        let enable = true;
        pipController.setAutoStartEnabled(enable);
        console.log('www data Succeeded in setAutoStartEnabled_test')
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('www data Failed to setAutoStartEnabled_test' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.name       : updateContentSize_test
     * @tc.desc       : To test the function of updateContentSize
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('updateContentSize_test', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data updateContentSize_test begin');
        let width = 540;
        let height = 960;
        pipController.updateContentSize(width, height);
        console.log('www data Succeeded in updateContentSize_test');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('www data Failed to updateContentSize_test' + JSON.stringify(error));
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.name       : stateChange_Function_Callback
     * @tc.desc       : To test the function of stateChange
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('stateChange_Function_Callback', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data stateChange_Function_ Callback begin');
        pipController.on('stateChange', (state, reason) => {
          let curState = '';
          switch (state) {
            case pipWindow.PiPState.ABOUT_TO_START:
              curState = 'ABOUT_TO_START';
              break;
            case pipWindow.PiPState.STARTED:
              curState = 'STARTED';
              break;
            case pipWindow.PiPState.ABOUT_TO_STOP:
              curState = 'ABOUT_TO_STOP';
              break;
            case pipWindow.PiPState.STOPPED:
              curState = 'STOPPED';
              break;
            case pipWindow.PiPState.ABOUT_TO_RESTORE:
              curState = 'ABOUT_TO_RESTORE';
              break;
            case pipWindow.PiPState.ERROR:
              curState = 'ERROR';
              break;
            default:
              break;
          }
          console.info('stateChange:' + curState + ' reason:' + reason);
          console.log('www data Succeeded in stateChange_Function_ Callback' + curState)
          console.log('www data Succeeded in stateChange_Function_ Callback' + reason)
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('www data Failed to stateChange_Function_ Callback' + JSON.stringify(err));
        if(err.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.name       : stateChange_test
     * @tc.desc       : To test the function of stateChange
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('stateChange_test', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data stateChange_test begin');
        pipController.on('stateChange', (state, reason) => {
          let curState = '';
          switch (state) {
            case pipWindow.PiPState.ABOUT_TO_START:
              curState = 'ABOUT_TO_START';
              break;
            case pipWindow.PiPState.STARTED:
              curState = 'STARTED';
              break;
            case pipWindow.PiPState.ABOUT_TO_STOP:
              curState = 'ABOUT_TO_STOP';
              break;
            case pipWindow.PiPState.STOPPED:
              curState = 'STOPPED';
              break;
            case pipWindow.PiPState.ABOUT_TO_RESTORE:
              curState = 'ABOUT_TO_RESTORE';
              break;
            case pipWindow.PiPState.ERROR:
              curState = 'ERROR';
              break;
            default:
              break;
          }
          console.log('www data Succeeded in stateChange_Function_ Callback' + curState)
          console.log('www data Succeeded in stateChange_Function_ Callback' + reason)
        });
        try {
          pipController.off('stateChange');
          console.log('www data Succeeded in stateChange_test')
          expect(true).assertTrue();
          done()
        } catch (error) {
          console.log('www data Failed1 to stateChange_test' + JSON.stringify(error))
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.log('www data Failed2 to stateChange_test' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.name       : controlPanelActionEvent_Function_Callback
     * @tc.desc       : To test the function of controlPanelActionEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('controlPanelActionEvent_Function_Callback', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data controlPanelActionEvent_Function_Callback begin');
        pipController.on('controlPanelActionEvent', (event) => {
          switch (event) {
            case 'playbackStateChanged':
              break;
            case 'nextVideo':
              break;
            case 'previousVideo':
              break;
            default:
              break;
          }
          console.info('registerActionEventCallback, event:' + event);
          console.log('www data Succeeded in registerActionEventCallback , event:' + event)
        });
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('www data Failed to registerActionEventCallback , event:' + JSON.stringify(error));
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.name       : controlPanelActionEvent_test
     * @tc.desc       : To test the function of controlPanelActionEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('controlPanelActionEvent_test', 0, async function (done) {
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data controlPanelActionEvent_test begin');
        pipController.on('controlPanelActionEvent', (event) => {
          switch (event) {
            case 'playbackStateChanged':
              break;
            case 'nextVideo':
              break;
            case 'previousVideo':
              break;
            default:
              break;
          }
          console.log('www data Succeeded in registerActionEventCallback , event:' + event)
        });
        try {
          pipController.off('controlPanelActionEvent');
          console.log('www data Succeeded in controlPanelActionEvent_test')
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.log('www data Failed1 to controlPanelActionEvent_test' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.log('www data Failed2 to registerActionEventCallback , event:' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.name       : testPiPTemplateType
     * @tc.desc       : To test the function of testPiPTemplateType
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('testPiPTemplateType', 0, async function (done) {
      let msg = "testPiPTemplateType"
      try {
        expect(pipWindow.PiPTemplateType.VIDEO_PLAY).assertEqual(0);
        expect(pipWindow.PiPTemplateType.VIDEO_CALL).assertEqual(1);
        expect(pipWindow.PiPTemplateType.VIDEO_MEETING).assertEqual(2);
        expect(pipWindow.PiPTemplateType.VIDEO_LIVE).assertEqual(3);
        done()
      } catch (error) {
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.name       : testPiPEvent
     * @tc.desc       : To test the function of testPiPEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('testPiPEvent', 0, async function (done) {
      let msg = "testPiPEvent"
      try {
        let event: pipWindow.PiPActionEventType = "playbackStateChanged";
        let event2: pipWindow.PiPVideoActionEvent = "playbackStateChanged";
        let event3: pipWindow.PiPCallActionEvent = "hangUp";
        let event4: pipWindow.PiPMeetingActionEvent = "hangUp";
        let event5: pipWindow.PiPLiveActionEvent = "playbackStateChanged";
        expect(pipWindow.PiPState.ABOUT_TO_START).assertEqual(1);
        expect(pipWindow.PiPState.STARTED).assertEqual(2);
        expect(pipWindow.PiPState.ABOUT_TO_STOP).assertEqual(3);
        expect(pipWindow.PiPState.STOPPED).assertEqual(4);
        expect(pipWindow.PiPState.ABOUT_TO_RESTORE).assertEqual(5);
        expect(pipWindow.PiPState.ERROR).assertEqual(6);
        done();
      } catch (error) {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.name       : create_Function_Promise_2
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise_2', 0, async function (done) {
      console.log('www data create_Function_Promise begin')
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err));
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.name       : create_Function_Promise_3
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise_3', 0, async function (done) {
      console.log('www data create_Function_Promise begin')
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err));
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.name       : create_Function_Promise_4
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise_4', 0, async function (done) {
      console.log('www data create_Function_Promise begin')
      let pipController = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err))
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed2 to create pip controller. Cause' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0100
     * @tc.name       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
     * @tc.desc       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT', 2, async (done:Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0200
     * @tc.name       : test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
     * @tc.desc       : test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD', 2, async (done:Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0300
     * @tc.name       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD
     * @tc.desc       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD', 2, async (done:Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT,pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(false).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD Failed. Cause` + JSON.stringify(error) + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0400
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0500
     * @tc.name       : test_VideoCallControlGroup_HANG_UP_BUTTON
     * @tc.desc       : test_VideoCallControlGroup_HANG_UP_BUTTON
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_HANG_UP_BUTTON', 2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_HANG_UP_BUTTON begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0600
     * @tc.name       : test_VideoCallControlGroup_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0700
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON', 2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH,pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0800
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH,pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_0900
     * @tc.name       : test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.HANG_UP_BUTTON,pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1000
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH,pipWindow.VideoCallControlGroup.HANG_UP_BUTTON,pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1100
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON', 2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1200
     * @tc.name       : test_VideoMeetingControlGroup_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1300
     * @tc.name       : test_VideoMeetingControlGroup_MUTE_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_MUTE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_MUTE_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_MUTE_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_MUTE_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1400
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON,pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1500
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON,pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1600
     * @tc.name       : test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.MUTE_SWITCH,pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1700
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH', 2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON,pipWindow.VideoMeetingControlGroup.MUTE_SWITCH,pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

  })
}

