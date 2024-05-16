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
import { describe, beforeAll, it, expect } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import fileIo from '@ohos.file.fs';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { PropertyKey }from './PropertyKey'

let imageSourceApi: image.ImageSource;
let pixelMap: image.PixelMap;
let filesDir: string | undefined;
let cacheDir: string | undefined;


const callbackExpectFail = (done: Function, testTag: string) => {
  try {
    expect().assertFail();
    done();
  } catch (e) {
    const msg = 'Prevents asynchronous intra-call expect from failing to exit the application';
    hilog.info(0x0000, testTag, `getimageProperty failed %{public}s `, msg, e);
    done();
  }
};


export default function imageWebpPackeExifTest() {
  describe('ActsImageWebpPackeExifTest', () => {
    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      const filePath = filesDir + "/" + "test_exif_v2.webp";
      const file = fs.openSync(filePath)
      imageSourceApi = image.createImageSource(file.fd);
      let opt:image.DecodingOptions = {
        editable: true,
      }
      pixelMap = await imageSourceApi.createPixelMap(opt);
    })

    const getImageProperty = async (propertyKey:string, imageSource:image.ImageSource) =>{
      const options: image.ImagePropertyOptions = { index: 0, defaultValue: 'undefined' }
      return await imageSource.getImageProperty(propertyKey, options)
    }

    const propertyComp = async (tag:string, key:string, newImageSource:image.ImageSource) =>{
      let result: boolean = true
      let imagePropertyOld:string
      imagePropertyOld = await getImageProperty(key, imageSourceApi)
      const imagePropertyNew = await getImageProperty(key, newImageSource)
      if(imagePropertyOld !== imagePropertyNew){
        hilog.info(0x0000, tag, `propertyComp failed ${key} imagePropertyOld ${imagePropertyOld} imagePropertyNew: ${imagePropertyNew}`);
        result = false
      }
      return result
    }

    const checkProperty = async(tag:string, newImageSource:image.ImageSource) => {
      let checkResult: boolean = true
      // const imageKeys = Object.values(image.PropertyKey)
      const imageKeys = Object.values(PropertyKey)
      for(let i=0; i<imageKeys.length; i++){
        const key:string = imageKeys[i]
        checkResult = await propertyComp(tag, key, newImageSource)
        if(!checkResult){
          return checkResult
        }
      }
      return checkResult
    }


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_IMAGESOURCE_PROMISE_0100',0,  async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_IMAGESOURCE_PROMISE_0100"
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        const imageData:ArrayBuffer = await imagePackerApi.packing(imageSourceApi, packOpts)
        const newImageSource = image.createImageSource(imageData);
        const result = await checkProperty(tag, newImageSource)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PIXELMAP_PROMISE_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PIXELMAP_PROMISE_0100',0,  async  (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PIXELMAP_PROMISE_0100"
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        const imageData:ArrayBuffer = await imagePackerApi.packing(pixelMap, packOpts)
        const newImageSource = image.createImageSource(imageData);
        const result = await checkProperty(tag, newImageSource)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.pacToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_IMAGESOURCE_PROMISE_0100',0, async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_IMAGESOURCE_PROMISE_0100"
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        let uri: string = cacheDir + '/' + tag + `.webp`;
        let file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        await imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts)
        const newImageSource = image.createImageSource(file.fd);
        const result = await checkProperty(tag, newImageSource)
        expect(result).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_PIXELMAP_PROMISE_0100
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.pacToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_PIXELMAP_PROMISE_0100',0, async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_PIXELMAP_PROMISE_0100"
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        let uri: string = cacheDir + '/' + tag + `.webp`;
        let file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        await imagePackerApi.packToFile(pixelMap, file.fd, packOpts)
        const newImageSource = image.createImageSource(file.fd);
        const result = await checkProperty(tag, newImageSource)
        expect(result).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PIXELMAP_CALLBACK_0100
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing                                                                                                                                                                           sc      : 1.modifyImageProperty
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PIXELMAP_CALLBACK_0100',0,  async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PIXELMAP_CALLBACK_0100"
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        imagePackerApi.packing(pixelMap, packOpts,  async (err: BusinessError, imageData: ArrayBuffer) => {
          if (err) {
            callbackExpectFail(done, tag)
          } else {
            const newImageSource = image.createImageSource(imageData);
            try {
              const result = await checkProperty(tag, newImageSource)
              expect(result).assertTrue()
              done()
            } catch (error) {
              callbackExpectFail(done, tag)
            }
          }
        })
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_IMAGESOURCE_CALLBACK_0100
     * @tc.name      : packing -callback
     * @tc.desc      : 1.packing
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_IMAGESOURCE_CALLBACK_0100',0,  async  (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_IMAGESOURCE_CALLBACK_0100"
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        imagePackerApi.packing(imageSourceApi, packOpts, async (err: BusinessError, imageData: ArrayBuffer) => {
          if (err) {
            callbackExpectFail(done, tag)
            done()
          } else {
            const newImageSource = image.createImageSource(imageData);
            try {
              const result = await checkProperty(tag, newImageSource)
              expect(result).assertTrue()
              done()
            } catch (error) {
              callbackExpectFail(done, tag)
            }
          }
        })
      }catch(error){
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_PIXELMAP_CALLBACK_0100
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.pacToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_PIXELMAP_CALLBACK_0100',0, async (done:Function) => {
      const tag:string = "SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_PIXELMAP_CALLBACK_0100"
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        let uri: string = cacheDir + '/' + tag + `.webp`;
        let file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        imagePackerApi.packToFile(pixelMap, file.fd, packOpts, async (err: BusinessError) => {
          if (err) {
            hilog.info(0x0000, tag, `packtofile fail ${JSON.stringify(err)}`);
            callbackExpectFail(done, tag)
          } else {
            const newImageSource = image.createImageSource(file.fd);
            try {
              const result = await checkProperty(tag, newImageSource)
              expect(result).assertTrue()
              done()
            } catch (error) {
              callbackExpectFail(done, tag)
            }
          }
        })
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_IMAGESOURCE_CALLBACk_0100
     * @tc.name      : packToFile -callback
     * @tc.desc      : 1.pacToFile
     *                 2.getImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_IMAGESOURCE_CALLBACk_0100',0, async (done:Function) => {
      const tag:string = 'SUB_MULTIMEDIA_IMAGE_WEBP_PACKTOFILE_IMAGESOURCE_CALLBACk_0100'
      try {
        const imagePackerApi : image.ImagePacker = image.createImagePacker();
        let packOpts : image.PackingOption = { format:"image/webp", quality:100 };
        let uri: string = cacheDir + '/' + tag + `.webp`;
        let file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, async (err: BusinessError) => {
          if (err) {
            hilog.info(0x0000, tag, `packtofile fail ${JSON.stringify(err)}`);
            callbackExpectFail(done, tag)
          } else {
            const newImageSource = image.createImageSource(file.fd);
            try {
              const result = await checkProperty(tag, newImageSource)
              expect(result).assertTrue()
              done()
            } catch (error) {
              callbackExpectFail(done, tag)
            }
          }
        })
      } catch (error) {
        hilog.info(0x0000, tag, `failed ${JSON.stringify(error)}`);
        expect().assertFail()
        done()
      }
    })
  })
}