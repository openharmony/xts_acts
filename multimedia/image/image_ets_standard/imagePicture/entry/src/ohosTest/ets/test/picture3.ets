
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010  ,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
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
            pixelFormat: image.PixelMapFormat.RGB_565,
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