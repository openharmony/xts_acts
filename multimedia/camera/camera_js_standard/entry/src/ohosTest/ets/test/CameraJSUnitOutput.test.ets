    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100
     * @tc.name      : captureSession stop 
     * @tc.desc      : captureSession stop 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        captureSession.commitConfig();
        captureSession.stop(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 FAILED: " +
            err.code+cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR);
            expect(err.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100
     * @tc.name      : captureSession release
     * @tc.desc      : captureSession release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        captureSession.commitConfig();
        captureSession.release(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })




    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100
     * @tc.name      : Create release session async api
     * @tc.desc      : Create release session async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.release(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200
     * @tc.name      : Create release session errorcode async api
     * @tc.desc      : Create release session errorcode async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.release(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 FAILED: " +
            err.message);
            expect(err.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })