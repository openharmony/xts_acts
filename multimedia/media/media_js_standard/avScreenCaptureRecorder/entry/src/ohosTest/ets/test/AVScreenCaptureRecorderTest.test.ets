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
import MediaTestBase from './MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

let mediaTestBase = new MediaTestBase()
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
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 start')

      let mySteps = new Array(
        // create
        mediaTestBase.CREATE_EVENT,
        // init
        mediaTestBase.INIT_EVENT,
        mediaTestBase.SETONCALLBACK_EVENT,
        //setMicEnable
        mediaTestBase.SET_MIC_ENABLE_EVENT,
        // start recorder
        mediaTestBase.STARTRECORDER_EVENT,
        // skip PrivacyMode
        mediaTestBase.SKIPPRIVACYMODE_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        //release recorder
        //close fd
        mediaTestBase.RELEASECORDER_EVENT,
        //create AV
        mediaTestBase.AV_CREATEAVPLAYER,
        mediaTestBase.END_EVENT);

      mediaTestBase.outputName = mediaTestBase.resourceName();
      mediaTestBase.outputFdObject = mediaTestBase.getFd(mediaTestBase.outputName);
      mediaTestBase.playPcmPromise()
      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: mediaTestBase.outputFdObject.fd,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 end')
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
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 start')

      let mySteps = new Array(
        // create
        mediaTestBase.CREATE_EVENT,
        // init
        mediaTestBase.INIT_EVENT,
        mediaTestBase.SETONCALLBACK_EVENT,
        //setMicEnable
        mediaTestBase.SET_MIC_ENABLE_EVENT,
        // start recorder
        mediaTestBase.STARTRECORDER_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        mediaTestBase.RELEASECORDER_EVENT,
        mediaTestBase.AV_CREATEAVPLAYER,
        mediaTestBase.END_EVENT);


      mediaTestBase.outputName = mediaTestBase.resourceName();
      mediaTestBase.outputFdObject = mediaTestBase.getFd(mediaTestBase.outputName);
      mediaTestBase.playPcmPromise()

      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: mediaTestBase.outputFdObject.fd,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H265_AAC_MP4,
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
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
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300 start')

      let sessionId: number = 0; // 替换成拉起此进程的sessionId
      let choice: string = 'false'; // 替换成用户的选择内容
      try {
        // await media.reportAVScreenCaptureUserChoice(sessionId, choice);
      } catch (error) {
        console.error(`reportAVScreenCaptureUserChoice error, error message: ${error.message}`);
        expect().assertFail()
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
      done();
    })
  })
}

