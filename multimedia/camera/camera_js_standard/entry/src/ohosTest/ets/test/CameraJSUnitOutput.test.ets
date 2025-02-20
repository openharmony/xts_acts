

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100
     * @tc.name      : photoOutput commitConfig
     * @tc.desc      : captureSession commitConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG +
          " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100--------------");
        createPhotoSession(1);
        addCommit(0, 1);
        await cameraSession.commitConfig();
        await sleep();
        await cameraSession.start();
        if (isEmpty(photoOutput)) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 photoOutput == null || undefined")
          expect().assertFail();
        } else {
          photoOutput.capture(captureSetting, async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 ends here");
            await sleep(1000);
            done();
          })
        }
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 ends here");
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
     * @tc.name      : photo output callback on captureStart
     * @tc.desc      : photo output callback on captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 to operate");
        let count = 0;
        photoOutput.on('captureStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 FAILED: " +
            err.message);
          }
        })
        photoOutput.capture();
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
     * @tc.name      : photo output callback on captureStart
     * @tc.desc      : photo output callback on captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 to operate");
        let count = 0;
        photoOutput.on('captureStartWithInfo', async (err, data: cameraObj.CaptureStartInfo) => {
          if (!err) {
            expect((!isEmpty(data.captureId)) && (!isEmpty(data.time))).assertTrue();
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG +
              "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 FAILED: " +
            err.message);
          }
        })
        photoOutput.capture();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100
     * @tc.name      : photo output callback on frameShutter
     * @tc.desc      : photo output callback on frameShutter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 to operate");
        let count = 0;
        photoOutput.on('frameShutter', async (err, data) => {
          if (!err) {
            count++;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, captureId = " +
            data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, timestamp = " +
            data.timestamp);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 FAILED: " +
            err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
        photoOutput.capture();

      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100
     * @tc.name      : photo output callback on captureEnd
     * @tc.desc      : photo output callback on captureEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 to operate");
        let count = 0;
        photoOutput.on('captureEnd', async (err, data) => {
          if (!err) {
            count++;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, captureId = " +
            data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, frameCount = " +
            data.frameCount);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 FAILED: " +
            err.message);
          }
        })
        await sleep(1000);
        done();
        photoOutput.capture();

      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.name      : photo output callback on error
     * @tc.desc      : photo output callback on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        photoOutput.on('error', async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100
     * @tc.name      : videoOutput start promise api
     * @tc.desc      : videoOutput start promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 start")
          videoOutput.start();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 end")
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 error`)
      }
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100
     * @tc.name      : videoOutput stop promise api
     * @tc.desc      : videoOutput stop promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 start")
          videoOutput.stop();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 end")
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 error`);
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100
     * @tc.name      : Start metadataOutput sync api
     * @tc.desc      : Start metadataOutput sync api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.start().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 ends here");
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100
     * @tc.name      : Stop metadataOutput sync api
     * @tc.desc      : Stop metadataOutput aync api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.stop().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 ends here");
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100
     * @tc.name      : videoOutput start async api
     * @tc.desc      : videoOutput start async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.start(async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 success");
            } else {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 ends here");
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput?.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 error`);
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100
     * @tc.name      : videoOutput stop async api
     * @tc.desc      : videoOutput stop async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.stop(async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 ends here");
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 error`)
      }
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100
     * @tc.name      : video output callback on frameStart api
     * @tc.desc      : video output callback on frameStart api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100', 1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.on('frameStart', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 error`);
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100
     * @tc.name      : video output callback off frameStart api
     * @tc.desc      : video output callback off frameStart api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100', 1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.off('frameStart', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 error`);
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100
     * @tc.name      : video output callback on frameEnd api
     * @tc.desc      : video output callback on frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
      await getVideoSurface();
      sleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
        videoOutput.on('frameEnd', async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " +
            err.message);
          }
        })
      } else {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      videoOutput.release();
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100
     * @tc.name      : video output callback off frameEnd api
     * @tc.desc      : video output callback off frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 to operate");
      await getVideoSurface();
      sleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
        videoOutput.off('frameEnd', async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 FAILED: " +
            err.message);
          }
        })
      } else {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      videoOutput.release();
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100
     * @tc.name      : video output get supported frameRates api
     * @tc.desc      : video output get supported frameRates api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100 to operate");
      await getVideoSurface();
      sleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
        let supportedFrameRatesArray = videoOutput.getSupportedFrameRates()
        expect(isEmpty(supportedFrameRatesArray)).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100 success");
      } else {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      videoOutput.release();
      await sleep(1000);
      done();
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100
     * @tc.name      : video output callback on error api
     * @tc.desc      : video output callback on error api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100', 1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.on('error', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 error`);
        done();
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100
     * @tc.name      : video output callback off error api
     * @tc.desc      : video output callback off error api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100', 1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.off('error', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 error`);
        done();
      }

    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100
     * @tc.name      : Create previewOutput instance async api
     * @tc.desc      : Create previewOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          photoOutput.release(async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 ends here");
            await sleep(1000);
            done();
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 error`);
      }
    })
  })

}