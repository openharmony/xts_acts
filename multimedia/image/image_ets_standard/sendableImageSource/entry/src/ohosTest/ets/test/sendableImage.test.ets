/**
     * @tc.number    : testImageSourceCreatePixelMapSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_Sync_0100
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMapSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_Sync_0100', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_Sync_0100';
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      await sendableImage.createPixelMap(color, opts).then(() => {
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.error(tag + ' Failed to create the pixel map.' + e);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceConvertFromPixelMap0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CONVERT_FROM_PIXEL_MAP_0100
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMapSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CONVERT_FROM_PIXEL_MAP_0100', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_SOURCE_CONVERT_FROM_PIXEL_MAP_0100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let sendablePixelMap : sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMap)
      if (sendablePixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue()
        done();
      } else {
          console.error(tag + ' Failed to create the pixel map.');
          expect().assertFail();
          done();
        }
    })

    /**
     * @tc.number    : testImageSourcereadPixelsToBuffer0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0100"
      const readBuffer: ArrayBuffer = new ArrayBuffer(3301488);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        pixelMap.readPixelsToBuffer(readBuffer).then(() => {
          console.info(tag + ' Succeeded in reading image pixel data.');
          expect(true).assertTrue();
          done();
        })
      })
    })

    /**
     * @tc.number    : testImageSourcereadPixelsToBuffer0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0200"
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean')
        if (pixelMap != undefined) {
          pixelMap.readPixelsToBuffer(readBuffer).then(() => {
            console.info(tag + ' Succeeded in reading image pixel data.');
          }).catch((error: BusinessError) => {
            console.error(tag + ` Failed to read image pixel data. errer is ${error}`);
            expect(error).assertEqual(62980115);
            done();
          })
        }
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail();
        done()
      })
    })

    /**
     * @tc.number    : testImageSourcereadPixels0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
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
    })

  /**
     * @tc.number    : testImageSourcereadPixelsSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_SYNC_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          pixelMap.readPixelsSync(area);
          console.info(tag + ' Succeeded in reading the image data in the area.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to read the image data in the area. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceWritePixels0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
          x: 0,
          y: 0}
      };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let bufferArr: Uint8Array = new Uint8Array(area.pixels);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.writePixels(area);
        console.info(tag + ' Succeeded to write pixelmap into the specified area.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to write pixelmap into the specified area. error is ${error}`);
        expect().assertFail();
        done();
      }
  })

  /**
     * @tc.number    : testImageSourceWritePixelsSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_SYNC_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
          x: 0,
          y: 0}
      };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let bufferArr: Uint8Array = new Uint8Array(area.pixels);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.writePixelsSync(area);
        console.info(tag + ' Succeeded to write pixelmap into the specified area.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to write pixelmap into the specified area. error is ${error}`);
        expect().assertFail();
        done();
      }
  })

  /**
     * @tc.number    : testImageSourceWriteBufferToPixelsSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_BUFFER_TO_PIXELS_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_BUFFER_TO_PIXELS_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_BUFFER_TO_PIXELS_SYNC_0100"
      const color: ArrayBuffer = new ArrayBuffer(96);
      let bufferArr: Uint8Array = new Uint8Array(color);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.writeBufferToPixelsSync(color);
        console.info(tag + ' Succeeded in writing data from a buffer to a PixelMap.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to write data from a buffer to a PixelMap. error is ${error}`);
        expect().assertFail();
        done();
        }
    })

    /**
     * @tc.number    : testImageSourceGetBytesNumberPerRow0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_BYTES_NUMBER_PER_ROW_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_BYTES_NUMBER_PER_ROW_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_BYTES_NUMBER_PER_ROW_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          pixelMap.getBytesNumberPerRow();
          console.info(tag + ' Succeeded in obtaining the number of bytes in the row of the image pixel.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to obtain the number of bytes in the row of the image pixel. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceGetPixelBytesNumber0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_PIXEL_BYTES_NUMBER_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_PIXEL_BYTES_NUMBER_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_PIXEL_BYTES_NUMBER_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          pixelMap.getPixelBytesNumber();
          console.info(tag + ' Succeeded in obtaining the total bytes of image pixels.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to obtain the total number of bytes of image pixels. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceGetDensity0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_DENSITY_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_DENSITY_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_DENSITY_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          let density = pixelMap.getDensity();
          console.info(tag + ' Obtaining the pixel density of the current image succeeded.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to obtain the pixel density of the current image. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceOpacity0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0100"
      let rate: number = 0.5;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      await pixelMap.opacity(rate).then(() => {
        console.info(tag + ' Succeeded in setting the transparent ratio.');
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.info(tag + ` Failed to set the transparent ratio. error is ` + e);
        expect().assertFail();
        done();
      })
      done();
    })

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
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        let alphaPixelmap = pixelMap.createAlphaPixelmap();
        console.info(tag + ' The PixelMap containing the alpha channel information is successfully generated. AlphaPixelmap is ' + alphaPixelmap);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to generate the PixelMap that contains the alpha channel information. error is ${error}`);
        expect().assertFail();
        done();
        }
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
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.scaleSync(scaleX, scaleY);
        console.info(tag + ' The image is zoomed in or out.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to zoom in or out the image. error is ${error}`);
        expect().assertFail();
        done();
        }
    })

    /**
     * @tc.number    : testImageSourceScaleSync0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0200"
      const color = new ArrayBuffer(96);
      let scaleX: number = 0;
      let scaleY: number = 0;
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.scaleSync(scaleX, scaleY);
        console.info(tag + ' The image is zoomed in or out.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to zoom in or out the image. error is ${error}`);
        expect().assertFail();
        done();
        }
    })


    /**
     * @tc.number    : testImageSourceScaleSync0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0300
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0300"
      const color = new ArrayBuffer(96);
      let scaleX: number = -1.0;
      let scaleY: number = -1.0;
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.scaleSync(scaleX, scaleY);
        console.info(tag + ' The image is zoomed in or out.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to zoom in or out the image. error is ${error}`);
        expect().assertFail();
        done();
        }
    })
  })
}