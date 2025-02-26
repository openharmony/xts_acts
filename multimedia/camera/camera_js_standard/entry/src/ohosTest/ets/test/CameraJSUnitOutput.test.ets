    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100
     * @tc.name      : capture session callback on error
     * @tc.desc      : capture session callback on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100', 0, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_01000--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        try {
          captureSession = cameraManager.createCaptureSession();
          captureSession.on('error', (error: BusinessError) => {
            console.error(`Capture session error code: ${error.code}`);
          });
          captureSession.off('error');
          done();
        } catch (err) {
          let error = err as BusinessError
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100 FAILED!");
          console.info('ERRORCODE: ' + error.code)
          expect().assertFail();
          done();
        }
      }
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100 PASSED");
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100
     * @tc.name      : capture session callback on focusStateChange
     * @tc.desc      : capture session callback on focusStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100', 0, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100 == null || undefined");
        expect().assertFail();
      } else {
        try {
          captureSession = cameraManager.createCaptureSession();
          captureSession.on('focusStateChange', (error: BusinessError, focusState: cameraObj.FocusState) => {
            if (error !== undefined && error.code !== 0) {
              console.error(`Callback Error, errorCode: ${error.code}`);
              return;
            }
            console.info(`Focus state: ${focusState}`);
          });
          captureSession.off('focusStateChange');
          done();
        } catch (err) {
          let error = err as BusinessError
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100 FAILED!");
          console.info('ERRORCODE: ' + error.code)
          expect().assertFail();
          done();
        }
      }
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100 PASSED");
      done();
    });
  })

}