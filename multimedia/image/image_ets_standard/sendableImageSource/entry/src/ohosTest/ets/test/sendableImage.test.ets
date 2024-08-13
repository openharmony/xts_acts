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


import { describe, it, expect, beforeAll } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import sendableImage from '@ohos.multimedia.sendableImage';
import camera from '@ohos.multimedia.camera';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import taskpool from '@ohos.taskpool';
import worker, { MessageEvents } from '@ohos.worker';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

let filesDir: string | undefined;
let testContext: common.UIAbilityContext;


let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

async function createPreview(cameraManager: camera.CameraManager,
  receiver: sendableImage.ImageReceiver): Promise<void> {
  // 获取支持的相机设备对象
  let camerasDevices: Array<camera.CameraDevice> = cameraManager.getSupportedCameras();

  // 获取支持的模式类型
  let sceneModes: Array<camera.SceneMode> = cameraManager.getSupportedSceneModes(camerasDevices[0]);
  let isSupportPhotoMode: boolean = sceneModes.indexOf(camera.SceneMode.NORMAL_PHOTO) >= 0;
  if (!isSupportPhotoMode) {
    console.error('photo mode not support');
    return;
  }

  // 获取profile对象
  let profiles: camera.CameraOutputCapability =
    cameraManager.getSupportedOutputCapability(camerasDevices[0], camera.SceneMode.NORMAL_PHOTO); // 获取对应相机设备profiles
  let previewProfiles: Array<camera.Profile> = profiles.previewProfiles;

  // 预览流
  let previewProfilesObj: camera.Profile = previewProfiles[0];

  // 创建 预览流 输出对象
  let imageReceiverSurfaceId: string = await receiver.getReceivingSurfaceId();
  let previewOutput: camera.PreviewOutput =
    cameraManager.createPreviewOutput(previewProfilesObj, imageReceiverSurfaceId);

  // 创建cameraInput对象
  let cameraInput: camera.CameraInput = cameraManager.createCameraInput(camerasDevices[0]);

  // 打开相机
  await cameraInput.open();

  // 会话流程
  let photoSession: camera.PhotoSession =
    cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;

  // 开始配置会话
  photoSession.beginConfig();

  // 把CameraInput加入到会话
  photoSession.addInput(cameraInput);

  // 把 预览流 加入到会话
  photoSession.addOutput(previewOutput);

  // 提交配置信息
  await photoSession.commitConfig();

  // 会话开始
  await photoSession.start();
}

@Concurrent
async function getImgs(img: image.Image) {
  let component = await img.getComponent(4)
  if (component) {
    console.info('0x000 getComponent succeeded')
  } else {
    console.error('0x000 getComponent failed')
  }
  return component
}

@Concurrent
async function getRelease(img: image.Image) {
  await img.release()
  console.info('0x000 img release succeeded')
}


