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
import image from '@ohos.multimedia.image'

import image from '@ohos.multimedia.image';

export default function graphicImagePixelMapTest(context, windowStage, abilityStorage) {
  describe('graphicImagePixelMapTest', function () {
    console.log('describe graphicImagePixelMapTest start!!!')

    const WIDTH = 8192;
    const HEIGHT = 8;
    const CAPACITY = 8;
    const DEVICE_CODE = 801;
    const { JPEG: FORMATJPEG } = image.ImageFormat;

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_029
     * @tc.name      : testCreatePixelMapFromSurfaceSync_receiver
     * @tc.desc      :  1.create ImageReceiver
                        2.createPixelMapFromSurfaceSync
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testCreatePixelMapFromSurfaceSync_receiver", 0, async function (done) {
      let msg = '=====testCreatePixelMapFromSurfaceSync_receiver====='
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver.getReceivingSurfaceId().then((id) => {
          console.log(msg + ' receiver.getReceivingSurfaceId GO')
          let region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
          try{
              image.createPixelMapFromSurfaceSync(id, region)
              console.log(msg + ' receiver surfaceId Successed in createPixelMapFromSurfaceSync')
              expect().assertFail();
              done();
          }catch (error){
              console.log(msg + ' receiver surfaceId Failed in createPixelMapFromSurfaceSync')
              console.log(msg + ' Counterexamples end !')
              expect(true).assertTrue();
              done();
          }
      })
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_030
     * @tc.name      : testSetTransferDetached_1
     * @tc.desc      :  1.create PixelMap
                        2.use SetTransferDetached
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetTransferDetached_1", 0, async function (done) {
      let msg = '=====testSetTransferDetached_1====='
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let horizontal: boolean = true;
      let vertical: boolean = false;
      let pixelMap: image.PixelMap | undefined = undefined;

      await image.createPixelMap(color, opts).then((pixelMapOK: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMapOK.');
        pixelMap = pixelMapOK
      }).catch((error: BusinessError) => {
        console.error( msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
      try{
        pixelMap.rotate(60)
        console.info( msg + ' Succeeded in rotate pixelMap.');
        try{
          pixelMap.setTransferDetached(true)
          console.info( msg + ' Succeeded in setTransferDetached pixelMap.');
          pixelMap.rotate(180)
          console.info( msg + ' Succeeded in rotate pixelMap.');
          console.log(msg + ' The main process can still invoke pixelmap attributes. Counterexamples end !')
          expect(true).assertTrue();
          done();
        }catch(error: BusinessError){
          console.error( msg + ` Failed to setTransferDetached pixelMap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      }catch(error: BusinessError){
        console.error( msg + ` Failed to rotate pixelMap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICIMAGE_JS_API_031
     * @tc.name      : testSetTransferDetached_2
     * @tc.desc      :  1.create PixelMap
                        2.use SetTransferDetached
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetTransferDetached_2", 0, async function (done) {
      let msg = '=====testSetTransferDetached_2====='
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let horizontal: boolean = true;
      let vertical: boolean = false;
      let pixelMap: image.PixelMap | undefined = undefined;

      await image.createPixelMap(color, opts).then((pixelMapOK: image.PixelMap) => {
        console.info( msg + ' Succeeded in creating pixelMapOK.');
        pixelMap = pixelMapOK
      }).catch((error: BusinessError) => {
        console.error( msg + ` Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
      try{
        pixelMap.rotate(60)
        console.info( msg + ' Succeeded in rotate pixelMap.');
        try{
          pixelMap.setTransferDetached(false)
          console.info( msg + ' Succeeded in setTransferDetached pixelMap.');
          pixelMap.rotate(180)
          console.info( msg + ' Succeeded in rotate pixelMap.');
          console.log(msg + ' The main process can still invoke pixelmap attributes. Counterexamples end !')
          expect(true).assertTrue();
          done();
        }catch(error: BusinessError){
          console.error( msg + ` Failed to setTransferDetached pixelMap. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        }
      }catch(error: BusinessError){
        console.error( msg + ` Failed to rotate pixelMap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}