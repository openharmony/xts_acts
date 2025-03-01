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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_0100
     * @tc.name      : photo output callback off captureReady
     * @tc.desc      : photo output callback off captureReady
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 打开监听
      photoOutput.on('captureReady', async (err) => {
        console.info(`photo output start listen on captureReady failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('captureReady', async (err) => {
        console.info(`photo output stop listen on captureReady failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on captureReady success`);
      expect(true).assertTrue()
      await sleep(1000);
      done();
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
        videoOutput.setFrameRate(1, 1);
        console.info(`videoOutput set FrameRate success`)
        expect().assertTrue;
      } catch {
        console.info(`videoOutput set FrameRate failed`)
        expect().assertFalse;
      }

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
        videoOutput.setFrameRate(1, 1);
        console.info(`videoOutput set FrameRate success`)
      } catch (err) {
        console.info(`videoOutput set FrameRate failed + + ${JSON.stringify(err)}`)
      }
      
      // 获取激活的帧率范围
      let activeFrameRate = videoOutput.getActiveFrameRate();
      console.info(`videoOutput get FrameRate success:  + ${JSON.stringify(activeFrameRate)}`) 
      expect(activeFrameRate["min"] == 1).assertTrue()

      
      done()
    
    })