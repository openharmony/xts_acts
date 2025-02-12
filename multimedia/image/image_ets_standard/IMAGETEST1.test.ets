
    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.NV21,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.NV21,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.RGB_565,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.RGB_565,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.RGBA_8888,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.RGBA_8888,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.BGRA_8888,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.BGRA_8888,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.NV12,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.NV12,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100
     * @tc.name      : testImageSourceGetDesiredAuxiliaryPictures
     * @tc.desc      : Test get desired AuxiliaryPicture from DecodingOptions. 
     *                 Added AuxiliaryPicture type array length abnormal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreatePictureDecodingOptions();
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
        expect(ndkTest.SetDesiredAuxiliaryPictures(0, inAuxTpyes)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to fragment metadata with illegal value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageWidthKey,fragmentImageWidthValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.MetadataSetPropertyErrorCode(xInOriginalKey, xInOriginalValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to fragment metadata with illegal value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageHeightKeyErr, fragmentImageHeightValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.MetadataSetPropertyErrorCode(yInOriginalKeyErr, yInOriginalValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.LINEAR_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testFileFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreateImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg)
          ndkTest.CreatePictureDecodingOptions();
          ndkTest.CreatePictureByImageSource();

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testFileAllAuxiliaryPictures, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreateImageSource(caseName, testFileAllAuxiliaryPictures)
          ndkTest.CreatePictureDecodingOptions();
          ndkTest.CreatePictureByImageSource();

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg);
        expect(ndkTest.CreatePictureByImageSourceWithDecodingOptionIsNull()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from png.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testFilePng);
        ndkTest.CreatePictureDecodingOptions();
        expect(ndkTest.CreatePictureByImageSourceErrorCode()).assertEqual(ErrorCode.IMAGE_DECODE_FAILED);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

        /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100
     * @tc.name      : testDecodePictureFromHeif
     * @tc.desc      : Test decode picture from heif.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.LINEAR_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
                image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
                image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
                image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
                image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreateImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic)
              ndkTest.CreatePictureDecodingOptions();
              ndkTest.CreatePictureByImageSource();
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800', 0, async (done: Function) => {
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            await sleep(1000);
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              testCreateImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic);
              expect(ndkTest.CreatePictureByImageSourceWithDecodingOptionIsNull()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
  })
}