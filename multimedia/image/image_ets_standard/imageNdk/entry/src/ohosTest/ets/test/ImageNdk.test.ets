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

interface picTypeValue {
  name:string
  fileName:string
  value?:string
  initValue?:string
  modifyData?:string
  compareData?:string
  errorData?: string
}

export default function imageNdkTest() {
  describe('ImageNdkTest', () => {
    let globalpixelmap: image.PixelMap;
    let outBuffer: ArrayBuffer = new ArrayBuffer(1200000)
    let testContext: common.UIAbilityContext;
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
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

    const getImageSource = async(filename:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "Buffer"){
        await getBuffer(filename)
        imageSourceApi = ndkTest.CreateFromData(buffer)
      }else if(type === "Uri"){
        filePath = filesDir + '/' + filename
        imageSourceApi = ndkTest.CreateFromUri(filePath)
      }else if(type === "Rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(filename)
        imageSourceApi = ndkTest.CreateFromRawFile(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length)
      }else{
        await getFd(filename);
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
        fs.closeSync(fileFd) // getFd open fd，创建ImageSource后，close fd。
      }
      return imageSourceApi
    }

    const NDK_CreatePixelMap = async (TAG: string, type:string, filename: string, width: number, height: number,done:Function) => {
      try {
        await getFd(filename);
        let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
        if (type === 'Fd') {
          imageSourceApi = ndkTest.CreateFromFd(fileFd);
        }
        if (type === 'Buffer') {
          await getBuffer(filename);
          imageSourceApi = ndkTest.CreateFromData(buffer);
        }
        if (type === 'RawFile') {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `type = rawfile`)
          const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
          let rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename);
          let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
            rawFileDescriptor.offset, rawFileDescriptor.length);
        }
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
          const pixelMap:image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi)
          if (typeof pixelMap === "object") {
            let result: boolean = false;
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)

            const pixelMapInfo = ndkTest.testGetImageInfo();
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo :' + JSON.stringify(pixelMapInfo));
            let desiredPixelFormat: number = 3
            let alphaType: number = 0
            if (pixelMapInfo.pixelFormat === desiredPixelFormat &&
              pixelMapInfo.width === width &&
              pixelMapInfo.height === height &&
              pixelMapInfo.alphaType === alphaType) {
              result = true
            }
            expect(result).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s',TAG + `pixelMap failed: ${pixelMap}`)
            ndkTest.SourceRelease(imageSourceApi)
            expect(false).assertTrue();
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(TAG + "Test exception " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromUri = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `ndkTest： ` + JSON.stringify(ndkTest))
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath)
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromFd = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', `ndkTest： ` + JSON.stringify(ndkTest))
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromData = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', `ndkTest： ` + JSON.stringify(ndkTest))
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByUri = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                           Regionwidth: number, RegionHeight: number, width: number, height: number,
                                           desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      console.log('-------------------- NDK' + ndkTest)
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let result = ndkTest.AssertImageSize(width, height);
          expect(result == 0).assertTrue();
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap Size is equal to DesiredSize success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByFd = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                          Regionwidth: number, RegionHeight: number, width: number, height: number,
                                          desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let result = ndkTest.AssertImageSize(width, height);
          expect(result == 0).assertTrue();
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap Size is equal to DesiredSize success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi)
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByData = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                            Regionwidth: number, RegionHeight: number, width: number, height: number,
                                            desiredPixelFormat: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let result = ndkTest.AssertImageSize(width, height);
          expect(result == 0).assertTrue();
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap Size is equal to DesiredSize success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }


    const NDK_CreatePixelMapListByUri = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                               Regionwidth: number, RegionHeight: number, width: number, height: number,
                                               desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByFd = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                              Regionwidth: number, RegionHeight: number, width: number, height: number,
                                              desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByData = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                                Regionwidth: number, RegionHeight: number, width: number, height: number,
                                                desiredPixelFormat: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }


    const NDK_GetDelayTime = async (TAG: string, filename: string, type: string, done: Function) => {
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);

      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const delayTime: Array<number> | number = ndkTest.GetDelayTime(imageSourceApi)
        if (Array.isArray(delayTime)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `delayTime success:${delayTime}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `delayTime failed: ${delayTime}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByUri = async (TAG: string, index: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByFd = async (TAG: string, index: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByData = async (TAG: string, index: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageProperty = async (TAG: string, filename: string, type: string, done: Function) => {
      let key = image.PropertyKey.SCENE_TYPE;
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      const imagePropertyRes: String | number = ndkTest.GetImageProperty(imageSourceApi, key);
      if (typeof imagePropertyRes === "string") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imagePropertyRes}`)
        ndkTest.SourceRelease(imageSourceApi);
        expect(true).assertTrue();
        done()
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imagePropertyRes}`)
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done()
      }
    }

    const NDK_ModifyImagePropertyByUri = async (TAG: string, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      let propertyModifyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, image.PropertyKey.ORIENTATION, "4");
      if (propertyModifyRes === 0) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes success:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(true).assertTrue();
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes failed:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_ModifyImagePropertyByFd = async (TAG: string, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      let propertyModifyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, image.PropertyKey.ORIENTATION, "4");
      if (propertyModifyRes === 0) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes success:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(true).assertTrue();
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes failed:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetFrameCount = async (TAG: string, filename: string, type: string, done: Function) => {

      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const frameCount: Array<number> = ndkTest.GetFrameCount(imageSourceApi)
        ndkTest.SourceRelease(imageSourceApi);
        if (Object.values(frameCount)[1] === 0) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `frameCount success: ${Object.values(frameCount)[1]}`)
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `frameCount failed: ${Object.values(frameCount)[1]}`)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_SourceRelease = async (TAG: string, filename: string, type: string, done: Function) => {
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const release = ndkTest.SourceRelease(imageSourceApi)
        if (release === 0) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `release success ${release}`)
          expect(true).assertTrue();
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `release failed: ${release}`)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByOption = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                            Regionwidth: number, RegionHeight: number, width: number, height: number,
                                            desiredPixelFormat: number, done: Function) => {
      let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
      ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
      ndkTest.DecodingOptionsSetIndex(options, index);
      ndkTest.DecodingOptionsSetRotate(options, rotate);
      ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
      ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
      hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `set DecodingOptions success:${options}`)
      const targetFromat: Number = ndkTest.DecodingOptionsGetPixelFormat(options);
      if (targetFromat === desiredPixelFormat) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsFormat success:${targetFromat}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsFormat failed:${targetFromat}`)
        expect(false).assertTrue();
      }

      const targetIndex: number = ndkTest.DecodingOptionsGetIndex(options);
      if (targetIndex === index) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsIndex success:${targetIndex}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsIndex failed:${targetIndex}`)
        expect(false).assertTrue();
      }

      const targetRotate: number = ndkTest.DecodingOptionsGetRotate(options);
      if (targetRotate === rotate) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRotate success:${targetRotate}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRotate failed:${targetRotate}`)
        expect(false).assertTrue();
      }

      const targetSize: image.Size = ndkTest.DecodingOptionsGetDesiredSize(options);
      if (Object.values(targetSize)[0] === width) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsWidth success`);
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsWidth failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetSize)[1] === height) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsHeight success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsHeight failed`)
        expect(false).assertTrue();
      }

      const targetRegion: image.Region = ndkTest.DecodingOptionsGetDesiredRegion(options);
      if (Object.values(targetRegion)[0] === x) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsX success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsX failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[1] === y) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsY success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsY failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[2] === Regionwidth) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionwidth success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionwidth failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[3] === RegionHeight) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionHeight success`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionHeight failed`)
        expect(false).assertTrue();
      }
      done();
    }

    const NDK_CreateFromRawFile = async (TAG: string, filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      resourceMgr.getRawFd(filename).then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
        let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
          rawFileDescriptor.offset, rawFileDescriptor.length);
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
          expect(true).assertTrue();
          done();
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
          expect(false).assertTrue();
          done();
        }
      }).catch((error: BusinessError) => {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source error: ${error.code}`)
        expect(false).assertTrue();
        done()
      })
    }

    const NDK_CreatePixelMapByRawFile = async (TAG: string, index: number, rotate: number, x: number, y: number, Regionwidth: number,
                                               RegionHeight: number, width: number, height: number, desiredPixelFormat: number,
                                               filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      const rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename)
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
        rawFileDescriptor.offset, rawFileDescriptor.length);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByRawFile = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                                   Regionwidth: number, RegionHeight: number, width: number, height: number,
                                                   desiredPixelFormat: number, filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      const rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename)
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
        rawFileDescriptor.offset, rawFileDescriptor.length);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          expect(true).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach((pixelMap) => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          expect(false).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const compResult = (res: Number, done: Function) => {
      if (res === -1 || res === 62980115 || res === 1) {
        expect(false).assertTrue();
        done()
      } else {
        expect(true).assertTrue();
        done()
      }
    }

    const compResultC = (res: Number, done: Function) => {

      if (res !== 0) {
        expect(true).assertTrue();
        done()
      } else {
        expect(false).assertTrue();
        done()
      }
    }

    const closeFile = (fileFd: number) => {
      try {
        fs.closeSync(fileFd)
      } catch (e) {
        console.log("close failed FD ", fileFd)

      }
    }


    const NDK_Packer = async (TAG: string, filename: string, done: Function, apiType: string, dataSource: string,
                              quality: number, mimeType: string, counterExample: boolean): Promise<void> => {

      hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} start`)
      const parker: image.ImagePacker = ndkTest.PackerCreate()
      hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} create packer `)
      if (parker) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} create packer success`)
        await getFd(filename);
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} getFd`)
        const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} imageSource ${imageSourceApi}`)
        if (imageSourceApi) {
          let packOpts: image.PackingOption = ndkTest.CreatePackingOptions()
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} createPackOpts ${imageSourceApi}`)
          const resQuality: number = ndkTest.PackingOptionsSetQuality(packOpts, quality)
          const resMimeType: number = ndkTest.PackingOptionsSetMimeType(packOpts, mimeType)
          ndkTest.PackingOptionsSetNeedsPackProperties(packOpts, 1)
          hilog.info(0x0000, 'scaleTest', '%{public}s', ` ${TAG} res1 res2 test ${resQuality} ${resMimeType}`)
          let res: number
          if (resQuality && resMimeType) {
            expect(false).assertTrue();
          }
          if (dataSource === "pixelMap") {
            const imagesource: image.ImageSource = ndkTest.CreateFromFd(fileFd)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} imageSource ${imagesource}`)
            const DecodingOptions: image.DecodingOptions = ndkTest.CreateDecodingOptions()
            const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imagesource, DecodingOptions)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} pixelMap ${pixelMap}`)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} packOpts ${packOpts}`)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} parker ${parker}`)
            if (apiType === "packing") {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromPixelMap`)
              res = ndkTest.PackToDataFromPixelMap(parker, packOpts, pixelMap, outBuffer)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromPixelMap ${res}`)
            } else {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} .PackToFileFromPixelMap`)
              res = ndkTest.PackToFileFromPixelMap(parker, packOpts, pixelMap, fileFd)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} .PackToFileFromPixelMap ${res}`)
            }
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} 444 `)
          } else {
            if (apiType === "packing") {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromImageSource`)
              res = ndkTest.PackToDataFromImageSource(parker, packOpts, imageSourceApi, outBuffer)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromImageSource res  ${res}`)
            } else {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToFileFromImageSource`)
              res = ndkTest.PackToFileFromImageSource(parker, packOpts, imageSourceApi, fileFd)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToFileFromImageSource ${res}`)
            }
          }
          closeFile(fileFd)
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} packresult ${res}`)
          if (counterExample) {
            return compResultC(res, done)
          }
          return compResult(res, done)
        } else {
          closeFile(fileFd)
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} failed `)
          expect().assertFail()
          done()
        }
      } else {
        closeFile(fileFd)
        expect().assertFail()
        done();
      }
    }

    const CreatePixelMapByHdr = async (TAG: string, done: Function) => {
      await getBuffer("text.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredDynamicRange(options, 2);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let pixelmapDynamic: number = ndkTest.GetPixelMapDynamicRange(pixelMap);
          if (pixelmapDynamic != 0) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `CreatePixelMapByHdr pixelmapDynamic is not zero`)
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `CreatePixelMapByHdr pixelmapDynamic is zero`)
            expect(true).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const PixelMapToSdr = async (TAG: string, done: Function) => {
      await getBuffer("text.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredDynamicRange(options, 2);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let pixelmapDynamic: number = ndkTest.GetPixelMapDynamicRange(pixelMap);
          if (pixelmapDynamic != 0) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `PixelMapToSdr pixelmapDynamic is not zero`)
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `PixelMapToSdr pixelmapDynamic is zero`)
            expect(true).assertTrue();
            let res:number = ndkTest.PixelMapToSdr(pixelMap);
            expect(res == 0).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const DecodingOptionsDesiredDynamic = async (TAG: string, desiredDynamicRange: number, done: Function) => {
      let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
      ndkTest.DecodingOptionsSetDesiredDynamicRange(options, desiredDynamicRange);

      const targetDynamic: number = ndkTest.DecodingOptionsGetDesiredDynamicRange(options);
      if (targetDynamic === desiredDynamicRange) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange success:${targetDynamic}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange failed:${targetDynamic}`)
        expect(false).assertTrue();
      }
      done();
    }

    const PackingOptionsDesiredDynamic = async (TAG: string, desiredDynamicRange: number, done: Function) => {
      let options: image.PackingOption = ndkTest.CreatePackingOptions();
      ndkTest.PackingOptionsSetDesiredDynamicRange(options, desiredDynamicRange);

      const targetDynamic: number = ndkTest.PackingOptionsGetDesiredDynamicRange(options);
      if (targetDynamic === desiredDynamicRange) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange success:${targetDynamic}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange failed:${targetDynamic}`)
        expect(false).assertTrue();
      }
      done();
    }

    const PackingOptionsNeedsPackProperties = async (TAG: string, needsPackProperties: number, done: Function) => {
      let options: image.PackingOption = ndkTest.CreatePackingOptions();
      ndkTest.PackingOptionsSetNeedsPackProperties(options, needsPackProperties);

      const target: number = ndkTest.PackingOptionsGetNeedsPackProperties(options);
      if (needsPackProperties === target) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get needsPackProperties success:${target}`)
        expect(true).assertTrue();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get needsPackProperties failed:${target}`)
        expect(false).assertTrue();
      }
      done();
    }

    const CheckImageSourceDynamicRange = async (TAG: string, done: Function) => {
      await getBuffer("test.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let sourceDynamic:number = ndkTest.GetImageSourceDynamicRange(imageSourceApi);
        if (sourceDynamic != 0) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NATIVE_RegionDecode = async (TAG: string, RegionX: number, RegionY: number,
                                          RegionWidth: number, RegionHeight: number, desiredWidth: number, desiredHeight: number,
                                          filename: string, done: Function, cropStrategy?: number) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'Native_RegionDecodeTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredSize(options, desiredWidth, desiredHeight);
        ndkTest.DecodingOptionsSetDesiredRegion(options, RegionX, RegionY, RegionWidth, RegionHeight);
        if (cropStrategy != undefined) {
          ndkTest.DecodingOptionsGetIndex(options);
          ndkTest.DecodingOptionsSetCropAndScaleStrategy(options, cropStrategy);
          const targetCropStrategy: number = ndkTest.DecodingOptionsGetCropAndScaleStrategy(options);
          expect(targetCropStrategy == cropStrategy).assertTrue();
        }
      const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
      if (typeof pixelMap === "object") {
        expect(true).assertTrue();
        ndkTest.SourceRelease(imageSourceApi)
        ndkTest.PixelMapRelease(pixelMap);
        done()
      } else {
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done()
      }
    } else {
        expect(false).assertTrue();
        done()
    }
  }

  const NDK_GetImagePropertyWithNull = async (TAG: string, filename: string, type:string, key:string, compareValue:string|undefined) => {
      let result = true
      let imageSourceApi: image.ImageSource = await getImageSource(filename, type)
      const imagePropertyRes: String | number = ndkTest.NewGetImagePropertyWithNull(imageSourceApi, key)
      if(typeof imagePropertyRes === "string"){
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`image info success: ${imagePropertyRes}`)
        if(imagePropertyRes === compareValue){
          result = true
        }else{
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`compare value error, getValue: ${imagePropertyRes}, compareValue: ${compareValue}`)
          result = false
        }
      }else{
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`image info fail: ${imagePropertyRes}`)
        result = false
      }
      ndkTest.SourceRelease(imageSourceApi)
      return result
    }
	

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0100
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0100', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0200
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0200', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0300
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0300', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0400
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0400', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0100
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0100', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0200
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0200', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0300
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0300', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0400
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0400', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0500
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0500', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0600
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0600', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0700
     * @tc.name      : testICreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0700', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0800
     * @tc.name      : testICreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0800', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_ReadPixels_0100
     * @tc.name      : testReadPixels
     * @tc.desc      : 1.testReadPixels
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_ReadPixels_0100', Level.LEVEL0, (done: Function) => {
      let pixelmapResult: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(pixelmapResult).assertEqual(0)
      let readBuffer = new ArrayBuffer(96);
      let result: number = ndkTest.testReadPixels(readBuffer)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_WritePixels_0100
     * @tc.name      : testWritePixels
     * @tc.desc      : 1.testWritePixels
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_WritePixels_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let result: number = ndkTest.testWritePixels(color)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_GetImageInfo_0100
     * @tc.name      : testGetImageInfo
     * @tc.desc      : 1.testGetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_GetImageInfo_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let imageInfo: IImageInfo = ndkTest.testGetImageInfo()
      hilog.info(0x0000, 'testTag', '%{public}s', `imageInfo:${JSON.stringify(imageInfo)}`);
      expect(imageInfo).not().assertNull();
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Opacity_0100
     * @tc.name      : testOpacity
     * @tc.desc      : 1.testOpacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Opacity_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testOpacity(90)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Scale_0100
    * @tc.name      : testScale
    * @tc.desc      : 1.testScale
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Scale_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testScale(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Translate_0100
    * @tc.name      : testTranslate
    * @tc.desc      : 1.testTranslate
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Translate_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testTranslate(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Rotate_0100
    * @tc.name      : testRotate
    * @tc.desc      : 1.testRotate
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Rotate_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testRotate(90.0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Flip_0100
     * @tc.name      : testFlip
     * @tc.desc      : 1.testFlip
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Flip_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testFlip(true, true)
      expect(result).assertEqual(0)
      done();
    })

    /*
   * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Crop_0100
   * @tc.name      : testCrop
   * @tc.desc      : 1.testCrop
   * @tc.size      : MediumTest
   * @tc.type      : Function
   * @tc.level     : Level 3
   */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Crop_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testCrop(100, 100, 100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100"
      try {
        await NDK_CreateFromUri(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200'
      try {
        await NDK_CreateFromUri(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300'
      try {
        await NDK_CreateFromUri(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400"
      try {
        await NDK_CreateFromUri(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500'
      try {
        await NDK_CreateFromUri(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600'
      try {
        await NDK_CreateFromUri(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700'
      try {
        await NDK_CreateFromUri(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800'
      try {
        await NDK_CreateFromUri(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100'
      try {
        await NDK_CreateFromFd(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200'
      try {
        await NDK_CreateFromFd(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300'
      try {
        await NDK_CreateFromFd(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400'
      try {
        await NDK_CreateFromFd(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500'
      try {
        await NDK_CreateFromFd(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600'
      try {
        await NDK_CreateFromFd(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700'
      try {
        await NDK_CreateFromFd(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800'
      try {
        await NDK_CreateFromFd(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100'
      try {
        await NDK_CreateFromData(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200'
      try {
        await NDK_CreateFromData(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300"
      try {
        await NDK_CreateFromData(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400'
      try {
        await NDK_CreateFromData(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500'
      try {
        await NDK_CreateFromData(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600'
      try {
        await NDK_CreateFromData(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700"
      try {
        await NDK_CreateFromData(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800'
      try {
        await NDK_CreateFromData(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0100'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0200'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0300'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0400'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0500'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0600'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0700'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0800'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900', "uri", "test5.jpg", 480, 360, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000', "uri", "test7.png", 550, 550, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0100'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0200'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0300'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0400'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0500'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0600'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0700'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0800'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900', "Fd", "test6.gif", 480, 270, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000', "Fd", "test8.bmp", 959, 959, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0100'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0200'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0300'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0400'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0500'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0600'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0700'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0800'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900', "Buffer", "test.webp", 1212, 681, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000', "Buffer", "test.arw", 3074, 2728, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYURI_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYURI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYURI_0100'
      try {
        await NDK_CreatePixelMapListByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYURI_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYURI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYURI_0100'
      try {
        await NDK_CreatePixelMapListByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYFD_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYFD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYFD_0100'
      try {
        await NDK_CreatePixelMapListByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYFD_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYFD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYFD_0100'
      try {
        await NDK_CreatePixelMapListByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYDATA_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYDATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYDATA_0100'
      try {
        await NDK_CreatePixelMapListByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYDATA_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYDATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYDATA_0100'
      try {
        await NDK_CreatePixelMapListByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Buffer", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0200'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100'
      try {
        await NDK_GetImageProperty(testTag, "test_exif_v2.jpg", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200'
      try {
        await NDK_GetImageProperty(testTag, "test_exif_v2.jpg", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_URI_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.ModifyImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_URI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'MODIFY_IMAGE_PROPERTY_URI_0100'
      try {
        await NDK_ModifyImagePropertyByUri(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_FD_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.ModifyImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_FD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'MODIFY_IMAGE_PROPERTY_FD_0100'
      try {
        await NDK_ModifyImagePropertyByFd(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100
     * @tc.name      : GetFrameCount
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetFrameCount
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100'
      try {
        await NDK_GetFrameCount(testTag, "test6.gif", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200
     * @tc.name      : GetFrameCount
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetFrameCount
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200'
      try {
        await NDK_GetFrameCount(testTag, "test6.gif", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromuri
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Buffer", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100
     * @tc.name      : NDK_GetImageInfoByOption
     * @tc.desc      : 1.CreateDecodingOptions,2.DecodingOptionsSetPixelFormat,3.DecodingOptionsSetIndex,
     *                 4.DecodingOptionsSetRotate,5.DecodingOptionsSetDesiredSize,6.DecodingOptionsSetDesiredRegion,
     *                 7.DecodingOptionsGetPixelFormat,8.DecodingOptionsGetIndex9.DecodingOptionsGetRotate,
     *                 10.DecodingOptionsGetDesiredSize,11.DecodingOptionsGetDesiredRegion
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100'
      try {
        await NDK_GetImageInfoByOption('SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100', 0, 90, 0, 0, 100,
          200, 400, 600, 3, done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.ndkTest.Create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100', Level.LEVEL0, async (done: Function) => {
      try {
        const parker: image.ImagePacker = ndkTest.PackerCreate()
        if (parker) {
          expect(true).assertTrue();
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100:${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.ndkTest.Create
     2.ndkTest.Release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      try {
        const parker: image.ImagePacker = ndkTest.PackerCreate()
        if (parker) {
          const release: number = ndkTest.PackerRelease(parker)
          if (release != undefined) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100 success`)
            expect(true).assertTrue();
            done()
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100 failed: `)
            expect(false).assertTrue();
            done()
          }
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100:${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndke
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100,
          "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 100,
          "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300", "test5.jpg", done, "packing", "imageSource", 10,
          "image/jpeg", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10, "image/jpeg", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600", "test5.jpg", done, "packing", "pixelMap", 100,
          "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700", "test5.jpg", done, "packing", "imageSource", 10,
          "image/webp", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10,
          "image/webp", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900", "test5.jpg", done, "packing", "imageSource", 100,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10,
          "image/png", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 10,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile",
          "imageSource", 10, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          10, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile",
          "imageSource", 10, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100'
      try {
        await NDK_CreateFromRawFile(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200'
      try {
        await NDK_CreateFromRawFile(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300'
      try {
        await NDK_CreateFromRawFile(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400'
      try {
        await NDK_CreateFromRawFile(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500'
      try {
        await NDK_CreateFromRawFile(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600'
      try {
        await NDK_CreateFromRawFile(testTag, "test.arw", done);
      }catch(error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700'
      try {
        await NDK_CreateFromRawFile(testTag, "docx.ico", done);
      }catch(error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800'
      try {
        await NDK_CreateFromRawFile(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test8.bmp", done);
      }catch (error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600", Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900', "RawFile", "docx.ico", 512, 512, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000', "RawFile", "SVG.svg", 1593, 1594, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100"
      try {
        await NDK_CreatePixelMapListByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100"
      try {
        await NDK_CreatePixelMapListByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100
     * @tc.name      : sub_multimedia_image_create_hdr
     * @tc.desc      : 1.hdr pixelMap create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100"
      try {
        await CreatePixelMapByHdr(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100
     * @tc.name      : sub_multimedia_pixelmap_tosdr
     * @tc.desc      : 1.hdr pixelMap create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100"
      try {
        await PixelMapToSdr(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_get_decoding_dynamicrange_options
     * @tc.desc      : 1.decodingOptions dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100"
      try {
        await DecodingOptionsDesiredDynamic(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_get_packing_dynamicrange_options
     * @tc.desc      : 1.packingOptions dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100"
      try {
        await PackingOptionsDesiredDynamic(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_check_imagesource_dynamicrange
     * @tc.desc      : 1.imagesource_dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100"
      try {
        await CheckImageSourceDynamicRange(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100
     * @tc.name      : sub_multimedia_image_get_packing_needs_pack_properties_options
     * @tc.desc      : 1.packingOptions needsPackProperties
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100"
      try {
        await PackingOptionsNeedsPackProperties(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done, image.CropAndScaleStrategy.SCALE_FIRST);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done, image.CropAndScaleStrategy.CROP_FIRST);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_SET_AND_GET_CROP_REGION_0100
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetCropRegion,
                      5.DecodingOptionsGetCropRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_SET_CROP_REGION_0100", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_MULTIMEDIA_IMAGE_NATIVE_SET_CROP_REGION_0100'
      let cropRegionSize: image.Size = { width: 800, height: 800 };
      let cropRegion: image.Region = { size: cropRegionSize, x: 0, y: 0 };
      try {
        await getFd("jpeg_test_1440x1920.jpg");
        const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`);
          let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `create image decodingOptions success`);
          ndkTest.DecodingOptionsSetCropRegion(options, cropRegion.x, cropRegion.y, cropRegionSize.width, cropRegionSize.height);
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `set image Crop Region success`);
          let getCropRegion = ndkTest.DecodingOptionsGetCropRegion(options);
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `get image Crop Region success:${JSON.stringify(getCropRegion)}`);
          expect(Object.values(getCropRegion)[0] === cropRegion.x).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `x is equal:${Object.values(getCropRegion)[0]}`);
          expect(Object.values(getCropRegion)[1] === cropRegion.y).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `y is equal:${Object.values(getCropRegion)[1]}`);
          expect(Object.values(getCropRegion)[2] === cropRegionSize.width).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `width is equal:${Object.values(getCropRegion)[2]}`);
          expect(Object.values(getCropRegion)[3] === cropRegionSize.height).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `height is equal:${Object.values(getCropRegion)[3]}`);
          const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
          if (typeof pixelMap === "object") {
            ndkTest.SourceRelease(imageSourceApi)
            ndkTest.PixelMapRelease(pixelMap);
            expect(true).assertTrue();
            done()
          } else {
            ndkTest.SourceRelease(imageSourceApi);
            expect(false).assertTrue();
            done()
          }
        } else {
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `create image source fail:${imageSourceApi}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, TAG, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_GET_PROPERTY_WITH_NULL_0100
     * @tc.name     : GetPropertyWithNull
     * @tc.desc     : 1.check getproperty equal to setProperty
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_GET_PROPERTY_WITH_NULL_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_GET_PROPERTY_WITH_NULL_0100';
      let res = ndkTest.GetPropertyWithNull();
      expect(res == 0).assertTrue();
      hilog.info(0x0000, testTag, `GetPropertyWithNull success`);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_GET_MIMETYPE_WITH_NULL_0100
     * @tc.name     : GetMimeTypeWithNull
     * @tc.desc     : 1.check getMimeType equal to setMimeType
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_GET_MIMETYPE_WITH_NULL_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_GET_MIMETYPE_WITH_NULL_0100';
      let res = ndkTest.GetMimeTypeWithNull();
      expect(res == 0).assertTrue();
      hilog.info(0x0000, testTag, `GetMimeTypeWithNull success`);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_GET_IMAGE_PROPERTY_WITH_NULL_0100
     * @tc.name     : GetImagePropertyWithNull
     * @tc.desc     : 1.check GetImageProperty equal to picture's exif
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_GET_IMAGE_PROPERTY_WITH_NULL_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_GET_IMAGE_PROPERTY_WITH_NULL_0100';
      await getFd("JpegFragmentMap.jpg");
      let res = ndkTest.GetImagePropertyWithNull(fileFd);
      expect(res == 0).assertTrue();
      hilog.info(0x0000, testTag, `GetImagePropertyWithNull success`);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.desc      : 1.test Image getDecodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100";
      const srcSupportedFormatsList: Array<string> = await ndkTest.GetImageSourceSupportedFormats();
      const dstSupportedFormatsList: Array<string> = image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats;
      hilog.info(0x0000, testTag, `srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
      hilog.info(0x0000, testTag, `dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
      const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
      hilog.info(0x0000, testTag, "compare result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.desc      : 1.test Image getEncodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100";
      const srcSupportedFormatsList: Array<string> = await ndkTest.GetImagePackerSupportedFormats();
      const dstSupportedFormatsList: Array<string> = image.createImagePacker().supportedFormats;
      hilog.info(0x0000, testTag, `srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
      hilog.info(0x0000, testTag, `dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
      const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
      hilog.info(0x0000, testTag, "compare result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.desc      : 1.test Image getDecodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100";
      const PARA_ERROR_CODE = 7700204;
      const ret: number = ndkTest.GetImageSourceSupportedFormatsError(true);
      hilog.info(0x0000, testTag, "GetImageSourceSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.desc      : 1.test Image getDecodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200";
      const PARA_ERROR_CODE = 7700204;
      const ret: number = ndkTest.GetImageSourceSupportedFormatsError(false);
      hilog.info(0x0000, testTag, "GetImageSourceSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.desc      : 1.test Image getEncodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100";
      const PARA_ERROR_CODE = 7800202;
      const ret: number = ndkTest.GetImagePackerSupportedFormatsError(true);
      hilog.info(0x0000, testTag, "GetImagePackerSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.desc      : 1.test Image getEncodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200";
      const PARA_ERROR_CODE = 7800202;
      const ret: number = ndkTest.GetImagePackerSupportedFormatsError(false);
      hilog.info(0x0000, testTag, "GetImagePackerSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    	/**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('NewSubfileType')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00100';
      const key = image.PropertyKey.NEW_SUBFILE_TYPE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubfileType')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00200';
      const key = image.PropertyKey.SUBFILE_TYPE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ImageWidth')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00300';
      const key = image.PropertyKey.IMAGE_WIDTH;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3456"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "256"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ImageLength')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00400';
      const key = image.PropertyKey.IMAGE_LENGTH;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4608"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "192"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('BitsPerSample')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00500';
      const key = image.PropertyKey.BITS_PER_SAMPLE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name:"jpeg", fileName:"test_exif_v2.jpg", value:"1, 1, 1"},
        {name:"webp", fileName:"test_exif_v2.webp", value:"8, 8, 8"},
        {name:"png", fileName:"test_exif_v2.png", value:"1, 1, 1"},
        {name:"dng", fileName:"test_exif_v2.dng", value:"8, 8, 8"},
        {name:"heif", fileName:"test_exif_v2.heic", value:"1, 1, 1"}
      ]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Compression')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00600';
      const key = image.PropertyKey.COMPRESSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Uncompressed"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Uncompressed"},
        {name: "png", fileName: "test_exif_v2.png", value: "Uncompressed"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Uncompressed"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Uncompressed"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('PhotometricInterpretation')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00700';
      const key = image.PropertyKey.PHOTOMETRIC_INTERPRETATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Reversed mono"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Reversed mono"},
        {name: "png", fileName: "test_exif_v2.png", value: "Reversed mono"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "RGB"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Reversed mono"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ImageDescription')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00800';
      const key = image.PropertyKey.IMAGE_DESCRIPTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "_cuva%s\\d"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "cuva"},
        {name: "png", fileName: "test_exif_v2.png", value: "_cuva%s\\d"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "_cuva"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "_cuva%s\\d"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Make')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_00900';
      const key = image.PropertyKey.MAKE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "华为"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "华为"},
        {name: "png", fileName: "test_exif_v2.png", value: "华为"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "HUAWEI"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "华为"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Model')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01000';
      const key = image.PropertyKey.MODEL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "TNY-AL00"},
        {name: "webp", fileName: "test_webp_exif.webp", value: "TNY-AL00"},
        {name: "png", fileName: "test_exif_v2.png", value: "TNY-AL00"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "MNA-AL00"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "TNY-AL00"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('StripOffsets')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01100';
      const key = image.PropertyKey.STRIP_OFFSETS;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10348"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Orientation')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01200';
      const key = image.PropertyKey.ORIENTATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Top-left"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Top-right"},
        {name: "png", fileName: "test_exif_v2.png", value: "Top-left"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Top-left"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Top-left"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SamplesPerPixel')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01300';
      const key = image.PropertyKey.SAMPLES_PER_PIXEL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "23"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('RowsPerStrip')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01400';
      const key = image.PropertyKey.ROWS_PER_STRIP;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "192"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('StripByteCounts')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01500';
      const key = image.PropertyKey.STRIP_BYTE_COUNTS;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "147456"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('XResolution')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01600';
      const key = image.PropertyKey.X_RESOLUTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: " 0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "72"},
        {name: "png", fileName: "test_exif_v2.png", value: " 0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "72"},
        {name: "heif", fileName: "test_exif_v2.heic", value: " 0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('YResolution')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01700';
      const key = image.PropertyKey.Y_RESOLUTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: " 0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "72"},
        {name: "png", fileName: "test_exif_v2.png", value: " 0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "72"},
        {name: "heif", fileName: "test_exif_v2.heic", value: " 0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('PlanarConfiguration')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01800';
      const key = image.PropertyKey.PLANAR_CONFIGURATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Chunky format"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Chunky format"},
        {name: "png", fileName: "test_exif_v2.png", value: "Chunky format"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Chunky format"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Chunky format"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ResolutionUnit')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_01900';
      const key = image.PropertyKey.RESOLUTION_UNIT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Inch"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Inch"},
        {name: "png", fileName: "test_exif_v2.png", value: "Inch"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Inch"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Inch"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('TransferFunction')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02000';
      const key = image.PropertyKey.TRANSFER_FUNCTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "3 bytes undefined data"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 bytes undefined data"},
        {name: "png", fileName: "test_exif_v2.png", value: "3 bytes undefined data"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3 bytes undefined data"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Software')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02100';
      const key = image.PropertyKey.SOFTWARE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "华为"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "TNY-AL00"},
        {name: "png", fileName: "test_exif_v2.png", value: "华为"},
        {name: "dng", fileName: "test_exif_v2.dng",
          value: "HUAWEI/MNA-AL00/HWMNA:12/HUAWEIMNA-AL00/104.0.0.56C00:user/release-keys"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "华为"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('DateTime')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02200';
      const key = image.PropertyKey.DATE_TIME;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2022:06:02 15:51:34"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:06:02 15:51:35"},
        {name: "png", fileName: "test_exif_v2.png", value: "2022:06:02 15:51:34"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2023:01:19 10:39:58"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2022:06:02 15:51:34"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Artist')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02300';
      const key = image.PropertyKey.ARTIST;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "None"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Bogdan Hrastnik"},
        {name: "png", fileName: "test_exif_v2.png", value: "None"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Joseph.Xu"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "None"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('WhitePoint')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02400';
      const key = image.PropertyKey.WHITE_POINT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "252, 0/0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "124, 0/0"},
        {name: "png", fileName: "test_exif_v2.png", value: "252, 0/0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "124.2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "252, 0/0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('PrimaryChromaticities')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02500';
      const key = image.PropertyKey.PRIMARY_CHROMATICITIES;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: " 0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "124"},
        {name: "png", fileName: "test_exif_v2.png", value: " 0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "124"},
        {name: "heif", fileName: "test_exif_v2.heic", value: " 0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('PhotoMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02600';
      const key = image.PropertyKey.PHOTO_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "252"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "252"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "252"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "252"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('JPEGInterchangeFormat')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02700';
      const key = image.PropertyKey.JPEG_INTERCHANGE_FORMAT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2798"},
        {name: "webp", fileName: "test_webp_exif.webp", value: "1252"},
        {name: "png", fileName: "test_exif_v2.png", value: "2798"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10344"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2798"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error JPEGInterchangeFormat ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('JPEGInterchangeFormatLength')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02800';
      const key = image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4"},
        {name: "webp", fileName: "test_webp_exif.webp", value: "24042"},
        {name: "png", fileName: "test_exif_v2.png", value: "4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error JPEGInterchangeFormatLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('YCbCrCoefficients')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_02900';
      const key = image.PropertyKey.YCBCR_COEFFICIENTS;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0.299, 0.587, 0.114"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.299, 0.587, 0.114"},
        {name: "png", fileName: "test_exif_v2.png", value: "0.299, 0.587, 0.114"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0.299, 0.587, 0.114"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0.299, 0.587, 0.114"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('YCbCrSubSampling')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03000';
      const key = image.PropertyKey.YCBCR_SUB_SAMPLING;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3, 2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3, 3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3, 2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3, 2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3, 2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('YCbCrPositioning')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03100';
      const key = image.PropertyKey.YCBCR_POSITIONING;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Centered"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Centered"},
        {name: "png", fileName: "test_exif_v2.png", value: "Centered"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Centered"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Centered"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ReferenceBlackWhite')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03200';
      const key = image.PropertyKey.REFERENCE_BLACK_WHITE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "222,  0, 1.5,  0, 25.2, 25.2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "221, 255,  0, 255,  0, 255"},
        {name: "png", fileName: "test_exif_v2.png", value: "222,  0, 1.5,  0, 25.2, 25.2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "221"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "222,  0, 1.5,  0, 25.2, 25.2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Copyright')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03300';
      const key = image.PropertyKey.COPYRIGHT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "undefined (Photographer) - [None] (Editor)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "ABB (Photographer) - [None] (Editor)"},
        {name: "png", fileName: "test_exif_v2.png", value: "undefined (Photographer) - [None] (Editor)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Hw (Photographer) - [None] (Editor)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "undefined (Photographer) - [None] (Editor)"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ExposureTime')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03400';
      const key = image.PropertyKey.EXPOSURE_TIME;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxxw"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxxw"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxxw"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FNumber')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03500';
      const key = image.PropertyKey.F_NUMBER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "f/1.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "f/1.8"},
        {name: "png", fileName: "test_exif_v2.png", value: "f/1.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "f/2.0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "f/1.0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ExposureProgram')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03600';
      const key = image.PropertyKey.EXPOSURE_PROGRAM;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Not defined"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal program"},
        {name: "png", fileName: "test_exif_v2.png", value: "Not defined"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal program"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Not defined"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SpectralSensitivity')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03700';
      const key = image.PropertyKey.SPECTRAL_SENSITIVITY;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "abc"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "sensitivity"},
        {name: "png", fileName: "test_exif_v2.png", value: "abc"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "sensitivity"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "abc"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSVersionID')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03800';
      const key = image.PropertyKey.GPS_VERSION_ID;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.2.0.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2.2.0.0"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.2.0.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.2.0.0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.2.0.0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSLatitudeRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_03900';
      const key = image.PropertyKey.GPS_LATITUDE_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "N"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "N"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSLatitude')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04000';
      const key = image.PropertyKey.GPS_LATITUDE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "N"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "N"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSLongitudeRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04100';
      const key = image.PropertyKey.GPS_LONGITUDE_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "E"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "W"},
        {name: "png", fileName: "test_exif_v2.png", value: "E"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "E"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "E"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSLongitude')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04200';
      const key = image.PropertyKey.GPS_LONGITUDE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "120, 52, 26"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "120, 52, 26"},
        {name: "png", fileName: "test_exif_v2.png", value: "120, 52, 26"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "120, 52, 26"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "120, 52, 26"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSAltitudeRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04300';
      const key = image.PropertyKey.GPS_ALTITUDE_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Sea level"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Sea level reference"},
        {name: "png", fileName: "test_exif_v2.png", value: "Sea level"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Sea level reference"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Sea level"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSAltitude')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04400';
      const key = image.PropertyKey.GPS_ALTITUDE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Sea level"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Sea level reference"},
        {name: "png", fileName: "test_exif_v2.png", value: "Sea level"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Sea level reference"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Sea level"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSTimeStamp')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04500';
      const key = image.PropertyKey.GPS_TIME_STAMP;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "11:37:58.00"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "11:37:58.00"},
        {name: "png", fileName: "test_exif_v2.png", value: "11:37:58.00"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "11:37:56.00"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "11:37:58.00"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSSatellites')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04600';
      const key = image.PropertyKey.GPS_SATELLITES;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "BBA"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxx"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSSatellites ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSStatus')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04700';
      const key = image.PropertyKey.GPS_STATUS;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "A"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "A"},
        {name: "png", fileName: "test_exif_v2.png", value: "A"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "A"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "A"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSMeasureMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04800';
      const key = image.PropertyKey.GPS_MEASURE_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDOP')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_04900';
      const key = image.PropertyKey.GPS_DOP;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "182"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "182"},
        {name: "png", fileName: "test_exif_v2.png", value: "182"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "182"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "182"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSSpeedRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05000';
      const key = image.PropertyKey.GPS_SPEED_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "K"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "K"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSSpeed')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05100';
      const key = image.PropertyKey.GPS_SPEED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "150"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "150"},
        {name: "png", fileName: "test_exif_v2.png", value: "150"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "150"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "150"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSTrackRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05200';
      const key = image.PropertyKey.GPS_TRACK_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "T"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "T"},
        {name: "png", fileName: "test_exif_v2.png", value: "T"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "T"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "T"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSTrack')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05300';
      const key = image.PropertyKey.GPS_TRACK;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "38.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "111"},
        {name: "png", fileName: "test_exif_v2.png", value: "38.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "56"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "38.0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSImgDirectionRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05400';
      const key = image.PropertyKey.GPS_IMG_DIRECTION_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "M"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "M"},
        {name: "png", fileName: "test_exif_v2.png", value: "M"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "M"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "M"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSImgDirection')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05500';
      const key = image.PropertyKey.GPS_IMG_DIRECTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.23"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2.23"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.23"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.23214"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.23"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSMapDatum')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05600';
      const key = image.PropertyKey.GPS_MAP_DATUM;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "TEST"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxx"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestLatitudeRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05700';
      const key = image.PropertyKey.GPS_DEST_LATITUDE_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "S"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "N"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestLatitude')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05800';
      const key = image.PropertyKey.GPS_DEST_LATITUDE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "33, 22, 11"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "33, 22, 11"},
        {name: "png", fileName: "test_exif_v2.png", value: "33, 22, 11"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "33, 22, 11"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "33, 22, 11"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestLongitudeRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_05900';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "E"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "W"},
        {name: "png", fileName: "test_exif_v2.png", value: "E"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "E"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "E"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestLongitude')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06000';
      const key = image.PropertyKey.GPS_DEST_LONGITUDE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "E"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "W"},
        {name: "png", fileName: "test_exif_v2.png", value: "E"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "E"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "E"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestBearingRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06100';
      const key = image.PropertyKey.GPS_DEST_BEARING_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "T"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "M"},
        {name: "png", fileName: "test_exif_v2.png", value: "T"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "T"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "T"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestBearingRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestBearing')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06200';
      const key = image.PropertyKey.GPS_DEST_BEARING;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2.0"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestDistanceRef')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06300';
      const key = image.PropertyKey.GPS_DEST_DISTANCE_REF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "N"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "K"},
        {name: "png", fileName: "test_exif_v2.png", value: "N"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "N"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "N"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDestDistance')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06400';
      const key = image.PropertyKey.GPS_DEST_DISTANCE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "10"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "10"},
        {name: "png", fileName: "test_exif_v2.png", value: "10"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "10"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSProcessingMethod')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06500';
      const key = image.PropertyKey.GPS_PROCESSING_METHOD;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "CELLID"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "CELLID"},
        {name: "png", fileName: "test_exif_v2.png", value: "CELLID"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "GPS"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "CELLID"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSAreaInformation')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06600';
      const key = image.PropertyKey.GPS_AREA_INFORMATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "arexxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "accxx"},
        {name: "png", fileName: "test_exif_v2.png", value: "arexxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "23...15...57"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "arexxx"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDateStamp')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06700';
      const key = image.PropertyKey.GPS_DATE_STAMP;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2025:01:11"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:01:11"},
        {name: "png", fileName: "test_exif_v2.png", value: "2025:01:11"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2023:10:19"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2025:01:11"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSDifferential')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06800';
      const key = image.PropertyKey.GPS_DIFFERENTIAL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GPSHPositioningError')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_06900';
      const key = image.PropertyKey.GPS_H_POSITIONING_ERROR;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: " 2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.5"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('PhotographicSensitivity')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07100';
      const key = image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "200"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "205"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('OECF')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07200';
      const key = image.PropertyKey.OECF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4 bytes undefined data"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2 bytes undefined data"},
        {name: "png", fileName: "test_exif_v2.png", value: "4 bytes undefined data"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 bytes undefined data"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4 bytes undefined data"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SensitivityType')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07300';
      const key = image.PropertyKey.SENSITIVITY_TYPE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "png", fileName: "test_exif_v2.png", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Standard output sensitivity (SOS) and ISO speed"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Standard output sensitivity (SOS) and ISO speed"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('StandardOutputSensitivity')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07400';
      const key = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5"},
        {name: "png", fileName: "test_exif_v2.png", value: "5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('RecommendedExposureIndex')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07500';
      const key = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "241"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "241"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ISOSpeedRatings')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07600';
      const key = image.PropertyKey.ISO_SPEED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "200"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "205"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ISOSpeedLatitudeyyy')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07700';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_YYY;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1456"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "1456"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1456"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ISOSpeedLatitudezzz')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07800';
      const key = image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1456"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "1456"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1456"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ExifVersion')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_07900';
      const key = image.PropertyKey.EXIF_VERSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Exif Version 1.1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Exif Version 1.1"},
        {name: "png", fileName: "test_exif_v2.png", value: "Exif Version 1.1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Exif Version 2.2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Exif Version 1.1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('DateTimeOriginal')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08000';
      const key = image.PropertyKey.DATE_TIME_ORIGINAL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2024:01:25 05:51:34"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:06:02 15:51:35"},
        {name: "png", fileName: "test_exif_v2.png", value: "2024:01:25 05:51:34"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2024:04:18 18:18:43"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2024:01:25 05:51:34"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('DateTimeDigitized')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08100';
      const key = image.PropertyKey.DATE_TIME_DIGITIZED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2022:06:02 15:51:34"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2022:06:02 15:51:35"},
        {name: "png", fileName: "test_exif_v2.png", value: "2022:06:02 15:51:34"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2023:01:19 10:39:58"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2022:06:02 15:51:34"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('OffsetTime')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08200';
      const key = image.PropertyKey.OFFSET_TIME;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2024:01:25"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "111"},
        {name: "png", fileName: "test_exif_v2.png", value: "2024:01:25"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2024:01:25"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('OffsetTimeOriginal')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08300';
      const key = image.PropertyKey.OFFSET_TIME_ORIGINAL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "chex"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "00xx"},
        {name: "png", fileName: "test_exif_v2.png", value: "chex"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "chex"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('OffsetTimeDigitized')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08400';
      const key = image.PropertyKey.OFFSET_TIME_DIGITIZED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "cfh"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "abs"},
        {name: "png", fileName: "test_exif_v2.png", value: "cfh"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "cfh"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ComponentsConfiguration')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08500';
      const key = image.PropertyKey.COMPONENTS_CONFIGURATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Y R G B"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Y R G B"},
        {name: "png", fileName: "test_exif_v2.png", value: "Y R G B"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "R G B -"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Y R G B"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('CompressedBitsPerPixel')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08600';
      const key = image.PropertyKey.COMPRESSED_BITS_PER_PIXEL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "24"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.95"},
        {name: "png", fileName: "test_exif_v2.png", value: "24"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1.5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "24"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ShutterSpeedValue')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08700';
      const key = image.PropertyKey.SHUTTER_SPEED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.50 EV (1/6 sec.)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "14.00 EV (1/16384 sec.)"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.50 EV (1/6 sec.)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6.64 EV (1/100 sec.)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.50 EV (1/6 sec.)"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ApertureValue')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08800';
      const key = image.PropertyKey.APERTURE_VALUE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.50 EV (f/2.4)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.69 EV (f/1.8)"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.50 EV (f/2.4)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0.08 EV (f/1.0)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.50 EV (f/2.4)"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('BrightnessValue')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_08900';
      const key = image.PropertyKey.BRIGHTNESS_VALUE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.50 EV (19.38 cd/m^2)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.00 EV (3.43 cd/m^2)"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.50 EV (19.38 cd/m^2)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.50 EV (19.38 cd/m^2)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.50 EV (19.38 cd/m^2)"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ExposureBiasValue')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09000';
      const key = image.PropertyKey.EXPOSURE_BIAS_VALUE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "23.00 EV"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "0.00 EV"},
        {name: "png", fileName: "test_exif_v2.png", value: "23.00 EV"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "23.00 EV"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "23.00 EV"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('MaxApertureValue')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09100';
      const key = image.PropertyKey.MAX_APERTURE_VALUE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.50 EV (f/2.4)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.69 EV (f/1.8)"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.50 EV (f/2.4)"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0.08 EV (f/1.0)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.50 EV (f/2.4)"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubjectDistance')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09200';
      const key = image.PropertyKey.SUBJECT_DISTANCE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.5 m"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "25.0 m"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.5 m"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2.5 m"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.5 m"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('MeteringMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09300';
      const key = image.PropertyKey.METERING_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Pattern"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Pattern"},
        {name: "png", fileName: "test_exif_v2.png", value: "Pattern"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Pattern"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Pattern"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('LightSource')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09400';
      const key = image.PropertyKey.LIGHT_SOURCE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Daylight"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Daylight"},
        {name: "png", fileName: "test_exif_v2.png", value: "Daylight"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Fluorescent"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Daylight"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Flash')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09500';
      const key = image.PropertyKey.FLASH;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "Strobe return light not detected"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Flash did not fire, auto mode"},
        {name: "png", fileName: "test_exif_v2.png", value: "Strobe return light not detected"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Strobe return light not detected"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Strobe return light not detected"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FocalLength')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09600';
      const key = image.PropertyKey.FOCAL_LENGTH;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0.0 mm"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "31.0 mm"},
        {name: "png", fileName: "test_exif_v2.png", value: "0.0 mm"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6.3 mm"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0.0 mm"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubjectArea')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09700';
      const key = image.PropertyKey.SUBJECT_AREA;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "(x,y) = (12,13)"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "(x,y) = (10,20)"},
        {name: "png", fileName: "test_exif_v2.png", value: "(x,y) = (12,13)"},
        {name: "dng", fileName: "test_exif_v2.dng",
          value: "Within rectangle (width 2318, height 1390) around (x,y) = (2009,1506)"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "(x,y) = (12,13)"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('MakerNote')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09800';
      const key = image.PropertyKey.MAKER_NOTE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg",
        value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' +
          'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,' +
          'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "webp", fileName: "test_exif_v2.webp", value: "HwMnoteCaptureMode:1,HwMnoteBurstNumber:2," +
          "HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7," +
          "HwMnoteFacePointer:122,HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3," +
          "HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8," +
          "HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8," +
          "HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,HwMnoteSceneStageConf:3," +
          "HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,HwMnoteSceneSnowConf:7," +
          "HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,HwMnoteSceneTextConf:11"},
        {name: "png", fileName: "test_exif_v2.png", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
          'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,' +
          'HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "dng", fileName: "test_exif_v2.dng", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:' +
          '3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,' +
          'HwMnoteWindSnapshotMode:8,HwMnoteFacePointer:166,HwMnoteFaceVersion:1,' +
          'HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:300,' +
          'HwMnoteSceneVersion:1,' + 'HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "heif", fileName: "test_exif_v2.heic", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' + 'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
          'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,' +
          'HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' + 'HwMnoteSceneStageConf:3,' +
          'HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error MakerNote ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteScenePointer')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_09900';
      const key = image.PropertyKey.SCENE_POINTER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "256"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "256"},
        {name: "png", fileName: "test_exif_v2.png", value: "256"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "300"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "256"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteScenePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneVersion')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10000';
      const key = image.PropertyKey.SCENE_VERSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneFoodConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10100';
      const key = image.PropertyKey.SCENE_FOOD_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneFoodConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneStageConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10200';
      const key = image.PropertyKey.SCENE_STAGE_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneStageConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneBlueSkyConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10300';
      const key = image.PropertyKey.SCENE_BLUE_SKY_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4"},
        {name: "png", fileName: "test_exif_v2.png", value: "4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneBlueSkyConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneGreenPlantConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10400';
      const key = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5"},
        {name: "png", fileName: "test_exif_v2.png", value: "5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneGreenPlantConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneBeachConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10500';
      const key = image.PropertyKey.SCENE_BEACH_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "6"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "6"},
        {name: "png", fileName: "test_exif_v2.png", value: "6"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "6"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneBeachConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneSnowConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10600';
      const key = image.PropertyKey.SCENE_SNOW_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "7"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "7"},
        {name: "png", fileName: "test_exif_v2.png", value: "7"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "7"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "7"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneSnowConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneSunsetConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10700';
      const key = image.PropertyKey.SCENE_SUNSET_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "8"},
        {name: "png", fileName: "test_exif_v2.png", value: "8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "8"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneSunsetConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneFlowersConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10800';
      const key = image.PropertyKey.SCENE_FLOWERS_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "9"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "9"},
        {name: "png", fileName: "test_exif_v2.png", value: "9"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "9"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "9"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneFlowersConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneNightConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_10900';
      const key = image.PropertyKey.SCENE_NIGHT_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "10"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "10"},
        {name: "png", fileName: "test_exif_v2.png", value: "10"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "10"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "10"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneNightConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteSceneTextConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11000';
      const key = image.PropertyKey.SCENE_TEXT_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "11"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "11"},
        {name: "png", fileName: "test_exif_v2.png", value: "11"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "11"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "11"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteSceneTextConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFacePointer')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11100';
      const key = image.PropertyKey.FACE_POINTER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "122"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "122"},
        {name: "png", fileName: "test_exif_v2.png", value: "122"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "166"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "122"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFacePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceVersion')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11200';
      const key = image.PropertyKey.FACE_VERSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceCount')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11300';
      const key = image.PropertyKey.FACE_COUNT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceCount ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceConf')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11400';
      const key = image.PropertyKey.FACE_CONF;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceSmileScore')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11500';
      const key = image.PropertyKey.FACE_SMILE_SCORE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 2 3 4 5 6 7 8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 2 3 4 5 6 7 8"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 2 3 4 5 6 7 8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 2 3 4 5 6 7 8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 2 3 4 5 6 7 8"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceSmileScore ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceRect')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11600';
      const key = image.PropertyKey.FACE_RECT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceRect ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceLeyeCenter')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11700';
      const key = image.PropertyKey.FACE_LEYE_CENTER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 2 3 4"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 2 3 4"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 2 3 4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 2 3 4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 2 3 4"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceLeyeCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceReyeCenter')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11800';
      const key = image.PropertyKey.FACE_REYE_CENTER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5 6 7 8"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5 6 7 8"},
        {name: "png", fileName: "test_exif_v2.png", value: "5 6 7 8"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5 6 7 8"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5 6 7 8"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceReyeCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFaceMouthCenter')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_11900';
      const key = image.PropertyKey.FACE_MOUTH_CENTER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", errorData: "987654321", value: '1 2 3 4 5 6 7 8'},
        {name: "png", fileName: "test_exif_v2.png", errorData: "987654321", value: '1 2 3 4 5 6 7 8'},
        {name: "heif", fileName: "test_exif_v2.heic", errorData: "987654321", value: '1 2 3 4 5 6 7 8'},
        {name: "webp", fileName: "test_exif_v2.webp", errorData: "987654321", value: '1 2 3 4 5 6 7 8'}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteCaptureMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12000';
      const key = image.PropertyKey.CAPTURE_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1"},
        {name: "png", fileName: "test_exif_v2.png", value: "1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteBurstNumber')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12100';
      const key = image.PropertyKey.BURST_NUMBER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteBurstNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFrontCamera')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12200';
      const key = image.PropertyKey.FRONT_CAMERA;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "3"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "3"},
        {name: "png", fileName: "test_exif_v2.png", value: "3"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "3"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "3"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFrontCamera ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteRollAngle')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12300';
      const key = image.PropertyKey.ROLL_ANGLE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "4"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4"},
        {name: "png", fileName: "test_exif_v2.png", value: "4"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "4"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "4"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteRollAngle ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnotePitchAngle')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12400';
      const key = image.PropertyKey.PITCH_ANGLE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5"},
        {name: "png", fileName: "test_exif_v2.png", value: "5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "5"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnotePitchAngle ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnotePhysicalAperture')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12500';
      const key = image.PropertyKey.PHYSICAL_APERTURE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "6"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "6"},
        {name: "png", fileName: "test_exif_v2.png", value: "6"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "6"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "6"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnotePhysicalAperture ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteFocusMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12600';
      const key = image.PropertyKey.FOCUS_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "7"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "7"},
        {name: "png", fileName: "test_exif_v2.png", value: "7"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "7"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "7"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteFocusMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('UserComment')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12700';
      const key = image.PropertyKey.USER_COMMENT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "place for user comments"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "place for user comments."},
        {name: "png", fileName: "test_exif_v2.png", value: "place for user comments"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "comm"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "place for user comments"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubsecTime')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12800';
      const key = image.PropertyKey.SUBSEC_TIME;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123456"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123456"},
        {name: "png", fileName: "test_exif_v2.png", value: "123456"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "427000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123456"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubsecTimeOriginal')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_12900';
      const key = image.PropertyKey.SUBSEC_TIME_ORIGINAL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "427000"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "543792"},
        {name: "png", fileName: "test_exif_v2.png", value: "427000"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "427000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "427000"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubsecTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubsecTimeDigitized')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13000';
      const key = image.PropertyKey.SUBSEC_TIME_DIGITIZED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "427000"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "427000"},
        {name: "png", fileName: "test_exif_v2.png", value: "427000"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "427000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "427000"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubsecTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FlashpixVersion')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13100';
      const key = image.PropertyKey.FLASHPIX_VERSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "FlashPix Version 1.0"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "FlashPix Version 1.0"},
        {name: "png", fileName: "test_exif_v2.png", value: "FlashPix Version 1.0"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "FlashPix Version 1.0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "FlashPix Version 1.0"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ColorSpace')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13200';
      const key = image.PropertyKey.COLOR_SPACE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "sRGB"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "sRGB"},
        {name: "png", fileName: "test_exif_v2.png", value: "sRGB"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Adobe RGB"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "sRGB"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('PixelXDimension')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13300';
      const key = image.PropertyKey.PIXEL_X_DIMENSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "123"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "123"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "123"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('PixelYDimension')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13400';
      const key = image.PropertyKey.PIXEL_Y_DIMENSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "234"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "4608"},
        {name: "png", fileName: "test_exif_v2.png", value: "234"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2000"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "234"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('RelatedSoundFile')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13500';
      const key = image.PropertyKey.RELATED_SOUND_FILE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "/usr/home"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "abb"},
        {name: "png", fileName: "test_exif_v2.png", value: "/usr/home"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "/usr/home/sound/sea.wav"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "/usr/home"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FlashEnergy')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13600';
      const key = image.PropertyKey.FLASH_ENERGY;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "832"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "832"},
        {name: "png", fileName: "test_exif_v2.png", value: "832"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "832"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "832"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SpatialFrequencyResponse')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13700';
      const key = image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "13"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "13"},
        {name: "png", fileName: "test_exif_v2.png", value: "13"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "13"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FocalPlaneXResolution')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13800';
      const key = image.PropertyKey.FOCAL_PLANE_X_RESOLUTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1080"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1080"},
        {name: "png", fileName: "test_exif_v2.png", value: "1080"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1080"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1080"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FocalPlaneYResolution')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_13900';
      const key = image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "880"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "880"},
        {name: "png", fileName: "test_exif_v2.png", value: "880"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "880"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "880"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FocalPlaneResolutionUnit')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14000';
      const key = image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Inch"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Centimeter"},
        {name: "png", fileName: "test_exif_v2.png", value: "Inch"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Centimeter"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Inch"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubjectLocation')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14100';
      const key = image.PropertyKey.SUBJECT_LOCATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0, 1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "5, 6"},
        {name: "png", fileName: "test_exif_v2.png", value: "0, 1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "2009, 1506, 2318, 1390"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0, 1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ExposureIndex')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14200';
      const key = image.PropertyKey.EXPOSURE_INDEX;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.5"},
        {name: "png", fileName: "test_exif_v2.png", value: "1.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1.5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1.5"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SensingMethod')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14300';
      const key = image.PropertyKey.SENSING_METHOD;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [
        {name: "jpeg", fileName: "test_exif_v2.jpg", value: "Two-chip color area sensor"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "One-chip color area sensor"},
        {name: "png", fileName: "test_exif_v2.png", value: "Two-chip color area sensor"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Two-chip color area sensor"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Two-chip color area sensor"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FileSource')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14400';
      const key = image.PropertyKey.FILE_SOURCE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "DSC"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "DSC"},
        {name: "png", fileName: "test_exif_v2.png", value: "DSC"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "DSC"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "DSC"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FileSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SceneType')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14500';
      const key = image.PropertyKey.SCENE_TYPE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Directly photographed"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Directly photographed"},
        {name: "png", fileName: "test_exif_v2.png", value: "Directly photographed"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Directly photographed"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Directly photographed"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SceneType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('CFAPattern')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14600';
      const key = image.PropertyKey.CFA_PATTERN;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "1 bytes undefined data"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1 bytes undefined data"},
        {name: "png", fileName: "test_exif_v2.png", value: "1 bytes undefined data"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1 bytes undefined data"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "1 bytes undefined data"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error CFAPattern ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('CustomRendered')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14700';
      const key = image.PropertyKey.CUSTOM_RENDERED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal process"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Custom process"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal process"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Custom process"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal process"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ExposureMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14800';
      const key = image.PropertyKey.EXPOSURE_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Auto exposure"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Auto exposure"},
        {name: "png", fileName: "test_exif_v2.png", value: "Auto exposure"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Auto exposure"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Auto exposure"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('WhiteBalance')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_14900';
      const key = image.PropertyKey.WHITE_BALANCE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Manual white balance"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Auto white balance"},
        {name: "png", fileName: "test_exif_v2.png", value: "Manual white balance"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Manual white balance"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Manual white balance"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('DigitalZoomRatio')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15000';
      const key = image.PropertyKey.DIGITAL_ZOOM_RATIO;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "321"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.00"},
        {name: "png", fileName: "test_exif_v2.png", value: "321"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 0"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "321"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('FocalLengthIn35mmFilm')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15100';
      const key = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "27"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "26"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SceneCaptureType')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15200';
      const key = image.PropertyKey.SCENE_CAPTURE_TYPE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Standard"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Standard"},
        {name: "png", fileName: "test_exif_v2.png", value: "Standard"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Standard"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Standard"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('GainControl')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15300';
      const key = image.PropertyKey.GAIN_CONTROL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Contrast')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15400';
      const key = image.PropertyKey.CONTRAST;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Saturation')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15500';
      const key = image.PropertyKey.SATURATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Sharpness')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15600';
      const key = image.PropertyKey.SHARPNESS;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Normal"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Normal"},
        {name: "png", fileName: "test_exif_v2.png", value: "Normal"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Normal"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Normal"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('DeviceSettingDescription')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15700';
      const key = image.PropertyKey.DEVICE_SETTING_DESCRIPTION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2xxx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2xxx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2xxx"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SubjectDistanceRange')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15800';
      const key = image.PropertyKey.SUBJECT_DISTANCE_RANGE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "Unknown"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "Unknown"},
        {name: "png", fileName: "test_exif_v2.png", value: "Unknown"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "Unknown"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "Unknown"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('ImageUniqueID')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_15900';
      const key = image.PropertyKey.IMAGE_UNIQUE_ID;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "FXIC012"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "FXIC012"},
        {name: "png", fileName: "test_exif_v2.png", value: "FXIC012"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "FXIC012"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "FXIC012"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ImageUniqueID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('CameraOwnerName')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16000';
      const key = image.PropertyKey.CAMERA_OWNER_NAME;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "c.uec"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "c.uec"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "c.uec"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('BodySerialNumber')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16100';
      const key = image.PropertyKey.BODY_SERIAL_NUMBER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "exoch"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "x1"},
        {name: "png", fileName: "test_exif_v2.png", value: "exoch"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "exoch"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('LensSpecification')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16200';
      const key = image.PropertyKey.LENS_SPECIFICATION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "0.8, 2.5, 1.5, 0.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: " 1, 2.5,  3,  2"},
        {name: "png", fileName: "test_exif_v2.png", value: "0.8, 2.5, 1.5, 0.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: " 1, 1.5,  1,  2"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "0.8, 2.5, 1.5, 0.5"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('LensMake')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16300';
      const key = image.PropertyKey.LENS_MAKE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxwx"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "aaa"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxwx"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxwx"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('LensModel')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16400';
      const key = image.PropertyKey.LENS_MODEL;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "txaw"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "xxx"},
        {name: "png", fileName: "test_exif_v2.png", value: "txaw"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "txaw"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('LensSerialNumber')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16500';
      const key = image.PropertyKey.LENS_SERIAL_NUMBER;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "qxhc"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "111"},
        {name: "png", fileName: "test_exif_v2.png", value: "qxhc"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "xxx"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "qxhc"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('CompositeImage')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16600';
      const key = image.PropertyKey.COMPOSITE_IMAGE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "2"},
        {name: "png", fileName: "test_exif_v2.png", value: "2"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SourceImageNumberOfCompositeImage')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16700';
      const key = image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "23, 34"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1234, 1"},
        {name: "png", fileName: "test_exif_v2.png", value: "23, 34"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1234"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "23, 34"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('SourceExposureTimesOfCompositeImage')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16800';
      const key = image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "xxxw"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "123"},
        {name: "png", fileName: "test_exif_v2.png", value: "xxxw"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "."},
        {name: "heif", fileName: "test_exif_v2.heic", value: "xxxw"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('Gamma')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_16900';
      const key = image.PropertyKey.GAMMA;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2.5"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1.5"},
        {name: "png", fileName: "test_exif_v2.png", value: "2.5"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1.5"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2.5"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('DNGVersion')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17000';
      const key = image.PropertyKey.DNG_VERSION;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "2, 2, 3, 1"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "1, 1, 2, 3"},
        {name: "png", fileName: "test_exif_v2.png", value: "2, 2, 3, 1"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "0x01, 0x01, 0x02, 0x03"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "2, 2, 3, 1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('DefaultCropSize')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17100';
      const key = image.PropertyKey.DEFAULT_CROP_SIZE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v2.jpg", value: "153, 841"},
        {name: "webp", fileName: "test_exif_v2.webp", value: "12, 1"},
        {name: "png", fileName: "test_exif_v2.png", value: "153, 841"},
        {name: "dng", fileName: "test_exif_v2.dng", value: "1"},
        {name: "heif", fileName: "test_exif_v2.heic", value: "153, 841"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteIsXmageSupported')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17300';
      const key = image.PropertyKey.IS_XMAGE_SUPPORTED;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteIsXmageSupported ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteXmageMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17400';
      const key = image.PropertyKey.XMAGE_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteXmageMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteXmageLeft')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17500';
      const key = image.PropertyKey.XMAGE_LEFT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteXmageLeft ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteXmageTop')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17600';
      const key = image.PropertyKey.XMAGE_TOP;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteXmageTop ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteXmageRight')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17700';
      const key = image.PropertyKey.XMAGE_RIGHT;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteXmageRight ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteXmageBottom')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17800';
      const key = image.PropertyKey.XMAGE_BOTTOM;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteXmageBottom ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteCloudEnhancementMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_17900';
      const key = image.PropertyKey.CLOUD_ENHANCEMENT_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteCloudEnhancementMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_18000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_18000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty('HwMnoteWindSnapshotMode')
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_18000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_18000';
      const key = image.PropertyKey.WIND_SNAPSHOT_MODE;
      const createImageSourceTypes = ["Fd", "Uri"]
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v4.jpg", value: "1"},
        {name: "webp", fileName: "test_exif_v4.webp", value: "1"},
        {name: "png", fileName: "test_exif_v4.png", value: "1"},
        {name: "heif", fileName: "test_exif_v4.heic", value: "1"}]
      try {
        for(let j = 0; j < createImageSourceTypes.length; j++){
          for(let i=0; i<values.length; i++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, values[i].fileName, createImageSourceTypes[j], key, values[i].value);
            if(!checkResult){
              expect().assertFail()
              done()
            }
          }
        }
        expect(true).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error HwMnoteWindSnapshotMode ` + e);
        expect().assertFail();
        done();
      }
    })
                
  })
}
