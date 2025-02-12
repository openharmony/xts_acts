
    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0300
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0300', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0300");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })    

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0400
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0400', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0400");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })    

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0500
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0500', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0500");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })    

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0600
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0600', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0600");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })    

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0700
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0700', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0700");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })    

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0800
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0800', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0800");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0900
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0900', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_0900");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1000
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1000', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1000");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1200
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with LINEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKLINEAR_HEIF_1200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [LINEAR_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0200
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0300
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0300', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0300");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0400
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0400', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0400");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0500
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0500', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0500");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0600
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0600', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0600");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0700
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0700', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0700");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 0,
            needsPackProperties: true
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0800
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0800', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0800");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100,
            desiredDynamicRange: 1,
            needsPackProperties: false
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0900
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0900', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_0900");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1000
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1000', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1000");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromPixelMap",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1100
     * @tc.name      : testPackToDataFromPicture for HEIF
     * @tc.desc      : Test pack data to ArrayBuffer from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1100', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1100");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToDataFromPicture", [FRAGMENT_MAP]);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1200
     * @tc.name      : testPackToFileFromPicture for HEIF
     * @tc.desc      : Test pack data to file from picture with FRAGMENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
     it('SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1200', 0, async (done: Function) => {
      if (!(isSupportHdr && isSupportHeicEncode)) {
        if (!isSupportHdr) {
          hilog.info(domain, testTag, 'device is not support hdr');
        } else if (!isSupportHeicEncode) {
          hilog.info(domain, testTag, 'device is not support hief decode');
        }
        expect(true).assertTrue();
        done();
      } else {
        let mlg = new Logger("SUB_MULTIMEDIA_PICTURE_NATIVE_PACKFRAGMENT_HEIF_1200");
        let packOpt: image.PackingOption = {
            format: imageFormatHeif,
            quality: 100
        }
        await testNativePackPictureFunc(mlg, done, testFileWithFiveAuxiliaryPictureHeic, "PictureFromImageSource",
          packOpt, "PackToFileFromPicture", [FRAGMENT_MAP]);
      }
    })
  })
}