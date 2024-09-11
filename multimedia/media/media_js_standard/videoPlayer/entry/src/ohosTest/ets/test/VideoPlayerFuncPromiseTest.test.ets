/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio'
import MediaTestBase from './NewMediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import resourceManager from '@ohos.resourceManager';

const VIDEO_SOURCE = 'H264_AAC.mp4';
const AUDIO_SOURCE = '01.mp3';
const PLAY_TIME = 2000;
const PLAY_TIME_1S = 1000;
const SEEK_TIME = 5000;
const WIDTH_VALUE = 720;
const HEIGHT_VALUE = 480;
const DURATION_TIME = 10034;
const DELTA_TIME = 1500;
const NEXT_FRAME_TIME = 8333;
const PREV_FRAME_TIME = 4166;
const DELTA_SEEK_TIME = 300;
const SLEEP_TIME = 200
let surfaceID = '';
let fdHead = 'fd://';
let fileDescriptor: media.AVFileDescriptor | undefined | null = null;
let fdPath = '';
let fdNumber = 0;
let mediaTestBase = new MediaTestBase()
let videoPlayer: media.VideoPlayer | undefined;

function openFileFailed() {
  console.info('case file fail');
}

function checkTime(actualTime: number, expectTIme: number, delteTime: number) {
  console.info('checkTime case actualTime is :' + actualTime + ', expectTIme is :' + expectTIme);
  let valueTime = Math.abs(expectTIme - actualTime);
  console.info('checkTime case time is :' + valueTime + ', delteTime is :' + delteTime);
  expect(valueTime < delteTime).assertEqual(true);
}

function checkSpeedTime(videoPlayer: media.VideoPlayer, speedValue: media.PlaybackSpeed, startTime: number) {
  let newTime = videoPlayer.currentTime;
  if (videoPlayer.state == 'playing') {
    switch (speedValue) {
      case media.PlaybackSpeed.SPEED_FORWARD_0_75_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (0.75 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 0.75);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_00_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (PLAY_TIME_1S))).assertLess(DELTA_TIME);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_25_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (1.25 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 1.25);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_75_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (1.75 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 1.75);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_2_00_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (2 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 2);
        break;
    }
  } else {
    console.info('case speed not in play');
  }
}

