/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <string>
#include "gtest/gtest.h"
#include "audio_info.h"
#include "native_avcodec_audiodecoder.h"
#include "native_avcodec_audioencoder.h"
#include "native_avcodec_base.h"
#include "native_avformat.h"
#include "ActsAudioDecEncNdkTest.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
    uint32_t ES_AAC_48000_32_1[] = {
        283, 336, 291, 405, 438, 411, 215, 215, 313, 270, 342, 641, 554, 545, 545, 546,
        541, 540, 542, 552, 537, 533, 498, 472, 445, 430, 445, 427, 414, 386, 413, 370, 380,
        401, 393, 369, 391, 367, 395, 396, 396, 385, 391, 384, 395, 392, 386, 388, 384, 379,
        376, 381, 375, 373, 349, 391, 357, 384, 395, 384, 380, 386, 372, 386, 383, 378, 385,
        385, 384, 342, 390, 379, 387, 386, 393, 397, 362, 393, 394, 391, 383, 385, 377, 379,
        381, 369, 375, 379, 346, 382, 356, 361, 366, 394, 393, 385, 362, 406, 399, 384, 377,
        385, 389, 375, 346, 396, 388, 381, 383, 352, 357, 397, 382, 395, 376, 388, 373, 374,
        353, 383, 384, 393, 379, 348, 364, 389, 380, 381, 388, 423, 392, 381, 368, 351, 391,
        355, 358, 395, 390, 385, 382, 383, 388, 388, 389, 376, 379, 376, 384, 369, 354, 390,
        389, 396, 393, 382, 385, 353, 383, 381, 377, 411, 387, 390, 377, 349, 381, 390, 378,
        373, 375, 381, 351, 392, 381, 380, 381, 378, 387, 379, 383, 348, 386, 364, 386, 371,
        399, 399, 385, 380, 355, 397, 395, 382, 380, 386, 352, 387, 390, 373, 372, 388, 378,
        385, 368, 385, 370, 378, 373, 383, 368, 373, 388, 351, 384, 391, 387, 389, 383, 355,
        361, 392, 386, 354, 394, 392, 397, 392, 352, 381, 395, 349, 383, 390, 392, 350, 393,
        393, 385, 389, 393, 382, 378, 384, 378, 375, 373, 375, 389, 377, 383, 387, 373, 344,
        388, 379, 391, 373, 384, 358, 361, 391, 394, 363, 350, 361, 395, 399, 389, 398, 375,
        398, 400, 381, 354, 363, 366, 400, 400, 356, 370, 400, 394, 398, 385, 378, 372, 354,
        359, 393, 381, 363, 396, 396, 355, 390, 356, 355, 371, 399, 367, 406, 375, 377, 405,
        401, 390, 393, 392, 384, 386, 374, 358, 397, 389, 393, 385, 345, 379, 357, 388, 356,
        381, 389, 367, 358, 391, 360, 394, 396, 357, 395, 388, 394, 383, 357, 383, 392, 394,
        376, 379, 356, 386, 395, 387, 377, 377, 389, 377, 385, 351, 387, 350, 388, 384, 345,
        358, 368, 399, 394, 385, 384, 395, 378, 387, 386, 386, 376, 375, 382, 351, 359, 356,
        401, 388, 363, 406, 363, 374, 435, 366, 400, 393, 392, 371, 391, 359, 359, 397, 388,
        390, 420, 411, 369, 384, 382, 383, 383, 375, 381, 361, 380, 348, 379, 386, 379, 379,
        386, 371, 352, 378, 378, 388, 384, 385, 352, 355, 387, 383, 379, 362, 386, 399, 376,
        390, 350, 387, 357, 403, 398, 397, 360, 351, 394, 400, 399, 393, 388, 395, 370, 377,
        395, 360, 346, 381, 370, 390, 380, 391, 387, 382, 384, 383, 354, 349, 394, 358, 387,
        400, 386, 402, 354, 396, 387, 391, 365, 377, 359, 361, 365, 395, 388, 388, 384, 388,
        378, 374, 382, 376, 377, 389, 378, 341, 390, 376, 381, 375, 414, 368, 369, 387, 411,
        396, 391, 378, 389, 349, 383, 344, 381, 387, 380, 353, 361, 391, 365, 390, 396, 382,
        386, 385, 385, 409, 387, 386, 378, 372, 372, 374, 349, 388, 389, 348, 395, 380, 382,
        388, 375, 347, 383, 359, 389, 368, 361, 405, 398, 393, 395, 359, 360, 395, 395, 362,
        354, 388, 348, 388, 386, 390, 350, 388, 356, 369, 364, 404, 404, 391, 394, 385, 439,
        432, 375, 366, 441, 362, 367, 382, 374, 346, 391, 371, 354, 376, 390, 373, 382, 385,
        389, 378, 377, 347, 414, 338, 348, 385, 352, 385, 386, 381, 388, 387, 364, 465, 405,
        443, 387, 339, 376, 337, 379, 387, 370, 374, 358, 354, 357, 393, 356, 381, 357, 407,
        361, 397, 362, 394, 394, 392, 394, 391, 381, 386, 379, 354, 351, 392, 408, 393, 389,
        388, 385, 375, 388, 375, 388, 375, 354, 384, 379, 386, 394, 383, 359, 405, 395, 352,
        345, 403, 427, 373, 380, 350, 415, 378, 434, 385, 388, 387, 400, 405, 329, 391, 356,
        419, 358, 359, 375, 367, 391, 359, 369, 361, 376, 378, 379, 348, 390, 345, 388, 390,
        406, 349, 368, 364, 391, 384, 401, 384, 391, 361, 399, 359, 386, 392, 382, 386, 380,
        383, 345, 376, 393, 400, 395, 343, 352, 354, 381, 388, 357, 393, 389, 384, 389, 388,
        384, 404, 372, 358, 381, 352, 355, 485, 393, 371, 376, 389, 377, 391, 387, 376, 342,
        390, 375, 379, 396, 376, 402, 353, 392, 382, 383, 387, 386, 372, 377, 382, 388, 381,
        387, 357, 393, 385, 346, 389, 388, 357, 362, 404, 398, 397, 402, 371, 351, 370, 362,
        350, 388, 399, 402, 406, 377, 396, 359, 372, 390, 392, 368, 383, 346, 384, 381, 379,
        367, 384, 389, 381, 371, 358, 422, 372, 382, 374, 444, 412, 369, 362, 373, 389, 401,
        383, 380, 366, 365, 361, 379, 372, 345, 382, 375, 376, 375, 382, 356, 395, 383, 384,
        391, 361, 396, 407, 365, 351, 385, 378, 403, 344, 352, 387, 397, 399, 377, 371, 381,
        415, 382, 388, 368, 383, 405, 390, 386, 384, 374, 375, 381, 371, 372, 374, 377, 346,
        358, 381, 377, 359, 385, 396, 385, 390, 389, 391, 375, 357, 389, 390, 377, 370, 379,
        351, 381, 381, 380, 371, 386, 389, 389, 383, 362, 393, 388, 355, 396, 383, 352, 384,
        352, 383, 362, 396, 385, 396, 357, 388, 382, 377, 373, 379, 383, 386, 350, 393, 355,
        380, 401, 392, 391, 402, 391, 427, 407, 394, 332, 398, 367, 373, 343, 381, 383, 386,
        382, 349, 353, 393, 378, 386, 375, 390, 356, 392, 384, 387, 380, 381, 385, 386, 383,
        378, 379, 359, 381, 382, 388, 357, 357, 397, 358, 424, 382, 352, 409, 374, 368, 365,
        399, 352, 393, 389, 385, 352, 380, 398, 389, 385, 387, 387, 353, 402, 396, 386, 357,
        395, 368, 369, 407, 394, 383, 362, 380, 385, 368, 375, 365, 379, 377, 388};
    constexpr uint32_t ES_AAC_48000_32_1_Length = sizeof(ES_AAC_48000_32_1) / sizeof(uint32_t);
    const string MIME_TYPE_AAC = "audio/mp4a-latm";
    constexpr uint32_t DEFAULT_SAMPLE_RATE = 44100;
    constexpr uint32_t DEFAULT_CHANNELS = 2;
    const char* READPATH = "/data/media/AAC_48000_32_1.aac";

    bool CheckDecDesc(map<string, int> InDesc, OH_AVFormat* OutDesc)
    {
        int32_t out ;
        for (const auto& t: InDesc) {
            bool res = OH_AVFormat_GetIntValue(OutDesc, t.first.c_str(), &out);
            cout << "key: " << t.first << "; out: " << out <<endl;
            if (!res) {
                cout << "OH_AVFormat_GetIntValue Fail. key:" << t.first << endl;
                return false;
            }
            if (out != t.second) {
                cout << "OH_AVFormat_GetIntValue error. key: " << t.first
                << "; expect: "<< t.second
                << ", actual: "<< out << endl;
                return false;
            }
            out = 0;
        }
        return true;
    }

    bool SetFormat(struct OH_AVFormat *format, map<string, int> mediaDescription)
    {
        const char *key;
        for (const auto& t: mediaDescription) {
            key = t.first.c_str();
            if (not OH_AVFormat_SetIntValue(format, key, t.second)) {
                cout << "OH_AV_FormatPutIntValue Fail. format key: " << t.first
                << ", value: "<< t.second << endl;
                return false;
            }
        }
        return true;
    }
}

