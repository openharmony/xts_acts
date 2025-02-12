
      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300
       * @tc.name      : test pixelmap.scale
       * @tc.desc      : 1.create pixelmap
       *               : 2.call scale-promise
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width * 2) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300',
            'promise', 'scale', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 2.0, 1.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400
       * @tc.name      : test pixelmap.scale callback
       * @tc.desc      : 1.create pixelmap
       *               : 2.call scale-callback
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width * 2) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400',
            'callback', 'scale', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 2.0, 1.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500
       * @tc.name      : test pixelmap.scaleSync
       * @tc.desc      : 1.create pixelmap
       *               : 2.call scaleSync
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width * 2) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500',
            'sync', 'scaleSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 2.0, 1.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600
       * @tc.name      : test pixelmap.translate
       * @tc.desc      : 1.create pixelmap
       *               : 2.call translate -promise
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            if (newInfo.size.width != orgInfo.size.width + 3) {
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600',
            'promise', 'translate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 3.0, 1.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700
       * @tc.name      : test pixelmap.translate callback
       * @tc.desc      : 1.create pixelmap
       *               : 2.call translate -callback
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width + 3) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700',
            'callback', 'translate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 3.0, 1.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800
       * @tc.name      : test pixelmap.translateSync
       * @tc.desc      : 1.create pixelmap
       *               : 2.call translateSync
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width + 3) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800',
            'sync', 'translateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 3.0, 1.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900
       * @tc.name      : test pixelmap.rotate
       * @tc.desc      : 1.create pixelmap
       *               : 2.call rotate -promise
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.height) {
              logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900',
            'promise', 'rotate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 90.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000
       * @tc.name      : test pixelmap.rotate callback
       * @tc.desc      : 1.create pixelmap
       *               : 2.call rotate -callback
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.height) {
              logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000',
            'callback', 'rotate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 90.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100
       * @tc.name      : test pixelmap.rotateSync
       * @tc.desc      : 1.create pixelmap
       *               : 2.call rotateSync
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.height) {
              logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100',
            'sync', 'rotateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 90.0)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200
       * @tc.name      : test pixelmap.flip
       * @tc.desc      : 1.create pixelmap
       *               : 2.call flip -promise
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200',
            'promise', 'flip', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, false, true)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300
       * @tc.name      : test pixelmap.flip callback
       * @tc.desc      : 1.create pixelmap
       *               : 2.call flip -callback
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300',
            'callback', 'flip', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, false, true)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400
       * @tc.name      : test pixelmap.flipSync
       * @tc.desc      : 1.create pixelmap
       *               : 2.call flipSync
       *               : 3.get pixelbytesnumber
       *               : 4.read pixels to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != orgInfo.size.width) {
              logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400',
            'sync', 'flipSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, false, true)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500
       * @tc.name      : test pixelmap.crop
       * @tc.desc      : 1.create PixelMap
       *               : 2.call crop -promise
       *               : 3.getImageInfo
       *               : 4.getPixelBytesNumber
       *               : 5.readPixelsToBuffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != region.size.width) {
              logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500',
            'promise', 'crop', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, region)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600
       * @tc.name      : test pixelmap.crop callback
       * @tc.desc      : 1.create PixelMap
       *               : 2.call crop -callback
       *               : 3.getImageInfo
       *               : 4.getPixelBytesNumber
       *               : 5.readPixelsToBuffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != region.size.width) {
              logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600',
            'callback', 'crop', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, region)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700
       * @tc.name      : test pixelmap.cropSync
       * @tc.desc      : 1.create PixelMap
       *               : 2.call cropSync
       *               : 3.getImageInfo
       *               : 4.getPixelBytesNumber
       *               : 5.readPixelsToBuffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
          let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
            if (newInfo.size.width != region.size.width) {
              logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
              expect(false).assertTrue();
              done();
            }
          }
          await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700',
            'sync', 'cropSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, region)
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800
       * @tc.name      : test pixelmap.release
       * @tc.desc      : 1.create PixelMap
       *               : 2.call release
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800", "CUVAHdrMulti.jpg", RGBA_1010102, "promise");
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900
       * @tc.name      : test pixelmap.release
       * @tc.desc      : 1.create PixelMap
       *               : 2.call release
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900", "HDRVividSingleLayer.heic", YCBCR_P010, "callback");
        }

      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000
       * @tc.name      : test pixelmap.release
       * @tc.desc      : 1.create PixelMap
       *               : 2.call release
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000", "HDRVividSingleLayer.heic", YCRCB_P010, "callback");
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100
       * @tc.name      : test pack pixelmap to file --promise
       * @tc.desc      : 1.create PixelMap
       *               : 2.pack pixelmap to file
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100', 0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100");
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
          expect(true).assertTrue();
          done();
        } else {
          let writeFile = getWriteFile("test_pack_to_file_promise.jpg");
          let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
          testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "promise", "CUVAHdrMulti.jpg", RGBA_1010102);
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200
       * @tc.name      : test pack pixelmap to file --callback
       * @tc.desc      : 1.create PixelMap
       *               : 2.pack pixelmap to file
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200', 0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200");
        if (!isSupportHdr || !isSupportHEICEncode) {
          if (!isSupportHdr) {
            logger.log("device is not support hdr");
          } else {
            logger.log("device is not support heic encode");
          }
          expect(true).assertTrue();
          done();
        } else {
          let writeFile = getWriteFile("test_pack_to_file_callback.heic");
          let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
          testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "callback", "HDRVividSingleLayer.heic", RGBA_1010102);
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300
       * @tc.name      : test pack pixelmap to buffer --promise
       * @tc.desc      : 1.create PixelMap
       *               : 2.pack pixelmap to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300', 0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300");
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
          expect(true).assertTrue();
          done();
        } else {
          let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
          testPack10bitPixelMapToData(done, logger, packOpt, "promise", "HDRVividSingleLayer.heic", RGBA_1010102);
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400
       * @tc.name      : test pack pixelmap to buffer --promise
       * @tc.desc      : 1.create PixelMap
       *               : 2.pack pixelmap to buffer
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400', 0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400");
        if (!isSupportHdr || !isSupportHEICEncode) {
          if (!isSupportHdr) {
            logger.log("device is not support hdr");
          } else {
            logger.log("device is not support heic encode");
          }
          expect(true).assertTrue();
          done();
        } else {
          let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
          testPack10bitPixelMapToData(done, logger, packOpt, "callback", "CUVAHdrMulti.jpg", RGBA_1010102);
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500
       * @tc.name      : test pixelmap.toSdr
       * @tc.desc      : 1.create PixelMap
       *               : 2.call toSdr
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500", "CUVAHdrMulti.jpg", RGBA_1010102);
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600
       * @tc.name      : test pixelmap.toSdr
       * @tc.desc      : 1.create PixelMap
       *               : 2.call toSdr
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600", "HDRVividSingleLayer.heic", YCBCR_P010);
        }
      });

      /**
       * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700
       * @tc.name      : test pixelmap.toSdr
       * @tc.desc      : 1.create PixelMap
       *               : 2.call toSdr
       * @tc.size      : MEDIUM
       * @tc.type      : Functional
       * @tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', 0, async (done: Function) => {
        if (!isSupportHdr) {
          hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', 'device is not support hdr');
          expect(true).assertTrue();
          done();
        } else {
          await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700", "HDRVividSingleLayer.heic", YCRCB_P010);
        }
      });
    })
  }