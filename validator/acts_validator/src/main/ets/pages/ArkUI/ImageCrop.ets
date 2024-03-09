/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import Logger from '../model/Logger';
import images from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import screenshot from '@ohos.screenshot';
import FirstDialog from '../model/FirstDialog';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import image from '@ohos.multimedia.image';
import { Info } from './InfoObj';
import { BusinessError } from '@ohos.base';

let path = globalThis.dir;
let LENGTH = 1;
const TAG = '[ImageCrop]';

@Entry
@Component
struct ImageCrop {
  @State FillColor: string = '#FF000000';
  @State name: string = 'ImageCrop';
  @State StepTips: string = '操作步骤：1、点击选择图片按钮，在图库选择一张图片\n' +
    '2、分别点击1：1、4：3、3：2按钮进行图片裁剪' + '\n' + '预期结果：图片裁剪成功';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State isMilitaryTime: boolean = false;
  @State time: string = '';
  @State select: Array<string> = [];
  @State imageList: Array<string> = [];
  @State pixelMap: PixelMap | null = null;
  @State tempPixelMap: PixelMap | null = null;
  @State originBM: PixelMap | null = null;
  @State isClick: boolean = true;
  @State is1_1: boolean = false;
  @State is4_3: boolean = false;
  @State is16_9: boolean = false;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    }
    else {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/ArkUI/ArkUI_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
        this.getScreen(isFullScreen);
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      this.getScreen(isFullScreen);
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  async getImage(): Promise<void> {
    Logger.info(TAG, 'enter getImage ===>')
    let mContext: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let abilityResult: common.AbilityResult = await mContext.startAbilityForResult(
      {
        bundleName: 'com.ohos.photos',
        abilityName: 'com.ohos.photos.MainAbility',
        parameters: {
          uri: 'multipleselect',
          filterMediaType: 'FILTER_MEDIA_TYPE_IMAGE',
          maxSelectCount: LENGTH
        }
      }
    );
    let want: Want | undefined = abilityResult.want;
    if (want !== null && want !== undefined) {
      let param: Want | undefined = want.parameters;
      if (param !== null && param !== undefined) {
        let result: Array<string> = param['select-item-list'] as Array<string>;

        if (result.length === LENGTH) {
          for (let i: number = 0; i < LENGTH; i++) {
            this.select.push(result[i]);
            Logger.info(TAG, 'imageList select ===>' + JSON.stringify(this.select))
            this.pixelMap = await this.readImage(this.select[0])
            this.originBM = await this.copyPixelMap(this.pixelMap);
            Logger.info(TAG, 'imageList pixelMap ===>' + JSON.stringify(this.pixelMap))
          }
        } else {
          result.forEach(item => {
            this.select.push(item);
            Logger.info(TAG, 'imageList select ===>' + JSON.stringify(this.select))
          })
        }
        Logger.info(TAG, 'imageList before  ===>')
      }
    }
  }

  async readImage(uri: string): Promise<PixelMap | null> {
    const prefix: string = 'file://';
    if (uri.startsWith('file://media')) {
      // uri = uri.substr(prefix.length);
      Logger.info(TAG, 'readImage prefix  ===>' + uri)
    } else if (prefix) {
      uri = uri.substr(prefix.length);
    }
    // path参数为文件的应用沙箱路径或文件URI，所以使用沙箱路径时，需要去掉前缀
    const file: fs.File = await fs.open(uri, fs.OpenMode.READ_ONLY);
    Logger.info(TAG, 'readImage file  ===>' + JSON.stringify(file.fd))
    let imageSourceApi: images.ImageSource = images.createImageSource(file.fd);
    Logger.info(TAG, 'readImage imageSourceApi  ===>' + JSON.stringify(imageSourceApi))
    if (!imageSourceApi) {
      Logger.info(TAG, 'readImage !imageSourceApi ===>')
      return null;
    }
    let pixmap: images.PixelMap = await imageSourceApi.createPixelMap();
    if (!pixmap) {
      Logger.info(TAG, 'readImage !pixmap ===>')
      return null;
    } else {
      Logger.info(TAG, 'readImage end>')
    }
    return pixmap;
  }

  /**
   * 图片裁剪
   * @param proportion
   */
  async cropImage(proportion: number): Promise<void> {
    if (!this.pixelMap) {
      return;
    }
    let imageInfo: images.ImageInfo = await this.pixelMap.getImageInfo();
    if (!imageInfo) {
      return;
    }
    let imageHeight: number = imageInfo.size.height;
    let imageWith: number = imageInfo.size.width;
    Logger.info(TAG, `imageInfo = ${JSON.stringify(imageInfo)}`);
    if (proportion === 1) {
      if (imageHeight > imageWith) {
        imageHeight = imageWith;
      } else {
        imageWith = imageHeight;
      }
      Logger.info(TAG, `imageHeight = ${JSON.stringify(imageHeight)},imageWith = ${JSON.stringify(imageWith)}`);
    }
    try {
      await this.pixelMap.crop({
        size: { height: imageHeight / proportion, width: imageWith },
        x: 0,
        y: 0
      });
    } catch (error) {
      Logger.info(TAG, `crop error = ${JSON.stringify(error)}`);
    }
    this.flushPage();
  }

  async copyPixelMap(pm: PixelMap): Promise<PixelMap> {
    const imageInfo: image.ImageInfo = await pm.getImageInfo();
    const w: number = imageInfo.size.width;
    const h: number = imageInfo.size.height;
    let buffer: ArrayBuffer = new ArrayBuffer(w * h * 4);
    // readPixelsToBuffer输出为BGRA_8888
    await pm.readPixelsToBuffer(buffer);
    // pixelFormat 4代表BGRA_8888，3代表BARG_8888。  这里使用copyPixelMap的时候，每次都进行两次转换，保证色值正常。
    let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: w, width: h } };
    return await image.createPixelMap(buffer, opts);
  }

  /**
   * 刷新图层显示
   */
  flushPage(): void {
    this.tempPixelMap = this.pixelMap;
    this.pixelMap = null;
    this.pixelMap = this.tempPixelMap;
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.is1_1 && this.is4_3 && this.is16_9) {
        this.Vue = true
      }
    }, 1000)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Button('选择图片')
          .onClick(async () => {
            this.getImage()
          })
          .backgroundColor(Color.Blue)
          .margin({ top: 24 })

        Image(this.pixelMap)
          .width('80%')
          .height('75%')
          .objectFit(ImageFit.Contain)
          .margin({ top: 24, bottom: 24 })

        Row() {
          Button('1:1')
            .backgroundColor(this.is1_1 ? Color.Green : Color.Blue)
            .onClick(async () => {
              if (this.isClick) {
                this.isClick = false
                this.pixelMap = await this.copyPixelMap(this.originBM);
                try {
                  await this.cropImage(1)
                  this.is1_1 = true
                } catch (err) {
                  Logger.info(TAG, 'err' + JSON.stringify(err.message))
                }
                setTimeout(() => {
                  this.isClick = true
                }, 500)
              }
            })

          Button('4:3')
            .backgroundColor(this.is4_3 ? Color.Green : Color.Blue)
            .onClick(async () => {
              if (this.isClick) {
                this.isClick = false
                this.pixelMap = await this.copyPixelMap(this.originBM);
                try {
                  await this.cropImage(4 / 3)
                  this.is4_3 = true
                } catch (err) {
                  Logger.info(TAG, 'err' + JSON.stringify(err.message))
                }
                setTimeout(() => {
                  this.isClick = true
                }, 500)
              }
            })

          Button('3:2')
            .backgroundColor(this.is16_9 ? Color.Green : Color.Blue)
            .onClick(async () => {
              if (this.isClick) {
                this.isClick = false
                this.pixelMap = await this.copyPixelMap(this.originBM);
                try {
                  await this.cropImage(3 / 2)
                  this.is16_9 = true
                } catch (err) {
                  Logger.info(TAG, 'err' + JSON.stringify(err.message))
                }
                setTimeout(() => {
                  this.isClick = true
                }, 500)
              }
            })
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
      }
      .padding({ bottom: 24 })
      .height('80%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })

        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }

  async savePicture(data: images.PixelMap, context: any) {
    Logger.info(TAG, `savePicture`);
    let packOpts: images.PackingOption = {
      format: "image/jpeg", quality: 100
    };
    let info: Info = {
      prefix: 'IMG_', suffix: '.jpg', directory: mediaLibrary.DirectoryType.DIR_IMAGE
    };
    let name = this.name;
    let displayName = `${info.prefix}${name}${info.suffix}`;
    let dirPath = path + '/screenshot' + '/' + displayName;
    let imagePackerApi = images.createImagePacker();
    let arrayBuffer = await imagePackerApi.packing(data, packOpts);
    let fd = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    imagePackerApi.release();
    try {
      await fs.write(fd.fd, arrayBuffer);
    } catch (err) {
      Logger.error(`write failed, code is ${err.code}, message is ${err.message}`);
    }
    await fs.close(fd);
    Logger.info(TAG, `write done`);
  }

  getScreen = (isFullScreen: boolean) => {
    let screenshotOptions: screenshot.ScreenshotOptions = {
      screenRect: { left: 0, top: 0, width: 400, height: 400 },
      imageSize: { width: 400, height: 400 },
      rotation: 0,
      displayId: 0
    };
    if (isFullScreen) {
      screenshotOptions = {
        rotation: 0
      }
    }
    try {
      screenshot.save(screenshotOptions, (err: BusinessError, data: images.PixelMap) => {
        if (err) {
          Logger.info(TAG, `Failed to save the screenshot. Error:${JSON.stringify(err)}`);
        }
        Logger.info(TAG, 'save callback');
        this.savePicture(data, getContext(this) as ESObject);
      })
    } catch (err) {
      Logger.error(`save failed, code is ${err.code}, message isaction ${err.message}`);
    }
  }
}

