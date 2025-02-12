
    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_0800
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with LINEAR.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_0800', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_0800");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 1,
          needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testAllAuxiliaryPicturesExcludeFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_0900
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_0900', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_0900");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testAllAuxiliaryPicturesExcludeFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1000
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with LINEAR.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1000', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1000");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testAllAuxiliaryPicturesExcludeFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1100
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1100', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1100");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testAllAuxiliaryPicturesExcludeFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1200
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with LINEAR.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1200', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_JPEG_1200");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testAllAuxiliaryPicturesExcludeFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0100
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0100', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0100");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 0,
          needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0200
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0200', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0200");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 1,
          needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0300
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0300', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0300");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 0,
          needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0400
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0400', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0400");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 1,
          needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0500
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0500', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0500");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 0,
          needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0600
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0600', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0600");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 1,
          needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0700
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0700', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0700");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 0,
          needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0800
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0800', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0800");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100,
          desiredDynamicRange: 1,
          needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0900
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0900', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_0900");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1000
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1000', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1000");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1100
     * @tc.name      : testPackToDataFromPicture for JPEG
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1100', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1100");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1200
     * @tc.name      : testPackToFileFromPicture for JPEG
     * @tc.desc      : Test pack data to file from picture with FRAGMENT.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1200', 0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_JPEG_1200");
        let packOpt: image.PackingOption = {
          format: imageFormatJpeg,
          quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileFragmentJpg, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0200
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0300
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0300', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0300");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0400
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0400', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0400");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0500
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0500', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0500");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0600
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0600', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0600");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0700
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0700', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0700");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0800
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with only mainPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0800', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0800");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0900
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with MAINPICTURE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0900', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_0900");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1000
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with MAINPICTURE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1000', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1000");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with MAINPICTURE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1200
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with MAINPICTURE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKMAINPICTURE_HEIF_1200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture");
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0200
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0300
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0300', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0300");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0400
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0400', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0400");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0500
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0500', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0500");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0600
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0600', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0600");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0700
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0700', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0700");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0800
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0800', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0800");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0900
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0900', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_0900");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileHdrHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1000
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1000', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1000");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileHdrHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileHdrHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1200
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with GAINMAP
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKGAINMAP_HEIF_1200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileHdrHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [GAINMAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0200
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0300
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0300', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0300");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0400
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0400', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0400");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0500
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0500', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0500");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0600
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0600', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0600");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0700
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0700', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0700");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0800
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0800', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0800");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0900
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0900', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_0900");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1000
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1000', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1000");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1200
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with UNREFOCUS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKUNREFOCUS_HEIF_1200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [UNREFOCUS_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0200
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0300
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0300', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0300");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0400
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0400', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0400");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0500
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0500', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0500");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0600
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0600', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0600");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0700
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0700', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0700");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0800
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0800', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0800");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0900
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0900', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_0900");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1000
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1000', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1000");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1200
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with DEPTH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKDEPTH_HEIF_1200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [DEPTH_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0200
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })