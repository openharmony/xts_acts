
CaptureSession_Callbacks* NDKCamera::GetCaptureSessionRegister(void)
{
    static CaptureSession_Callbacks captureSessionCallbacks = {
        .onFocusStateChange = CaptureSessionOnFocusStateChange,
        .onError = CaptureSessionOnError
    };
    return &captureSessionCallbacks;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallback(void)
{
    ret_ = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CaptureSessionUnRegisterCallback(void)
{
    ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, GetCaptureSessionRegister());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreateCameraInputWithPositionAndType(Camera_Position position, Camera_Type type)
{
    LOG("ndkXTS CreateCameraInputWithPositionAndType start.");
    if (cameraManager_ == nullptr) {
        LOG("ndkXTS cameraManager_ is NULL.");
    }
    ret_ = OH_CameraManager_CreateCameraInput_WithPositionAndType(cameraManager_, position, type, &cameraInput_);
    if (cameraInput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreateCameraInputWithPositionAndType failed = %d. cameraInput_ = %p", ret_, cameraInput_);
    }
    LOG("ndkXTS CreateCameraInputWithPositionAndType end.");
    return ret_;
}

CaptureSession_Callbacks *NDKCamera::GetCaptureSessionRegister(int useCaseCode)
{
    static CaptureSession_Callbacks captureSessionCallbacks;
    if (useCaseCode == ALL_CALLBACK_IS_NULL) {
        captureSessionCallbacks = {.onFocusStateChange = nullptr,
                                   .onError = nullptr};
    } else if (useCaseCode == ONLY_ON_ERROR) {
        captureSessionCallbacks = {.onFocusStateChange = nullptr,
                                   .onError = CaptureSessionOnError};
    } else if (useCaseCode == ONLY_ON_FOCUS_STATE_CHANGE) {
        captureSessionCallbacks = {.onFocusStateChange = CaptureSessionOnFocusStateChange,
                                   .onError = nullptr};
    }
    return &captureSessionCallbacks;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallbackOn(int useCaseCode)
{
    ret_ = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister(useCaseCode));
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_RegisterCallback failed.%d", ret_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CaptureSessionUnregisterCallbackOff(int useCaseCode)
{
    ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, GetCaptureSessionRegister(useCaseCode));
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_UnregisterCallback failed.%d", ret_);
    }
    return ret_;
}


Camera_ErrorCode NDKCamera::GetCameraFromCameras(Camera_Device* cameras, Camera_Device** camera,
    size_t cameraIndex)
{
    if (cameras != nullptr) {
        LOG("supported cameras list is not null.");
        if (cameraIndex < this->size_) {
            *camera = &cameras[cameraIndex];
            ret_ = CAMERA_OK;
        } else {
            ret_ = CAMERA_INVALID_ARGUMENT;
            LOG("fail to get valid camera, size is out of supported cameras list range. %d", ret_);
        }
    } else {
        ret_ = CAMERA_INVALID_ARGUMENT;
        LOG("get camera from supported cameras list failed, the list is null. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterCallback(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_RegisterCallback(nullptr, GetCaptureSessionRegister());
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CaptureSessionRegisterCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CaptureSessionUnRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, GetCaptureSessionRegister());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_UnregisterCallback(nullptr, GetCaptureSessionRegister());
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedSceneModes(int useCaseCode)
{
    if (camera_ == nullptr) {
        ret_ = GetCameraFromCameras(cameras_, &camera_);
    }
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, &sceneModes_, &sceneModesSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, &sceneModes_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, nullptr, &sceneModesSize_);
    } else if (useCaseCode == SET_CAMERA_FRONT_FOR_SECURE_PHOTO) {
        ret_ = GetCameraFromCameras(cameras_, &camera_, FRONT_CAMERA);
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, &sceneModes_, &sceneModesSize_);
    } else {
        ret_ = OH_CameraManager_GetSupportedSceneModes(nullptr, &sceneModes_, &sceneModesSize_);
    }
    if (ret_ == CAMERA_OK && sceneModesSize_ > 1) {
        isNormalPhoto_ = false;
        isNormalVideo_ = false;
        isSecurePhoto_ = false;
        for (decltype(sceneModesSize_) index = 0; index < sceneModesSize_; index++) {
            switch (sceneModes_[index]) {
                case NORMAL_PHOTO:
                    isNormalPhoto_ = true;
                    break;
                case NORMAL_VIDEO:
                    isNormalVideo_ = true;
                    break;
                case SECURE_PHOTO:
                    isSecurePhoto_ = true;
                    break;
                default: break;
            }
        }
        LOG("isSupported_NORMAL_PHOTO: %d, isSupported_NORMAL_VIDEO: %d, isSupported_NSECURE_PHOTO: %d.",
            isNormalPhoto_, isNormalVideo_, isSecurePhoto_);
    } else {
        ret_ = CAMERA_INVALID_ARGUMENT;
        LOG("ndkXTS OH_CameraManager_GetSupportedSceneModes failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::DeleteSceneModes(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_DeleteSceneModes(cameraManager_, sceneModes_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_DeleteSceneModes(cameraManager_, nullptr);
    } else {
        ret_ = OH_CameraManager_DeleteSceneModes(nullptr, sceneModes_);
    }
    if (sceneModes_ != nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraManager_DeleteSceneModes failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedCameraOutputCapabilityWithSceneMode(int useCaseCode)
{
    if (camera_ == nullptr) {
        ret_ = GetCameraFromCameras(cameras_, &camera_);
    }
    if (useCaseCode == PARAMETER_OK) {
        if (sceneMode_ == SECURE_PHOTO) {
        ret_ = GetCameraFromCameras(cameras_, &camera_, FRONT_CAMERA);
        }
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, camera_, sceneMode_,
        &cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, camera_, sceneMode_,
        nullptr);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, camera_,
            static_cast<Camera_SceneMode>(0), &cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, nullptr, sceneMode_,
        &cameraOutputCapability_);
    } else {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(nullptr, camera_, sceneMode_,
        &cameraOutputCapability_);
    }
    if (cameraOutputCapability_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_UnregisterCallback failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetSceneMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        sceneMode_ = NORMAL_PHOTO;
    } else if (useCaseCode == PARAMETER1_ERROR) {
        sceneMode_ = NORMAL_VIDEO;
    } else if (useCaseCode == PARAMETER2_ERROR) {
        sceneMode_ = SECURE_PHOTO;
    }
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::SetSessionMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetSessionMode(captureSession_, sceneMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_SetSessionMode(captureSession_, static_cast<Camera_SceneMode>(0));
    } else {
        ret_ = OH_CaptureSession_SetSessionMode(nullptr, sceneMode_);
    }
    if (ret_ == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_SetSessionMode successful.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddInput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddInput(captureSession_, cameraInput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddInput(captureSession_, cameraInput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddInput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddInput(nullptr, cameraInput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddInput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add input.");
        } else {
            LOG("can not add input.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddPreviewOutput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(captureSession_, previewOutput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(captureSession_, previewOutput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(nullptr, previewOutput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddPreviewOutput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add preview output.");
        } else {
            LOG("can not add preview output.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddPhotoOutput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(captureSession_, photoOutput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(captureSession_, photoOutput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(nullptr, photoOutput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddPhotoOutput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add photo output.");
        } else {
            LOG("can not add photo output.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddVideoOutput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddVideoOutput(captureSession_, videoOutput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddVideoOutput(captureSession_, videoOutput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddVideoOutput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddVideoOutput(nullptr, videoOutput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddVideoOutput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add video output.");
        } else {
            LOG("can not add video output.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::AddSecureOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_AddSecureOutput(captureSession_, previewOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_AddSecureOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_AddSecureOutput(nullptr, previewOutput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddSecureOutput successful.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::OpenSecureCamera(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_OpenSecureCamera(cameraInput_, &secureSeqId_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraInput_OpenSecureCamera(cameraInput_, nullptr);
    } else {
        ret_ = OH_CameraInput_OpenSecureCamera(nullptr, &secureSeqId_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraInput_OpenSecureCamera failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePreviewOutputUsedInPreconfig(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, previewSurfaceId_, &previewOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, previewSurfaceId_, nullptr);
    } else if (useCaseCode == INVALID_SURFACE_ID) {
        const char* abnormalSurfaceId = "0";
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, abnormalSurfaceId, &previewOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, nullptr, &previewOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(nullptr, previewSurfaceId_, &previewOutput_);
    }

    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePhotoOutputUsedInPreconfig(char *photoSurfaceId, int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, photoSurfaceId, &photoOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, photoSurfaceId, nullptr);
    } else if (useCaseCode == INVALID_SURFACE_ID) {
        const char* abnormalSurfaceId = "0";
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, abnormalSurfaceId, &photoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, nullptr, &photoOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(nullptr, photoSurfaceId, &photoOutput_);
    }

    return ret_;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfig(uint32_t mode, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanPreconfig(captureSession_, preconfigType, &canPreconfig_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanPreconfig(captureSession_, preconfigType, nullptr);
    } else {
        ret_ = OH_CaptureSession_CanPreconfig(nullptr, preconfigType, &canPreconfig_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfigWithRatio(uint32_t mode, uint32_t mode2, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    Camera_PreconfigRatio preconfigRatio = static_cast<Camera_PreconfigRatio>(mode2);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanPreconfigWithRatio(captureSession_, preconfigType, preconfigRatio, &canPreconfig_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CaptureSession_CanPreconfigWithRatio(captureSession_, preconfigType, preconfigRatio, nullptr);
    } else {
        ret_ = OH_CaptureSession_CanPreconfigWithRatio(nullptr, preconfigType, preconfigRatio, &canPreconfig_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionPreconfig(uint32_t mode, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_Preconfig(captureSession_, preconfigType);
    } else {
        ret_ = OH_CaptureSession_Preconfig(nullptr, preconfigType);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionPreconfigWithRatio(uint32_t mode, uint32_t mode2, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    Camera_PreconfigRatio preconfigRatio = static_cast<Camera_PreconfigRatio>(mode2);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_PreconfigWithRatio(captureSession_, preconfigType, preconfigRatio);
    } else {
        ret_ = OH_CaptureSession_PreconfigWithRatio(nullptr, preconfigType, preconfigRatio);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreateVideoOutputUsedInPreconfig(char *videoId, int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, videoId, &videoOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, videoId, nullptr);
    } else if (useCaseCode == INVALID_SURFACE_ID) {
        const char* abnormalVideoId = "0";
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, abnormalVideoId, &videoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, nullptr, &videoOutput_);
    } else {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(nullptr,  videoId, &videoOutput_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::VideoOutputGetActiveProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_GetActiveProfile(videoOutput_, &videoActiveProfile_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetActiveProfile(videoOutput_, nullptr);
    } else {
        ret_ = OH_VideoOutput_GetActiveProfile(nullptr, &videoActiveProfile_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::VideoOutputDeleteProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_DeleteProfile(videoActiveProfile_);
    } else {
        ret_ = OH_VideoOutput_DeleteProfile(nullptr);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PreviewOutputGetActiveProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_GetActiveProfile(previewOutput_, &cameraProfile_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_GetActiveProfile(previewOutput_, nullptr);
    } else {
        ret_ = OH_PreviewOutput_GetActiveProfile(nullptr, &cameraProfile_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PreviewOutputDeleteProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_DeleteProfile(cameraProfile_);
    } else {
        ret_ = OH_PreviewOutput_DeleteProfile(nullptr);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoOutputGetActiveProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_GetActiveProfile(photoOutput_, &cameraProfile_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_GetActiveProfile(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_GetActiveProfile(nullptr, &cameraProfile_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoOutputDeleteProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_DeleteProfile(cameraProfile_);
    } else {
        ret_ = OH_PhotoOutput_DeleteProfile(nullptr);
    }
    return ret_;
}

void PhotoOutputOnPhotoAvailable(Camera_PhotoOutput* photoOutput, OH_PhotoNative* photo)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_PHOTO_AVAILABLE;
    LOG("PhotoOutputOnPhotoAvailable is called.");
}

Camera_ErrorCode NDKCamera::RegisterPhotoAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterPhotoAvailableCallback(photoOutput_, PhotoOutputOnPhotoAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterPhotoAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_RegisterPhotoAvailableCallback(nullptr, PhotoOutputOnPhotoAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterPhotoAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::UnregisterPhotoAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAvailableCallback(photoOutput_, PhotoOutputOnPhotoAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_UnregisterPhotoAvailableCallback(nullptr, PhotoOutputOnPhotoAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterPhotoAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

void PhotoOutputOnPhotoAssetAvailable(Camera_PhotoOutput* photoOutput, OH_MediaAsset* photoAsset)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_PHOTO_ASSET_AVAILABLE;
    LOG("PhotoOutputOnPhotoAssetAvailable is called.");
}

Camera_ErrorCode NDKCamera::RegisterPhotoAssetAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput_, PhotoOutputOnPhotoAssetAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(nullptr, PhotoOutputOnPhotoAssetAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterPhotoAssetAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::UnregisterPhotoAssetAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback(photoOutput_, PhotoOutputOnPhotoAssetAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback(nullptr, PhotoOutputOnPhotoAssetAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsMovingPhotoSupported(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_IsMovingPhotoSupported(photoOutput_, &isMovingPhotoSupported_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_IsMovingPhotoSupported(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_IsMovingPhotoSupported(nullptr, &isMovingPhotoSupported_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_IsMovingPhotoSupported failed. %d", ret_);
    } else {
        if (isMovingPhotoSupported_ != true) {
            LOG("moving photo is not supported.");
        } else {
            LOG("moving photo is supported.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::EnableMovingPhoto(int useCaseCode, bool enable)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_EnableMovingPhoto(photoOutput_, enable);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_EnableMovingPhoto(nullptr, enable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_EnableMovingPhoto failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetMainImage(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoNative_GetMainImage(photoNative_, &mainImage_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoNative_GetMainImage(photoNative_, nullptr);
    } else {
        ret_ = OH_PhotoNative_GetMainImage(nullptr, &mainImage_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoNative_GetMainImage failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoNativeRelease(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoNative_Release(photoNative_);
    } else {
        ret_ = OH_PhotoNative_Release(nullptr);
    }
    if (ret_ != CAMERA_OK || !photoNative_) {
        LOG("OH_PhotoNative_Release failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePhotoOutputWithoutSurface(int useCaseCode)
{
    for (decltype(cameraOutputCapability_->photoProfilesSize) i = 0;
            i< cameraOutputCapability_->photoProfilesSize; i++) {
        if (cameraOutputCapability_->photoProfiles[i]->size.width == PhotoOutputWithoutSurface.size.width &&
            cameraOutputCapability_->photoProfiles[i]->size.height == PhotoOutputWithoutSurface.size.height &&
            cameraOutputCapability_->photoProfiles[i]->format == PhotoOutputWithoutSurface.format) {
            photoProfile_ = cameraOutputCapability_->photoProfiles[i];
            break;
        }
    }
    if (!photoProfile_) {
        photoProfile_ = cameraOutputCapability_->photoProfiles[0];
    }
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, photoProfile_, &photoOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, photoProfile_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, nullptr, &photoOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(nullptr, photoProfile_, &photoOutput_);
    }
    if (ret_ != CAMERA_OK || !photoOutput_) {
        ret_ = CAMERA_INVALID_ARGUMENT;
        LOG("OH_CameraManager_CreatePhotoOutputWithoutSurface failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsTorchSupported(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_IsTorchSupported(cameraManager_, &isTorchSupported_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupported(nullptr, &isTorchSupported_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupported(cameraManager_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_IsTorchSupported failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::TorchMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        torchMode_ = OFF;
    } else if (useCaseCode == PARAMETER1_ERROR) {
        torchMode_ = ON;
    } else if (useCaseCode == PARAMETER2_ERROR) {
        torchMode_ = AUTO;
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_IsTorchSupported failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsTorchSupportedByTorchMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(cameraManager_, torchMode_, &isTorchSupportedByTorchMode_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(nullptr, torchMode_, &isTorchSupportedByTorchMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(cameraManager_, static_cast<Camera_TorchMode>(-1),
            &isTorchSupported_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(cameraManager_, torchMode_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_IsTorchSupportedByTorchMode failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetTorchMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_SetTorchMode(cameraManager_, torchMode_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_SetTorchMode(nullptr, torchMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_SetTorchMode(cameraManager_, static_cast<Camera_TorchMode>(-1));
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_SetTorchMode failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetExposureValue(int useCaseCode)
{
    float exposureValue;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetExposureValue(captureSession_, &exposureValue);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetExposureValue(nullptr, &exposureValue);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetExposureValue(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetExposureValue failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetFocalLength(int useCaseCode)
{
    float focalLength = 0;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetFocalLength(captureSession_, &focalLength);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetFocalLength(nullptr, &focalLength);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetFocalLength(captureSession_, nullptr);
    }
    if (focalLength == 0 || ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetFocalLength failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetSmoothZoom(int useCaseCode)
{
    float targetZoom = TARGET_ZOOM;
    Camera_SmoothZoomMode smoothZoomMode = NORMAL;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetSmoothZoom(captureSession_, targetZoom, smoothZoomMode);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_SetSmoothZoom(nullptr, targetZoom, smoothZoomMode);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_SetSmoothZoom failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedColorSpaces(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, &colorSpace_, &colorSpacesSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(nullptr, &colorSpace_, &colorSpacesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, nullptr, &colorSpacesSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, &colorSpace_, nullptr);
    }
    if (colorSpace_ == nullptr || colorSpacesSize_ == 0 || ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetSupportedColorSpaces failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::DeleteColorSpaces(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_DeleteColorSpaces(captureSession_, colorSpace_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_DeleteColorSpaces(nullptr, colorSpace_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_DeleteColorSpaces(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_DeleteColorSpaces failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::GetActiveColorSpace(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetActiveColorSpace(captureSession_, &activeColorSpace_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetActiveColorSpace(nullptr, &activeColorSpace_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetActiveColorSpace(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetActiveColorSpace failed.");
    }
    return ret_;
}
int32_t NDKCamera::ColorSpace(void)
{
    int32_t nativeColorSpaceSize = sizeof(oHNativeBufferColorSpace)/sizeof(oHNativeBufferColorSpace[0]);
    bool flag = false;
    ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, &colorSpace_, &colorSpacesSize_);
    if (colorSpacesSize_ == 0) {
        setcolorSpace_ = oHNativeBufferColorSpace[SET_OH_COLORSPACE_SRGB_FULL];
        return COLOR_SPACE_NOT_SUPPORTED;
    }
    for (uint32_t nativeIndex = 0; nativeIndex < nativeColorSpaceSize; nativeIndex++) {
        flag = false;
        for (int32_t supportedIndex = 0; supportedIndex < colorSpacesSize_; supportedIndex++) {
            if (oHNativeBufferColorSpace[nativeIndex] == colorSpace_[supportedIndex]) {
                flag = true;
                break;
            }
        }
        if (!flag) {
            setcolorSpace_ = oHNativeBufferColorSpace[nativeIndex];
            return COLOR_SPACE_NOT_SUPPORTED;
        }
    }
    return colorSpacesSize_;
}
Camera_ErrorCode NDKCamera::SetColorSpace(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(captureSession_, activeColorSpace_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(nullptr, activeColorSpace_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(captureSession_, static_cast<OH_NativeBuffer_ColorSpace>(-1));
    } else if (useCaseCode == COLOR_SPACE_NOT_SUPPORTED_MODE) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(captureSession_, setcolorSpace_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_SetActiveColorSpace failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::GetSupportedFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(previewOutput_, &frameRateRange_, &frameRatesSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(nullptr, &frameRateRange_, &frameRatesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(previewOutput_, nullptr, &frameRatesSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(previewOutput_, &frameRateRange_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_GetSupportedFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::DeleteFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_DeleteFrameRates(previewOutput_, frameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_DeleteFrameRates(nullptr, frameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_DeleteFrameRates(previewOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_DeleteFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SetFrameRate(int useCaseCode)
{
    int32_t minFps = activeFrameRateRange_.min;
    int32_t maxFps = activeFrameRateRange_.max;
    bool flag = false;
    for (uint32_t i = 0; i < frameRatesSize_; i++) {
        if (frameRateRange_[i].min != activeFrameRateRange_.min ||
            frameRateRange_[i].max != activeFrameRateRange_.max) {
            minFps = frameRateRange_[i].min;
            maxFps = frameRateRange_[i].max;
            flag = true;
            break;
        }
    }
    if (!flag) {
        if (maxFps > minFps) {
            minFps++;
        }
    }
    if (useCaseCode == PARAMETER_OK) {
        if (maxFps <= minFps + INVALID_MIN_FPS) {
            return CAMERA_OK;
        }
        ret_ = OH_PreviewOutput_SetFrameRate(previewOutput_, minFps, maxFps);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_SetFrameRate(nullptr, minFps, maxFps);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_SetFrameRate(previewOutput_, INVALID_MIN_FPS, maxFps + INVALID_MAX_FPS);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_DeleteFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::GetActiveFrameRate(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_GetActiveFrameRate(previewOutput_, &activeFrameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_GetActiveFrameRate(nullptr, &activeFrameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_GetActiveFrameRate(previewOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_GetActiveFrameRate failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputGetSupportedFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(videoOutput_, &videoFrameRateRange_, &videoFrameRatesSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(nullptr, &videoFrameRateRange_, &videoFrameRatesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(videoOutput_, nullptr, &videoFrameRatesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(videoOutput_, &videoFrameRateRange_, nullptr);
    }
    if (videoFrameRatesSize_ == 0 || ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_GetSupportedFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputGetActiveFrameRate(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_GetActiveFrameRate(videoOutput_, &videoActiveFrameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_GetActiveFrameRate(nullptr, &videoActiveFrameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetActiveFrameRate(videoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_GetActiveFrameRate failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputSetFrameRate(int useCaseCode)
{
    uint32_t minFps = videoActiveFrameRateRange_.min;
    uint32_t maxFps = videoActiveFrameRateRange_.max;
    bool flag = false;
    for (uint32_t i = 0; i < videoFrameRatesSize_; i++) {
        if (videoFrameRateRange_[i].min != videoActiveFrameRateRange_.min ||
            videoFrameRateRange_[i].max != videoActiveFrameRateRange_.max) {
            minFps = videoFrameRateRange_[i].min;
            maxFps = videoFrameRateRange_[i].max;
            flag = true;
            break;
        }
    }
    if (!flag) {
        if (maxFps > minFps) {
            minFps++;
        }
    }
    if (useCaseCode == PARAMETER_OK) {
        if (maxFps <= minFps + INVALID_MIN_FPS) {
            return CAMERA_OK;
        }
        ret_ = OH_VideoOutput_SetFrameRate(videoOutput_, minFps, maxFps);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_SetFrameRate(nullptr, minFps, maxFps);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_SetFrameRate(videoOutput_, INVALID_MIN_FPS, maxFps + INVALID_MAX_FPS);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_SetFrameRate failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputDeleteFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_DeleteFrameRates(videoOutput_, videoFrameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_DeleteFrameRates(nullptr, videoFrameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_DeleteFrameRates(videoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_DeleteFrameRates failed.");
    }
    return ret_;
}
void CameraManagerTorchStatusCallback(Camera_Manager *cameraManager, Camera_TorchStatusInfo *status)
{
    LOG("CameraManagerTorchStatusCallback");
}
Camera_ErrorCode NDKCamera::CameraManagerRegisterTorchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_RegisterTorchStatusCallback(cameraManager_, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_RegisterTorchStatusCallback(nullptr, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_RegisterTorchStatusCallback(cameraManager_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_RegisterTorchStatusCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CameraManagerUnregisterTorchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_UnregisterTorchStatusCallback(cameraManager_, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_UnregisterTorchStatusCallback(nullptr, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_UnregisterTorchStatusCallback(cameraManager_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_UnregisterTorchStatusCallback failed.");
    }
    return ret_;
}
void CaptureSessionSmoothZoomInfoCallback(Camera_CaptureSession *session, Camera_SmoothZoomInfo *smoothZoomInfo)
{
    LOG("CaptureSessionSmoothZoomInfoCallback");
}
Camera_ErrorCode NDKCamera::CaptureSessionRegisterSmoothZoomInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterSmoothZoomInfoCallback(captureSession_, CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_RegisterSmoothZoomInfoCallback(nullptr, CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterSmoothZoomInfoCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterSmoothZoomInfoCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CaptureSessionUnregisterSmoothZoomInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterSmoothZoomInfoCallback(captureSession_,
            CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_UnregisterSmoothZoomInfoCallback(nullptr, CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterSmoothZoomInfoCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterSmoothZoomInfoCallback failed.");
    }
    return ret_;
}
void PhotoOutputCaptureStartWithInfoCallback(Camera_PhotoOutput* photoOutput, Camera_CaptureStartInfo* Info)
{
    LOG("PhotoOutputCaptureStartWithInfoCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureStartWithInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(photoOutput_,
            PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(nullptr, PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterCaptureStartWithInfoCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterCaptureStartWithInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback(photoOutput_,
            PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback(nullptr, PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback failed.");
    }
    return ret_;
}
void PhotoOutputCaptureEndCallback(Camera_PhotoOutput* photoOutput, int32_t frameCount)
{
    LOG("PhotoOutputCaptureEndCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterCaptureEndCallback(photoOutput_, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureEndCallback(nullptr, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterCaptureEndCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterCaptureEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterCaptureEndCallback(photoOutput_, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureEndCallback(nullptr, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("CaptureSessionUnregisterSmoothZoomInfoCallback failed.");
    }
    return ret_;
}
void PhotoOutputFrameShutterEndCallback(Camera_PhotoOutput* photoOutput, Camera_FrameShutterInfo* Info)
{
    LOG("PhotoOutputFrameShutterEndCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterFrameShutterEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterFrameShutterEndCallback(photoOutput_, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterFrameShutterEndCallback(nullptr, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterFrameShutterEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterFrameShutterEndCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterFrameShutterEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterFrameShutterEndCallback(photoOutput_, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterFrameShutterEndCallback(nullptr, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterFrameShutterEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterFrameShutterEndCallback failed.");
    }
    return ret_;
}
void PhotoOutputCaptureReadyCallback(Camera_PhotoOutput* photoOutput)
{
    LOG("PhotoOutputCaptureReadyCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureReadyCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterCaptureReadyCallback(photoOutput_, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureReadyCallback(nullptr, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureReadyCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterCaptureReadyCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterCaptureReadyCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterCaptureReadyCallback(photoOutput_, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureReadyCallback(nullptr, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureReadyCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterCaptureReadyCallback failed.");
    }
    return ret_;
}
void PhotoOutputEstimatedCaptureDurationCallback(Camera_PhotoOutput* photoOutput, int64_t duration)
{
    LOG("PhotoOutputEstimatedCaptureDurationCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterEstimatedCaptureDurationCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback(photoOutput_,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback(nullptr,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterEstimatedCaptureDurationCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback(photoOutput_,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback(nullptr,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::ReadyCreatePhotoOutputWithoutSurface()
{
    isCreatePhotoOutputWithoutSurface_ = true;
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::IsAutoDeviceSwitchSupported(bool* isSupported)
{
    ret_ = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession_, isSupported);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_IsAutoDeviceSwitchSupported failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::EnableAutoDeviceSwitch(bool isEnable)
{
    ret_ = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession_, isEnable);
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback failed.");
    }
    return ret_;
}
 
void CameraAutoDeviceSwitchStatusInfoCallback(Camera_CaptureSession* session,
    Camera_AutoDeviceSwitchStatusInfo* autoDeviceSwitchStatusInfo)
{
    LOG("CameraAutoDeviceSwitchStatusInfoCallback is called.");
}
Camera_ErrorCode NDKCamera::RegisterAutoDeviceSwitchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(captureSession_,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(nullptr,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback failed.");
    }
    return ret_;
}
 
Camera_ErrorCode NDKCamera::UnegisterAutoDeviceSwitchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(captureSession_,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(nullptr,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback failed.");
    }
    return ret_;
}
 
void CameraFoldStatusInfoCallback(Camera_Manager *cameraManager, Camera_FoldStatusInfo *foldStatusInfo)
{
    LOG("CameraFoldStatusInfoCallback is called.");
}
 
Camera_ErrorCode NDKCamera::CameraManagerRegisterFoldStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_RegisterFoldStatusInfoCallback(cameraManager_, CameraFoldStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_RegisterFoldStatusInfoCallback(nullptr, CameraFoldStatusInfoCallback);
    } else {
        ret_ = OH_CameraManager_RegisterFoldStatusInfoCallback(cameraManager_, nullptr);
    }
    return ret_;
}
 
Camera_ErrorCode NDKCamera::CameraManagerUnregisterFoldStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_UnregisterFoldStatusInfoCallback(cameraManager_, CameraFoldStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_UnregisterFoldStatusInfoCallback(nullptr, CameraFoldStatusInfoCallback);
    } else {
        ret_ = OH_CameraManager_UnregisterFoldStatusInfoCallback(cameraManager_, nullptr);
    }
    return ret_;
}