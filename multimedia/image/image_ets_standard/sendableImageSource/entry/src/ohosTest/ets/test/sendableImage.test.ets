/**
     * @tc.number    : testImageSourceOpacity0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0200"
      let rate: number = 1.1;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.opacity(rate).then(() => {
        console.info(tag + ' Succeeded in setting the transparent ratio.')
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.error(tag + ` Failed to set the transparent ratio. error is ` + e);
        expect(e).assertEqual(62980115);
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceOpacity0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0300
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0300"
      let rate: number = -0.1;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.opacity(rate).then(() => {
        console.info(tag + ' Succeeded in setting the transparent ratio.')
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.error(tag + ` Failed to set the transparent ratio. error is ` + e);
        expect(e).assertEqual(62980115);
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceCreateAlphaPixelMap0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_ALPHA_PIXEL_MAP_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_ALPHA_PIXEL_MAP_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_ALPHA_PIXEL_MAP_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6},
        alphaType: 3
      };

      let pixelMap = await sendableImage.createPixelMap(color, opts);
      let alphaPixelmap = pixelMap.createAlphaPixelmap().then((alphaPixelMap: sendableImage.PixelMap) => {
        console.info(tag + ' Succeeded in creating alpha pixelmap. AlphaPixelmap is ' + alphaPixelmap);
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to create alpha pixelmap. error is ` + error);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceScaleSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0100"
      const color = new ArrayBuffer(96);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6},
        scaleMode: 1
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.scaleSync(scaleX, scaleY);
        console.info(tag + ' The image is zoomed in or out.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to zoom in or out the image. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceCrop0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_0100"
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 4, width: 6 }
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.crop(region).then(() => {
        console.info(tag + ' Succeeded in cropping pixelmap.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to crop pixelmap. error is ` + error);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceCropSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0100"
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 4, width: 6 }
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.cropSync(region);
        console.info(tag + ' Succeeded in cropping pixelmap.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to crop pixelmap. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceGetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100"
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap()
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceGetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100"
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap()
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceSetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      try {
        await pixelMap.setColorSpace(csm); 
        console.info(tag + ' Succeeded in Setting ColorSpace.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to set ColorSpace. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceApplyColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      pixelMap.applyColorSpace(targetColorSpace).then(() => {
        console.info(tag + ' Succeeded in applying color space for pixelmap object.');
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. code is ${error.code}, message is ${error.message}`); 
        })
      done();
    })

    /**
     * @tc.number    : testImageSourceSizeHeight0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_AND_WIDTH_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: null!, width: null! }
      };
      try {
        await sendableImage.createPixelMap(color, opts);
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(tag + ' Failed to create the pixel map.' + error);
        expect().assertFail();
        done();
      }
      done();
    })
    
    /**
     * @tc.number    : testImageSourceSizeHeight0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_AND_WIDTH_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: null!, width: null! }
      };
      try {
        await sendableImage.createPixelMap(color, opts);
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(tag + ' Failed to create the pixel map.' + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceRegionSIZE0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 0, width: 0},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        pixelMap.readPixels(area).then(() => {
          console.info(tag + ' Succeeded in reading the image data in the area.');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to read the image data in the area. error is ${error}`);
          expect().assertFail();
          done();
        })
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceRegionSIZE0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0200"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: null!, width: null!},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        pixelMap.readPixels(area).then(() => {
          console.info(tag + ' Succeeded in reading the image data in the area.');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to read the image data in the area. error is ${error}`);
          expect().assertFail();
          done();
        })
      })
      done();
    })
  })
}