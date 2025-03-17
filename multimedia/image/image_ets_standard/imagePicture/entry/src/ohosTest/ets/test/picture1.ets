
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100");
      let writeFd = await getFdCacheDir("pack_picture_01.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200");
      let writeFd = await getFdCacheDir("pack_picture_02.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300");
      let writeFd = await getFdCacheDir("pack_picture_03.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400");
      let writeFd = await getFdCacheDir("pack_picture_04.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500");
      let writeFd = await getFdCacheDir("pack_picture_04.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_0100
     * @tc.name      : test picture release 
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test release picture 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_0100', 0, async (done: Function) => {
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      picture.release();
      expect(picture.getMainPixelmap() == undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGB_565);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGB_565);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.BGRA_8888);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.BGRA_8888);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_F16);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_F16);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_1010102);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_1010102);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.YCBCR_P010);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.YCBCR_P010);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.YCRCB_P010);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.YCRCB_P010);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.NV21);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.NV21);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.NV12);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.NV12);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        logger.log("auxinfo: " + JSON.stringify(auxInfo));
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
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
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
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
      }
    });