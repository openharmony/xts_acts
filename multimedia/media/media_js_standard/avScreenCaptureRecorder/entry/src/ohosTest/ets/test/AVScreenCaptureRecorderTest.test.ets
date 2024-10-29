/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import fileIo from '@ohos.file.fs';
import { UiDriver, BY, PointerMatrix } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

let avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null = null;
let avPlayer: media.AVPlayer | null = null;
const SETONCALLBACK_EVENT = 'setAvScreenCaptureCallback';
const SET_MIC_ENABLE_EVENT = 'setMicEnable';
const CREATE_EVENT = 'create';
const INIT_EVENT = 'init';
const STARTRECORDER_EVENT = 'start';
const SKIPPRIVACYMODE_EVENT = 'skipPrivacyMode';
const STOPRECORDER_EVENT = 'stop';
const RELEASECORDER_EVENT = 'release';
const END_EVENT = 'end';
const FAIL_EVENT = 'fail';


const AV_CREATEAVPLAYER = 'createAVPlayer';

const AV_IDLE = 'idle';
const AV_INITIALIZED = 'initialized';
const AV_PREPARED = 'prepared';
const AV_PLAYING = 'playing';
const AV_PAUSED = 'paused';
const AV_COMPLETED = 'completed';
const AV_STOPPED = 'stopped';
const AV_RELEASED = 'released';
const AV_ERROR = 'error';

let TAG = "[AvScreenCaptureLocalTest] ";
let outputFdObject: media.AVScreenCaptureRecordConfig = {
  fd: -1
};
let avFileDescriptor: media.AVScreenCaptureRecordConfig = {
  fd: -1
};

let outputName = '';

function setAVScreenCaptueCallback(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null, done: Function) {
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
    expect().assertFail()
  })

}

async function toNextStep(avScreenCaptureRecorder: media.AVScreenCaptureRecorder | null,
  avConfig: media.AVScreenCaptureRecordConfig, recorderTime: number,
  steps: Array<string>, done: Function) {
  if (steps[0] == END_EVENT) {
    console.info('case success!!');
    done();
  }
  switch (steps[0]) {
    case SETONCALLBACK_EVENT:
      steps.shift();
      try {
        await setAVScreenCaptueCallback(avScreenCaptureRecorder, done)
        toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
      } catch (error) {
        console.info('setAVScreenCaptueCallback failed and catch error is ' + error.message);
      }
      break;
    case CREATE_EVENT:
      steps.shift();
      await media.createAVScreenCaptureRecorder().then((captureRecorder) => {
        if (captureRecorder != null) {
          avScreenCaptureRecorder = captureRecorder;
          console.info('createAVScreenCaptureRecorder success');
          toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
        } else {
          console.error('createAVScreenCaptureRecorder fail');
          expect().assertFail()
        }
      }).catch((error: BusinessError) => {
        console.error(`createAVScreenCaptureRecorder catchCallback, error message:${error.message}`);
        expect().assertFail()
      });

      break;
    case INIT_EVENT:
      steps.shift();
      await avScreenCaptureRecorder?.init(avConfig).then(() => {
        console.info('avScreenCaptureRecorder init success');
        toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
      }).catch((err: BusinessError) => {
        console.info('avScreenCaptureRecorder init failed, error: ' + err.message);
        expect().assertFail()

      });

      break;
    case STARTRECORDER_EVENT:
      steps.shift();
      await avScreenCaptureRecorder?.startRecording().then(() => {
        console.info('avScreenCaptureRecorder start success');
      }).catch((err: BusinessError) => {
        console.info('avScreenCaptureRecorder start failed, error: ' + err.message);
        expect().assertFail()
      })

      driveFnNoSleep(1)
      setTimeout(() => {
        toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
      }, recorderTime);

      break;
    case SKIPPRIVACYMODE_EVENT:
      steps.shift();
      let windowAllIds = [];
      await avScreenCaptureRecorder?.skipPrivacyMode(windowAllIds).then(() => {
        console.info('avScreenCaptureRecorder skipPrivacyMode success');
        toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
      }).catch((err: BusinessError) => {
        console.info('avScreenCaptureRecorder skipPrivacyMode failed, error: ' + err.message);
        expect().assertFail()
      })

      break;
    case STOPRECORDER_EVENT:
      steps.shift();
      await avScreenCaptureRecorder?.stopRecording().then(() => {
        console.info('avScreenCaptureRecorder stop success');
        toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
      }).catch((err: BusinessError) => {
        console.info('avScreenCaptureRecorder stop failed, error: ' + err.message);
        expect().assertFail()
      })

      break;
    case RELEASECORDER_EVENT:
      steps.shift();
      await avScreenCaptureRecorder?.release().then(() => {
        console.info('avScreenCaptureRecorder release success');
        toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
      }).catch((err: BusinessError) => {
        console.info('avScreenCaptureRecorder release failed, error: ' + err.message);
        expect().assertFail();
      })

      closeFd(outputFdObject.fd);

      break;
    case SET_MIC_ENABLE_EVENT:
      steps.shift();
      await avScreenCaptureRecorder?.setMicEnabled(true).then(() => {
        console.info('avScreenCaptureRecorder setMicEnabled success');
        toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
      }).catch((err: BusinessError) => {
        console.info('avScreenCaptureRecorder setMicEnabled failed, error: ' + err.message);
        expect().assertFail()
      })
      break;
    case AV_CREATEAVPLAYER:
      steps.shift();
      AvPlayerMp4(outputName, done)
      break;
    default:
      break;
  }
}

