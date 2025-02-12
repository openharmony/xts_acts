
    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200
     * @tc.name      : testAuxiliaryPictureReadPixels
     * @tc.desc      : Test read pixels from AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.RGBA_8888);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300
     * @tc.name      : testAuxiliaryPictureReadPixels
     * @tc.desc      : Test read pixels from AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.NV12);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400
     * @tc.name      : testAuxiliaryPictureReadPixels
     * @tc.desc      : Test read pixels from AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.NV21);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set type to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: image.AuxiliaryPictureType.UNREFOCUS_MAP,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          let newType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
          expect(ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType).assertEqual(newType);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set size to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: 30,
            height: 40,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().width).assertEqual(30);
          expect(ndkTest.AuxiliaryPictureGetInfo().height).assertEqual(40);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set rowStride to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: 20,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().rowStride).assertEqual(20);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set pixelFormat to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat:  image.PixelMapFormat.RGBA_8888
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().pixelFormat).assertEqual(auxInfo.pixelFormat);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set auxiliaryPictureInfo to auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);

        let auxInfo: ndkTest.IAuxInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          width: 10,
          height: 20,
          rowStride: 30,
          pixelFormat: image.PixelMapFormat.RGBA_8888
        };
        expect(ndkTest.AuxiliaryPictureSetInfo(auxInfo)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100
     * @tc.name      : testAuxiliaryPictureGetInfo
     * @tc.desc      : Test get auxiliaryPictureInfo from auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);

        let auxInfo: ndkTest.IAuxInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          width: 10,
          height: 20,
          rowStride: 30,
          pixelFormat: image.PixelMapFormat.RGBA_8888
        };
        ndkTest.AuxiliaryPictureSetInfo(auxInfo);

        expect(ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType).assertEqual(auxInfo.auxiliaryPictureType);
        expect(ndkTest.AuxiliaryPictureGetInfo().width).assertEqual(auxInfo.width);
        expect(ndkTest.AuxiliaryPictureGetInfo().height).assertEqual(auxInfo.height);
        expect(ndkTest.AuxiliaryPictureGetInfo().rowStride).assertEqual(auxInfo.rowStride);
        expect(ndkTest.AuxiliaryPictureGetInfo().pixelFormat).assertEqual(auxInfo.pixelFormat);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100
     * @tc.name      : testAuxiliaryPictureRelease
     * @tc.desc      : Test release the created (GAINMAP/DEPTH_MAP/UNREFOCUS_MAP/LINEAR_MAP/FRAGMENT_MAP) object.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);
 
        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200
     * @tc.name      : testAuxiliaryPictureRelease
     * @tc.desc      : Test release the AuxiliaryPicture added to picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileWithFiveAuxiliaryPictureJpg);

        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100
     * @tc.name      : testAuxiliaryPictureInfoCrerate
     * @tc.desc      : Test create auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        expect(ndkTest.CreateAuxiliaryPictureInfo() != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.GAINMAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.DEPTH_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.UNREFOCUS_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.LINEAR_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.FRAGMENT_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500');
    })


    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600
     * @tc.name      : testAuxiliaryPictureInfoSetType
     * @tc.desc      : Test set illegal type to AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();

        let auxType: number = -1;
        expect(ndkTest.AuxiliaryPictureInfoSetTypeErrorCode(auxType)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100
     * @tc.name      : testAuxiliaryPictureInfoSetSizeGetSize
     * @tc.desc      : Test set and get normal size about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();
        let inSize: image.Size = {height: 15, width: 20};
        expect(ndkTest.AuxiliaryPictureInfoSetSize(inSize)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        let outSize: image.Size = ndkTest.AuxiliaryPictureInfoGetSize();
        expect(outSize.width).assertEqual(inSize.width);
        expect(outSize.height).assertEqual(inSize.height);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100
     * @tc.name      : testAuxiliaryPictureInfoSetRowStrideGetRowStride
     * @tc.desc      : Test set and get normal rowStride about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();
        let rowStride = 40;
        expect(ndkTest.AuxiliaryPictureInfoSetRowStride(rowStride)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.AuxiliaryPictureInfoGetRowStride()).assertEqual(rowStride);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100
     * @tc.name      : testAuxiliaryPictureInfoRelease
     * @tc.desc      : Test release AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();

        expect(ndkTest.ReleaseAuxiliaryPictureInfo()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get exif metadata property from PictureMetadata that contains some wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetProperty(imageLengthKey)).assertEqual(imageLengthValue);
        expect(ndkTest.MetadataGetProperty(imageWidthKey)).assertEqual(imageWidthValue);
        expect(ndkTest.MetadataGetPropertyErrorCode(orientationKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get exif metadata property from PictureMetadata that contains all wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(imageLengthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(imageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(orientationKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get fragment metadata property from PictureMetadata that contains some wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageHeightKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetProperty(xInOriginalKey)).assertEqual(xInOriginalValue);
        expect(ndkTest.MetadataGetProperty(yInOriginalKey)).assertEqual(yInOriginalValue);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get fragment metadata property from PictureMetadata that contains all wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageHeightKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(xInOriginalKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(yInOriginalKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100
     * @tc.name      : testPictureMetadataClone
     * @tc.desc      : Test clone PictureMetadata
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultExifMetadata();

        expect(ndkTest.MetadataClone() != undefined).assertTrue();
        expect(ndkTest.clonedMetadataGetProperty(imageLengthKey))
          .assertEqual(ndkTest.MetadataGetProperty(imageLengthKey));
        expect(ndkTest.clonedMetadataGetProperty(imageWidthKey))
          .assertEqual(ndkTest.MetadataGetProperty(imageWidthKey));
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get UNKNOWN pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.UNKNOWN,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGB_565 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGBA_8888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get BGRA_8888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGB_888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get ALPHA_8 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.ALPHA_8,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGBA_F16 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get NV21 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get NV12 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGBA_1010102 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get YCBCR_P010 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get YCRCB_P010 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200')
    })