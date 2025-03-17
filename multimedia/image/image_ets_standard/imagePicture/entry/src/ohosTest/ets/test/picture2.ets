
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        logger.log("auxinfo: " + JSON.stringify(auxInfo));
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after metadata
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have all auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let undefinedTypeList = [];
        testImageSourceCreatePicture(done, logger, "AllAuxiliaryPictures.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP];
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "CUVAHdrMulti.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary images and store them in the picture
     *                 3.test auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100");
      let size: image.Size = {height: -1, width: -1};
      try {
        let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", size);
        logger.log("gainMapAuxiliaryPicture: " + gainMapAuxiliaryPicture);
        expect(false).assertTrue();
        done();
      } catch (error) {
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test set auxiliaryPicture info
     *                 3.throwing error code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200");
      let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", {height: 960, width: 720});
      try {
        let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: {height: -1, width: 3072},
          rowStride: 10,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        }
        gainMapAuxiliaryPicture!.setAuxiliaryPictureInfo(auxiliaryPictureInfoOrigin);
      } catch (error) {
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test set auxiliaryPicture info
     *                 3.throwing error code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300");
      let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", {height: 960, width: 720});
      try {
        let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: {height: 1536, width: -1},
          rowStride: 10,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        }
        gainMapAuxiliaryPicture!.setAuxiliaryPictureInfo(auxiliaryPictureInfoOrigin);
      } catch (error) {
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100
     * @tc.name      : test picture getHdrComposedPixelmap error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get HdrComposed pixelMap failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100");
      testPictureApiError(done, logger, "testExif.jpg", "buffer", "hdrComposedPixelmap");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300
     * @tc.name      : test picture metadata API error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get metadata error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      await testGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100', 0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100");
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packing", picture);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100");
      let writeFd = await getFdCacheDir("pack_txt_01.jpg");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      let packOpts: image.PackingOption = {format: "image/png", quality: 98};
      await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100
     * @tc.name      : test picture packToFile error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create picture use image format is png
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100");
      try {
        let imageSourceApi: image.ImageSource = await getImageSource("test.png", "uri");
        let picture: image.Picture = await imageSourceApi.createPicture();
        if (picture != undefined) {
          expect(false).assertEqual(true);
          done();
        }
      } catch (error) {
        logger.log("createPicture by imageSource is error: " + JSON.stringify(error) + ", error code is: " + error.code);
        expect(error.code == UNSUPPORTED_DECODE_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer",
            typeList, undefinedTypeList);
      }
    })
  
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200
     * @tc.name      : test ImageSource createPicture decodingOptForPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "uri",
            typeList, undefinedTypeList);
      }
    })
  
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300
     * @tc.name      : test ImageSource createPicture decodingOptForPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "fd",
            typeList, undefinedTypeList);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test haven't auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "buffer");
        for (let i = 0; i < undefinedTypeList.length; i++) {
          let ret = picture?.getAuxiliaryPicture(undefinedTypeList[i]) == undefined;
          logger.log("ret = " + ret)
          expect(ret).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100
     * @tc.name      : test Image createPicture
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.test haven't auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        for (let i = 0; i < undefinedTypeList.length; i++) {
          let ret = picture?.getAuxiliaryPicture(undefinedTypeList[i]) == undefined;
          logger.log("ret = " + ret)
          expect(ret).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary images and store them in the picture
     *                 3.test auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testGetType(done, logger, "0801_sdr2.heic", "fd", typeList);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        testPictureApi(done, logger, "0801_sdr2.heic", "buffer", "mainPixelMap");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100
     * @tc.name      : test picture getHdrComposedPixelmap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get HdrComposed pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "hdrComposedPixelmap");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100
     * @tc.name      : test picture getGainmapPixelmap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get gainmap pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "gainMapPixelMap");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after main pixel map info and metadata 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        testMarshalling(done, logger, picture, "picture", EXIF_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after gainmap pixel map info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        testMarshalling(done, logger, picture, "GAINMAP");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after metadata
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
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
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: await colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
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
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
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
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
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
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
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
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3)
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