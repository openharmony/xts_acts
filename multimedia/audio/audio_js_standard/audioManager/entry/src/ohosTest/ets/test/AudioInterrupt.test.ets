/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import avSession from '@ohos.multimedia.avsession';
import fileIo from '@ohos.file.fs';

let fdRead: number;
let readPath: string;
let fdPath: string;
let filePath: string;
type AVSessionType = 'audio' | 'video' | 'voice_call' | 'video_call';

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export async function getcreateAVSession() {
  let tag: string = "createNewSession";
  let type: AVSessionType = "audio";
  let context1: Context = globalThis.abilityContext;
  let av = await avSession.createAVSession(context1, tag, type);
  console.info('av is ' + JSON.stringify(av));
}

export async function getFdRead(pathName: string, done: Function) {
  // let context: Context = getContext();
  // console.info("case0 context is  " + context);
  // let data = context.filesDir
  // console.info("case1 getFilesDir is path " + data);
  // filePath = data + '/' + pathName;
  fdPath = 'fd://';
  fdPath = 'fd://';
  filePath = getContext().getApplicationContext().filesDir + '/' + pathName;
  console.info('case4 filePath is ' + filePath);
  try {
    let file:ESObject = await fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
    console.log('filefilefile',JSON.stringify(file.fd))
    fdPath = fdPath + '' + file.path;
    filePath = 'fd:// ' + file.fd;
    fdRead = file.fd;
      console.info('[fileIO]case open fd success,fdPath is ' + fdPath);
      console.info('[fileIO]case open fd success,fdRead is ' + fdRead);
  } catch (error){
    console.info(`[fileIO]case catch open fd error : ${error}`);
  }

  // await fileIo.open(filePath).then((fdNumber) => {
  //   fdPath = fdPath + '' + fdNumber.path;
  //   fdRead = fdNumber.fd;
  //   console.info('[fileIO]case open fd success,fdPath is ' + fdPath);
  //   console.info('[fileIO]case open fd success,fdRead is ' + fdRead);
  //
  // }, (err: BusinessError) => {
  //   console.info('[fileIO]case open fd failed');
  // }).catch((err: BusinessError) => {
  //   console.info('[fileIO]case catch open fd failed');
  // });
  // let File = await fileIo.open(readPath);
  // fdPath = fdPath + '' + File.path;
  // fdRead = File.fd;
  // console.info('[fileIO]case open fd success,fdPath is ' + fdPath);
  // console.info('[fileIO]case open fd success,fdRead is ' + fdRead);
}

let AudioStreamInfo: audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
  channels: audio.AudioChannel.CHANNEL_2,
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
}

let AudioRendererInfo: audio.AudioRendererInfo = {
  content: audio.ContentType.CONTENT_TYPE_MUSIC,
  usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
  rendererFlags: 0
}

let AudioRendererOptions: audio.AudioRendererOptions = {
  streamInfo: AudioStreamInfo,
  rendererInfo: AudioRendererInfo
}

readPath = 'StarWars10s-2C-48000-4SW.wav';

export default function audioInterruptTest() {
  describe('AudioInterruptTestTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('SUB_AUDIO_INTERRUPT_001', 0,async (done:Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      await getFdRead(readPath, done);
      let audioRen = await audio.createAudioRenderer(AudioRendererOptions);
      console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);
      let activated: boolean | undefined;
      let InterruptHint: number | undefined = 0;
      await sleep(7000);
      let audioManager = audio.getAudioManager();
      let interAudioInterrupt:audio.AudioInterrupt = {
        streamUsage: 1,
        contentType: 0,
        pauseWhenDucked: true
      };
      audioManager.on('interrupt', interAudioInterrupt, (InterruptAction) => {
        console.info('come in MasterHap interrupt');
        if (InterruptAction.actionType != undefined && InterruptAction.actionType != null) {
          console.info('An event to gain the audio focus starts.');
          console.info(`Focus gain event: ${InterruptAction} `);
          activated = InterruptAction.activated;
          InterruptHint = InterruptAction.hint
          console.info('activated is :' + activated);
          console.info('InterruptHint is :' + InterruptHint);
          console.info('InterruptAction.actionType  is :' + InterruptAction.actionType);
        }
      });
      await audioRen.start().then(() => {
        console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
      }).catch((err: BusinessError) => {
        console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
      });

      console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);
      let bufferSize: number = 0;
      await audioRen.getBufferSize().then((data: number) => {
        console.info(`AudioFrameworkRenderLog: getBufferSize: SUCCESS ${data}`);
        bufferSize = data;
      }).catch((err: BusinessError) => {
        console.error(`AudioFrameworkRenderLog: getBufferSize: ERROR: ${err}`);
      });
      let ss = fileIo.fdopenStreamSync(fdRead, 'r');
      console.info('AudioFrameworkRenderLog:case 2:AudioFrameworkRenderLog: File Path: ' + ss);
      let discardHeader = new ArrayBuffer(44);
      console.info('AudioFrameworkRenderLog:case 2-1:AudioFrameworkRenderLog: File Path: ');
      ss.readSync(discardHeader);
      let totalSize = fileIo.statSync(fdRead).size;
      console.info('AudioFrameworkRenderLog:case 3 : AudioFrameworkRenderLog: File totalSize size: ' + totalSize);
      totalSize = totalSize - 44;
      console.info('AudioFrameworkRenderLog: File size : Removing header: ' + totalSize);
      let rlen = 0;
      let count = 0;
      while (rlen < totalSize) {
        if (activated == false && InterruptHint == 3) {
          console.info('audio was interrupt')
          break;
        }
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info('MasterHap:BufferAudioFramework: bytes read from =================== file: ' + rlen);

        if (rlen >= totalSize / 3 && count == 0) {
          count++;
          await globalThis.startAbilityForResult(
            {
              want:
              {
                bundleName: "com.example.myapplication",
                abilityName: "com.example.entry_test.TestAbility",
              },
            }
          ).then((data:ESObject) => {
            console.info("==========================>startAbility Success=======================>" +
            JSON.stringify(data));

          })
            .catch((err: BusinessError) => {
              console.info("==========================>startAbility Fail=======================>" + JSON.stringify(err));
            });
        }
        await audioRen.write(buf);
      }
      console.info('AudioFrameworkRenderLog: Renderer after read');
      await audioRen.drain();
      await audioRen.release();
      console.info(`AudioFrameworkRenderLog: activated ${activated} InterruptHint ${InterruptHint}`);
      expect(activated == true && InterruptHint == 0).assertTrue();
      done();
    })
  })
}