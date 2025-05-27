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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium'
import ndkTest, { IImageInfo } from 'libImageNdk.so'
import image from "@ohos.multimedia.image";
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';

export default function imageNdkDecodeTest() {
  describe('ImageNdkDecodeTest', () => {
    let globalpixelmap: image.PixelMap;
    let outBuffer: ArrayBuffer = new ArrayBuffer(1200000)
    let testContext: common.UIAbilityContext;
    afterEach(async () => {
      console.info('afterEach case');
    })

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    })

    let filePath: string;
    let fileFd: number;
    let buffer: ArrayBuffer;
    let filesDir: string | undefined

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      fileFd = file.fd;
    }

    const getBuffer = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      buffer = bufferRead
    }

    const Ndk_CropAndScaleStrategyDecode = async (done: Function, filename: string, TAG: string, desiredWidth: number, desiredHeight: number, regionX: number, regionY: number, regionWidth: number, regionHeight: number, cropAndScaleStrategy: number, imageWidth:number, imageHeight:number) => {
      try {
        await getFd(filename);
        let result = await ndkTest.testCropAndScaleStrategy(fileFd, desiredWidth, desiredHeight, regionX, regionY, regionWidth, regionHeight, cropAndScaleStrategy, imageWidth, imageHeight);
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` result is `+ result);
        expect(result == 0).assertTrue();
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test success`);
        done();
      } catch (error) {
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test fail`);
        expect(false).assertTrue();
        done();
      }
    }

    const Ndk_CropAndScaleStrategyDecodeErr = async (done: Function, filename: string, TAG: string, desiredWidth: number, desiredHeight: number, regionX: number, regionY: number, regionWidth: number, regionHeight: number, cropAndScaleStrategy: number) => {
      try {
        await getFd(filename);
        let result = await ndkTest.testCropAndScaleStrategyErr(fileFd, desiredWidth, desiredHeight, regionX, regionY, regionWidth, regionHeight, cropAndScaleStrategy);
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` result is `+ result);
        expect(result == 0).assertTrue();
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test success`);
        done();
      } catch (error) {
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test fail`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0010
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0010", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0010';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_1440x1920.bmp', tag, 800, 800, 0, 0, 500, 1000, 0, 800, 800);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0020
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0020", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0020';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_1440x1920.bmp', tag, 800, 800, 0, 0, 500, 1000, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0030
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0030", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0030';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_1440x1920.bmp', tag, 800, 800, 0, 0, 500, 1000, 2, 800, 800);
    })
    
  })
}