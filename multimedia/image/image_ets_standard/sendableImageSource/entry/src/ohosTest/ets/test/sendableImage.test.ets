
    /**
     * @tc.number    : testImageSourceReadPixelsToBuffer0100
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
     * @tc.number    : testImageSourceReadPixelsToBuffer0200
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
        done();
      })
    })

    /**
     * @tc.number    : testImageSourceReadPixels0100
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
     * @tc.number    : testImageSourceCreatePixelMapFromParcel0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_FROM_PARCEL_0100
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMapSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_FROM_PARCEL_0100', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_FROM_PARCEL_0100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let bufferArr: Uint8Array = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = 0x80;
      }
      let opts: image.InitializationOptions = {
      editable: true,
      pixelFormat: 4,
      size: { height: 4, width: 6 },
      alphaType: 3
      }
      let pixelMap: sendableImage.PixelMap | undefined = undefined;
      sendableImage.createPixelMap(color, opts).then((srcPixelMap: sendableImage.PixelMap) => {
        pixelMap = srcPixelMap;
        console.info(tag + " Successed in creating PixelMap. " + pixelMap);
        try {
          let parcelable: MySequence = new MySequence(pixelMap);
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          data.writeParcelable(parcelable);
          let ret: MySequence = new MySequence(pixelMap);
          data.readParcelable(ret);
          let unmarshPixelmap = ret.pixel_map;
          expect(unmarshPixelmap != undefined).assertTrue();
          console.info(tag + " Successed in creating PixelMap from parcel. " + pixelMap);
          done();
        } catch (error) {
          console.info(tag + " Failed to create PixelMap from parcel. " + pixelMap);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number    : testImageSourceCreatePixelMapFromParcel0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_FROM_PARCEL_0200
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMapSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_FROM_PARCEL_0200', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_FROM_PARCEL_0200';
      try {
        sendableImage.createPixelMapFromParcel(undefined!)
        console.info(tag + " Successed in creating PixelMap from parcel. ");
        done();
      } catch (error) {
        console.info(tag + ' Failed to create PixelMap from parcel. error is ' + error + ' error code is ' + error.code);
        expect(error.code == 62980178).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : testImageSourceGetImageInfoSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_0100"
      const color: ArrayBuffer = new ArrayBuffer(96);
      let bufferArr: Uint8Array = new Uint8Array(color);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 4, width: 6 }
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      if (pixelMap != undefined) {
        try {
          let imageInfo = pixelMap.getImageInfoSync();
          console.info(tag + ' Succeeded in getting image info. imageInfo is ' + imageInfo);
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to get image info. error is ${error}`);
          expect().assertFail();
          done();
        }
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.number    : testImageSourceScaleSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0200
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0200"
      const color = new ArrayBuffer(96);
      let scaleX: number = 99.9;
      let scaleY: number = 0.1;
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap = sendableImage.createPixelMapSync(color, opts);
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(error.code == 62980103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceSetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0100
     * @tc.desc      : 
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
     * @tc.number    : testImageSourceSetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0200
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0200"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      try {
        await pixelMap.setColorSpace(undefined!); 
        console.info(tag + ' Succeeded in Setting ColorSpace.');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to set ColorSpace. error is ` + error);
        expect(true).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceSetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0300
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0300"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      try {
        await pixelMap.setColorSpace(null!); 
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
     * @tc.number    : testImageSourceApplyColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0100
     * @tc.desc      : 
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
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. code is ${error.code}, message is ${error.message}`); 
        expect().assertFail();
        done();
        })
      done();
    })

    /**
     * @tc.number    : testImageSourceApplyColorSpace0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0200
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0200"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
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
     * @tc.number    : testImageSourceSizeHeight0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100
     * @tc.desc      : 
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
     * @tc.number    : testImageSourceSizeWidth0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_WIDTH_0100
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_WIDTH_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_WIDTH_0100"
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
     * @tc.desc      : 
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
     * @tc.desc      : 
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
    
    /**
     * @tc.number    : testImageSourceIsStrideAlignment0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_IS_STRIDE_ALIGNMENT_0100
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_IS_STRIDE_ALIGNMENT_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_IS_STRIDE_ALIGNMENT_0100"
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName);
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        let ret = pixelMap.isStrideAlignment
        if (ret == undefined) {
          console.info("pixelMap.isStrideAlignment is undefined");
        } else {
          if (ret == false) {
            console.info("pixelMap.isStrideAlignment is false");
          } else {
            console.info("pixelMap.isStrideAlignment is true");
          }
        }
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` create imageSource failed. error is ${error}`);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImagePixelMapRelease0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100"
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.release().then(() => {
        console.info(tag + ' Succeeded in releasing pixelmap object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + `Failed to release pixelmap object. error is ${error}`);
        expect().assertFail();
        done();
        })
      done();
    })

    /**
     * @tc.number    : testImageReceiverProperty0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_RECEIVER_SIZE_0100
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_RECEIVER_SIZE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_RECEIVER_SIZE_0100"
      let size: image.Size = { height: undefined!, width: undefined! } 
      try {
        let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(tag + ' Succeeded in creating Receive Size. receiver is ' + receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to create Receive. Due to Size. error is ` + error);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : testImageReceiverProperty0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_RECEIVER_FORMAT_0100
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_RECEIVER_FORMAT_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_RECEIVER_FORMAT_0100"
      let size: image.Size = { height: 8192, width: 8 } 
      try {
        let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, undefined!, 8);
        console.info(tag + ' Succeeded in creating Receive Format. receiver is ' + receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to create Receive. Due to Format. error is ` + error);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : testImageReceiverProperty0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_RECEIVER_CAPACITY_0100
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_RECEIVER_CAPACITY_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_RECEIVER_CAPACITY_0100"
      let size: image.Size = { height: 8192, width: 8 } 
      try {
        let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, undefined!);
        console.info(tag + ' Succeeded in creating Receive Capacity. receiver is ' + receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to create Receive. Due to Capacity. error is ` + error);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : testImagePixelMapRelease0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100"
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.release().then(() => {
        console.info(tag + ' Succeeded in releasing pixelmap object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + `Failed to release pixelmap object. error is ${error}`);
        expect().assertFail();
        done();
        })
      done();
    })
 
    /**
     * @tc.number    : testImageSourceReadLatestImage0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_LATEST_IMAGE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_LATEST_IMAGE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_LATEST_IMAGE_0100"
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver.readLatestImage().then((img: image.Image) => {
          console.info(tag + ' readLatestImage succeeded.');
          expect(true).assertTrue();
          done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` readLatestImage failed. error is  ${error}`);
        expect(error).assertUndefined();
        done();
      })
      done();
    })
 
    /**
     * @tc.number    : testImageSourceReadNextImage0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_NEXT_IMAGE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_NEXT_IMAGE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_NEXT_IMAGE_0100"
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver.readNextImage().then((img: image.Image) => {
          console.info(tag + ' readNextImage  succeeded.');
          expect(true).assertTrue();
          done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` readNextImage  failed. error is  ${error}`);
        expect(error).assertUndefined();
        done();
      })
      done();
    })

  })
}