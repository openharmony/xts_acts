
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, GAINMAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100
     * @tc.name      : test picture release 
     * @tc.desc      : 1.create main pixelMap
     *                 2.create picture object by main pixelMap
     *                 3.test release picture 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        picture.release();
        expect(picture.getMainPixelmap() == undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGB_565);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGB_565);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.BGRA_8888);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.BGRA_8888);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_F16);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_F16);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_1010102);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_1010102);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.YCBCR_P010);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.YCBCR_P010);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.YCRCB_P010);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.YCRCB_P010);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.NV21);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.NV21);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.NV12);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.NV12);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have all auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let undefinedTypeList = [];
        testImageSourceCreatePicture(done, logger, "all_auxtype.heic", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have all auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [];
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HDRVividSingleLayer.heic", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300
     * @tc.name      : test picture metadata API error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get metadata error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        await testGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100
     * @tc.name      : test picture packing error
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packing", picture);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100
     * @tc.name      : test picture packToFile error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_txt_01.heic");
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100
     * @tc.name      : test picture packToFile error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.set desiredAuxiliaryPictures is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        try {
          let imageSource: image.ImageSource = await getImageSource("all_auxtype.heic", "fd");
          let picture = await imageSource.createPicture(null);
        } catch (error) {
          logger.log("create picture error" + JSON.stringify(error));
          expect(error.code == PARA_ERROR_CODE).assertTrue();
          done();
        }
      }
    })

    /**
    * @tc.number    : testImageFragmentMapPropertyKey0100
    * @tc.name      : SUB_MULTIMEDIA_IMAGE_FRAGMENT_MAP_PROPERTY_KEY_0100
    * @tc.desc      : 
    * @tc.size      : MediumTest
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_FRAGMENT_MAP_PROPERTY_KEY_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_FRAGMENT_MAP_PROPERTY_KEY_0100"
      let property_X: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.X_IN_ORIGINAL;
      expect(property_X == 'XInOriginal').assertTrue();
      console.info(tag + 'X_IN_ORIGINAL is equal to XInOriginal. ')
      let property_Y: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.Y_IN_ORIGINAL;
      expect(property_Y == 'YInOriginal').assertTrue();
      console.info(tag + ' X_IN_ORIGINAL is equal to YInOriginal. ')
      let property_width: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.WIDTH;
      expect(property_width == 'FragmentImageWidth').assertTrue();
      console.info(tag + ' X_IN_ORIGINAL is equal to FragmentImageWidth. ')
      let property_height: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.HEIGHT;
      expect(property_height == 'FragmentImageHeight').assertTrue();
      console.info(tag + ' X_IN_ORIGINAL is equal to FragmentImageHeight. ')
    })

    /**
    * @tc.number    : testImagePixelMapSetColorSpace0100
    * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100
    * @tc.desc      : 
    * @tc.size      : MediumTest
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.png'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      if (pixelMap != undefined) {
        console.info(tag + ' Succeeded in creating pixelMap.');
        expect(true).assertTrue();
        done();
      } else {
        console.info(tag + ' Succeeded in creating pixelMap.');
        expect().assertFail();
        done();
      }
      try {
        pixelMap.setColorSpace(null!); 
        console.info(tag + ' Succeeded in Setting ColorSpace. Expect fail.');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to set ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(error.code == 62980115).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageApplyColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0100
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'test.png'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      if (pixelMap != undefined) {
        console.info(tag + ' Succeeded in creating pixelMap.');
        expect(true).assertTrue();
        done();
      } else {
        console.info(tag + ' Succeeded in creating pixelMap.');
        expect().assertFail();
        done();
      }
      pixelMap.applyColorSpace(null!).then(() => {
        console.info(tag + ' Succeeded in applying color space for pixelmap object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. error is ${error}`); 
        expect(error).assertEqual(62980115);
        done();
        })
      done();
    })

    /**
     * @tc.number    : testImageApplyColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0200
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0200"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'dog.astc'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      pixelMap.applyColorSpace(targetColorSpace).then(() => {
        console.info(tag + ' Succeeded in applying color space for pixelmap object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. error is ${error}`); 
        if (Number(error) == 62980108) {
          expect(Number(error) == 62980108).assertTrue();
          console.info('Failed to apply color space. Error is 62980108. Check your device.')
          done();
        } else {
          console.info('Error is not 62980108. Error is ' + error)
          expect().assertFail();
          done();
        }
      })
      done();
    })

    /**
     * @tc.number    : testImageApplyColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0300
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0300"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'dog.astc'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      pixelMap.applyColorSpace(targetColorSpace, (error: BusinessError) => {
        if (error == undefined || error == null) {
          console.info(tag + ' Succeeded in applying color space for pixelmap object.');
          expect(true).assertTrue();
          done();
        } else {
          if (Number(error) == 62980108){
            expect(Number(error) == 62980108).assertTrue();
            console.info('Failed to apply color space. Error is 62980108. Check your device.')
            done();
          } else {
            console.info('Error is not 62980108. Error is ' + error)
            expect().assertFail();
            done();
          }
        }
      })
    })

    /**
     * @tc.number    : testImageCreatePixelMapList0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0100
     * @tc.desc      : 1.createPixelMapList(options?: DecodingOptions): Promise<Array<PixelMap>>
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0100"
      let fileName = 'test_code116.jpg'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
      };
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info('Succeeded in creating pixelMapList object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(`Failed to create pixelMapList object. Error is ${error}`);
        expect(Number(error) == 62980116).assertTrue();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageCreatePixelMapList0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0200
     * @tc.desc      : 1.createPixelMapList(options: DecodingOptions, callback: AsyncCallback<Array<PixelMap>>)
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0200"
      let fileName = 'test_code116.jpg'
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
      };
      try {
        let imageSourceApi = await getImageSource(fileName, "uri")
        imageSourceApi.createPixelMapList(decodeOpts, (error: BusinessError, pixelMapList: Array<image.PixelMap>) => {
          if (error) {
            console.error(tag + ` Failed to create pixelMapList object. Callback code is ${error.code}`);
            expect(Number(error.code) == 62980116).assertTrue();
            done();
          } else {
            console.info(tag + ' Succeeded in creating pixelMapList object.');
            expect(false).assertFail();
            done();
          }
        })
      } catch (error) {
        console.info(tag + ' Failed to create pixelMapList object.');
        expect(false).assertFail();
        done();
      }
    })
    
  })
}