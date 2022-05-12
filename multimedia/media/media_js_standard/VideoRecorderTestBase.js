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

import {expect} from 'deccjsunit/index'
import camera from '@ohos.multimedia.camera'
import media from '@ohos.multimedia.media'
import * as mediaTestBase from './MediaTestBase.js';

const VIDEO_TRACK = 'video_track';
const AUDIO_TRACK = 'audio_track';
const AUDIO_VIDEO_TYPE = 'audio_video';
const DELTA_TIME = 1000;
const PLAY_TIME = 1000;
let tarckType = new Array(VIDEO_TRACK, AUDIO_TRACK);

export async function initCaptureSession(videoOutPut, cameraManager, cameras, cameraID) {
    let cameraInput = await cameraManager.createCameraInput(cameras[cameraID].cameraId);
    if (cameraInput != null) {
        console.info('[camera] case createCameraInput success');
    } else {
        console.info('[camera] case createCameraInput failed');
        return;
    }
    let captureSession = await camera.createCaptureSession(null);
    await captureSession.beginConfig();
    await captureSession.addInput(cameraInput);
    await captureSession.addOutput(videoOutPut);
    await captureSession.commitConfig();
    return captureSession;
}

export async function stopCaptureSession(captureSession) {
    await captureSession.release();
}

export function getTrackArray(videoType, recorderConfigFile) {
    if (videoType == AUDIO_VIDEO_TYPE) {
        let audioTrack = new Array(recorderConfigFile.audioBitrate, recorderConfigFile.audioChannels,
                                   'audio/mpeg', recorderConfigFile.audioSampleRate);
        let videoTrack = new Array('video/mpeg', recorderConfigFile.videoFrameHeight,
                                   recorderConfigFile.videoFrameWidth);
        let trackArray = new Array(videoTrack, audioTrack);
        return trackArray;
    } else {
        let videoTrack = new Array('video/mpeg',
                                   recorderConfigFile.videoFrameHeight, recorderConfigFile.videoFrameWidth);
        let trackArray = new Array(videoTrack);
        return trackArray;
    }
}

export function checkDescription(obj, trackTpye, descriptionValue) {
    let index = 0;
    if (trackTpye == VIDEO_TRACK) {
        console.info('case video codec_mime is  '+ obj['codec_mime']);
        expect(obj['codec_mime']).assertEqual(descriptionValue[index++]);
        console.info('case video height is  '+ obj['height']);
        expect(obj['height']).assertEqual(descriptionValue[index++]);
        console.info('case video width is  '+ obj['width']);
        expect(obj['width']).assertEqual(descriptionValue[index++]);
    } else {
        console.info('case audio bitrate is  '+ obj['bitrate']);
        expect(obj['bitrate']).assertClose(descriptionValue[index++], 2 * DELTA_TIME);
        console.info('case audio channel_count is  '+ obj['channel_count']);
        expect(obj['channel_count']).assertEqual(descriptionValue[index++]);
        console.info('case audio codec_mime is  '+ obj['codec_mime']);
        expect(obj['codec_mime']).assertEqual(descriptionValue[index++]);
        console.info('case audio sample_rate is  '+ obj['sample_rate']);
        expect(obj['sample_rate']).assertEqual(descriptionValue[index++]);
    }
}

export async function checkVideos(playFdPath, duration, trackArray, playerSurfaceId) {
    let videoPlayer = null;
    let arrayDescription = null;
    await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
            videoPlayer = video;
            expect(videoPlayer.state).assertEqual('idle');
        } else {
            console.info('case createVideoPlayer is failed');
            expect().assertFail();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    console.info('[checkVideos] case checkVideos fdPath is :' + playFdPath);

    videoPlayer.url = playFdPath;
    await videoPlayer.setDisplaySurface(playerSurfaceId).then(() => {
        console.info('case setDisplaySurface success');
        expect(videoPlayer.state).assertEqual('idle');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertClose(duration, DELTA_TIME);
        console.info('case prepare called!!');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.getTrackDescription().then((arrayList) => {
        console.info('case getTrackDescription called!!');
        if (typeof (arrayList) != 'undefined') {
            arrayDescription = arrayList;
        } else {
            console.info('case getTrackDescription is failed');
            expect().assertFail();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    
    let startTime = videoPlayer.currentTime;
    await videoPlayer.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let endTime = videoPlayer.currentTime;
    expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

    await videoPlayer.stop().then(() => {
        console.info('case stop called!!');
        expect(videoPlayer.state).assertEqual('stopped');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    await videoPlayer.release().then(() => {
        console.info('case release called!!');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    expect(arrayDescription.length).assertEqual(trackArray.length);
    for (let i = 0; i < arrayDescription.length; i++) {
        checkDescription(arrayDescription[i], tarckType[i], trackArray[i]);
    }
}