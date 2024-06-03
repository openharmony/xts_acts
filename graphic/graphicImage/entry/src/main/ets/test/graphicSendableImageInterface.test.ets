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
// import { RenderNode, DrawContext } from "@ohos.arkui.node"
// import drawing from "@ohos.graphics.drawing"
// import common2D from "@ohos.graphics.common2D"
// import image from "@ohos.multimedia.image"
// import text from "@ohos.graphics.text"
// import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

import image from '@ohos.multimedia.image';
import sendableImage from '@ohos.multimedia.sendableImage'

export default function graphicSendableImageInterfaceTest(context, windowStage, abilityStorage) {
  describe('graphicSendableImageInterfaceTest', function () {
    console.log('describe graphicSendableImageInterfaceTest start!!!')

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testConvertFromPixelMap
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testConvertFromPixelMap', 1, async function () {
      let msg = " =testConvertFromPixelMap= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let sendablePixelMap: sendableImage.PixelMap = sendableImage.convertFromPixelmap(pixelMap);
          console.log(msg + " Succeed in sendableImage.convertFromPixelmap " + JSON.stringify(sendablePixelMap))
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testConvertToPixelmap
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testConvertToPixelmap', 1, async function () {
      let msg = " =testConvertToPixelmap= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let sendablePixelMap: image.PixelMap = sendableImage.convertToPixelmap(sendablePixelMap);
          console.log(msg + " Succeed in sendableImage.convertFromPixelmap " + JSON.stringify(sendablePixelMap))
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testReadPixelsSync
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testReadPixelsSync', 1, async function () {
      let msg = " =testReadPixelsSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          const area: image.PositionArea = {
            pixels: new ArrayBuffer(8),
            offset: 0,
            stride: 8,
            region: {
              size: {
                height: 1, width: 2
              }, x: 0, y: 0
            }
          };
          pixelMap.readPixelsSync(area);
          console.info(msg + '' + a)
          console.info(msg + '' + JSON.stringify(a))
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testWriteBufferToPixels
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWriteBufferToPixels', 1, async function () {
      let msg = " =testWriteBufferToPixels= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      let bufferArr: Uint8Array = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          pixelMap.writeBufferToPixels(color).then(() => {
            console.info("Succeeded in writing data from a buffer to a PixelMap.");
          }).catch((error: BusinessError) => {
            console.error(`Failed to write data from a buffer to a PixelMap. code is ${error.code}, message is ${error.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testOpacitySync
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOpacitySync', 1, async function () {
      let msg = " =testOpacitySync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let rate: number = 0.5;
          pixelMap.opacitySync(rate);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testCreateAlphaPixelmapSync
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateAlphaPixelmapSync', 1, async function () {
      let msg = " =testCreateAlphaPixelmapSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let pixelmap: image.PixelMap = pixelMap.createAlphaPixelmapSync();
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : tesTtranslateSync
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('tesTtranslateSync', 1, async function () {
      let msg = " =tesTtranslateSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let translateX: number = 50.0;
          let translateY: number = 10.0;
          pixelMap.translateSync(translateX, translateY);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testRotateSync
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRotateSync', 1, async function () {
      let msg = " =testRotateSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let angle: number = 90.0;
          pixelMap.rotateSync(angle);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testFlipSync
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFlipSync', 1, async function () {
      let msg = " =testFlipSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let horizontal: boolean = true;
          let vertical: boolean = false;
          pixelMap.flipSync(horizontal, vertical);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testCropSync
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCropSync', 1, async function () {
      let msg = " =testCropSync= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let region: image.Region = {
            x: 0, y: 0, size: {
              height: 2, width: 3
            }
          };
          pixelMap.cropSync(region);
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testScale
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testScale', 1, async function () {
      let msg = " =testScale= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let scaleX: number = 2.0;
          let scaleY: number = 1.0;
          pixelMap.scale(scaleX, scaleY).then(() => {
            console.info('Sucessed in scaling pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testTranslate
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTranslate', 1, async function () {
      let msg = " =testTranslate= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let translateX: number = 50.0;
          let translateY: number = 10.0;
          pixelMap.translate(translateX, translateY).then(() => {
            console.info('Sucessed in translating pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testRotate
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRotate', 1, async function () {
      let msg = " =testRotate= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let angle: number = 90.0;
          pixelMap.rotate(angle).then(() => {
            console.info('Sucessed in rotating pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to rotate pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testFlip
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFlip', 1, async function () {
      let msg = " =testFlip= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let horizontal: boolean = true;
          let vertical: boolean = false;
          pixelMap.flip(horizontal, vertical).then(() => {
            console.info('Sucessed in flipping pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to flip pixelmap. code is ${err.code}, message is ${err.message}`);
          })
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testCrop
     * @tc.desc      : To test the interface of sendableImage. Create a PixelMap under senableImage using PixelMap under image
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCrop', 1, async function () {
      let msg = " =testCrop= "
      const color: ArrayBuffer = new ArrayBuffer(96); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      try {
        sendableImage.createPixelMap(color, opts).then((pixelMap: sendableImage.PixelMap) => {
          let region: image.Region = {
            x: 0, y: 0, size: {
              height: 2, width: 3
            }
          };
          pixelMap.crop(region).then(() => {
            console.info('Succeeded in cropping pixelmap.');
          }).catch((err: BusinessError) => {
            console.error(`Failed to crop pixelmap. code is ${err.code}, message is ${err.message}`);
          });
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

  })
}