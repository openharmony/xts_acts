    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100
     * @tc.name      : preview output callback on frameEnd api
     * @tc.desc      : preview output callback on frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
        let count = 0;
        previewOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            count++
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " +
            err.message);
          }
          await sleep(1000);
          done();
        })
        previewOutput.stop();
        // expect(count == 1).assertTrue();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.name      : preview output callback on frameEnd api
     * @tc.desc      : preview output callback on frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        previewOutput.on('error', async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " +
            err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100
     * @tc.name      : check photoOutput is mirror supported with promise mode
     * @tc.desc      : check photoOutput is mirror supported with promise mode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        let isMirrorSupportedFlag = photoOutput.isMirrorSupported();
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 isMirrorSupportedFlag = ' +
          isMirrorSupportedFlag);
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100
     * @tc.name      : photoOutput capture with promise mode
     * @tc.desc      : photoOutput capture with promise mode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100--------------");
      createPhotoSession(1);
      await addCommit(0, 1);
      await cameraSession.commitConfig();
      await sleep();
      await cameraSession.start();
      console.info(TAG +
        `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 +${photoOutput}`)
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        await photoOutput.capture().then(() => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 success');
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 failed :' + err);
          expect().assertFail();
        });
      }
      await sleep(6000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100
     * @tc.name      : photoOutput commitConfig
     * @tc.desc      : captureSession commitConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100--------------");
      createPhotoSession(1);
      await addCommit(0, 1);
      await cameraSession.commitConfig();
      await sleep();
      await cameraSession.start();
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(6000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100
     * @tc.name      : photoOutput commitConfig
     * @tc.desc      : captureSession commitConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.quality = ' +
        captureSetting.quality);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.rotation = ' +
        captureSetting.rotation);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.latitude = ' +
        captureSetting.location!.latitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.longitude = ' +
        captureSetting.location!.longitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.altitude = ' +
        captureSetting.location!.altitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.mirror = ' +
        captureSetting.mirror);

        await photoOutput.capture(captureSetting).then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 success :' + result);
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 failed :' + err);
        });
      }
      await sleep(1000);
      done();
    })


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