function AvPlayerMp4(outputName: string, done: Function) {
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;

      avFileDescriptor = getFd(outputName)
      if (typeof (avFileDescriptor) == 'string') {
        console.info('case src test');
        avPlayer.url = avFileDescriptor;
      } else {
        console.info('case fdsrc test');
        avPlayer.fdSrc = avFileDescriptor;
      }

      let surfaceID: string = globalThis.value;
      console.error(`case INITIALIZED , surfaceID is ${surfaceID}`);
      avPlayer?.on('stateChange', async (state, reason) => {
        switch (state) {
          case AV_INITIALIZED:
            if (!avPlayer) {
              console.info(`avPlayer is null`);
              break;
            }
            console.info(`case INITIALIZED`);
            console.error(`case INITIALIZED , surfaceID is ${surfaceID}`);
            avPlayer.surfaceId = surfaceID;
            expect(avPlayer.state).assertEqual(AV_INITIALIZED);
            avPlayer.prepare((err) => {
              console.info('case prepare called' + err);
              if (err != null) {
                console.error(`case prepare error, errMessage is ${err.message}`);
                expect().assertFail();
                done();
              } else if (avPlayer) {
                console.info('case avPlayer.duration: ' + avPlayer.duration);
              }
            });
            break;
          case AV_PREPARED:
            if (avPlayer != null) {
              getTrackDescriptionTest(avPlayer, done)
            }
            avPlayer?.play().then(() => {
              console.info('Succeeded in playing');
            }, (err: BusinessError) => {
              console.error('Failed to play,error message is :' + err.message)
            })
            break;
          case AV_PLAYING:
            if (avPlayer != null) {
              getTrackDescriptionTest(avPlayer, done)
            }
            break;
          case AV_RELEASED:
            avPlayer = null;
            done();
            break;
          case AV_ERROR:
            expect().assertFail();
            avPlayer?.release().then(() => {
              console.info('avPlayer release success');
            }).catch((err: BusinessError) => {
              console.info('avPlayer release failed, error: ' + err.message);
              expect().assertFail()
            })
            avPlayer = null;
            break;
          default:
            break;
        }
      })
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });

}

function getTrackDescriptionTest(avPlayer: media.AVPlayer, done: Function) {

  avPlayer?.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
    if (arrList != null) {
      for (let i = 0; i < arrList.length; i++) {
        console.info(`case getTrackDescription is ${JSON.stringify(arrList[i])}`);
        // expect(arrList[i]['bitrate']).assertEqual(480000)
      }
      done();
    } else {
      console.error(`Failed to get TrackDescription, error:${error}`);
      expect().assertFail();
    }
  });
}

async function driveFnNoSleep(num: number) {
  console.info(`case come in driveFn 111`)
  let driver = await UiDriver.create()
  console.info(`driver is ${JSON.stringify(driver)}`)
  console.info(`UiDriver start`)
  for (let i = 0; i < num; i++) {
    let button = await driver.findComponent(BY.text('允许'))
    if (button == null) {
      let cmd = "hidumper -s WindowManagerService -a'-a'"
      await delegator.executeShellCommand(cmd);
      continue;
    }
    console.info(`button is ${JSON.stringify(button)}`)
    if (await driver.findComponent(BY.text('允许')) != null) {
      await button.click()
    }
  }
}
function resourceName() {
  let timestamp = Date.now();
  let filename = `avScreenCapture_${timestamp}.mp4`;
  return filename;
}

function getFd(outputName: string) {
  outputName = globalThis.abilityContext.filesDir + "/" + outputName;
  console.info("case outputName is" + outputName);
  try {
    let file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    if (file) {
      outputFdObject.fd = file.fd;
    }
  } catch (err) {
    console.info('case getDSt err: ' + err);
  }
  console.info('case getDSt number is: ' + outputFdObject.fd);
  return outputFdObject;
}

