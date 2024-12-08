/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import audio from '@ohos.multimedia.audio';
import { expect } from '@ohos/hypium'
import fs from '@ohos.file.fs';
import { UiDriver, BY } from '@ohos.UiTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import media from '@ohos.multimedia.media';


export default class MediaTestBase {
  TAG = "[AvScreenCaptureLocalTest] ";
  SETONCALLBACK_EVENT = 'setAvScreenCaptureCallback';
  SET_MIC_ENABLE_EVENT = 'setMicEnable';
  CREATE_EVENT = 'create';
  INIT_EVENT = 'init';
  STARTRECORDER_EVENT = 'start';
  SKIPPRIVACYMODE_EVENT = 'skipPrivacyMode';
  STOPRECORDER_EVENT = 'stop';
  RELEASECORDER_EVENT = 'release';
  END_EVENT = 'end';
  FAIL_EVENT = 'fail';
  AV_CREATEAVPLAYER = 'createAVPlayer';
  AV_IDLE = 'idle';
  AV_INITIALIZED = 'initialized';
  AV_PREPARED = 'prepared';
  AV_PLAYING = 'playing';
  AV_PAUSED = 'paused';
  AV_COMPLETED = 'completed';
  AV_STOPPED = 'stopped';
  AV_RELEASED = 'released';
  AV_ERROR = 'error';
  outputName = '';
  outputFdObject: media.AVScreenCaptureRecordConfig = {
    fd: -1
  };
  avFileDescriptor: media.AVScreenCaptureRecordConfig = {
    fd: -1
  };
  avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null = null;
  avPlayer: media.AVPlayer | null = null;

  setAVScreenCaptueCallback(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null, done: Function) {
    // 状态机变化回调函数
    avScreenCaptureRecorder?.on('stateChange', (state) => {
      console.info('avScreenCapture stateChange to ' + state);
      switch (state) {
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_CANCELED:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER_SWITCHES:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_INTERRUPTED_BY_OTHER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_CALL:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNAVAILABLE:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_MUTED_BY_USER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNMUTED_BY_USER:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_ENTER_PRIVATE_SCENE:
          break;
        case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_EXIT_PRIVATE_SCENE:
          break;
        default:
          console.error('invalid AVScreenCaptureStateCode: ' + state);
          break;
      }
    })

    avScreenCaptureRecorder?.on('error', (err) => {
      console.error('avScreenCaptureRecorder error:' + err.message);
    })

  }

  async toNextStep(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null,
    avConfig: media.AVScreenCaptureRecordConfig, recorderTime: number,
    steps: Array<string>, done: Function) {
    if (steps[0] == this.END_EVENT) {
      console.info('case success!!');
      done();
    }

    console.info('case EVENT::::!!' + steps[0]);
    switch (steps[0]) {
      case this.SETONCALLBACK_EVENT:
        steps.shift();
        try {
          await this.setAVScreenCaptueCallback(avScreenCaptureRecorder, done)
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        } catch (error) {
          console.info('setAVScreenCaptueCallback failed and catch error is ' + error.message);
        }
        break;
      case this.CREATE_EVENT:
        steps.shift();
        await media.createAVScreenCaptureRecorder().then((captureRecorder) => {
          if (captureRecorder != null) {
            avScreenCaptureRecorder = captureRecorder;
            console.info('createAVScreenCaptureRecorder success');
            this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
          } else {
            console.error('createAVScreenCaptureRecorder fail');
            expect().assertFail()
          }
        }).catch((error: BusinessError) => {
          console.error(`createAVScreenCaptureRecorder catchCallback, error message:${error.message}`);
          expect().assertFail()
        });

        break;
      case this.INIT_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.init(avConfig).then(() => {
          console.info('avScreenCaptureRecorder init success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          if (avConfig.fd == -1) {

            let mySteps = new Array(
              this.END_EVENT);
            this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, mySteps, done);
          } else {
            console.info('avScreenCaptureRecorder init failed, error: ' + err.message);
            expect().assertFail()
          }

        });

        break;
      case this.STARTRECORDER_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.startRecording().then(() => {
          console.info('avScreenCaptureRecorder start success');
        }).catch((err: BusinessError) => {
          console.info('avScreenCaptureRecorder start failed, error: ' + err.message);

          let mySteps = new Array(
            this.RELEASECORDER_EVENT,
            this.END_EVENT);
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, mySteps, done);
        })

