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

import media from '@ohos.multimedia.media'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

export default function VideoRecorderEnumTest() {
    describe('VideoRecorderEnumTest', function () {
        beforeAll(function() {
            console.info('beforeAll case');
        })
    
        beforeEach(function() {
            console.info('beforeEach case');
        })
    
        afterEach(function() {
            console.info('afterEach case');
        })
    
        afterAll(function() {
            console.info('afterAll case');
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_RECORDER_ENUM_AUDIO_SOURCE_TYPE_0100
            * @tc.name      : AudioSourceType
            * @tc.desc      : AudioSourceType Enumeration test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_RECORDER_ENUM_AUDIO_SOURCE_TYPE_0100', 0, async function (done) {
            expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_DEFAULT).assertEqual(0);
            expect(media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC).assertEqual(1);
            done();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_RECORDER_ENUM_VIDEO_SOURCE_TYPE_0100
            * @tc.name      : VideoSourceType
            * @tc.desc      : VideoSourceType Enumeration test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_RECORDER_ENUM_VIDEO_SOURCE_TYPE_0100', 0, async function (done) {
            expect(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV).assertEqual(0);
            expect(media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES).assertEqual(1);
            done();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DECODER_ENUM_CODECMIMETYPE_0100
            * @tc.name      : CodecMimeType
            * @tc.desc      : Test Enumerate CodecMimeType
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_DECODER_ENUM_CODECMIMETYPE_0100', 0, async function (done) {
            expect(media.CodecMimeType.VIDEO_H263).assertEqual('video/h263');
            expect(media.CodecMimeType.VIDEO_AVC).assertEqual('video/avc');
            expect(media.CodecMimeType.VIDEO_MPEG2).assertEqual('video/mpeg2');
            expect(media.CodecMimeType.VIDEO_MPEG4).assertEqual('video/mp4v-es');
            expect(media.CodecMimeType.VIDEO_VP8).assertEqual('video/x-vnd.on2.vp8');
            done();
        }) 
    })
}

