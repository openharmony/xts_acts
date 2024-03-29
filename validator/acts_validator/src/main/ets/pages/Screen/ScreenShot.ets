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

import Logger from '../model/Logger';
import { CustomContainer } from '../common/CameraFlashContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';
import animator, { AnimatorOptions } from '@ohos.animator';
import window from '@ohos.window';
import display from '@ohos.display';
import prompt from '@ohos.promptAction';
import screenshot from '@ohos.screenshot';
import image from '@ohos.multimedia.image';
import fileIo from '@ohos.file.fs';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base';

class ResponseData {
  status: string;
  errorMessage: string;
  result?: boolean
}

const RANGE: number = 20 // 裁剪框点击范围
const SCALE: number = 0.5 // 缩放比例

@CustomDialog
struct ScreenshotDialog {
  screenshotController: CustomDialogController
  @Link screenshotUrl: PixelMap
  @Link isScroll: boolean

  build() {
    Scroll() {
      Column() {
        Image(this.screenshotUrl)
      }
      .borderRadius(10)
      .padding(20)
      .backgroundColor(Color.White)
    }
    .id('screenResult')
    .scrollable(this.isScroll ? ScrollDirection.None : ScrollDirection.Vertical)
    .scale({ x: SCALE, y: SCALE })
    .onClick(() => {
      this.screenshotController.close()
    })
  }
}

const context = getContext(this);
let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);

@Entry
@Component
struct ScreenShot {
  @State FillColor: string = '#FF000000';
  @State name: string = 'ScreenShot';
  @State StepTips: string = '测试目的：用于测试系统截图功能\n-点击颜色块，在滑动过程中点击截屏' +
    '\n-截取1、2、3块颜色块图片\n-去图库查看图片是否正常。';
  @State Vue: boolean = false;
  @State isFlush: boolean = undefined;
  @State isPass: boolean = false;
  @State intervalNum: number = 0;
  @State hid: number = 25;
  @State textNum: number = 1;
  @State screenshotUrl: PixelMap = undefined;
  @State isScroll: boolean = true
  private photoPath: string = '';
  private flag: boolean = false;
  private TAG: string = "[ScreenShot test]";
  private backAnimator: ESObject = undefined;
  screenshotDialogController: CustomDialogController = new CustomDialogController({
    builder: ScreenshotDialog({ screenshotUrl: $screenshotUrl, isScroll: $isScroll }),
    autoCancel: true,
    customStyle: true,
    offset: { dx: -100, dy: 100 }
  })

  // 获取当前窗口
  getCurrentWindow(context: Context) {
    return window.getTopWindow(context)
  }

  // 判断隐私窗口
  hasPrivate(): ResponseData {
    let currentDisplay: display.Display = null
    try {
      currentDisplay = display.getDefaultDisplaySync()
    } catch (exception) {
      return { status: 'failed', errorMessage: JSON.stringify(exception) }
    }
    if (currentDisplay === null) {
      return { status: 'failed', errorMessage: 'get current display failed' }
    }
    let ret = undefined
    try {
      ret = display.hasPrivateWindow(currentDisplay.id)
    } catch (exception) {
      return { status: 'failed', errorMessage: JSON.stringify(exception) }
    }
    if (ret === undefined) {
      return { status: 'failed', errorMessage: 'ret is undefined' }
    }
    return ret ? { status: 'success', errorMessage: '', result: true } :
      { status: 'success', errorMessage: '', result: false }
  }

  // 设置隐私窗口
  setWindowPrivacyMode(context: Context, windowPrivacyMode: boolean) {
    let currentWindow = null
    this.getCurrentWindow(context)
      .then(res => {
        currentWindow = res
        try {
          currentWindow.setWindowPrivacyMode(windowPrivacyMode, (err: BusinessError) => {
            if (err.code) {
              Logger.error('set window privacy mode failed cause: ' + JSON.stringify(err))
              return
            }
            Logger.info(`set window privacy mode success ${windowPrivacyMode}`)
          })
        } catch (exception) {
          Logger.info('set window mode failed cause: ' + JSON.stringify(exception))
        }
      })
  }

  // 屏幕截图 默认参数screenshotOptions为空时 截全屏
  getScreenshot(screenshotOption = {}) {
    return screenshot.save(screenshotOption)
  }

  // 设置全屏展示 isFullScreen: boolean
  setFullScreen(context: Context, isFullScreen: boolean) {
    this.getCurrentWindow(context)
      .then(res => {
        res.setFullScreen(isFullScreen, (err) => {
          if (err.code) {
            Logger.error('failed set full-screen mode cause: ' + JSON.stringify(err))
            return
          }
          Logger.info('success set full-screen mode')
        })
      })
  }

