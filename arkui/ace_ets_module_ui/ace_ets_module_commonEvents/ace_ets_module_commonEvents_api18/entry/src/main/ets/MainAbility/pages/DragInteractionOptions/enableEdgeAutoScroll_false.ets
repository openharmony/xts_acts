/*
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

@Entry
@Component
struct EnableEdgeAutoScroll_falseExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  @State text: string = ''

  build() {
    Column() {
      Row() {
        Image($r('app.media.app_icon')).key('image')
          .draggable(true)
          .width('15%')
          .height('10%')
          .onDragStart(()=>{})
      }
      Column() {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('5%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
        .backgroundColor(Color.Pink)
        .onDidScroll(() => {
          this.text = 'enableEdgeAutoScroll:false'
        })
        .width('20%')
        .height('45%')
        .dragPreviewOptions({}, { isMultiSelectionEnabled: false, enableEdgeAutoScroll: false })

       Column().key('Text')
       
        Column() {
          Text(this.text).key('text_false')
        }
      }

    }.width('100%').height('100%')

  }
}
