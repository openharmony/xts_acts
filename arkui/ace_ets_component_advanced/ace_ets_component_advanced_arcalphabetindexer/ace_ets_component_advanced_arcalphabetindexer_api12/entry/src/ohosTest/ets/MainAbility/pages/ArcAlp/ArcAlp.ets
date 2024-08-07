/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { ComponentContent, ColorMetrics, LengthMetrics } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import { ArcAlphabetIndexer, ArcAlphabetIndexerAttribute } from '@ohos.arkui.ArcAlphabetIndexer';
const commonFamily = 'HarmonyOS Sans'
@Builder
function buildText() {
  Stack() {
    Text('head')
      .fontSize(30)
      .padding(10)
      .backgroundColor(0xF9CF93)
      .border({ width: '1px', color: Color.Black })

    Divider().width('100%').height('1px')
  }
  .alignContent(Alignment.Bottom)
}

@Entry
@Component
struct ArcListAndIndexer {
  private fullValue: string[] = [
    '#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ]
  private singleValue: string[] = [
    '#', 'A', 'B', 'C', 'D'
  ]
  private arrName : string[] = [
    '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',
    '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38',
    '39','40', '41','42',
  ];
  context: UIContext = this.getUIContext()
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));

  private scrollerForList: Scroller = new Scroller()
  @State indexerIndex: number = 0;

  private watchSize: number = 233 // 手表默认宽高：233*233
  private itemSize: number = 24   // 索引项默认大小：24

  build() {
    Column() {
      Row() {
        Stack() {
          ArcAlphabetIndexer({ arrayValue: this.fullValue, selected: 0 })
            .key('arcAlphabetIndex01')
            .autoCollapse(true)
            .width(100)
            .height(100)
            .borderWidth(1)

          ArcAlphabetIndexer({ arrayValue: this.singleValue, selected: 0 })
            .key('arcAlphabetIndex02')
            .width(100)
            .height(100)
            .color(ColorMetrics.resourceColor('#FFFAFA'))
            .selectedColor (ColorMetrics.resourceColor(Color.Red))
            .popupColor(ColorMetrics.resourceColor('#00FF7F'))
            .selectedBackgroundColor (ColorMetrics.resourceColor(Color.Blue))
            .popupBackground (ColorMetrics.resourceColor('#FF1F71FF'))
            .popupBackgroundBlurStyle(BlurStyle.BACKGROUND_THIN)
            .usingPopup(true)
            .selectedFont({size:'10.00fp',style:FontStyle.Italic,weight:200,family:commonFamily})
            .font({size:'15.00fp',style:FontStyle.Italic,weight:300,family:commonFamily})
            .popupFont({size:'20.00fp',style:FontStyle.Italic,weight:400,family:commonFamily})
            .itemSize(LengthMetrics.vp(20))
            .selected(1)
            .autoCollapse(false)

          ArcAlphabetIndexer({ arrayValue: this.singleValue, selected: 0 })
            .key('arcAlphabetIndex03')
            .width(100)
            .height(100)
            .color(ColorMetrics.resourceColor('#FFFAFA'))
            .selectedColor (ColorMetrics.resourceColor(Color.Red))
            .popupColor(ColorMetrics.resourceColor('#00FF7F'))
            .selectedBackgroundColor (ColorMetrics.resourceColor(Color.Blue))
            .popupBackground (ColorMetrics.resourceColor('#FF1F71FF'))
            .popupBackgroundBlurStyle(BlurStyle.BACKGROUND_THIN)
            .selectedFont({size:'-10.00fp',style:FontStyle.Italic,weight:-200,family:commonFamily})
            .font({size:'-15.00fp',style:FontStyle.Italic,weight:-300,family:commonFamily})
            .popupFont({size:'-20.00fp',style:FontStyle.Italic,weight:-400,family:commonFamily})
            .itemSize(LengthMetrics.vp(-20))
            .selected(-1)
        }.width('100%').height('100%')
      }.width('100%').height('100%')
    }
  }
}