/**
 * @tc.number    : ActsAudioDecEncNdkTest001
 * @tc.name      : stop at end of stream
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsAudioDecEncNdkTest, ActsAudioDecEncNdkTest001, Function | MediumTest | Level1)
{
    ADecEncNdkSample *aDecEncSample = new ADecEncNdkSample();

    map<string, int> AudioParam = {
            {OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS},
            {OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE},
            {OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE},
    };
    OH_AVFormat *AudioFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, AudioFormat);
    ASSERT_EQ(true, SetFormat(AudioFormat, AudioParam));

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audDec);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureDec(AudioFormat));
    OH_AVFormat *OutDescDec = OH_AudioDecoder_GetOutputDescription(audDec);
    ASSERT_NE(nullptr, OutDescDec);
    ASSERT_EQ(true, CheckDecDesc(AudioParam, OutDescDec));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareDec());

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audEnc);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureEnc(AudioFormat));
    OH_AVFormat *OutDescEnc = OH_AudioEncoder_GetOutputDescription(audEnc);
    ASSERT_NE(nullptr, OutDescEnc);
    ASSERT_EQ(true, CheckDecDesc(AudioParam, OutDescEnc));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareEnc());

    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out1.aac");
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());

    while (!aDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StopEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseDec());
    audDec = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseEnc());
    audEnc = nullptr;
    OH_AVFormat_Destroy(AudioFormat);
    AudioFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
}

/**
 * @tc.number    : ActsAudioDecEncNdkTest002
 * @tc.name      : reset at end of stream
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsAudioDecEncNdkTest, ActsAudioDecEncNdkTest002, Function | MediumTest | Level1)
{
    ADecEncNdkSample *aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audDec);
    OH_AVFormat *AudioFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, AudioFormat);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureDec(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareDec());

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audEnc);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureEnc(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareEnc());
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out2.aac");

    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    while (!aDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ResetEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ResetDec());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseDec());
    audDec = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseEnc());
    audEnc = nullptr;
    OH_AVFormat_Destroy(AudioFormat);
    AudioFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
}

/**
 * @tc.number    : ActsAudioDecEncNdkTest003
 * @tc.name      : release at end of stream
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsAudioDecEncNdkTest, ActsAudioDecEncNdkTest003, Function | MediumTest | Level1)
{
    ADecEncNdkSample *aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audDec);
    OH_AVFormat *AudioFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, AudioFormat);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureDec(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareDec());

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audEnc);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureEnc(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareEnc());
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out3.aac");

    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    while (!aDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseDec());
    audDec = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseEnc());
    audEnc = nullptr;
    OH_AVFormat_Destroy(AudioFormat);
    AudioFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
}

/**
 * @tc.number    : ActsAudioDecEncNdkTest004
 * @tc.name      : flush at running
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsAudioDecEncNdkTest, ActsAudioDecEncNdkTest004, Function | MediumTest | Level1)
{
    ADecEncNdkSample *aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audDec);
    OH_AVFormat *AudioFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, AudioFormat);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureDec(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareDec());

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audEnc);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureEnc(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareEnc());
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out4.aac");

    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    while (aDecEncSample->GetFrameCount() < 500) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->FlushDec());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());

    while (!aDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseDec());
    audDec = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseEnc());
    audEnc = nullptr;
    OH_AVFormat_Destroy(AudioFormat);
    AudioFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
}

/**
 * @tc.number    : ActsAudioDecEncNdkTest005
 * @tc.name      : flush decoder at eos
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsAudioDecEncNdkTest, ActsAudioDecEncNdkTest005, Function | MediumTest | Level1)
{
    ADecEncNdkSample *aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audDec);
    OH_AVFormat *AudioFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, AudioFormat);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureDec(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareDec());

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audEnc);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureEnc(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareEnc());
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetEosState(false);
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out5.aac");

    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    while (!aDecEncSample->GetDecEosState()) {};
    cout << "aDecEncSample->GetDecEosState() is " << aDecEncSample->GetDecEosState() << endl;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->FlushDec());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->FlushEnc());
    aDecEncSample->ReRead();
    aDecEncSample->ResetDecParam();
    aDecEncSample->ResetEncParam();
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out5_2.aac");
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    aDecEncSample->SetEosState(true);
    sleep(2);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());

    while (!aDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseDec());
    audDec = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseEnc());
    audEnc = nullptr;
    OH_AVFormat_Destroy(AudioFormat);
    AudioFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
}


/**
 * @tc.number    : ActsAudioDecEncNdkTest006
 * @tc.name      : stop at running and restart to eos
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsAudioDecEncNdkTest, ActsAudioDecEncNdkTest006, Function | MediumTest | Level1)
{
    ADecEncNdkSample *aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audDec);
    OH_AVFormat *AudioFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, AudioFormat);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureDec(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareDec());

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audEnc);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureEnc(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareEnc());
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out6.aac");

    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    while (aDecEncSample->GetFrameCount() < 500) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());

    while (!aDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseDec());
    audDec = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseEnc());
    audEnc = nullptr;
    OH_AVFormat_Destroy(AudioFormat);
    AudioFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
}


/**
 * @tc.number    : ActsAudioDecEncNdkTest007
 * @tc.name      : stop dec at eos and restart to eos
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsAudioDecEncNdkTest, ActsAudioDecEncNdkTest007, Function | MediumTest | Level1)
{
    ADecEncNdkSample *aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audDec);
    OH_AVFormat *AudioFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, AudioFormat);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(AudioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureDec(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareDec());

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoder(MIME_TYPE_AAC);
    ASSERT_NE(nullptr, audEnc);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ConfigureEnc(AudioFormat));
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->PrepareEnc());
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetEosState(false);
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out7.aac");

    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());
    while (!aDecEncSample->GetDecEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->FlushEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());

    aDecEncSample->ReRead();
    aDecEncSample->ResetDecParam();
    aDecEncSample->ResetEncParam();
    aDecEncSample->SetSavePath("/data/media/AAC_48000_32_1_out7_2.aac");
    aDecEncSample->SetEosState(true);
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->StartDec());

    while (!aDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseDec());
    audDec = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->ReleaseEnc());
    audEnc = nullptr;
    OH_AVFormat_Destroy(AudioFormat);
    AudioFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, aDecEncSample->CalcuError());
}