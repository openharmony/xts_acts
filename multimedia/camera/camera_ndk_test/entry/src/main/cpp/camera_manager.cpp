static napi_value OHPhotoOutputUnregisterPhotoAvailableCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->UnregisterPhotoAvailableCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputRegisterPhotoAssetAvailableCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->RegisterPhotoAssetAvailableCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputUnregisterPhotoAssetAvailableCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->UnregisterPhotoAssetAvailableCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputIsMovingPhotoSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->IsMovingPhotoSupported(index);

    napi_value movingPhoto = nullptr;
    napi_create_object(env, &movingPhoto);
    napi_value jsValue = nullptr;

    bool isMovingPhoto = ndkCamera_->isMovingPhotoSupported_;
    napi_get_boolean(env, isMovingPhoto, &jsValue);
    napi_set_named_property(env, movingPhoto, "isMovingPhotoSupported", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, movingPhoto, "errorCode", jsValue);

    return movingPhoto;
}
static napi_value OHPhotoOutputEnableMovingPhoto(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[NUMBER_2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    bool enable;
    napi_get_value_bool(env, args[1], &enable);

    Camera_ErrorCode code = ndkCamera_->EnableMovingPhoto(index, enable);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoNativeGetMainImage(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetMainImage(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoNativeRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoNativeRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreatePhotoOutputWithoutSurface(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CreatePhotoOutputWithoutSurface(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value ReleaseCamera(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_ErrorCode code = ndkCamera_->ReleaseCamera();

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerIsTorchSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->IsTorchSupported(index);

    napi_value isTorchSupported = nullptr;
    napi_create_object(env, &isTorchSupported);
    napi_value jsValue = nullptr;

    napi_get_boolean(env, ndkCamera_->isTorchSupported_, &jsValue);
    napi_set_named_property(env, isTorchSupported, "isTorchSupported", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, isTorchSupported, "errorCode", jsValue);

    return isTorchSupported;
}

static napi_value OHCameraManagerIsTorchSupportedByTorchMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->IsTorchSupportedByTorchMode(index);

    napi_value isTorchSupportedByTorchMode = nullptr;
    napi_create_object(env, &isTorchSupportedByTorchMode);
    napi_value jsValue = nullptr;

    napi_get_boolean(env, ndkCamera_->isTorchSupportedByTorchMode_, &jsValue);
    napi_set_named_property(env, isTorchSupportedByTorchMode, "isTorchSupportedByTorchMode", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, isTorchSupportedByTorchMode, "errorCode", jsValue);

    return isTorchSupportedByTorchMode;
}

static napi_value OHCameraManagerSetTorchMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetTorchMode(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetExposureValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetExposureValue(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetFocalLength(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetFocalLength(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionSetSmoothZoom(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetSmoothZoom(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetSupportedColorSpaces(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetSupportedColorSpaces(index);

    napi_value colorSpacesSize = nullptr;
    napi_create_object(env, &colorSpacesSize);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->colorSpacesSize_, &jsValue);
    napi_set_named_property(env, colorSpacesSize, "colorSpacesSize", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, colorSpacesSize, "errorCode", jsValue);
    return colorSpacesSize;
}

static napi_value OHCaptureSessionDeleteColorSpaces(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->DeleteColorSpaces(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetActiveColorSpace(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetActiveColorSpace(index);

    napi_value activeColorSpace = nullptr;
    napi_create_object(env, &activeColorSpace);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->activeColorSpace_, &jsValue);
    napi_set_named_property(env, activeColorSpace, "activeColorSpace", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, activeColorSpace, "errorCode", jsValue);

    return activeColorSpace;
}

static napi_value OHNativeBufferColorSpace(napi_env env, napi_callback_info info)
{
    napi_value colorSpace = nullptr;
    napi_create_object(env, &colorSpace);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->ColorSpace(), &jsValue);
    napi_set_named_property(env, colorSpace, "colorSpaceSupportSize", jsValue);

    napi_create_int32(env, ndkCamera_->setcolorSpace_, &jsValue);
    napi_set_named_property(env, colorSpace, "setcolorSpace", jsValue);

    napi_create_int32(env, ndkCamera_->colorSpacesSize_, &jsValue);
    napi_set_named_property(env, colorSpace, "colorSpacesSize", jsValue);

    return colorSpace;
}


static napi_value OHCaptureSessionSetActiveColorSpace(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetColorSpace(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPreviewOutputGetSupportedFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetSupportedFrameRates(index);

    napi_value frameRatesSize = nullptr;
    napi_create_object(env, &frameRatesSize);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->frameRatesSize_, &jsValue);
    napi_set_named_property(env, frameRatesSize, "frameRatesSize", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, frameRatesSize, "errorCode", jsValue);

    return frameRatesSize;
}

static napi_value OHPreviewOutputSetFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetFrameRate(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPreviewOutputGetActiveFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetActiveFrameRate(index);

    napi_value activeFrameRateRange = nullptr;
    napi_create_object(env, &activeFrameRateRange);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->activeFrameRateRange_.min, &jsValue);
    napi_set_named_property(env, activeFrameRateRange, "min", jsValue);

    napi_create_int32(env, ndkCamera_->activeFrameRateRange_.max, &jsValue);
    napi_set_named_property(env, activeFrameRateRange, "max", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, activeFrameRateRange, "errorCode", jsValue);
    return activeFrameRateRange;
}

static napi_value OHVideoOutputGetSupportedFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputGetSupportedFrameRates(index);

    napi_value videoFrameRatesSize = nullptr;
    napi_create_object(env, &videoFrameRatesSize);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->videoFrameRatesSize_, &jsValue);
    napi_set_named_property(env, videoFrameRatesSize, "videoFrameRatesSize", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, videoFrameRatesSize, "errorCode", jsValue);
    return videoFrameRatesSize;
}

static napi_value OHVideoOutputSetFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputSetFrameRate(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHVideoOutputGetActiveFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputGetActiveFrameRate(index);

    napi_value videoActiveFrameRateRange = nullptr;
    napi_create_object(env, &videoActiveFrameRateRange);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->videoActiveFrameRateRange_.min, &jsValue);
    napi_set_named_property(env, videoActiveFrameRateRange, "min", jsValue);

    napi_create_int32(env, ndkCamera_->videoActiveFrameRateRange_.max, &jsValue);
    napi_set_named_property(env, videoActiveFrameRateRange, "max", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, videoActiveFrameRateRange, "errorCode", jsValue);
    return videoActiveFrameRateRange;
}

static napi_value OHVideoOutputDeleteFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputDeleteFrameRates(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPreviewOutputDeleteFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->DeleteFrameRates(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerRegisterTorchStatusCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CameraManagerRegisterTorchStatusCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerUnregisterTorchStatusCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CameraManagerUnregisterTorchStatusCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionRegisterSmoothZoomInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CaptureSessionRegisterSmoothZoomInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionUnregisterSmoothZoomInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CaptureSessionUnregisterSmoothZoomInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterCaptureStartWithInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterCaptureStartWithInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterCaptureEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterCaptureEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterCaptureEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterCaptureEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterFrameShutterEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterFrameShutterEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterFrameShutterEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterFrameShutterEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterCaptureReadyCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterCaptureReadyCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterCaptureReadyCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterCaptureReadyCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterEstimatedCaptureDurationCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterEstimatedCaptureDurationCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterEstimatedCaptureDurationCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterEstimatedCaptureDurationCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerTorchMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->TorchMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value ReadyCreatePhotoOutputWithoutSurface(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode code = ndkCamera_->ReadyCreatePhotoOutputWithoutSurface();

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value SessionIsAutoDeviceSwitchSupported(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    bool isSupported = false;
    Camera_ErrorCode code = ndkCamera_->IsAutoDeviceSwitchSupported(&isSupported);
    napi_value jsValue = nullptr;
    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, obj, "errorCode", jsValue);
    napi_get_boolean(env, isSupported, &jsValue);
    napi_set_named_property(env, obj, "isSupported", jsValue);
    return obj;
}
static napi_value SessionEnableAutoDeviceSwitch(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isEnable;
    napi_get_value_bool(env, args[0], &isEnable);
    Camera_ErrorCode code = ndkCamera_->EnableAutoDeviceSwitch(isEnable);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value SessionRegisterAutoDeviceSwitchStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->RegisterAutoDeviceSwitchStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value SessionUnregisterAutoDeviceSwitchStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->UnegisterAutoDeviceSwitchStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value CameraManagerRegisterFoldStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->CameraManagerRegisterFoldStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value CameraManagerUnregisterFoldStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->CameraManagerUnregisterFoldStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "initCamera", nullptr, InitCamera, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getSupportedCameras", nullptr, GetSupportedCameras, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraOrientation", nullptr, GetCameraOrientation, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostNameErrorParameter", nullptr, GetCameraHostNameErrorParameter, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostTypeErrorParameter", nullptr, GetCameraHostTypeErrorParameter, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostTypeInspection", nullptr, GetCameraHostTypeInspection, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostNameInspection", nullptr, GetCameraHostNameInspection, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostName", nullptr, GetCameraHostName, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostType", nullptr, GetCameraHostType, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createCameraInput", nullptr, CreateCameraInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createCameraInputWithPositionAndType", nullptr, CreateCameraInputWithPositionAndType, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getSupportedOutputCapability", nullptr, GetSupportedOutputCapability, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "createPreviewOutput", nullptr, CreatePreviewOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createPhotoOutput", nullptr, CreatePhotoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createVideoOutput", nullptr, CreateVideoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createMetadataOutput", nullptr, CreateMetadataOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createSession", nullptr, CreateSession, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isCameraMuted", nullptr, IsCameraMuted, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputOpen", nullptr, CameraInputOpen, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputClose", nullptr, CameraInputClose, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputRelease", nullptr, CameraInputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStart", nullptr, PreviewOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStop", nullptr, PreviewOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputRelease", nullptr, PreviewOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "photoOutputCapture", nullptr, PhotoOutputCapture, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "photoOutputRelease", nullptr, PhotoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isMirrorSupported", nullptr, IsMirrorSupported, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputStart", nullptr, VideoOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputStop", nullptr, VideoOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputRelease", nullptr, VideoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputStart", nullptr, MetadataOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputStop", nullptr, MetadataOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputRelease", nullptr, MetadataOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStop", nullptr, PreviewOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddInput", nullptr, SessionAddInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionRemoveInput", nullptr, SessionRemoveInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddPreviewOutput", nullptr, SessionAddPreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionAddPhotoOutput", nullptr, SessionAddPhotoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddVideoOutput", nullptr, SessionAddVideoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddMetadataOutput", nullptr, SessionAddMetadataOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemovePreviewOutput", nullptr, SessionRemovePreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemovePhotoOutput", nullptr, SessionRemovePhotoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemoveVideoOutput", nullptr, SessionRemoveVideoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemoveMetadataOutput", nullptr, SessionRemoveMetadataOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionStart", nullptr, SessionStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionStop", nullptr, SessionStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionBegin", nullptr, SessionBegin, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionCommitConfig", nullptr, SessionCommitConfig, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRelease", nullptr, SessionRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionHasFlash", nullptr, SessionHasFlash, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsFlashModeSupported", nullptr, SessionIsFlashModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetFlashMode", nullptr, SessionGetFlashMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFlashMode", nullptr, SessionSetFlashMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsExposureModeSupported", nullptr, SessionIsExposureModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetExposureMode", nullptr, SessionGetExposureMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetExposureMode", nullptr, SessionSetExposureMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetMeteringPoint", nullptr, SessionGetMeteringPoint, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetMeteringPoint", nullptr, SessionSetMeteringPoint, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetExposureBiasRange", nullptr, SessionGetExposureBiasRange, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetExposureBias", nullptr, SessionSetExposureBias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetExposureBias", nullptr, SessionGetExposureBias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsFocusModeSupported", nullptr, SessionIsFocusModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetFocusMode", nullptr, SessionGetFocusMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFocusMode", nullptr, SessionSetFocusMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFocusPoint", nullptr, SessionSetFocusPoint, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetFocusPoint", nullptr, SessionGetFocusPoint, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetZoomRatioRange", nullptr, SessionGetZoomRatioRange, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetZoomRatio", nullptr, SessionGetZoomRatio, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetZoomRatio", nullptr, SessionSetZoomRatio, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsVideoStabilizationModeSupported", nullptr, SessionIsVideoStabilizationModeSupported,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetVideoStabilizationMode", nullptr, SessionGetVideoStabilizationMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetVideoStabilizationMode", nullptr, SessionSetVideoStabilizationMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetQualityPrioritization", nullptr, SessionSetQualityPrioritization, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "getCameraCallbackCode", nullptr, GetCameraCallbackCode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "takePictureWithSettings", nullptr, TakePictureWithSettings, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetPhotoRotation", nullptr, SessionGetPhotoRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetVideoRotation", nullptr, SessionGetVideoRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetPreviewRotation", nullptr, SessionGetPreviewRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetPreviewRotation", nullptr, SessionSetPreviewRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionIsAutoDeviceSwitchSupported", nullptr, SessionIsAutoDeviceSwitchSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionEnableAutoDeviceSwitch", nullptr, SessionEnableAutoDeviceSwitch, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRegisterAutoDeviceSwitchStatusChange", nullptr, SessionRegisterAutoDeviceSwitchStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionUnregisterAutoDeviceSwitchStatusChange", nullptr, SessionUnregisterAutoDeviceSwitchStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraManagerRegisterFoldStatusChange", nullptr, CameraManagerRegisterFoldStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraManagerUnregisterFoldStatusChange", nullptr, CameraManagerUnregisterFoldStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_property_descriptor desc1[] = {
        {"oHCaptureSessionRegisterCallback", nullptr, OHCaptureSessionRegisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionUnregisterCallback", nullptr, OHCaptureSessionUnregisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraManagerGetSupportedSceneModes", nullptr, OHCameraManagerGetSupportedSceneModes, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"oHCameraManagerDeleteSceneModes", nullptr, OHCameraManagerDeleteSceneModes, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode", nullptr,
            OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionSetSessionMode", nullptr, OHCaptureSessionSetSessionMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionCanAddInput", nullptr, OHCaptureSessionCanAddInput, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionCanAddPreviewOutput", nullptr, OHCaptureSessionCanAddPreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionCanAddPhotoOutput", nullptr, OHCaptureSessionCanAddPhotoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionCanAddVideoOutput", nullptr, OHCaptureSessionCanAddVideoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionAddSecureOutput", nullptr, OHCaptureSessionAddSecureOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraInputOpenSecureCamera", nullptr, OHCameraInputOpenSecureCamera, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionRegisterCallbackOn", nullptr, OHCaptureSessionRegisterCallbackOn, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionUnregisterCallbackOff", nullptr, OHCaptureSessionUnregisterCallbackOff, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"oHCameraManagerSetSceneMode", nullptr, OHCameraManagerSetSceneMode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
    };
    napi_property_descriptor desc2[] = {
        {"oHCameraManagerCreatePreviewOutputUsedInPreconfig", nullptr,
            OHCameraManagerCreatePreviewOutputUsedInPreconfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCameraManagerCreatePhotoOutputUsedInPreconfig", nullptr, OHCameraManagerCreatePhotoOutputUsedInPreconfig,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionCanPreconfig", nullptr, OHCaptureSessionCanPreconfig, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionCanPreconfigWithRatio", nullptr, OHCaptureSessionCanPreconfigWithRatio, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"oHCaptureSessionPreconfig", nullptr, OHCaptureSessionPreconfig, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionPreconfigWithRatio", nullptr, OHCaptureSessionPreconfigWithRatio, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraManagerCreateVideoOutputUsedInPreconfig", nullptr, OHCameraManagerCreateVideoOutputUsedInPreconfig,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHVideoOutputGetActiveProfile", nullptr, OHVideoOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHVideoOutputDeleteProfile", nullptr, OHVideoOutputDeleteProfile, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHPreviewOutputGetActiveProfile", nullptr, OHPreviewOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPreviewOutputDeleteProfile", nullptr, OHPreviewOutputDeleteProfile, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHPhotoOutputGetActiveProfile", nullptr, OHPhotoOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPhotoOutputDeleteProfile", nullptr, OHPhotoOutputDeleteProfile, nullptr, nullptr, nullptr, napi_default,
            nullptr},
    };
    napi_property_descriptor desc3[] = {
        {"oHCameraManagerTorchMode", nullptr, OHCameraManagerTorchMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCameraManagerIsTorchSupported", nullptr, OHCameraManagerIsTorchSupported, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCameraManagerIsTorchSupportedByTorchMode", nullptr, OHCameraManagerIsTorchSupportedByTorchMode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCameraManagerSetTorchMode", nullptr, OHCameraManagerSetTorchMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionGetExposureValue", nullptr, OHCaptureSessionGetExposureValue, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionGetFocalLength", nullptr, OHCaptureSessionGetFocalLength, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionSetSmoothZoom", nullptr, OHCaptureSessionSetSmoothZoom, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionGetSupportedColorSpaces", nullptr, OHCaptureSessionGetSupportedColorSpaces, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionDeleteColorSpaces", nullptr, OHCaptureSessionDeleteColorSpaces, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionGetActiveColorSpace", nullptr, OHCaptureSessionGetActiveColorSpace, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeBufferColorSpace", nullptr, OHNativeBufferColorSpace, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHCaptureSessionSetActiveColorSpace", nullptr, OHCaptureSessionSetActiveColorSpace, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHPreviewOutputGetSupportedFrameRates", nullptr, OHPreviewOutputGetSupportedFrameRates, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHPreviewOutputSetFrameRate", nullptr, OHPreviewOutputSetFrameRate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHPreviewOutputGetActiveFrameRate", nullptr, OHPreviewOutputGetActiveFrameRate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHVideoOutputGetSupportedFrameRates", nullptr, OHVideoOutputGetSupportedFrameRates, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHVideoOutputSetFrameRate", nullptr, OHVideoOutputSetFrameRate, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHVideoOutputGetActiveFrameRate", nullptr, OHVideoOutputGetActiveFrameRate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHVideoOutputDeleteFrameRates", nullptr, OHVideoOutputDeleteFrameRates, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHPreviewOutputDeleteFrameRates", nullptr, OHPreviewOutputDeleteFrameRates, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCameraManagerGetSupportedCameraInfos", nullptr, CameraManagerGetSupportedCameraInfos, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHCameraManagerRegisterTorchStatusCallback", nullptr, OHCameraManagerRegisterTorchStatusCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCameraManagerUnregisterTorchStatusCallback", nullptr, OHCameraManagerUnregisterTorchStatusCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionRegisterSmoothZoomInfoCallback", nullptr, OHCaptureSessionRegisterSmoothZoomInfoCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionUnregisterSmoothZoomInfoCallback", nullptr,
         OHCaptureSessionUnregisterSmoothZoomInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterCaptureStartWithInfoCallback", nullptr,
         OHPhotoOutputRegisterCaptureStartWithInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterCaptureStartWithInfoCallback", nullptr,
         OHPhotoOutputUnregisterCaptureStartWithInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterCaptureEndCallback", nullptr, OHPhotoOutputRegisterCaptureEndCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterCaptureEndCallback", nullptr, OHPhotoOutputUnregisterCaptureEndCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterFrameShutterEndCallback", nullptr, OHPhotoOutputRegisterFrameShutterEndCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterFrameShutterEndCallback", nullptr, OHPhotoOutputUnregisterFrameShutterEndCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterCaptureReadyCallback", nullptr, OHPhotoOutputRegisterCaptureReadyCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterCaptureReadyCallback", nullptr, OHPhotoOutputUnregisterCaptureReadyCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterEstimatedCaptureDurationCallback", nullptr,
         OHPhotoOutputRegisterEstimatedCaptureDurationCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterEstimatedCaptureDurationCallback", nullptr,
         OHPhotoOutputUnregisterEstimatedCaptureDurationCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_property_descriptor desc4[] = {
        {"oHPhotoOutputRegisterPhotoAvailableCallback", nullptr, OHPhotoOutputRegisterPhotoAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterPhotoAvailableCallback", nullptr, OHPhotoOutputUnregisterPhotoAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterPhotoAssetAvailableCallback", nullptr, OHPhotoOutputRegisterPhotoAssetAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterPhotoAssetAvailableCallback", nullptr,
            OHPhotoOutputUnregisterPhotoAssetAvailableCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputIsMovingPhotoSupported", nullptr, OHPhotoOutputIsMovingPhotoSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPhotoOutputEnableMovingPhoto", nullptr, OHPhotoOutputEnableMovingPhoto, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPhotoNativeGetMainImage", nullptr, OHPhotoNativeGetMainImage, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHPhotoNativeRelease", nullptr, OHPhotoNativeRelease, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCameraManagerCreatePhotoOutputWithoutSurface", nullptr, OHCameraManagerCreatePhotoOutputWithoutSurface,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseCamera", nullptr, ReleaseCamera, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readyCreatePhotoOutputWithoutSurface", nullptr, ReadyCreatePhotoOutputWithoutSurface, nullptr, nullptr,
            nullptr, napi_default, nullptr},
    };
    size_t mergedLength = sizeof(desc) / sizeof(desc[0]) +
                          sizeof(desc1) / sizeof(desc1[0]) +
                          sizeof(desc2) / sizeof(desc2[0]) +
                          sizeof(desc3) / sizeof(desc3[0]) +
                          sizeof(desc4) / sizeof(desc4[0]);
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc) / sizeof(desc[0]); ++i) {
        mergedArray[i] = desc[i];
    }
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + i] = desc1[i];
    }
    for (size_t i = 0; i < sizeof(desc2) / sizeof(desc2[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + sizeof(desc1) / sizeof(desc1[0]) + i] = desc2[i];
    }
    for (size_t i = 0; i < sizeof(desc3) / sizeof(desc3[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + sizeof(desc1) / sizeof(desc1[0]) +
            sizeof(desc2) / sizeof(desc2[0]) + i] = desc3[i];
    }
    for (size_t i = 0; i < sizeof(desc4) / sizeof(desc4[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + sizeof(desc1) / sizeof(desc1[0]) +
        sizeof(desc2) / sizeof(desc2[0]) + sizeof(desc3) / sizeof(desc3[0]) + i] = desc4[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
};
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}