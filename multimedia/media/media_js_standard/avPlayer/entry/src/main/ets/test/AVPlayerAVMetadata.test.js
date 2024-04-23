/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import * as mediaTestBase from '../../../../../../MediaTestBase';
import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


export default function AVPlayerAVMetadataJSTest() {
  describe('AVPlayerAVMetadataJSTest', function () {
    const AUDIO_SOURCE = 'mjpeg_mp3.mp3';
    const VIDEO_SOURCE = 'H264_AAC_Matedata.mp4';
    const VIDEO_NOSUPPORT = 'No_Support_Format.mov'
    const TAG = "MetadataDemo"
    let AVFileDescriptor = null;
    let AVFileDescriptor2 = null;
    let AVFileDescriptor3 = null;
    // let avMetadataExtractor = null;
    beforeAll(async function () {
      console.info('beforeAll case');
      await mediaTestBase.getStageFileDescriptor(AUDIO_SOURCE).then((res) => {
        AVFileDescriptor = res;
      });
      await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE).then((res) => {
        AVFileDescriptor2 = res;
      });
      await mediaTestBase.getStageFileDescriptor(VIDEO_NOSUPPORT).then((res) => {
        AVFileDescriptor3 = res;
      });
    })

    beforeEach(async function () {
      console.info('beforeEach case');
    })

    afterEach(async function () {
      console.info('afterEach case');
    })

    afterAll(async function () {
      console.info('afterAll case');
      await mediaTestBase.closeFileDescriptor(AUDIO_SOURCE);
      await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
      await mediaTestBase.closeFileDescriptor(VIDEO_NOSUPPORT);
    })
    

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_PROMISE_FUNCTION_1800
      * @tc.name      : 001.testAVMeta hdrType
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_PROMISE_FUNCTION_1800', 0, async function (done) {
        console.info('AVMetadataExtractor success');
        let avMetadataExtractor;
        await media.createAVMetadataExtractor().then((extractor) => {
          if (extractor != null) {
            avMetadataExtractor = extractor;
            console.info('createAVMetadataExtractor success');
          } else {
            console.error('createAVMetadataExtractor fail');
          }
        }).catch((error) => {
          console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
        });
        // 获取元数据
        console.info('AVMetadataExtractor success');
        avMetadataExtractor.fdSrc = AVFileDescriptor;
        // 获取元信息
        await avMetadataExtractor.fetchMetadata().then((metadata) => {
            if (metadata.hdrType == media.HdrType.AV_HDR_TYPE_NONE) {
                console.info(TAG, `fetchMetadata callback success, hdrType: AV_HDR_TYPE_NONE`)
            } else if (metadata.hdrType == media.HdrType.AV_HDR_TYPE_VIVID) {
                console.info(TAG, `fetchMetadata callback success, hdrType: AV_HDR_TYPE_VIVID`)
            } else {
                console.info(TAG, `fetchMetadata callback success, hdrType: ${metadata.hdrType}`)
            }
          avMetadataExtractor.release();
        }).catch((error) => {
          console.error(`fetchMetadata catchCallback, error message:${error.message}`);
        });
        done();
      })

  })
}
