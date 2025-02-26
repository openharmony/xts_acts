    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100
     * @tc.name      : capturesession stop api
     * @tc.desc      : capturesession stop api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      mCameraSession.stop(async (err: BusinessError) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
          cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR);
          expect(err.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        }
      })
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100 END Here");
      done();
    })