        break;
      case this.SKIPPRIVACYMODE_EVENT:
        steps.shift();
        let windowAllIds = [];
        await avScreenCaptureRecorder?.skipPrivacyMode(windowAllIds).then(() => {
          console.info('avScreenCaptureRecorder skipPrivacyMode success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.info('avScreenCaptureRecorder skipPrivacyMode failed, error: ' + err.message);

          let mySteps = new Array(
            this.RELEASECORDER_EVENT,
            this.END_EVENT);
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, mySteps, done);
        })

        break;
      case this.STOPRECORDER_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.stopRecording().then(() => {
          console.info('avScreenCaptureRecorder stop success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.info('avScreenCaptureRecorder stop failed, error: ' + err.message);

          let mySteps = new Array(
            this.RELEASECORDER_EVENT,
            this.END_EVENT);
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, mySteps, done);
        })

        break;
      case this.RELEASECORDER_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.release().then(() => {
          console.info('avScreenCaptureRecorder release success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.info('avScreenCaptureRecorder release failed, error: ' + err.message);
          expect().assertFail();
        })

        this.closeFd(this.outputFdObject.fd);

        break;
      case this.SET_MIC_ENABLE_EVENT:
        steps.shift();
        await avScreenCaptureRecorder?.setMicEnabled(true).then(() => {
          console.info('avScreenCaptureRecorder setMicEnabled success');
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        }).catch((err: BusinessError) => {
          console.info('avScreenCaptureRecorder setMicEnabled failed, error: ' + err.message);

          let mySteps = new Array(
            this.RELEASECORDER_EVENT,
            this.END_EVENT);
          this.toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, mySteps, done);
        })
        break;
      default:
        break;
    }
  }

  getTrackDescriptionTest(avPlayer: media.AVPlayer, audioSampleRate: number, done: Function) {

    avPlayer?.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
      if (arrList != null) {
        for (let i = 0; i < arrList.length; i++) {
          console.info(`case getTrackDescription is ${JSON.stringify(arrList[i])}`);
          if (arrList[i]['codec_mime'].toString() == "audio/mp4a-latm") {
            expect(arrList[i]['bitrate']).assertLess(audioSampleRate / 3)
          }
        }
        done();
      } else {
        console.error(`Failed to get TrackDescription, error:${error}`);
        expect().assertFail();
      }
    });
  }

  async driveFnNoSleep(num: number) {
    console.info(`case come in driveFn 111`)
    let driver = await UiDriver.create()
    console.info(`driver is ${JSON.stringify(driver)}`)
    console.info(`UiDriver start`)
    for (let i = 0; i < num; i++) {
      let button = await driver.findComponent(BY.text('允许'))
      if (button == null) {
        continue;
      }
      console.info(`button is ${JSON.stringify(button)}`)
      if (await driver.findComponent(BY.text('允许')) != null) {
        await button.click()
      }
    }
  }

  async getPermission(permissionNames: Array<Permissions>) {
    let context: ESObject = AppStorage.get('testContext');
    let atManager = abilityAccessCtrl.createAtManager();
    //requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    atManager.requestPermissionsFromUser(context, permissionNames).then((data) => {
      let grantStatus = data.authResults;
      let length = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          return;
        }
      }
      //授权成功
    }).catch((err: BusinessError) => {
      console.error(`Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
    })
  }

  // wait asynchronously
  async msleepAsync(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  resourceName() {
    let timestamp = Date.now();
    let filename = `avScreenCapture_${timestamp}.mp4`;
    return filename;
  }

  getFd(outputName: string) {
    outputName = globalThis.abilityContext.filesDir + "/" + outputName;
    console.info("case outputName is" + outputName);
    try {
      let file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      if (file) {
        this.outputFdObject.fd = file.fd;
      }
    } catch (err) {
      console.info('case getDSt err: ' + err);
    }
    console.info('case getDSt number is: ' + this.outputFdObject.fd);
    return this.outputFdObject;
  }

  closeFd(fdNumber: number | null) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }
}

