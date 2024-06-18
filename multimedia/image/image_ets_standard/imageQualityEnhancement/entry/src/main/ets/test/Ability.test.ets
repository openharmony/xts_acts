import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

interface imageOriInfoSize {
  width: number,
  height: number,
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let filePath: string = "";
    let fdNumber: number = 0;
    let imageOriSize: imageOriInfoSize = {width: 0, height: 0};
    let globalPixelMap: PixelMap | null = null;
    let result: boolean = false;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      await fs.open(filePath).then(file => {
        fdNumber = file.fd;
        console.info("@@@ image case open fd success " + fdNumber);
      })
      await sleep(100);
    }

    const getTestResult = async (TAG: string, resolutionQuality: image.ResolutionQuality, desiredPixelFormat: image.PixelMapFormat,
                                 sizeFactor: number, serviceName: string, decodingDynamicRange: image.DecodingDynamicRange | null = null)=> {
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(TAG + " @@@ create image source failed");
      } else {
        await imageSourceApi.getImageInfo(0)
          .then((imageInfo : image.ImageInfo) => {
            imageOriSize.width = imageInfo.size.width
            imageOriSize.height = imageInfo.size.height
            console.log("@@@ image size is: width, " + imageOriSize.width + " height, " + imageOriSize.height);
          }).catch((error : BusinessError) => {
            console.error("@@@ Get image information failed, code message is: " + error.message);
          })
        let decodingOptions: image.DecodingOptions = {
          desiredSize: {
            width: imageOriSize.width! * sizeFactor,
            height: imageOriSize.height! * sizeFactor
          }
        };
        if (resolutionQuality != null) {
          decodingOptions.resolutionQuality = resolutionQuality
          decodingOptions.desiredPixelFormat = desiredPixelFormat
        }
        if (decodingDynamicRange != null) {
          decodingOptions.desiredDynamicRange = decodingDynamicRange
        }
        switch (serviceName) {
          case 'CheckAisrDecodeWithTargetSize':
            await aisrDecodeWithTargetSize(TAG, imageSourceApi, decodingOptions);
            break
          case 'CheckAihdrDecodeStatus':
            await AihdrDecodeSucceed(TAG, imageSourceApi, decodingOptions);
            break
        }
      }
    }

    const aisrDecodeWithTargetSize = async (TAG: string, imageSourceApi: image.ImageSource,
                                            decodingOptions: image.DecodingOptions) => {
      result = false;
      if (decodingOptions != undefined) {
        await imageSourceApi.createPixelMap(decodingOptions).then(async (pixelMap) => {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then(async (imageInfo) => {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageOriSize:' + JSON.stringify(imageOriSize));
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' desiredSize:' + JSON.stringify(decodingOptions.desiredSize));
            let imageInfoSize = imageInfo.size;
            imageInfoSize.height === decodingOptions!.desiredSize!.height && imageInfoSize.width === decodingOptions!.desiredSize!.width && (result = true);
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo failed ' + JSON.stringify(err));
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, 'testTag', '%{public}s', TAG + ' createPixelMap failed ' + JSON.stringify(err));
          })
        })
      }
    }

    const AihdrDecodeSucceed = async (TAG: string, imageSourceApi: image.ImageSource,
                                      decodingOptions: image.DecodingOptions) => {
      result = false;
      await imageSourceApi.createPixelMap(decodingOptions).then(async (pixelMap) => {
        globalPixelMap = pixelMap;
        let csm: colorSpaceManager.ColorSpaceManager = pixelMap.getColorSpace();
        console.info('Now colorspace is: ' + csm.getColorSpaceName())
        await pixelMap.getImageInfo().then((imageInfo) => {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
          let isHDR = imageInfo.isHdr;
          let pixelmapFormat = imageInfo.pixelFormat;
          // The AIHDR function only takes effect at ODC venues
          (isHDR === true) && (result = true) && (csm.getColorSpaceName() === colorSpaceManager.ColorSpace.LINEAR_BT2020) && (pixelmapFormat === image.PixelMapFormat.RGBA_1010102);
          result = true
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' createPixelMap err ' + JSON.stringify(err));
        })
      })
    }

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      if (globalPixelMap != undefined) {
        console.info("@@@ globalpixelmap release start");
        try {
          await globalPixelMap.release();
        } catch (error) {
          console.error("@@@ globalpixelmap release fail");
        }
      }
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100
     * @tc.name      : TTest_createPixelMap_decodingOptions_aihdr_auto_jpg
     * @tc.desc      : 1.create imageSource
     *                 2.set decodingDynamicRange of DecodeOptions to HDR
     *                 3.create PixelMap and getImageinfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100", 0, async (done: Function) => {
      await getFd("test.jpg");
      try{
        await getTestResult('SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100', 3,
          image.PixelMapFormat.RGBA_8888, 1, 'CheckAihdrDecodeStatus', 2);
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

  })
}
