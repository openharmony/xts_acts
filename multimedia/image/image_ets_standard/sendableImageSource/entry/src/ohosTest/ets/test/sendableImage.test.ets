
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100
     * @tc.name      : photo output callback on estimatedCaptureDuration
     * @tc.desc      : photo output callback on estimatedCaptureDuration
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100 to operate");

      // 打开监听
      photoOutput.on('estimatedCaptureDuration', async (err) => {
        console.info(`photo output start listen on estimatedCaptureDuration failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on estimatedCaptureDuration success`);
      expect(true).assertTrue()

      await sleep(1000);
      done();
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100
     * @tc.name      : photo output callback off estimatedCaptureDuration
     * @tc.desc      : photo output callback off estimatedCaptureDuration
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100 to operate");

      // 打开监听
      photoOutput.on('estimatedCaptureDuration', async (err) => {
        console.info(`photo output start listen on estimatedCaptureDuration failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('estimatedCaptureDuration', async (err) => {
        console.info(`photo output stop listen on estimatedCaptureDuration failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on estimatedCaptureDuration success`);
      expect(true).assertTrue()
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100
     * @tc.name      : photo output callback on photoAvailable
     * @tc.desc      : photo output callback on photoAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAvailable', async (err) => {
        console.info(`photo output start listen on photoAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on photoAvailable success`);
      expect(true).assertTrue()

      await sleep(1000);
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100
     * @tc.name      : photo output callback off photoAvailable
     * @tc.desc      : photo output callback off photoAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAvailable', async (err) => {
        console.info(`photo output start listen on photoAvailable failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('photoAvailable', async (err) => {
        console.info(`photo output stop listen on photoAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on photoAvailable success`);
      expect(true).assertTrue()
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100
     * @tc.name      : photo output callback on photoAssetAvailable
     * @tc.desc      : photo output callback on photoAssetAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAssetAvailable', async (err) => {
        console.info(`photo output start listen on photoAssetAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on photoAssetAvailable success`);
      expect(true).assertTrue()

      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100
     * @tc.name      : photo output callback off photoAssetAvailable
     * @tc.desc      : photo output callback off photoAssetAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAssetAvailable', async (err) => {
        console.info(`photo output start listen on photoAssetAvailable failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('photoAssetAvailable', async (err) => {
        console.info(`photo output stop listen on photoAssetAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on photoAssetAvailable success`);
      expect(true).assertTrue()
      await sleep(1000);
      done();
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100
     * @tc.name      : photo output callback off captureStart
     * @tc.desc      : photo output callback off captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      
      // 先开启监听
      photoOutput.on('captureStart', async (err) => {
        console.info(`photo output error code: ${err.code}`);
      })

      // 关闭监听
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 to operate");
      let count = 0;
      photoOutput.off('captureStart', async (err, data) => {
        if (!err) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 FAILED: " +
          err.message);
        }
      })
      
      expect(1 == 1).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 success");
      photoOutput.capture();
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100
     * @tc.name      : photo output callback on capture start with info
     * @tc.desc      : photo output callback on capture start with info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100', 1, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 先开启监听
      photoOutput.on('captureStartWithInfo', async (err) => {
        console.info(`photo output error code: ${err.code}`);
      })


      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 to operate");
      let count = 0;
      photoOutput.off('captureStartWithInfo', async (err, data: cameraObj.CaptureStartInfo) => {
        if (!err) {
          expect((!isEmpty(data.captureId)) && (!isEmpty(data.time))).assertTrue();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG +
            "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 FAILED: " +
          err.message);
        }
      })
      expect(1 == 1).assertTrue();
      console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 success");
      photoOutput.capture();
      await sleep(1000);
      done();
    })




    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100
     * @tc.name      : photo output callback off frameShutter
     * @tc.desc      : photo output callback off frameShutter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 先开启监听
      photoOutput.on('frameShutter', async (err, data) => {
        console.info(`photo output error code: ${err.code}`);
      })

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 to operate");
      let count = 0;
      photoOutput.off('frameShutter', async (err, data) => {
        if (!err) {
          count++;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 success");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100, captureId = " +
          data.captureId);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100, timestamp = " +
          data.timestamp);
        } else {
          expect(1 == 1).assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 FAILED: " +
          err.message);
        }
        await sleep(1000);
        done();
      })
      expect(1 == 1).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 success");
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100
     * @tc.name      : photo output callback on frameShutterEnd
     * @tc.desc      : photo output callback on frameShutterEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100 to operate");

      // 打开监听
      photoOutput.on('frameShutterEnd', async (err) => {
        console.info(`photo output start listen on frameShutterEnd failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on frameShutterEnd success`);
      expect(true).assertTrue()

      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100
     * @tc.name      : photo output callback off frameShutterEnd
     * @tc.desc      : photo output callback off frameShutterEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100 to operate");

      // 打开监听
      photoOutput.on('frameShutterEnd', async (err) => {
        console.info(`photo output start listen on frameShutterEnd failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('frameShutterEnd', async (err) => {
        console.info(`photo output stop listen on frameShutterEnd failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on frameShutterEnd success`);
      expect(true).assertTrue()
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100
     * @tc.name      : photo output callback off captureEnd
     * @tc.desc      : photo output callback off captureEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 to operate");

      // 先打开监听
      photoOutput.on('captureEnd', async (err, data) => {
        console.info(`photo output error code: ${err.code}`);
      })
      await sleep(1000)

      let count = 0;
      photoOutput.off('captureEnd', async (err, data) => {
        if (!err) {
          count++;
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100, captureId = " +
          data.captureId);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100, frameCount = " +
          data.frameCount);
        } else {
          expect(1 == 1).assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 FAILED: " +
          err.message);
        }
      })
      expect(1 == 1).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 success");
      await sleep(1000);
      done();

    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_0100
     * @tc.name      : photo output callback on captureReady
     * @tc.desc      : photo output callback on captureReady
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 to operate");

      // 打开监听
      photoOutput.on('captureReady', async (err) => {
        console.info(`photo output start listen on captureReady failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on captureReady success`);
      expect(true).assertTrue()

      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100
     * @tc.name      : photo output callback off error
     * @tc.desc      : photo output callback off error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 先开启监听
      photoOutput.on('error', async (err) => {
        console.info(`photo output error code: ${err.code}`);
      })

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 to operate");
      await sleep(1000);

      // 关闭监听
      photoOutput.off('error', async (err) => {
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 FAILED: " +
          err.message);
          expect(1 == 1).assertFail();
      })
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 success");
      expect(1 == 1).assertTrue();
      await sleep(1000);
      done();
    })





    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_0100
     * @tc.name      : photo output getActiveProfile
     * @tc.desc      : photo output getActiveProfile
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_0100', 1, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 获取激活的配置
      let activeProfile = photoOutput.getActiveProfile()
      console.info(`activeProfile: ${JSON.stringify(activeProfile)}`)

      // 断言
      if (activeProfile) {
        expect(1 == 1).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 success");
      } else {
        expect(1 == 1).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 failed");        
      }
      await sleep(1000);
      done();
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0100
     * @tc.name      : photo output enableMovingPhoto on errorCode
     * @tc.desc      : photo output enableMovingPhoto on errorCode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0200', 1, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0200--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 开启动态图片功能
      try {
        photoOutput.enableMovingPhoto(true)
        expect(true).assertTrue()
        console.info(`photoOutput enableMovingPhoto success`)
      } catch (err) {
        console.info(`photoOutput enableMovingPhoto failed + ${JSON.stringify(err)}`)
        expect(true).assertFalse()
      }

      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300
     * @tc.name      : photo output enableMovingPhoto on errorCode 7400101
     * @tc.desc      : photo output enableMovingPhoto on errorCode 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300', 2, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 开启动态图片功能
      try {
        photoOutput.enableMovingPhoto(null)
        expect(true).assertTrue()
        console.info(`photoOutput enableMovingPhoto success`)
      } catch (err) {
        console.info(`photoOutput enableMovingPhoto failed + ${JSON.stringify(err)}`)
        expect(err.code == 7400101 ).assertTrue()
      }

      await sleep(1000);
      done();
    })    



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_FRAME_SHUTTER_END_INFO_0100
     * @tc.name      : frame shutter end info
     * @tc.desc      : frame shutter end info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300', 2, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 开启动态图片功能
      try {
        photoOutput.enableMovingPhoto(null)
        expect(true).assertTrue()
        console.info(`photoOutput enableMovingPhoto success`)
      } catch (err) {
        console.info(`photoOutput enableMovingPhoto failed + ${JSON.stringify(err)}`)
        expect(err.code == 7400101 ).assertTrue()
      }

      await sleep(1000);
      done();
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100
     * @tc.name      : video output get supported frame rates
     * @tc.desc      : video output get supported frame rates
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100', 1, async (done: Function) => {
      console.info("--------------BEGIN SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100--------------");    

      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
      expect(isEmpty(supportedFrameRates)).assertFalse()
      done()
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0100
     * @tc.name      : video output set frame rate
     * @tc.desc      : video output set frame rate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0100--------------");
      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)

      // 设置帧率范围
      try {
        videoOutput.setFrameRate(supportedFrameRates[0]['min'], supportedFrameRates[0]['max']);
        console.info(`videoOutput set FrameRate success`)
        expect().assertTrue;
      } catch {
        console.info(`videoOutput set FrameRate failed`)
        expect().assertFalse;
      }
      done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200
     * @tc.name      : video output set frame rate with errorCode 7400101
     * @tc.desc      : video output set frame rate with errorCode 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200--------------");
      await getVideoSurface();
      cameraManager = cameraObj.getCameraManager(context);
      let camerasArray = cameraManager.getSupportedCameras();
      if (isEmpty(cameraManager)) {
          console.info(TAG + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager.createSession(cameraObj.SceneMode.NORMAL_VIDEO);
      if (isEmpty(captureSession)) {
          console.info(TAG + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      if (isEmpty(cameraOutputCap)) {
          console.info(TAG + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager.createCameraInput(camerasArray[0]);
      if (isEmpty(cameraInput)) {
          console.info(TAG + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 start createVideoOutput")
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
      } else {
          console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      await cameraInput.open();
      captureSession.beginConfig();
      if (!isEmpty(cameraInput)) {
          console.info(TAG + "Start to addInput");
          captureSession.addInput(cameraInput);
      }
      if (!isEmpty(videoOutput)) {
          console.info(TAG + "Start to addOutput videoOutput");
          captureSession.addOutput(videoOutput);
      }
      await captureSession.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = videoOutput.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await sleep(1000);

        videoOutput.setFrameRate(-1, -1);
        console.info(`videoOutput set FrameRate success`)
        expect(true).assertFalse();
      } catch (err) {
        console.info(`videoOutput set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      await captureSession.release();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 PASS");
      await sleep(1000);
      done();
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0300
     * @tc.name      : video output set frame rate with errorCode 7400110
     * @tc.desc      : video output set frame rate with errorCode 7400110
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0300--------------");
      getCameraDevices()
      // 创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置录制参数, 获取 videoSurfaceId
      await getVideoSurface();
      console.info('videoSurfaceId: ' + videoSurfaceId)
      // 创建VideoOutput对象
      videoOutput = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
      // 创建第二个videoOutput
      let videoOutput2 = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
      //创建会话
      createPhotoSession(cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置会话
      createInput(0);
      if (cameraInput) {
        cameraSession.addInput(cameraInput);
      }
      if (previewOutput) {
        cameraSession.addOutput(previewOutput);
      }
      if (videoOutput) {
        cameraSession.addOutput(videoOutput);
      }
      if (videoOutput2) {
        cameraSession.addOutput(videoOutput2);
      }
      cameraSession.commitConfig();
      cameraSession.start();

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)

      // 设置帧率范围
      try {
        videoOutput2.setFrameRate(supportedFrameRates[0]['min'] + 1, supportedFrameRates[0]['max'] - 1);
        console.info(`videoOutput2 set FrameRate success`)
        expect().assertFail();
      } catch (err) {
        console.info(`videoOutput2 set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS).assertTrue();
        // expect(err.code == 7400110).assertTrue();
      }
      stopCameraSession()
      done()
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_0100
     * @tc.name      : video output get active frame rate
     * @tc.desc      : video output get active frame rate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_0100--------------");    
      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)

      // 设置帧率范围
      try {
        videoOutput.setFrameRate(supportedFrameRates[0]['min'], supportedFrameRates[0]['max']);
        console.info(`videoOutput set FrameRate success`)
      } catch (err) {
        console.info(`videoOutput set FrameRate failed + + ${JSON.stringify(err)}`)
      }
      // 获取激活的帧率范围
      let activeFrameRate = videoOutput.getActiveFrameRate();
      console.info(`videoOutput get FrameRate success:  + ${JSON.stringify(activeFrameRate)}`) 
      expect(activeFrameRate["min"] == supportedFrameRates[0]['min']).assertTrue()
      done()
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


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100
     * @tc.name      : preview output set frame rate
     * @tc.desc      : preview output set frame rate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100--------------");
      cameraManager = cameraObj.getCameraManager(context);
      let camerasArray = cameraManager.getSupportedCameras();
      if (isEmpty(cameraManager)) {
          console.info(TAG + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(captureSession)) {
          console.info(TAG + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(cameraOutputCap)) {
          console.info(TAG + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager.createCameraInput(camerasArray[0]);
      if (isEmpty(cameraInput)) {
          console.info(TAG + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let previewProfiles = cameraOutputCap?.previewProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      previewOutput = cameraManager.createPreviewOutput(previewProfiles, surfaceIds)
      await cameraInput.open();
      captureSession.beginConfig();
      if (!isEmpty(cameraInput)) {
          console.info(TAG + "Start to addInput");
          captureSession.addInput(cameraInput);
      }
      if (!isEmpty(previewOutput)) {
          console.info(TAG + "Start to addOutput previewOutput");
          captureSession.addOutput(previewOutput);
      }
      await captureSession.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = previewOutput.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await sleep(1000);

        previewOutput.setFrameRate(supportedFrameRates[0]['min'] + 1, supportedFrameRates[0]['max'] - 1);
        console.info(`videoOutput set FrameRate success`)
        expect(true).assertTrue();
      } catch (err) {
        console.info(`videoOutput set FrameRate failed: ` + err.code)
        expect().assertFail();
      }
      await captureSession.release();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100 PASS");
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200
     * @tc.name      : preview output set frame rate with errorCode 7400101
     * @tc.desc      : preview output set frame rate with errorCode 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200--------------");
      cameraManager = cameraObj.getCameraManager(context);
      let camerasArray = cameraManager.getSupportedCameras();
      if (isEmpty(cameraManager)) {
          console.info(TAG + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(captureSession)) {
          console.info(TAG + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(cameraOutputCap)) {
          console.info(TAG + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager.createCameraInput(camerasArray[0]);
      if (isEmpty(cameraInput)) {
          console.info(TAG + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let previewProfiles = cameraOutputCap?.previewProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      previewOutput = cameraManager.createPreviewOutput(previewProfiles, surfaceIds)
      await cameraInput.open();
      captureSession.beginConfig();
      if (!isEmpty(cameraInput)) {
          console.info(TAG + "Start to addInput");
          captureSession.addInput(cameraInput);
      }
      if (!isEmpty(previewOutput)) {
          console.info(TAG + "Start to addOutput previewOutput");
          captureSession.addOutput(previewOutput);
      }
      await captureSession.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = previewOutput.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await sleep(1000);

        previewOutput.setFrameRate(-1, -1);
        console.info(`previewOutput set FrameRate success`)
        expect(true).assertFalse();
      } catch (err) {
        console.info(`previewOutput set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      await captureSession.release();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200 PASS");
      await sleep(1000);
      done();
    })
  })
}