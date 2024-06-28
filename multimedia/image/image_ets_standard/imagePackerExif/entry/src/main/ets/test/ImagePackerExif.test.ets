/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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


import hilog from '@ohos.hilog';
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import fileIo from '@ohos.file.fs';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import PropertyKey from './PropertyKey'
import common from '@ohos.app.ability.common';

let filesDir: string | undefined;
let cacheDir: string | undefined;


class picType {
  public name: string = ""
  public mimeType:string = ""
  public fileSuffix:string = ""
}

interface Result {
  pixelMap: image.PixelMap
  imageSource: image.ImageSource
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};


export default function imagePackerExifTest() {

  describe('ActsImagePackerExifTest', () => {

    const picMimeType:Array<picType> = [{name:"test_exif_v2.jpg",mimeType:"image/jpeg", fileSuffix:"jpg"},
      {name:"test_exif_v2.webp",mimeType:"image/webp", fileSuffix:"webp"},
      {name:"test_exif_v2.png",mimeType:"image/png", fileSuffix:"png"}]

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
    })

    const getImageProperty = async (propertyKey:image.PropertyKey, imageSource:image.ImageSource) =>{
      const options: image.ImagePropertyOptions = { index: 0, defaultValue: 'undefined' }
      return await imageSource.getImageProperty(propertyKey, options)
    }

    const propertyComp = async (tag:string, key:image.PropertyKey, newImageSource:image.ImageSource,
                                oldImageSource:image.ImageSource, fileName:string) =>{
      let result: boolean = true
      const imagePropertyOld = await getImageProperty(key, oldImageSource)
      const imagePropertyNew = await getImageProperty(key, newImageSource)
      if(imagePropertyOld !== imagePropertyNew){
        hilog.info(0x0000, tag, `propertyComp failed ${fileName} ${key} imagePropertyOld ${imagePropertyOld} imagePropertyNew: ${imagePropertyNew}`);
        result = false
      }
      return result
    }

    const checkProperty = async(tag:string, newImageSource:image.ImageSource,
                                oldImageSource:image.ImageSource,fileName:string) => {
      let checkResult: boolean = true
      for(let i=0; i<PropertyKey.length; i++){
        const key = PropertyKey[i]
        checkResult = await propertyComp(tag, key, newImageSource, oldImageSource,fileName)
        if(!checkResult){
          return checkResult
        }
      }
      return checkResult
    }

    const genImageSource = async (fileName:string) => {
      const filePath = filesDir + "/" + fileName;
      const file = fs.openSync(filePath)
      const imageSourceApi = image.createImageSource(file.fd);
      return imageSourceApi
    }

    const genPixelMap = async (fileName:string) =>{
      const imageSourceApi = await genImageSource(fileName)
      let opt:image.DecodingOptions = {
        editable: true,
      }
      const pixelMap = await imageSourceApi.createPixelMap(opt);
      const result:Result = {pixelMap: pixelMap, imageSource: imageSourceApi}
      return result
    }

    const getFd = async(tag:string, fileNameEnd:string) => {
      const uri: string = cacheDir + '/' + tag + `.${fileNameEnd}`;
      const file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd
    }

    const checkPackImageSourcePixelMapPromise = async (packOptsFormat:string, fileName:string, fileNameEnd:string, tag:string,
                                                          caseType:string, packType:string) => {
      const imagePackerApi : image.ImagePacker = image.createImagePacker();
      let packOpts : image.PackingOption = { format:packOptsFormat, quality:100 };
      let imageData:ArrayBuffer
      let oldImageSource: image.ImageSource
      let newImageSource: image.ImageSource
      if(caseType === "pixelMap"){
        const result =  await genPixelMap(fileName)
        const pixelMap = result.pixelMap
        oldImageSource = result.imageSource
        if(packType === "packing"){
          imageData = await imagePackerApi.packing(pixelMap, packOpts)
          newImageSource = image.createImageSource(imageData);
        }else{
          const fdNum = await getFd(tag, fileNameEnd)
          await imagePackerApi.packToFile(pixelMap, fdNum, packOpts)
          newImageSource = image.createImageSource(fdNum);
        }
      }else{
        const imageSourceApi = await genImageSource(fileName)
        oldImageSource = imageSourceApi
        if(packType === "packing"){
          imageData = await imagePackerApi.packing(imageSourceApi, packOpts)
          newImageSource = image.createImageSource(imageData);
        }else{
          const fdNum = await getFd(tag, fileNameEnd)
          await imagePackerApi.packToFile(imageSourceApi, fdNum, packOpts)
          newImageSource = image.createImageSource(fdNum);
        }
      }
      const result = await checkProperty(tag, newImageSource, oldImageSource, fileName)
      return result
    }


    const checkPack = async (err:BusinessError, tag:string, imageData: ArrayBuffer, fileName:string,
                                oldImageSource:image.ImageSource, fdNum:number, checkType:string) =>{
      let result = false
      if(!err){
        let newImageSource:image.ImageSource
        if(checkType == "data"){
          newImageSource = image.createImageSource(imageData);
        }else{
          newImageSource = image.createImageSource(fdNum);
        }
        try {
          result  = await checkProperty(tag, newImageSource,oldImageSource,fileName)
        } catch (error) {
          result  = false
        }
      }
      return result
    }

    const checkPackImageSourcePixelMapCallBack = async (packOptsFormat:string, fileName:string,fileNameEnd:string,
                                                           tag:string, caseType:string, packType:string) => {
      const imagePackerApi : image.ImagePacker = image.createImagePacker();
      let packOpts : image.PackingOption = { format:packOptsFormat, quality:100 };
      let oldImageSource:image.ImageSource
      let cResult = false
      if(caseType === "pixelMap"){
        const result =  await genPixelMap(fileName)
        const pixelMap = result.pixelMap
        oldImageSource = result.imageSource
        if(packType === "packing"){
          imagePackerApi.packing(pixelMap, packOpts, async (err: BusinessError, imageData: ArrayBuffer) => {
            cResult = await checkPack(err,  tag, imageData, fileName, oldImageSource, 0, "data")
          })
        }else{
          const fdNum = await getFd(tag, fileNameEnd)
          imagePackerApi.packToFile(pixelMap, fdNum, packOpts, async (err: BusinessError) => {
            cResult = await checkPack(err,  tag, new ArrayBuffer(0), fileName, oldImageSource, fdNum, "fd")
          })
        }
      }else{
        const imageSourceApi = await genImageSource(fileName)
        oldImageSource = imageSourceApi
        if(packType === "packing"){
          imagePackerApi.packing(imageSourceApi, packOpts,  async (err: BusinessError, imageData: ArrayBuffer) => {
            cResult = await checkPack(err, tag, imageData, fileName, oldImageSource, 0, "data")
          })
        }else{
          const fdNum = await getFd(tag, fileNameEnd)
          imagePackerApi.packToFile(imageSourceApi, fdNum, packOpts, async (err: BusinessError) => {
            cResult = await checkPack(err, tag, new ArrayBuffer(0), fileName, oldImageSource, fdNum, "fd")
          })
        }
      }
      await sleep(3000)
      return cResult
    }


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100',0,  async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100"
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(mimeType, name, fileSuffix, tag, "imageSource","packing")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0100',0,  async  (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_PROMISE_0100"
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(mimeType, name,fileSuffix, tag, "pixelMap","packing")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0100',0, async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_PROMISE_0100"
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix:string = picMimeType[i].fileSuffix
          const result =  await checkPackImageSourcePixelMapPromise(mimeType, name, fileSuffix, tag,  "imageSource","packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0100
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0100',0, async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_PROMISE_0100"
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix:string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapPromise(mimeType, name, fileSuffix, tag, "pixelMap","packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0100
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing                                                                                                                                                                           sc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0100',0,  async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAP_CALLBACK_0100"
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix:string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(mimeType, name, fileSuffix, tag,
            "pixelMap", "packing")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100',0,  async  (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100"
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix:string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(mimeType, name, fileSuffix, tag,
            "imageSource", "packing")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0100
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0100',0, async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAP_CALLBACK_0100"
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix:string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(mimeType, name, fileSuffix, tag,
            "pixelMap", "packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACk_0100
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.packToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACk_0100',0, async (done:Function) => {
      const tag:string = 'SUB_MULTIMEDIA_IMAGE_PACKTOFILE_IMAGESOURCE_CALLBACk_0100'
      try {
        let compResult = true
        for(let i=0; i<picMimeType.length; i++){
          const name:string = picMimeType[i].name
          const mimeType:string = picMimeType[i].mimeType
          const fileSuffix:string = picMimeType[i].fileSuffix
          const result = await checkPackImageSourcePixelMapCallBack(mimeType, name, fileSuffix, tag,
            "imageSource", "packToFile")
          compResult = compResult && result
        }
        expect(compResult).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })
  })
}