function closeFd(fdNumber: number | null) {
  console.info('case come in closeFd')
  if (fdNumber != null) {
    fs.closeSync(fdNumber);
  } else {
    console.info('[fs.closeSync] case fdNumber is null');
  }
}

async function playPcmPromise() {
  console.info(`${TAG}: Promise : Audio playPcmPromise Function`);
  let audioStreamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
    channels: audio.AudioChannel.CHANNEL_1,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  };

  let audioRendererInfo: audio.AudioRendererInfo = {
    usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
    rendererFlags: 0
  };

  let audioRendererOptions: audio.AudioRendererOptions = {
    streamInfo: audioStreamInfo,
    rendererInfo: audioRendererInfo
  };

  let audioRen: audio.AudioRenderer | ESObject;
  await audio.createAudioRenderer(audioRendererOptions).then((data) => {
    audioRen = data;
    console.info(`${TAG}: AudioRender Created : Success : Stream Type: SUCCESS`);
  }).catch((err: BusinessError) => {
    console.info(`${TAG}: AudioRender Created : ERROR : ${err.message}`);
  });
  let bufferSize: number = 0;

  class Options {
    offset?: number;
    length?: number;
  }

  let filePath = globalThis.abilityContext.filesDir + '/lbvc_1c_16000hz_6k.pcm'
  let stat = await fs.stat(filePath)
  let file: fileIo.File = await fileIo.openSync(filePath, fileIo.OpenMode.READ_ONLY);

  await audioRen.on('writeData', (buffer: ArrayBuffer) => {
    console.info(`${TAG}: writeDataCallback : ${buffer.byteLength}`);

    let options: Options = {
      offset: bufferSize,
      length: buffer.byteLength
    }
    fileIo.readSync(file.fd, buffer, options);
    bufferSize += buffer.byteLength;
    if (bufferSize > stat.size) {
      bufferSize = 0
    }
  });

  console.info(`${TAG}: AudioRenderer : Path : ${filePath}`);

  console.info(`${TAG}: AudioRenderer : STATE : ${audioRen.state}`);

  await audioRen.start().then(() => {
    console.info(`${TAG}: renderInstant started :SUCCESS `);
  }).catch((err: BusinessError) => {
    console.info(`${TAG}: renderInstant start :ERROR : ${err.message}`);
  });
}

export default function avScreenCaptureTest() {
  describe('AvScreenCaptureTest', () => {


    beforeAll(async () => {
      console.info('beforeAll case');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
      console.info('afterEach case');
    })

    afterAll(async () => {
      console.info('afterAll case');
    })


    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100
        * @tc.name      : 01.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100', 0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 start')

      let mySteps = new Array(
        // create
        CREATE_EVENT,
        // init
        INIT_EVENT,
        SETONCALLBACK_EVENT,
        //setMicEnable
        SET_MIC_ENABLE_EVENT,
        // start recorder
        STARTRECORDER_EVENT,
        // skip PrivacyMode
        SKIPPRIVACYMODE_EVENT,
        // stop recorder
        STOPRECORDER_EVENT,
        //release recorder
        //close fd
        RELEASECORDER_EVENT,
        //create AV
        AV_CREATEAVPLAYER,
        END_EVENT);

      outputName = resourceName();
      outputFdObject = getFd(outputName);
      playPcmPromise()
      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: outputFdObject.fd,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
      }

      toNextStep(avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100
        * @tc.name      : 02.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200', 0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 start')

      let mySteps = new Array(
        // create
        CREATE_EVENT,
        // init
        INIT_EVENT,
        SETONCALLBACK_EVENT,
        //setMicEnable
        SET_MIC_ENABLE_EVENT,
        // start recorder
        STARTRECORDER_EVENT,
        // stop recorder
        STOPRECORDER_EVENT,
        RELEASECORDER_EVENT,
        AV_CREATEAVPLAYER,
        END_EVENT);


      outputName = resourceName();
      outputFdObject = getFd(outputName);
      playPcmPromise()

      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: outputFdObject.fd,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H265_AAC_MP4,
      }

      toNextStep(avScreenCaptureRecorder, avConfig, 3000, mySteps, done)
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300
        * @tc.name      : 03.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300', 0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300 start')

      let sessionId: number = 0; // 替换成拉起此进程的sessionId
      let choice: string = 'false'; // 替换成用户的选择内容
      try {
        // await media.reportAVScreenCaptureUserChoice(sessionId, choice);
      } catch (error) {
        console.error(`reportAVScreenCaptureUserChoice error, error message: ${error.message}`);
        expect().assertFail()
      }
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
      done();
    })
  })
}

