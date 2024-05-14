/**
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

@Entry
@Component
struct RichEditorMenuPolicy {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State start: number = -1;
  @State end: number = -1;
  @State message: string = "[-1, -1]"
  @State radius: number = 0
  @State menuPolicyOptions: number[] = [0, 1, 2]
  @State menuPolicyOptionStr: string[] = ['DEFAULT', 'HIDE', 'SHOW']
  @State index: number = 0
  @State count: number = 0

  build() {
    Column() {
      Column() {
        RichEditor(this.options)
          .id("RichEditorMenuPolicyCon")
          .clip(true)
          .padding(10)
          .onReady(() => {
            this.controller.addTextSpan("0123456789",
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 60
                },
                gesture:
                {
                  onLongPress: () => {
                    console.info("onLongPress测试")
                    this.controller.setSelection(this.start, this.end, {
                      menuPolicy: this.menuPolicyOptions[this.index]
                    })
                  }
                }
              })
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width(400)
          .height(200)
          .borderRadius(this.radius)
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height(200)

      Column() {
        Row({ space: 2 }) {
          Button('设置menuPolicy属性:' + this.menuPolicyOptionStr[this.index])
            .id("RichEditorMenuPolicy_" + this.menuPolicyOptionStr[this.index])
            .onClick(() => {
            this.index++
            if (this.index > (this.menuPolicyOptions.length - 1)) {
              this.index = 0
            }
          })
        }
      }
      .justifyContent(FlexAlign.Center)
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height(100)

      Column() {
        Text("selection range:").width("100%")
        Text() {
          Span(this.message)
        }.width("100%")
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height(100)
    }
  }
}
