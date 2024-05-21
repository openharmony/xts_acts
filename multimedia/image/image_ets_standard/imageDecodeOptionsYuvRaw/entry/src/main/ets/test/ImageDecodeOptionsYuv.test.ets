/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

interface newImageInfoSize {
  width?: number,
  height?: number,
}

interface newImageInfo {
  size?: newImageInfoSize,
  pixelFormat?: number,
  colorSpace?: number,
  alphaType?: number,
  density?: number,
  stride?: number,
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function imageDecodeOptionsYuvTest() {
  describe('ImageDecodeOptionsYuv', () => {
    let filePath: string;
    let fdNumber: number;
    let globalPixelMap: PixelMap;
    let result: boolean = false;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      await fs.open(filePath).then(file => {
        fdNumber = file.fd;
        console.info("image case open fd success " + fdNumber);
      })
      await sleep(100);
    }

    const getResult = async (TAG: string, width: number, height: number,
                             desiredPixelFormat: number, serviceName: string) => {
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(TAG + " create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          desiredSize: {
            width: width, height: height
          },
          desiredPixelFormat: desiredPixelFormat,
          index: 0
        };
        switch (serviceName){
          case 'decodingOptions':
            await decodingOptionsCreate(TAG, imageSourceApi, decodingOptions, desiredPixelFormat);
            break
          case 'callBackCreate':
            await callBackCreate(TAG, imageSourceApi, decodingOptions, desiredPixelFormat);
            break
        }
        await sleep(100);
      }
    }

    const decodingOptionsCreate = async (TAG: string, imageSourceApi: image.ImageSource,
                                         decodingOptions: image.DecodingOptions, desiredPixelFormat: number) => {
      result = false;
      await imageSourceApi.createPixelMap(decodingOptions)
        .then(async (pixelMap) => {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo) => {
            let imageInfoStr = JSON.stringify(imageInfo) ;
            let zheImageInfo : newImageInfo = JSON.parse(imageInfoStr) as newImageInfo ;
            let pixelFormat = zheImageInfo?.pixelFormat
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === desiredPixelFormat && (result = true);
          })
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        })
    }

    const callBackCreate = async (TAG: string, imageSourceApi: image.ImageSource,
                                  decodingOptions: image.DecodingOptions, desiredPixelFormat: number) => {
      result = false;
      imageSourceApi.createPixelMap(decodingOptions, async (err : BusinessError, pixelMap : image.PixelMap) => {
        if (!err) {
          globalPixelMap = pixelMap;
          await pixelMap.getImageInfo().then((imageInfo) => {
            let imageInfoStr = JSON.stringify(imageInfo) ;
            let zheImageInfo : newImageInfo = JSON.parse(imageInfoStr) as newImageInfo ;
            let pixelFormat = zheImageInfo?.pixelFormat
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
            pixelFormat === desiredPixelFormat && (result = true);
          })
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
        }
      })
    }

    beforeAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll case');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach case');
    })

    afterEach(async () => {
      fs.closeSync(fdNumber);
      if (globalPixelMap) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'globalPixelMap release start');
        try {
          await globalPixelMap.release();
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'globalPixelMap release fail');
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    })

    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll case');
    })
    
    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100
     * @tc.name      : Test_createPixelMap_decodingOptions_pixelFormat_8_JPEG_444
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100", 0, async (done: Function) => {
      await getFd("test_tree_444.jpg");
      try{
        await getResult('SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100',
          240, 180, 8, 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200
     * @tc.name      : Test_createPixelMap_decodingOptions_pixelFormat_8_NV21_JPEG_ODD_440
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200", 0, async (done: Function) => {
      await getFd("test_treeodd_440.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200",
          240, 180, 8, 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0200 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300
     * @tc.name      : Test_createPixelMap_decodingOptions_pixelFormat_8_NV21_JPEG_422
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300", 0, async (done: Function) => {
      await getFd("test_tree_422.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300",
          240, 180, 8, 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0300 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400
     * @tc.name      : Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_8_NV21_JPEG_ODD_420
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400", 0, async (done: Function) => {
      await getFd("test_treeodd_420.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400",
          240, 180, 8, 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0400 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500
     * @tc.name      : Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_8_NV21_JPEG_411
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500", 0, async (done: Function) => {
      await getFd("test_tree_411.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500",
          240, 180, 8, 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0500 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600
     * @tc.name      : Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_8_NV21_JPEG_ODD_400
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600", 0, async (done: Function) => {
      await getFd("test_treeodd_400.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600",
          240, 180, 8, 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0600 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700
     * @tc.name      : Test_createPixelMap_decodingOptions_pixelFormat_9_NV12_JPEG_444
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700", 0, async (done: Function) => {
      await getFd("test_tree_444.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700",
          480, 180, 9, 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0700 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800
     * @tc.name      : Test_createPixelMap_decodingOptions_pixelFormat_9_NV12_JPEG_ODD_440
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800", 0, async (done: Function) => {
      await getFd("test_treeodd_440.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800",
          480, 180, 9, 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0800 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900
     * @tc.name      : Test_createPixelMap_decodingOptions_pixelFormat_9_NV12_JPEG_422
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900", 0, async (done: Function) => {
      await getFd("test_tree_422.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900",
          480, 180, 9, 'decodingOptions');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_0900 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000
     * @tc.name      : Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_9_NV12_JPEG_ODD_420
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000", 0, async (done: Function) => {
      await getFd("test_treeodd_420.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000",
          480, 180, 9, 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1000 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100
     * @tc.name      : Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_9_NV12_JPEG_411
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100", 0, async (done: Function) => {
      await getFd("test_tree_411.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100",
          480, 180, 9, 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1100 error:' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200
     * @tc.name      : Test_createPixelMap_decodingOptions_asyncCallback_pixelFormat_9_NV12_JPEG_ODD_400
     * @tc.desc      : 1.create imageSource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.callback return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200", 0, async (done: Function) => {
      await getFd("test_treeodd_400.jpg");
      try{
        await getResult("SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200",
          480, 180, 9, 'callBackCreate');
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_YUV_CREATEPIXELMAP_PIXELFORMAT_1200 error:' + e);
        expect().assertFail();
        done();
      }
    });

  })
}
