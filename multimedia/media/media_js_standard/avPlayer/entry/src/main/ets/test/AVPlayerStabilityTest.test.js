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
import * as mediaTestBase from '../../../../../../MediaTestBase';
import * as AVPlayerTestBase from '../../../../../../AVPlayerTestBase.js';
import { testAVPlayerFun, AV_PLAYER_STATE, setSource, avPlayerWithCallBack, avPlayerWithoutCallBack,
    sleep } from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function AVPlayerStabilityTest() {
    describe('AVPlayerStabilityTest', function () {

        const VIDEO_SOURCE = 'H264_AAC.mp4';
        const AUDIO_SOURCE = '01.mp3';
        const VIDEO_NOAUDIO = 'H264_NONE.mp4'
        let TAG = "[AVPlayerStabilityTest] ";
        let callBackSet = 0;
        const PLAY_TIME = 2;
        let avPlayer = null;
        let fileDescriptor = null;
        let fileDescriptor2 = null;
        let fileDescriptor3 = null;
        let avPlayTest1 = {
            width: 0,
            height: 0,
            duration: -1,
        };
        let avPlayTest2 = {
            width: 0,
            height: 0,
            duration: -1,
        };

        beforeAll(async function() {
            console.info('beforeAll case');
            await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE).then((res) => {
                fileDescriptor = res;
            });
            await mediaTestBase.getStageFileDescriptor(AUDIO_SOURCE).then((res) => {
                fileDescriptor2 = res;
            });
            await mediaTestBase.getStageFileDescriptor(VIDEO_NOAUDIO).then((res) => {
                fileDescriptor3 = res;
            });
        })

        beforeEach(async function() {
            console.info('beforeEach case');
            await sleep(3000);
        })

        afterEach(async function() {
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            console.info('afterEach case');
            await sleep(3000);
        })

        afterAll(async function() {
            console.info('afterAll case');
            await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
            await mediaTestBase.closeFileDescriptor(AUDIO_SOURCE);
            await mediaTestBase.closeFileDescriptor(VIDEO_NOAUDIO);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100
            * @tc.name      : 001.test play pause loop 1000 (waiting for callback)
            * @tc.desc      : Local Video play to pause 1000 times (waiting for callback)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100 start')
            avPlayTest1 = { width: 720, height: 480, duration: 10034 };
            avPlayerWithCallBack(fileDescriptor, avPlayer, avPlayTest1, PLAY_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200
            * @tc.name      : 001.test play pause loop 1000 (do not wait for callback)
            * @tc.desc      : Local Video play to pause 1000 times (do not wait for callback)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200 start')
            avPlayTest2 = { width: 720, height: 480, duration: 10034 };
            avPlayerWithoutCallBack(fileDescriptor, avPlayer, avPlayTest2, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200 end')
        })
    })
}