/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from "@ohos/hypium"
import nativeavdemuxer from 'libnativeavdemuxerndk.so'

export default function nativeavdemuxerNdkTest() {
  describe('MuslNativeAvdemuxerNdkTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVDEMUXER_OH_AVDEMUXER_CREATEWITHSOURCE_0100
     * @tc.name       : testOHAVDemuxerCreateWithSource001
     * @tc.desc       : test OH_AVDemuxer_CreateWithSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAVDemuxerCreateWithSource001', 0, async (done: Function) => {
      let result: number = nativeavdemuxer.oHAVDemuxerCreateWithSource();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVDEMUXER_OH_AVDEMUXER_DESTROY_0100
     * @tc.name       : testOHAVDemuxerDestroy001
     * @tc.desc       : test OH_AVDemuxer_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAVDemuxerDestroy001', 0, async (done: Function) => {
      let result: number = nativeavdemuxer.oHAVDemuxerDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVDEMUXER_OH_AVDEMUXER_UNSELECTTRACKBYID_0100
     * @tc.name       : testOHAVDemuxerUnselectTrackByID001
     * @tc.desc       : test OH_AVDemuxer_UnselectTrackByID
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAVDemuxerUnselectTrackByID001', 0, async (done: Function) => {
      let result: number = nativeavdemuxer.oHAVDemuxerUnselectTrackByID();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVDEMUXER_OH_AVDEMUXER_SEEKTOTIME_0100
     * @tc.name       : testOHAVDemuxerSeekToTime001
     * @tc.desc       : test OH_AVDemuxer_SeekToTime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAVDemuxerSeekToTime001', 0, async (done: Function) => {
      let result: number = nativeavdemuxer.oHAVDemuxerSeekToTime();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVDEMUXER_OH_AVDEMUXER_SELECTTRACKBYID_0100
     * @tc.name       : testOHAVDemuxerSelectTrackByID001
     * @tc.desc       : test OH_AVDemuxer_SelectTrackByID
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAVDemuxerSelectTrackByID001', 0, async (done: Function) => {
      let result: number = nativeavdemuxer.oHAVDemuxerSelectTrackByID();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVDEMUXER_OH_AVDEMUXER_READSAMPLE_0100
     * @tc.name       : testOHAVDemuxerReadSample001
     * @tc.desc       : test OH_AVDemuxer_ReadSample
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAVDemuxerReadSample001', 0, async (done: Function) => {
      let result: number = nativeavdemuxer.oHAVDemuxerReadSample();
      expect(result).assertEqual(0);
      done();
    });
  })
}
