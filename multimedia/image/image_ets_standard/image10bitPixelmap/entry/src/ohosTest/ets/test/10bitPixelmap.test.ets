
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000
     * @tc.name      : test pixelmap.createAlphaPixelmap
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000', 0, async (done: Function) => {
      const surfaceId = null; 
      try {
        let pixelMap: image.PixelMap = await image.createPixelMapFromSurface(surfaceId);
        console.error("Expected an ereeror but none was thrown");
        done();
      } catch (error) {
        console.error(`Failed to create the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(Number(error.code) == 62980103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0900
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000',0, async (done: Function) => {
      let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listening succeeded')
    }
    try {
      receiver.on('imageArrival', callbackFunc)
      receiver.off('imageArrival', callbackFunc)
      expect(true).assertTrue()
      done()
    } catch (error) {
      console.info(`Listening error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000',0, async (done: Function) => {
      let creator: image.ImageCreator = image.createImageCreator(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listen succeeded')
    }
    try {
      creator.on('imageRelease', callbackFunc)
      creator.off('imageRelease', callbackFunc)
      expect(true).assertTrue()
      done()
    } catch (error) {
      console.info(`Listen error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })  

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200
     * @tc.name      : test pixelmap.createAlphaPixelmap
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300
     * @tc.name      : test pixelmap.createAlphaPixelmap callback
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400
     * @tc.name      : test pixelmap.createAlphaPixelmapSync
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', 'sync', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500
     * @tc.name      : test RGBA_1010102 pixelmap.setColorSpace and pixelmap.getColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.call getColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500",  "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600
     * @tc.name      : test YCBCR_P010 pixelmap.setColorSpace and pixelmap.getColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.call getColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600",  "CUVAHdrMulti.jpg", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700
     * @tc.name      : test YCRCB_P010 pixelmap.setColorSpace and pixelmap.getColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.call getColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700",  "CUVAHdrMulti.jpg", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800
     * @tc.name      : test pixelmap.applyColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3. call applyColorSpace-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', 1, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900
     * @tc.name      : test pixelmap.applyColorSpace callback
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3. call applyColorSpace-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', 1, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000
     * @tc.name      : test RGBA_1010102 pixelmap.marshalling and pixelmap.unmarshalling
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.marshalling pixelmap into the messageSequence
     *                 5.unmarshalling pixelmap from the messageSequence
     *                 6.return pixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100
     * @tc.name      : test YCBCR_P010 pixelmap.marshalling and pixelmap.unmarshalling
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.marshalling pixelmap into the messageSequence
     *                 5.unmarshalling pixelmap from the messageSequence
     *                 6.return pixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */

    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200
     * @tc.name      : test YCRCB_P010 pixelmap.marshalling and pixelmap.unmarshalling
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.marshalling pixelmap into the messageSequence
     *                 5.unmarshalling pixelmap from the messageSequence
     *                 6.return pixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300
     * @tc.name      : test pixelmap.scale
     * @tc.desc      : 1.create pixelmap
     *               : 2.call scale-promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300',
          'promise', 'scale', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400
     * @tc.name      : test pixelmap.scale callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call scale-callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400',
          'callback', 'scale', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500
     * @tc.name      : test pixelmap.scaleSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call scaleSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500',
          'sync', 'scaleSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600
     * @tc.name      : test pixelmap.translate
     * @tc.desc      : 1.create pixelmap
     *               : 2.call translate -promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
          if (newInfo.size.width != orgInfo.size.width + 3) {
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600',
          'promise', 'translate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700
     * @tc.name      : test pixelmap.translate callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call translate -callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width + 3) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700',
          'callback', 'translate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800
     * @tc.name      : test pixelmap.translateSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call translateSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width + 3) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800',
          'sync', 'translateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900
     * @tc.name      : test pixelmap.rotate
     * @tc.desc      : 1.create pixelmap
     *               : 2.call rotate -promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900',
          'promise', 'rotate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000
     * @tc.name      : test pixelmap.rotate callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call rotate -callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000',
          'callback', 'rotate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100
     * @tc.name      : test pixelmap.rotateSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call rotateSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100',
          'sync', 'rotateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200
     * @tc.name      : test pixelmap.flip
     * @tc.desc      : 1.create pixelmap
     *               : 2.call flip -promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200',
          'promise', 'flip', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, false, true)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300
     * @tc.name      : test pixelmap.flip callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call flip -callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300',
          'callback', 'flip', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, false, true)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400
     * @tc.name      : test pixelmap.flipSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call flipSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400',
          'sync', 'flipSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, false, true)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500
     * @tc.name      : test pixelmap.crop
     * @tc.desc      : 1.create PixelMap
     *               : 2.call crop -promise
     *               : 3.getImageInfo
     *               : 4.getPixelBytesNumber
     *               : 5.readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500',
          'promise', 'crop', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, region)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600
     * @tc.name      : test pixelmap.crop callback
     * @tc.desc      : 1.create PixelMap
     *               : 2.call crop -callback
     *               : 3.getImageInfo
     *               : 4.getPixelBytesNumber
     *               : 5.readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600',
          'callback', 'crop', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, region)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700
     * @tc.name      : test pixelmap.cropSync
     * @tc.desc      : 1.create PixelMap
     *               : 2.call cropSync
     *               : 3.getImageInfo
     *               : 4.getPixelBytesNumber
     *               : 5.readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700',
          'sync', 'cropSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, region)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800
     * @tc.name      : test pixelmap.release
     * @tc.desc      : 1.create PixelMap
     *               : 2.call release
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800", "CUVAHdrMulti.jpg", RGBA_1010102, "promise");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900
     * @tc.name      : test pixelmap.release
     * @tc.desc      : 1.create PixelMap
     *               : 2.call release
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900", "HDRVividSingleLayer.heic", YCBCR_P010, "callback");
      }

    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000
     * @tc.name      : test pixelmap.release
     * @tc.desc      : 1.create PixelMap
     *               : 2.call release
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000", "HDRVividSingleLayer.heic", YCRCB_P010, "callback");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100
     * @tc.name      : test pack pixelmap to file --promise
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to file
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_promise.jpg");
        let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "promise", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200
     * @tc.name      : test pack pixelmap to file --callback
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to file
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200");
      if (!isSupportHdr || !isSupportHEICEncode) {
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
        } else {
          logger.log("device is not support heic encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_callback.heic");
        let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "callback", "HDRVividSingleLayer.heic", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300
     * @tc.name      : test pack pixelmap to buffer --promise
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToData(done, logger, packOpt, "promise", "HDRVividSingleLayer.heic", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400
     * @tc.name      : test pack pixelmap to buffer --promise
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400");
      if (!isSupportHdr || !isSupportHEICEncode) {
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
        } else {
          logger.log("device is not support heic encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToData(done, logger, packOpt, "callback", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500
     * @tc.name      : test pixelmap.toSdr
     * @tc.desc      : 1.create PixelMap
     *               : 2.call toSdr
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600
     * @tc.name      : test pixelmap.toSdr
     * @tc.desc      : 1.create PixelMap
     *               : 2.call toSdr
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800", 0, async (done: Function) => {
      let num =  image.AlphaType.UNPREMUL
      console.info(`AlphaType.UNPREMUL ${num}`)
      expect(num == 3).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900", 0, async (done: Function) => {
      console.info(`----------------SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900--------------`)
      let num =  image.AlphaType.PREMUL
      console.info(`AlphaType.PREMUL ${num}`)
      expect(num == 2).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000", 0, async (done: Function) => {
      console.info(`----------------SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000--------------`)
      let num =  image.AlphaType.UNKNOWN
      console.info(`AlphaType.UNKNOWN ${num}`)
      expect(num == 0).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100", 0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100  -------------`)
      let num =  image.ScaleMode.FIT_TARGET_SIZE
      console.info(`ScaleMode.FIT_TARGET_SIZE ${num}`)
      expect(num == 0).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200", 0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200  -------------`)
      let num =  image.ScaleMode.CENTER_CROP
      console.info(`ScaleMode.CENTER_CROP ${num}`)
      expect(num == 1).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300", 0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300  -------------`)
      let num =  image.ComponentType.YUV_Y
      console.info(`ComponentType.YUV_Y ${num}`)
      expect(num == 1).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400", 0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400  -------------`)
      let num =  image.ComponentType.YUV_U
      console.info(`ComponentType.YUV_U ${num}`)
      expect(num == 2).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500", 0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500  -------------`)
      let num =  image.ComponentType.YUV_V
      console.info(`ComponentType.YUV_V ${num}`)
      expect(num == 3).assertTrue()
      done()
    });
  
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600", 0, async (done: Function) => {
      let low_quality = image.ResolutionQuality.LOW
      expect(low_quality).assertEqual(1);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is low quality.')
      let medium_quality = image.ResolutionQuality.MEDIUM
      expect(medium_quality).assertEqual(2);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is medium quality.')
      let high_quality = image.ResolutionQuality.HIGH
      expect(high_quality).assertEqual(3);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is high quality.')
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900", 0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900  -------------`)
      try {
        image.createPremultipliedPixelMap(null, null)
        done()
      }catch (error) {
        console.error(`failed to createPremultipliedPixelMap: ${error.code},error is ${error}`);
        expect(Number(error) == 401).assertTrue();
        done();}
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700
     * @tc.name      : test pixelmap.toSdr
     * @tc.desc      : 1.create PixelMap
     *               : 2.call toSdr
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });
  })
}