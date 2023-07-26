#include "napi/native_api.h"
#include "native_avcodec_audiodecoder.h"
#include "native_avcodec_audioencoder.h"
#include "native_avcodec_videodecoder.h"
#include "native_avcodec_videoencoder.h"
#include "native_avcodec_base.h"
#include "native_avmemory.h"
#include "native_avmuxer.h"

static napi_value Demuxer(napi_env env, napi_callback_info info)
{
    OH_AVSource_CreateWithURI(nullptr);
    OH_AVSource_CreateWithFD(-1, 0, 0);
    OH_AVSource_Destroy(nullptr);
    OH_AVSource_GetSourceFormat(nullptr);
    OH_AVSource_GetTrackFormat(nullptr, -1);
    OH_AVDemuxer_CreateWithSource(nullptr);
    OH_AVDemuxer_Destroy(nullptr);
    OH_AVDemuxer_SelectTrackByID(nullptr, -1);
    OH_AVDemuxer_UnselectTrackByID(nullptr, -1);
    OH_AVDemuxer_ReadSample(nullptr, 0, nullptr, nullptr);

    OH_AVErrCode result = OH_AVDemuxer_SeekToTime(nullptr, 0, 0);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
static napi_value CreateAudioCapture(napi_env env, napi_callback_info info)
{
    const char *mime = "video/avc";
    OH_AVCodec *avCode = OH_VideoDecoder_CreateByMime(mime);
    OH_AVErrCode result = OH_VideoDecoder_Prepare(avCode);
    OH_VideoDecoder_Destroy(avCode);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value Capability(napi_env env, napi_callback_info info)
{
    OH_AVCodec_GetCapability(nullptr, true);
    OH_AVCodec_GetCapabilityByCategory("", true, HARDWARE);
    OH_AVCapability_IsHardware(nullptr);
    OH_AVCapability_GetName(nullptr);
    OH_AVCapability_GetMaxSupportedInstances(nullptr);
    OH_AVCapability_GetEncoderBitrateRange(nullptr, nullptr);
    OH_AVCapability_IsEncoderBitrateModeSupported(nullptr, BITRATE_MODE_CBR);
    OH_AVCapability_GetEncoderQualityRange(nullptr, nullptr);
    OH_AVCapability_GetEncoderComplexityRange(nullptr, nullptr);

    const int32_t *sampleRates = nullptr;
    OH_AVCapability_GetAudioSupportedSampleRates(nullptr, &sampleRates, nullptr);

    OH_AVCapability_GetAudioChannelCountRange(nullptr, nullptr);
    OH_AVCapability_GetVideoWidthAlignment(nullptr, nullptr);
    OH_AVCapability_GetVideoHeightAlignment(nullptr, nullptr);
    OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, 0, nullptr);
    OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, 0, nullptr);
    OH_AVCapability_GetVideoWidthRange(nullptr, nullptr);
    OH_AVCapability_GetVideoHeightRange(nullptr, nullptr);
    OH_AVCapability_IsVideoSizeSupported(nullptr, 0, 0);
    OH_AVCapability_GetVideoFrameRateRange(nullptr, nullptr);
    OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, 0, 0, nullptr);
    OH_AVCapability_AreVideoSizeAndFrameRateSupported(nullptr, 0, 0, 0);

    const int32_t *temp = nullptr;
    OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &temp, nullptr);
    OH_AVCapability_GetSupportedProfiles(nullptr, &temp, nullptr);
    OH_AVErrCode result = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, 0, &temp, nullptr);
    OH_AVCapability_AreProfileAndLevelSupported(nullptr, 0, 0);

    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value VideoEncoder(napi_env env, napi_callback_info info)
{
    OH_VideoEncoder_CreateByMime(nullptr);
    OH_VideoEncoder_CreateByName(nullptr);
    OH_VideoEncoder_Destroy(nullptr);

    OH_AVCodecAsyncCallback cb;
    cb.onError = NULL;
    cb.onStreamChanged = NULL;
    cb.onNeedInputData = NULL;
    cb.onNeedOutputData = NULL;
    OH_VideoEncoder_SetCallback(nullptr, cb, nullptr);

    OH_VideoEncoder_Configure(nullptr, nullptr);
    OH_VideoEncoder_Prepare(nullptr);
    OH_VideoEncoder_Start(nullptr);
    OH_VideoEncoder_Stop(nullptr);
    OH_VideoEncoder_Flush(nullptr);
    OH_VideoEncoder_Reset(nullptr);
    OH_VideoEncoder_GetOutputDescription(nullptr);
    OH_VideoEncoder_SetParameter(nullptr, nullptr);

    OHNativeWindow *window = nullptr;
    OH_VideoEncoder_GetSurface(nullptr, &window);
    OH_VideoEncoder_FreeOutputData(nullptr, 0);
    OH_VideoEncoder_NotifyEndOfStream(nullptr);

    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    OH_VideoEncoder_PushInputData(nullptr, 0, attr);
    OH_VideoEncoder_GetInputDescription(nullptr);

    OH_AVErrCode result = OH_VideoEncoder_IsValid(nullptr, nullptr);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value VideoDecoder(napi_env env, napi_callback_info info)
{
    OH_VideoDecoder_CreateByMime(nullptr);
    OH_VideoDecoder_CreateByName(nullptr);
    OH_VideoDecoder_Destroy(nullptr);

    OH_AVCodecAsyncCallback cb;
    cb.onError = NULL;
    cb.onStreamChanged = NULL;
    cb.onNeedInputData = NULL;
    cb.onNeedOutputData = NULL;
    OH_VideoDecoder_SetCallback(nullptr, cb, nullptr);

    OH_VideoDecoder_SetSurface(nullptr, nullptr);
    OH_VideoDecoder_Configure(nullptr, nullptr);
    OH_VideoDecoder_Prepare(nullptr);
    OH_VideoDecoder_Start(nullptr);
    OH_VideoDecoder_Stop(nullptr);
    OH_VideoDecoder_Flush(nullptr);
    OH_VideoDecoder_Reset(nullptr);
    OH_VideoDecoder_GetOutputDescription(nullptr);
    OH_VideoDecoder_SetParameter(nullptr, nullptr);

    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    OH_VideoDecoder_PushInputData(nullptr, 0, attr);

    OH_VideoDecoder_RenderOutputData(nullptr, 0);
    OH_VideoDecoder_FreeOutputData(nullptr, 0);

    OH_AVErrCode result = OH_VideoDecoder_IsValid(nullptr, nullptr);
    napi_value res;
    napi_create_int32(env, result, &res);

    return res;
}
// audio decode
static napi_value AudioDecodeTest(napi_env env, napi_callback_info info)
{
    OH_AVCodec *audioDec = OH_AudioDecoder_CreateByMime("aaa");
    audioDec = OH_AudioDecoder_CreateByName("aaa");

    OH_AVErrCode ret = AV_ERR_OK;

    OH_AudioDecoder_Destroy(audioDec);

    struct OH_AVCodecAsyncCallback callback = {nullptr, nullptr, nullptr, nullptr};
    OH_AudioDecoder_SetCallback(audioDec, callback, nullptr);

    OH_AVFormat *format = nullptr;
    OH_AudioDecoder_Configure(audioDec, format);

    OH_AudioDecoder_Prepare(audioDec);
    OH_AudioDecoder_Start(audioDec);
    OH_AudioDecoder_Stop(audioDec);
    OH_AudioDecoder_Flush(audioDec);
    OH_AudioDecoder_Reset(audioDec);
    OH_AudioDecoder_GetOutputDescription(audioDec);
    OH_AudioDecoder_SetParameter(audioDec, format);

    OH_AVCodecBufferAttr attr;
    uint32_t index = 0;
    OH_AudioDecoder_PushInputData(audioDec, index, attr);

    OH_AudioDecoder_FreeOutputData(audioDec, index);

    bool isVaild;
    OH_AudioDecoder_IsValid(audioDec, &isVaild);

    napi_value res;
    napi_create_int32(env, ret, &res);
    return res;
}

// audio encode
static napi_value AudioEncodeTest(napi_env env, napi_callback_info info)
{
    OH_AVCodec *audioEnc = OH_AudioEncoder_CreateByMime("aaa");
    audioEnc = OH_AudioEncoder_CreateByName("aaa");

    OH_AVErrCode ret = AV_ERR_OK;

    OH_AudioEncoder_Destroy(audioEnc);

    struct OH_AVCodecAsyncCallback callback = {nullptr, nullptr, nullptr, nullptr};
    OH_AudioEncoder_SetCallback(audioEnc, callback, nullptr);

    OH_AVFormat *format = nullptr;
    OH_AudioEncoder_Configure(audioEnc, format);

    OH_AudioEncoder_Prepare(audioEnc);
    OH_AudioEncoder_Start(audioEnc);
    OH_AudioEncoder_Stop(audioEnc);
    OH_AudioEncoder_Flush(audioEnc);
    OH_AudioEncoder_Reset(audioEnc);
    OH_AudioEncoder_GetOutputDescription(audioEnc);
    OH_AudioEncoder_SetParameter(audioEnc, format);

    OH_AVCodecBufferAttr attr;
    uint32_t index = 0;
    OH_AudioEncoder_PushInputData(audioEnc, index, attr);

    OH_AudioEncoder_FreeOutputData(audioEnc, index);

    bool isVaild;
    OH_AudioEncoder_IsValid(audioEnc, &isVaild);

    napi_value res;
    napi_create_int32(env, ret, &res);
    return res;
}

// avmuxer
static napi_value AVMuxerTest(napi_env env, napi_callback_info info)
{
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_M4A;
    int32_t fd = -1;

    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVMuxer *avmuxer = OH_AVMuxer_Create(fd, format);

    int32_t rotation = 90;
    OH_AVMuxer_SetRotation(avmuxer, rotation);

    int32_t trackId;
    OH_AVFormat *trackFormat = nullptr;
    OH_AVMuxer_AddTrack(avmuxer, &trackId, trackFormat);

    OH_AVMuxer_Start(avmuxer);
    OH_AVMemory *sampleBuffer = nullptr;
    OH_AVCodecBufferAttr info1;
    OH_AVMuxer_WriteSample(avmuxer, trackId, sampleBuffer, info1);

    OH_AVMuxer_Stop(avmuxer);
    OH_AVMuxer_Destroy(avmuxer);

    napi_value res;
    napi_create_int32(env, ret, &res);
    return res;
}

// avmemory
static napi_value AVMemoryTest(napi_env env, napi_callback_info info)
{
    OH_AVMemory *avMemBuffer = OH_AVMemory_Create(100);

    OH_AVMemory_GetAddr(avMemBuffer);
    int32_t ret = AV_ERR_OK;

    OH_AVMemory_GetSize(avMemBuffer);
    OH_AVMemory_Destroy(avMemBuffer);

    napi_value res;
    napi_create_int32(env, ret, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"demuxer", nullptr, Demuxer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"capability", nullptr, Capability, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"videoEncoder", nullptr, VideoEncoder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"videoDecoder", nullptr, VideoDecoder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createAudioCapture", nullptr, CreateAudioCapture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioDecodeTest", nullptr, AudioDecodeTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioEncodeTest", nullptr, AudioEncodeTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVMuxerTest", nullptr, AVMuxerTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVMemoryTest", nullptr, AVMemoryTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