export default function sendableImageSource() {
  describe('sendableImageAbilityTest', () => {

    let filePath: string;
    let fdNumber: number;
    let receiverApi: sendableImage.ImageReceiver
    let cameraM = camera.getCameraManager(testContext)

    let isEmpty = (temp: ESObject) => {
      if (temp == null || temp == undefined) {
        return true
      }
      return false
    }


    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
      await ability()
      let driver = Driver.create()
      await sleep(500)
      let button = await driver.findComponent(ON.text('允许', MatchPattern.EQUALS))
      console.info('button is ' + JSON.stringify(button))
      if (button != undefined) {
        console.info('button is ' + JSON.stringify(button))
        await button?.click()
      }
      sleep(3000)
    })

    let ability = async () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator()
      const bundleName = abilityDelegatorRegistry.getArguments().bundleName
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'TestAbility'
      }
      await delegator.startAbility(want)
      await sleep(500)
    }

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath)
      fdNumber = file.fd
      return fdNumber
    }

    const getBuffer = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const getImageSource = async (fileName: string, type?: string) => {
      let imageSourceApi: sendableImage.ImageSource
      if (type === "buffer") {
        const buffer = await getBuffer(fileName)
        imageSourceApi = sendableImage.createImageSource(buffer)
      } else if (type === "uri") {
        const filePath = fileName ? filesDir + '/' + fileName : ''
        console.info(`getImageSource imageSource uri ${filePath}`)
        imageSourceApi = sendableImage.createImageSource(filePath)
      } else {
        await getFd(fileName)
        imageSourceApi = sendableImage.createImageSource(fdNumber);
      }
      console.info(`getImageSource imageSourceApi ${imageSourceApi}`)
      return imageSourceApi
    }

    const getImageReceiver = async (type: number) => {
      if (type == 1) {
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      } else if (type == 2) {
        let size: image.Size = {
          height: 0,
          width: 0
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      } else if (type == 3) {
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.YCBCR_422_SP, 8);
      } else if (type == 4) {
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, -1);
      }
      return receiverApi
    }

    /**
     * @tc.number    : testCreateImageSourceUri0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0100
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0100"
      let fileName = 'test.jpg'
      try {
        let imageSourceApi = await getImageSource(fileName, "uri")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : testCreateImageSourceUri0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0200
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0200"
      let fileName = 'test.png'
      try {
        let imageSourceApi = await getImageSource(fileName, "uri")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceUri0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0300
     * @tc.desc      : 1.create imageSource
     *                 2.set uri is empty
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0300"
      let fileName = ''
      try {
        let imageSourceApi = await getImageSource(fileName, "uri")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(imageSourceApi).assertUndefined()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0100
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0100"
      let fileName = 'test.gif'
      try {
        let imageSourceApi = await getImageSource(fileName)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0200
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0200', 0, async (done: Function) => {
      const tag: string = "testCreateImageSourceFd0200"
      let fileName = 'test.jpg'
      try {
        let imageSourceApi = await getImageSource(fileName)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0300
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0300"
      let fileName = ''
      try {
        let imageSourceApi = await getImageSource(fileName)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0400
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0400
     * @tc.desc      : 1.create imageSource
     *                 2.set fd is -1
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0400', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0400"
      try {
        let imageSourceApi = await sendableImage.createImageSource(-1)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(imageSourceApi).assertUndefined()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : testCreateImageSourceBuf0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0100
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0100"
      let fileName = 'test.bmp'
      try {
        let imageSourceApi = await getImageSource(fileName, "buffer")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceBuf0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0200
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0200"
      let fileName = 'test.jpg'
      try {
        let imageSourceApi = await getImageSource(fileName, "buffer")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceBuf0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0300
     * @tc.desc      : 1.create imageSource
     *                 2.set ArrayBuffer is 0
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0300"
      try {
        const buf: ArrayBuffer = new ArrayBuffer(0)
        const imageSourceApi: sendableImage.ImageSource = sendableImage.createImageSource(buf)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(imageSourceApi).assertUndefined()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : testImageSourceCreatePixelMap0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0100
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0100"
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean')
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.number    : testImageSourceCreatePixelMap0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0200
     * @tc.desc      : 1.create imageSource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0200"
      let fileName = 'test.dng'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let opt: image.DecodingOptions = {
        editable: true,
        desiredSize: {
          width: 200,
          height: 200
        },
        desiredRegion: {
          size: {
            width: 100,
            height: 100
          },
          x: 0,
          y: 0
        }
      }
      imageSourceApi.createPixelMap(opt).then(async (pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        let info = await pixelMap.getImageInfo()
        console.info(`0x0000 ${tag} pixelMap size is ${info.size.height} ${info.size.width}`);
        expect(opt.desiredSize?.height).assertEqual(info.size.height)
        expect(opt.desiredSize?.width).assertEqual(info.size.width)
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })


    /**
     * @tc.number    : testImageSourceCreatePixelMap0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0300
     * @tc.desc      : 1.create imageSource
     *                 2.set sampleSize is 0
     *                 3.create PixelMap
     *                 4.return error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0300"
      let fileName = 'SVG.svg'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let opt: image.DecodingOptions = {
        sampleSize: 0
      }
      imageSourceApi.createPixelMap(opt).then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(isEmpty(pixelMap)).assertTrue()
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect(true).assertEqual(JSON.stringify(error) != null);
        done()
      })
    })


    /**
     * @tc.number    : testImageSourceCreatePixelMap0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0400
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0400', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0400"
      let fileName = 'test.ico'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let colorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);

      let opt: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: 3,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0,
        fitDensity:0,
        desiredDynamicRange:image.DecodingDynamicRange.AUTO,
        desiredColorSpace:colorSpace
      }
      imageSourceApi.createPixelMap(opt).then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean')
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })


    /**
     * @tc.number    : testImageSourceRelease0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0100
     * @tc.desc      : 1.create imageSource
     *                 2.imageSource release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0100"
      let fileName = 'test.jpg'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.release().then(() => {
        console.info(`0x0000 ${tag} release success ${JSON.stringify(imageSourceApi.createPixelMap())}`);
        expect(isEmpty(imageSourceApi.createPixelMap())).assertTrue()
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.number    : testImageSourceRelease0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0200
     * @tc.desc      : 1.create imageSource
     *                 2.imageSource release
     *                 3.create PixelMap
     *                 4.return error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0200"
      let fileName = 'test.jpg'
      let imageSourceApi = await getImageSource(fileName, 'uri')
      imageSourceApi.release().then(() => {
        imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
          console.info(`0x0000 ${tag} success ${pixelMap}`)
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`);
          expect(true).assertEqual(JSON.stringify(error) != null);
          done()
        })
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect(true).assertEqual(JSON.stringify(error) != null);
        done()
      })
    })

    /**
     * @tc.number    : testCreateImageReceiver0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0100
     * @tc.desc      : 1.create receiver
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0100"
      let receiver = await getImageReceiver(1)
      console.info(`0x0000 ${tag} success ${receiver}`)
      expect(isEmpty(receiver)).assertFalse()
      done()
    })

    /**
     * @tc.number    : testCreateImageReceiver0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0200
     * @tc.desc      : 1.create receiver
     *                 2.set format
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0200"
      try {
        let receiver = await getImageReceiver(2)
        console.info(`0x0000 ${tag} success ${receiver}`)
        expect(isEmpty(receiver)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect(error.code).assertEqual('401')
        done()
      }
    })


    /**
     * @tc.number    : testCreateImageReceiver0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0300
     * @tc.desc      : 1.create receiver
     *                 2.set format image.ImageFormat.YCBCR_422_SP
     *                 3.return error code is 401
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0300"
      try {
        let receiver = await getImageReceiver(3)
        console.info(`0x0000 ${tag} success ${receiver}`)
        expect(isEmpty(receiver)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect(error.code).assertEqual('401')
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageReceiver0400
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0400
     * @tc.desc      : 1.create receiver
     *                 2.set capacity is -1
     *                 3.return receiver
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0400', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0400"
      try {
        let receiver = await getImageReceiver(4)
        console.info(`0x0000 ${tag} success ${receiver}`)
        expect(isEmpty(receiver)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect(error.code).assertEqual('401')
        done()
      }
    })

    /**
     * @tc.number    : testImageReceiverOn0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_ON_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_ON_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_ON_0100"
      let receiver = await getImageReceiver(1)
      console.info(`0x0000 ${tag} success ${receiver}`)
      console.info(`onImageArrival start`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        expect(isEmpty(receiver.size)).assertFalse()
        done()
      })
      await createPreview(cameraM, receiver)

    })

    /**
     * @tc.number    : testGetReceivingSurfaceId0100
     * @tc.name      : SUB_MULTIMEDIA_GET_RECEIVING_SURFACES_0100
     * @tc.desc      : 1.create receiver
     *                 2.getReceivingSurfaceId
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_GET_RECEIVING_SURFACES_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_GET_RECEIVING_SURFACES_0100"
      let receiver = await getImageReceiver(1)
      receiver.getReceivingSurfaceId().then((id: string) => {
        console.info(`0x0000 ${tag} success ${receiver} ${id}`)
        expect(isEmpty(id)).assertFalse()
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      })
    })


    /**
     * @tc.number    : testReadNextImage0100
     * @tc.name      : SUB_MULTIMEDIA_RECEIVER_READ_NEXT_IMAGE_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_RECEIVER_READ_NEXT_IMAGE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_RECEIVER_READ_NEXT_IMAGE_0100"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success receiver`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then((img: image.Image) => {
          console.info(`0x0000 ${tag} readNextImage success`)
          expect(isEmpty(img.clipRect)).assertFalse()
          expect(isEmpty(img.format)).assertFalse()
          expect(isEmpty(img.size)).assertFalse()
          expect(isEmpty(img.timestamp)).assertFalse()
          done()
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
    })

    /**
     * @tc.number    : testImageGetComponent0100
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.getComponent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0100"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success ${receiver}`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then((img: image.Image) => {
          let clipRect = img.clipRect
          let format = img.format
          let size = img.size
          let timestamp = img.timestamp
          console.info(`0x0000 ${tag} img attributes ${JSON.stringify(clipRect)} ${JSON.stringify(size)} ${format} ${timestamp}`)
          img.getComponent(4).then((Component: image.Component) => {
            console.info(`0x0000 ${tag} img.getComponent succeeded`)
            expect(isEmpty(Component)).assertFalse()
            done()
          })
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
    })

    /**
     * @tc.number    : testImageGetComponent0200
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0200
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.getComponent
     *                 6.set componentType is 5
     *                 7.return error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0200"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success ${receiver}`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then((img: image.Image) => {
          img.getComponent(5).then((Component: image.Component) => {
            console.info(`0x0000 ${tag} img.getComponent succeeded`)
            expect().assertFail()
            done()
          })
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect(true).assertEqual(JSON.stringify(error) != null);
          done()
        })
      })
    })


    /**
     * @tc.number    : testImageGetComponent0300
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0300
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.main thread create image
     *                 5.child thread getComponent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0300"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success ${receiver}`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        let task1: taskpool.Task = new taskpool.Task(getImgs, img);
        taskpool.execute(task1).then((res: Object) => {
          console.info(`0x0000 ${tag} task1 return value: ${JSON.stringify(res)}`)
          expect(isEmpty(res)).assertFalse()
          done()
        }).catch((error: BusinessError) => {
          console.info(`0x0000 ${tag} task1 catch error: ${JSON.stringify(error)}`)
          expect().assertFail()
          done()
        })
      })
    })


    /**
     * @tc.number    : testImageGetComponent0400
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0400
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.main thread create image
     *                 5.child thread getComponent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0400', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0400"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker')
        workerInstance.postMessageWithSharedSendable(img);
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`0x0000 ${tag} workerInstance receive data: ${JSON.stringify(e.data)}`)
          expect('success').assertEqual(e.data)
          done()
        }
        workerInstance.onmessageerror = (e: MessageEvents) => {
          console.info(`0x0000 ${tag} worker error: ${e.data}`)
          expect().assertFail()
          done()
        }
      })
    })

    /**
     * @tc.number    : testReceiverRelease0100
     * @tc.name      : SUB_MULTIMEDIA_IMG_RELEASE_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_RELEASE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMG_RELEASE_0100"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then((img: image.Image) => {
          img.release().then(() => {
            console.info(`0x0000 ${tag} img.release succeeded`)
            expect(isEmpty(img.clipRect)).assertTrue()
            done()
          })
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
    })

    /**
     * @tc.number    : testReceiverRelease0200
     * @tc.name      : SUB_MULTIMEDIA_IMG_RELEASE_0200
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.main thread create image
     *                 6.child thread release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_RELEASE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMG_RELEASE_0200"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        let task2: taskpool.Task = await new taskpool.Task(getRelease, img)
        taskpool.execute(task2).then((res: Object) => {
          console.info(`0x0000 ${tag} task2 success `)
        }).catch((error: BusinessError) => {
          console.info(`0x0000 ${tag} ttask2 failed `)
        })

        setTimeout(() => {
          console.info(`0x0000 ${tag} img release success `)
          try {
            img.getComponent(4).then((Component: image.Component) => {
              console.info(`0x0000 ${tag} img getComponent succeeded`)
              expect().assertFail()
              done()
            }).catch((error: BusinessError) => {
              console.info(`0x0000 ${tag} img getComponent failed`)
            })
          } catch (error) {
            console.info(`0x0000 ${tag} getComponent failed error ${error}`)
            expect(true).assertEqual(JSON.stringify(error) != null);
            done()
          }
        }, 10)
      })
    })

    /**
     * @tc.number    : testReceiverRelease0300
     * @tc.name      : SUB_MULTIMEDIA_IMG_RELEASE_0300
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.main thread create image
     *                 6.child thread releas
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_RELEASE_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMG_RELEASE_0300"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/workerRelease')
        workerInstance.postMessageWithSharedSendable(img);
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`0x0000 ${tag} workerInstance receive data: ${JSON.stringify(e.data)}`)
          setTimeout(() => {
            console.info(`0x0000 ${tag} img release success `)
            try {
              img.getComponent(4).then((Component: image.Component) => {
                console.info(`0x0000 ${tag} img getComponent succeeded`)
                expect().assertFail()
                done()
              }).catch((error: BusinessError) => {
                console.info(`0x0000 ${tag} img getComponent failed`)
              })
            } catch (error) {
              console.info(`0x0000 ${tag} getComponent failed error ${error}`)
              expect(true).assertEqual(JSON.stringify(error) != null);
              done()
            }
          }, 10)
        }
        workerInstance.onmessageerror = (e: MessageEvents) => {
          console.info(`0x0000 ${tag} worker error: ${e.data}`)
          expect().assertFail()
          done()
        }
      })
    })

    /**
     * @tc.number    : testReadLatestImage0100
     * @tc.name      : SUB_MULTIMEDIA_RECEIVER_READ_LATEST_IMAGE_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readLatestImage
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_RECEIVER_READ_LATEST_IMAGE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_RECEIVER_READ_LATEST_IMAGE_0100"
      let receiver = await getImageReceiver(1)
      console.info(`0x0000 ${tag} success receiver`)
      console.info(`onImageArrival start`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readLatestImage().then((img: image.Image) => {
          console.info(`0x0000 ${tag} readLatestImage success`)
          expect(isEmpty(img)).assertFalse()
          done()
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
      await createPreview(cameraM, receiver)
    })

  })
}