  create() {
    let _this = this
    this.backAnimator = animator.create({
      duration: 2500,
      easing: "ease",
      delay: 0,
      fill: "none",
      direction: "normal",
      iterations: 1,
      begin: 25,
      end: 400
    })
    this.backAnimator.onfinish = () => {
      _this.flag = true
      _this.textNum++
      if (_this.textNum === 4) {
        _this.textNum = 1
      }
      console.info(_this.TAG, 'backAnimator onfinish')
    }
    this.backAnimator.onrepeat = () => {
      console.info(_this.TAG, 'backAnimator repeat')
    }
    this.backAnimator.oncancel = () => {
      console.info(_this.TAG, 'backAnimator cancel')
    }
    this.backAnimator.onframe = (value: number) => {
      _this.hid = value
    }
  }

  /**
   * 保存图片
   * @param buffer
   */
  async saveImage(buffer: ArrayBuffer): Promise<void> {
    // 创建截图类型文件
    let testFileName: string = 'testFile' + Date.now() + '.jpg';
    let createOption: photoAccessHelper.PhotoCreateOptions = {
      subtype: photoAccessHelper.PhotoSubtype.SCREENSHOT
    }
    Logger.info(this.TAG, 'testFileName ==' + testFileName);

    phAccessHelper.createAsset(testFileName, createOption, (err, photoAsset) => {
      let asset = photoAsset;
      Logger.info(this.TAG, 'enter createAsset ==' + asset.uri);
      if (asset != undefined) {
        console.info(this.TAG, 'createAsset file photoAsset.uri' + asset.uri);
        console.info(this.TAG, 'createAsset successfully');
        asset.open('rw', async (err, fd) => {
          if (fd != undefined) {
            console.info(this.TAG, 'File fd' + fd);
            await fileIo.write(fd, buffer);
            asset.close(fd);
          } else {
            console.error(this.TAG, 'File err' + err);
          }
        });
        Logger.info(this.TAG, 'save image done');
      } else {
        console.error('createAsset failed, message = ', err);
      }
    });
  }

  async pixelMapToBuffer(pm: PixelMap): Promise<void> {
    const imagePackerApi = image.createImagePacker();
    let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
    imagePackerApi.packing(pm, packOpts).then((data: ArrayBuffer) => {
      // data 为打包获取到的文件流，写入文件保存即可得到一张图片
      this.saveImage(data)
    }).catch((error: BusinessError) => {
      console.error(this.TAG, 'Failed to pack the image. And the error is: ' + error.message);
    })
  }

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name)
    globalThis.ShowFloatingWindow();
  }

  build() {
    Stack() {
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
              url: 'pages/Screen/Screen_index',
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
        .zIndex(1)


        // 小方块的移动
        Row() {
          if (this.textNum === 1) {
            Row() {
              Text()
                .width(80)
                .height(80)
                .backgroundColor(Color.Blue)
            }
            .position({ x: '40%', y: this.hid })
            .onClick(() => {
              this.create()
              this.flag = false
              this.backAnimator.play()
            })
            .width('100%')
          } else if (this.textNum === 2) {
            Row() {
              Text()
                .width(80)
                .height(80)
                .backgroundColor(Color.Blue)

              Text()
                .width(80)
                .height(80)
                .backgroundColor(Color.Green)
            }
            .position({ x: '35%', y: this.hid })
            .onClick(() => {
              this.create()
              this.flag = false
              this.backAnimator.play()
            })
            .width('100%')
          } else if (this.textNum === 3) {
            Row() {
              Text()
                .width(80)
                .height(80)
                .backgroundColor(Color.Blue)

              Text()
                .width(80)
                .height(80)
                .backgroundColor(Color.Green)

              Text()
                .width(80)
                .height(80)
                .backgroundColor(Color.Yellow)
            }
            .position({ x: '25%', y: this.hid })
            .onClick(() => {
              this.create()
              this.flag = false
              this.backAnimator.play()
            })
            .width('100%')
          }
        }
        .width('100%')
        .height('70%')
        .zIndex(1)

        Row() {
          Button('截屏')
            .width(70)
            .height(70)
        }
        .onClick(() => {
          this.isScroll = true
          this.Vue = true
          let result: ResponseData = this.hasPrivate()
          console.info('onClick  result===', result.status)
          if (result.status === 'failed') {
            prompt.showToast({
              message: result.errorMessage
            })
            return
          }
          if (result.status === 'success' && result.result) {
            prompt.showToast({
              message: '截屏成功',
              duration: 10000
            })
            return
          }
          let promise = this.getScreenshot()
          try {
            promise.then(res => {
              this.screenshotUrl = res
              console.info('onClick  screenshotUrl===', this.screenshotUrl)
              this.screenshotDialogController.open()
              this.pixelMapToBuffer(this.screenshotUrl)
            })
          } catch (error) {
            prompt.showToast({
              message: `${error}`
            })
          }

        })
        .height('10%')
        .offset({ x: '-35%', y: '-10%' })
        .zIndex(2)

        CustomContainer({
          title: this.name,
          Url: 'pages/Screen/Screen_index',
          StepTips: this.StepTips,
          FillColor: $FillColor,
          name: $name,
          Vue: $Vue,
          isFlash: $isFlush
        })
          .height('10%')
          .width('100%')
          .zIndex(2)
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Black)
    }
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Screen/Screen_index'
    })
  }
}