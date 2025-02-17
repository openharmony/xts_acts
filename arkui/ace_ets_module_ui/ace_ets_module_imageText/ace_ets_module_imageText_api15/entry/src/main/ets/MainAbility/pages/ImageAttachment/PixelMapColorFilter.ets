/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { LengthMetrics } from '@ohos.arkui.node'
import { image } from '@kit.ImageKit'
import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct PixelMapColorFilter {
  private ColorFilterMatrix: number[] = [0.239, 0, 0, 0, 0, 0, 0.616, 0, 0, 0, 0, 0, 0.706, 0, 0, 0, 0, 0, 1, 0];
  private color: common2D.Color = { alpha: 125, red: 125, green: 125, blue: 255 };
  @State DrawingColorFilterFirst: ColorFilter | DrawingColorFilter | undefined = new ColorFilter(this.ColorFilterMatrix)
  @State mutableStyledString1: MutableStyledString = new MutableStyledString("Init");
  @State syncLoadValue: boolean = false
  @State resourceValue: string = ''
  @State ColorFilter: string = ''
  @State imagePixelMap: image.PixelMap | undefined = undefined
  @State imagePixelMap3: image.PixelMap | undefined = undefined

  async aboutToAppear() {
    console.info("aboutToAppear initial imagePixelMap")
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'))
  }
  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    })
    await imageSource.release()
    return createPixelMap
  }

  controller: TextController = new TextController();

  update(){
    this.controller.setStyledString(this.mutableStyledString1)
  }
  build() {
    Column({ space: 1 }) {
      Text(undefined, { controller: this.controller }).width('100%').copyOption(CopyOptions.LocalDevice)
        .height('10%')
      Button('append pixelmap').height('5%').id('set_colorFilter_append_pixelmap')
        .onClick(()=>{
          if (this.imagePixelMap != undefined) {
            this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
              value: this.imagePixelMap,
              size: { width: 50, height: 50 },
              layoutStyle: { borderRadius: LengthMetrics.vp(10) },
              verticalAlign: ImageSpanAlignment.BASELINE,
              objectFit: ImageFit.Contain,
              colorFilter: this.DrawingColorFilterFirst,
            })))
            this.update()
          }
        })
      Row() {
        Button('undefined').width('50%').height('5%').id('set_colorFilter_undefined')
          .onClick(() => {
            this.DrawingColorFilterFirst = undefined
            this.update()
          })
        Button('Drawing').width('50%').height('5%').id('set_colorFilter_DrawingColorFilter')
          .onClick(() => {
            this.DrawingColorFilterFirst = drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.SRC_IN)
            this.update()
          })
      }
      Button('getStyles').width('50%').height('5%').id('get_styles')
        .onClick(() => {
          let imageArray = this.mutableStyledString1.getStyles(0,  this.mutableStyledString1.length)
          for (let i = 0; i < imageArray.length; ++i) {
            if (imageArray[i].styledKey === 300) {
              let attachment = imageArray[i].styledValue as ImageAttachment
              console.info('ImageAttachment value  ' + JSON.stringify(attachment.value))
              this.imagePixelMap3 = attachment.value
              console.info('ImageAttachment size  ' + JSON.stringify(attachment.size))
              console.info('ImageAttachment verticalAlign  ' + JSON.stringify(attachment.verticalAlign))
              console.info('ImageAttachment objectFit  ' + JSON.stringify(attachment.objectFit))
              console.info('ImageAttachment layoutStyle  ' + JSON.stringify(attachment.layoutStyle))
              if (attachment.colorFilter) {
                this.DrawingColorFilterFirst = attachment.colorFilter
                console.info('ImageAttachment colorFilter1  ' + JSON.stringify(attachment.colorFilter))
                this.ColorFilter = '' + JSON.stringify(attachment.colorFilter)
              } else {
                console.info('ImageAttachment colorFilter2  ' + JSON.stringify(attachment.colorFilter))
                this.ColorFilter = 'undefined'
              }
            }
          }
        }).height(35).padding(8).margin({top:10,right:10})
      Row() {
        Text(this.resourceValue).id('resourceValue').height('5%')
        Text(this.ColorFilter).id('ColorFilter_content').height('5%')
      }
      Image(this.imagePixelMap3).height('5%').colorFilter(this.DrawingColorFilterFirst)
    }.width('100%')
  }
}