export default function VideoPlayerFuncPromiseTest() {
  describe('VideoPlayerFuncPromiseTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber) => {
        fdNumber = testNumber;
        fdPath = fdHead + '' + fdNumber;
        fileDescriptor = {
          fd: fdNumber
        }
      });
    });
    beforeEach(async () => {
      await mediaTestBase.msleepAsync(PLAY_TIME_1S).then(() => {
      });
      videoPlayer = undefined
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      await mediaTestBase.clearRouter();
      videoPlayer?.release()
      console.info('afterEach case');
    });
    afterAll(async () => {
      await mediaTestBase.closeFdNumber(fdNumber);
      console.info('afterAll case');
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSOURCE_0100
        * @tc.name      : 001.setSorce "" (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSOURCE_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          console.info('case createVideoPlayer success');
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      if (videoPlayer) {
        videoPlayer?.on('error', async (error) => {
          console.info(`case error called,errMessage is ${error.message}`);
          await videoPlayer?.release().then(() => {
            console.info('case release called!!');
          });
          done();
        });
        videoPlayer.url = "";
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETVOLUME_0100
        * @tc.name      : 001.SetVolume 0/0.5/1 (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETVOLUME_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      });
      let startTime = 0
      if (videoPlayer) {
        videoPlayer.audioInterruptMode = audio.InterruptMode.INDEPENDENT_MODE; // 1
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }

      for (let i = 0; i < 3; i++) {
        await videoPlayer?.setVolume(i * 0.5).then(() => {
          if (videoPlayer) {
            expect(videoPlayer.state).assertEqual('playing');
          }
          console.info('case setVolume called');
        });
      }
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSPEED_0100
        * @tc.name      : 001.SetSpeed 0.75/1/1.25/1.75/2 (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSPEED_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      });
      let startTime = 0
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME_1S);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
          mediaTestBase.msleep(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_0_75_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      });
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
          mediaTestBase.msleep(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_00_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      });
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_25_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_25_X);
          mediaTestBase.msleep(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_25_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      });
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_75_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_75_X);
          mediaTestBase.msleep(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_75_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      });
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
          mediaTestBase.msleep(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_2_00_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      });
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SEEKMODE_0100
        * @tc.name      : 001.seek mode SEEK_PREV_SYNC/SEEK_NEXT_SYNC (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SEEKMODE_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      });
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }

      await videoPlayer?.seek(SEEK_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(SEEK_TIME);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      });
      await videoPlayer?.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(SEEK_TIME)
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      });
      await videoPlayer?.seek(PREV_FRAME_TIME - 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(PREV_FRAME_TIME - 100);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      });
      await videoPlayer?.seek(PREV_FRAME_TIME + 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(PREV_FRAME_TIME + 100);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      });
      await videoPlayer?.seek(NEXT_FRAME_TIME - 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(NEXT_FRAME_TIME - 100);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      });
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_CALLBACK_0100
        * @tc.name      : 001.test callback bufferingUpdate/videoSizeChanged/startRenderFrame/playbackCompleted
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_CALLBACK_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      let frameCount = false;
      let completedCount = 0;
      let widthValue = -1;
      let heightValue = -1;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      mediaTestBase.msleep(SLEEP_TIME);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        completedCount++;
        expect(widthValue).assertEqual(WIDTH_VALUE);
        expect(heightValue).assertEqual(HEIGHT_VALUE);
        expect(frameCount).assertEqual(true);
        expect(completedCount).assertEqual(1);
      });
      videoPlayer?.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      videoPlayer?.on('startRenderFrame', () => {
        console.info('case startRenderFrame success');
        frameCount = true;
      });
      videoPlayer?.on('videoSizeChanged', (width, height) => {
        console.info('case videoSizeChanged success');
        widthValue = width;
        heightValue = height;
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      mediaTestBase.msleep(SLEEP_TIME);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      });
      mediaTestBase.msleep(SLEEP_TIME);
      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          console.info('case play called!!');
          mediaTestBase.msleep(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      mediaTestBase.msleep(SLEEP_TIME);
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      });
      mediaTestBase.msleep(SLEEP_TIME);
      done()
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_GETTRECKDESCRIPTION_0100
        * @tc.name      : 001.getTrackDescription (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_GETTRECKDESCRIPTION_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      let arrayDescription: Array<media.MediaDescription> = [];
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let audioTrackKey =
        new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let videoTrackValue = new Array('1366541', 'video/avc', '6000', '480', '0', '1', '720');
      let audioTrackValue = new Array('129207', '2', 'audio/mp4a-latm', '44100', '1', '0');
      let descriptionKey = new Array(videoTrackKey, audioTrackKey);
      let descriptionValue = new Array(videoTrackValue, audioTrackValue);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }

      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          console.info('case prepare called!!');
        }
      });
      await videoPlayer?.getTrackDescription().then((arrayList) => {
        console.info('case getTrackDescription called!!');
        if (typeof (arrayList) != 'undefined') {
          arrayDescription = arrayList;
        } else {
          console.info('case getTrackDescription is failed');
          expect().assertFail();
        }
      });
      for (let i = 0; i < arrayDescription.length; i++) {
        mediaTestBase.checkOldDescription(arrayDescription[i], descriptionKey[i], descriptionValue[i]);
      }
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_LOOP_0100
        * @tc.name      : 001.Loop true (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_LOOP_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.play().then(() => {
          if (videoPlayer) {
            expect(videoPlayer.loop).assertEqual(false);
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
          }
        });
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        });
        done();
      });
      videoPlayer?.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      if (videoPlayer && fileDescriptor) {
        videoPlayer.fdSrc = fileDescriptor;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      });
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          mediaTestBase.msleep(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }

      for (let i = 0; i < 4; i++) {
        await videoPlayer?.seek(DURATION_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
          if (videoPlayer) {
            expect(videoPlayer.state).assertEqual('playing');
          }
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        });
        mediaTestBase.msleep(3000);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_BASE_0100
        * @tc.name      : 001.test video playe (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_BASE_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          console.info('case createVideoPlayer success');
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        });
        done();
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      });
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }

      await videoPlayer?.pause().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('paused');
          console.info('case pause called!!');
        }
      });
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      await videoPlayer?.stop().then(() => {
        console.info('case stop called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('stopped');
        }
      });
      await videoPlayer?.reset().then(() => {
        console.info('case reset called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
        }
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      });
      if (videoPlayer) {
        videoPlayer.loop = true;
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }

      await videoPlayer?.seek(videoPlayer.duration / 2).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
        mediaTestBase.msleep(PLAY_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      });
      await videoPlayer?.seek(0).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
        mediaTestBase.msleep(PLAY_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      });
      await videoPlayer?.seek(videoPlayer.duration).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
        mediaTestBase.msleep(PLAY_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      });
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0100
        * @tc.name      : 001.test video player videoScaleTpe (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          console.info('case createVideoPlayer success');
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      videoPlayer?.on('error', (error) => {
        expect().assertFail();
        console.info('case error happened :' + error.message);
      });
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        });
        done();
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
        console.info('case set  videoScaleType : 1');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      });
      if (videoPlayer) {
        expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP);
      }
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }

      console.info('case set  videoScaleType : 0');
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
      }
      await videoPlayer?.pause().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('paused');
          console.info('case pause called!!');
        }
      });
      if (videoPlayer) {
        expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT);
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      await videoPlayer?.stop().then(() => {
        console.info('case stop called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('stopped');
        }
      });
      if (videoPlayer) {
        console.info('case set  videoScaleType : 1');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.reset().then(() => {
        if (videoPlayer) {
          console.info('case reset called!!');
          expect(videoPlayer.state).assertEqual('idle');
        }
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
        console.info('case set  videoScaleType : 1');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      });
      if (videoPlayer) {
        expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP);
        videoPlayer.loop = true;
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;

        console.info('case set  videoScaleType : 0');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
      }
      await videoPlayer?.seek(videoPlayer.duration / 2).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT);
          mediaTestBase.msleep(PLAY_TIME);
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      });
      console.info('case set  videoScaleType : 1');
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.seek(0).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP);
          mediaTestBase.msleep(PLAY_TIME);
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      });
      console.info('case set  videoScaleType : 0');
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
      }
      await videoPlayer?.seek(videoPlayer.duration).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT);
          mediaTestBase.msleep(PLAY_TIME);
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      });
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0200
        * @tc.name      : 002.set videoScaleTpe 100 times in playing (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0200', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      let count = 0;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.play().then(() => {
          if (videoPlayer) {
            expect(videoPlayer.loop).assertEqual(false);
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
          }
        });
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        });
        done();
      });
      videoPlayer?.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      });
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          mediaTestBase.msleep(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }

      for (let i = 0; i < 20; i++) {
        if (count == 0) {
          console.info('case set  videoScaleType : 1');
          if (videoPlayer) {
            videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
          }
          count = 1;
        } else {
          console.info('case set  videoScaleType : 0');
          if (videoPlayer) {
            videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
          }
          count = 0;
        }
        mediaTestBase.msleep(500);
      }
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0300
        * @tc.name      : 003.set error value to videoScaleTpe (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0300', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      let errorCount = 0;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      videoPlayer?.on('error', async (error) => {
        errorCount++;
        console.info('case error happened :' + error.message);
        if (errorCount == 3) {
          await videoPlayer?.release().then(() => {
            console.info('case release called!!');
          });
          done();
        }
      });
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
        videoPlayer.url = fdPath;
        videoPlayer.videoScaleType = 2;
        videoPlayer.videoScaleType = -1;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0100
        * @tc.name      : 001.parameter value after create/reset/release (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0100', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      if (videoPlayer) {
        expect(videoPlayer.state).assertEqual('idle');
        expect(videoPlayer.url).assertEqual('');
        expect(videoPlayer.fdSrc.fd).assertEqual(0);
        expect(videoPlayer.fdSrc.offset).assertEqual(0);
        expect(videoPlayer.fdSrc.length).assertEqual(-1);
        expect(videoPlayer.currentTime).assertEqual(-1);
        expect(videoPlayer.duration).assertEqual(-1);
        expect(videoPlayer.width).assertEqual(0);
        expect(videoPlayer.height).assertEqual(0);
        expect(videoPlayer.loop).assertEqual(false);
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare success');
        if (videoPlayer) {
          videoPlayer.loop = true;
        }
      });
      if (videoPlayer) {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.url).assertEqual(fdPath);
        expect(videoPlayer.fdSrc.fd).assertEqual(0);
        expect(videoPlayer.fdSrc.offset).assertEqual(0);
        expect(videoPlayer.fdSrc.length).assertEqual(-1);
        expect(videoPlayer.currentTime).assertEqual(0);
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        expect(videoPlayer.loop).assertEqual(true);
      }
      await videoPlayer?.reset().then(() => {
        console.info('case reset success');
      });
      if (videoPlayer) {
        expect(videoPlayer.state).assertEqual('idle');
        expect(videoPlayer.fdSrc.fd).assertEqual(0);
        expect(videoPlayer.fdSrc.offset).assertEqual(0);
        expect(videoPlayer.fdSrc.length).assertEqual(-1);
        expect(videoPlayer.currentTime).assertEqual(-1);
        expect(videoPlayer.duration).assertEqual(-1);
        expect(videoPlayer.loop).assertEqual(false);
      }
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0200
        * @tc.name      : 002.speed and loop value after finish (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0200', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      mediaTestBase.msleep(SLEEP_TIME);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
          expect(videoPlayer.url).assertEqual(fdPath);
          expect(videoPlayer.currentTime).assertEqual(DURATION_TIME);
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
        await videoPlayer?.play().then(() => {
          if (videoPlayer) {
            expect(videoPlayer.loop).assertEqual(false);
            startTime = videoPlayer.currentTime;
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
          }
        });
        mediaTestBase.msleep(SLEEP_TIME);
        if (videoPlayer) {
          endTime = videoPlayer.currentTime;
          startTime = videoPlayer.currentTime;
        }
        await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X).then((speedMode) => {
          if (videoPlayer) {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
            mediaTestBase.msleep(PLAY_TIME);
            endTime = videoPlayer.currentTime;
          }
          console.info('case setSpeed endTime is ' + endTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        });
      });
      mediaTestBase.msleep(SLEEP_TIME);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      mediaTestBase.msleep(SLEEP_TIME);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      });
      mediaTestBase.msleep(SLEEP_TIME);
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          mediaTestBase.msleep(PLAY_TIME_1S);
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      mediaTestBase.msleep(SLEEP_TIME);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      if (videoPlayer) {
        expect(videoPlayer.loop).assertEqual(true);
        startTime = videoPlayer.currentTime;
      }
      console.info('case startTime is :' + startTime);
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
          mediaTestBase.msleep(PLAY_TIME);
          endTime = videoPlayer.currentTime;
        }
        console.info('case setSpeed called and speedMode is ' + speedMode);
      });
      mediaTestBase.msleep(SLEEP_TIME);
      await videoPlayer?.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      });
      mediaTestBase.msleep(SLEEP_TIME);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
        mediaTestBase.msleep(PLAY_TIME);
        endTime = videoPlayer.currentTime;
        expect(videoPlayer.loop).assertEqual(true);
        mediaTestBase.msleep(DURATION_TIME);
        expect(videoPlayer.loop).assertEqual(true);
        videoPlayer.loop = false;
      }
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      });
      mediaTestBase.msleep(SLEEP_TIME);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0300
        * @tc.name      : 003.speed and loop value after reset (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0300', 0, async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      });
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
        }
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        });
        done();
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
        console.info('case prepare called!!');
      });
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          mediaTestBase.msleep(PLAY_TIME_1S);
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      if (videoPlayer) {
        expect(videoPlayer.loop).assertEqual(true);
        startTime = videoPlayer.currentTime;
      }
      console.info('case startTime is :' + startTime);
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
          mediaTestBase.msleep(PLAY_TIME);
          endTime = videoPlayer.currentTime;
        }
        console.info('case setSpeed called and speedMode is ' + speedMode);
      });
      await videoPlayer?.reset().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
          expect(videoPlayer.state).assertEqual('idle');
          expect(videoPlayer.duration).assertEqual(-1);
        }
        console.info('case reset called!!');
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
        console.info('case prepare called!!');
      });
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }

      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
          console.info('case play called!!');
          mediaTestBase.msleep(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      });
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
    });
  })
}