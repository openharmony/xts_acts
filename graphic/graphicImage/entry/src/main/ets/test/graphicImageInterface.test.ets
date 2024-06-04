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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

import image from '@ohos.multimedia.image';

export default function graphicImageInterfaceTest(context, windowStage, abilityStorage) {
  describe('graphicImageInterfaceTest', function () {
    console.log('describe graphicImageInterfaceTest start!!!')

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    let pixel;
    beforeAll(async function () {
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_016
     * @tc.name      : testCreatePremultipliedPixelMap_callback
     * @tc.desc      : The transparent channel non-premultiplied mode of PixelMap is changed to premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through the callback function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreatePremultipliedPixelMap_callback', 1, async function () {
      let msg = " =testCreatePremultipliedPixelMap_callback= "
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts);
        let dstPixelMap = image.createPixelMapSync(opts);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
          if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect().assertFail()
              done()
          } else {
              console.info(msg + ' Succeeded in converting pixelmap.');
              expect(true).assertTrue()
              done()
          }
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_017
     * @tc.name      : testCreatePremultipliedPixelMap_promise
     * @tc.desc      : Convert PixelMap data into a pre-multiply format based on transparency, save the converted data to another PixelMap, and return the result through Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreatePremultipliedPixelMap_promise', 1, async function () {
      let msg = " =testCreatePremultipliedPixelMap_promise= "
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts);
        let dstPixelMap = image.createPixelMapSync(opts);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
            console.info(msg + ' Succeeded in converting pixelmap.');
            expect(true).assertTrue()
            done()
        }).catch((error: BusinessError) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail()
            done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_018
     * @tc.name      : testCreateUnpremultipliedPixelMap_callback
     * @tc.desc      : The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through the callback function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateUnpremultipliedPixelMap_callback', 1, async function () {
      let msg = " =testCreateUnpremultipliedPixelMap_callback= "
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 2}
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts);
        let dstPixelMap = image.createPixelMapSync(opts);
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
          if(error) {
              console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message} `);
              expect().assertFail()
              done()
          } else {
              console.info(msg + ' Succeeded in converting pixelmap.');
              expect(true).assertTrue()
              done()
          }
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_019
     * @tc.name      : testCreateUnpremultipliedPixelMap_promise
     * @tc.desc      : The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateUnpremultipliedPixelMap_promise', 1, async function () {
      let msg = " =testCreateUnpremultipliedPixelMap_promise= "
      const color: ArrayBuffer = new ArrayBuffer(16); // 16为需要创建的像素buffer大小，取值为：height * width *4
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
      }
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 2, width: 2 } , alphaType: 3}
      try {
        console.log(msg + " succeed in try createPixelMapSync ")
        let srcPixelmap = image.createPixelMapSync(color, opts);
        let dstPixelMap = image.createPixelMapSync(opts);
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
            console.info(msg + ' Succeeded in converting pixelmap.');
            expect(true).assertTrue()
            done()
        }).catch((error: BusinessError) => {
            console.error(msg + ` Failed to convert pixelmap. code is ${error.code}, message is ${error.message}`);
            expect().assertFail()
            done()
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_019
     * @tc.name      : testWriteBufferToPixelsSync
     * @tc.desc      : The transparent channel premultiplied mode of PixelMap is changed to non-premultiplied mode. The converted data is stored in the target PixelMap and the result is returned through Promise.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWriteBufferToPixelsSync', 1, async function () {
      let msg = " =testWriteBufferToPixelsSync= "

      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
        try {
          console.info(msg + ' Succeeded in createPixelMap.');
          if (pixelMap != undefined) {
              pixelMap.writeBufferToPixelsSync(color);
              console.info(msg + ' Succeeded in writeBufferToPixelsSync.');
              expect(true).assertTrue()
              done()
          }else{
              console.info(msg + ' pixelMap == undefined');
              expect().assertFail()
              done()
          }
        } catch (err) {
          console.log(msg + " Faild in writeBufferToPixelsSync " + JSON.stringify(err))
          console.log(msg + " Faild in writeBufferToPixelsSync " + err)
          expect().assertFail()
          done()
        }
      }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail()
          done()
      })
    })

  })
}