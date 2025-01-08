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
struct RichEditorOnDoubleClick {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State onDoubleClick: string = 'Init';

  build() {
    Column({ space: 100 }) {
      Text(this.onDoubleClick).id("onDoubleClick_text").width('90%')
      RichEditor(this.options)
        .id("onDoubleClick_id")
        .clip(true)
        .draggable(true)
        .onReady(() => { 
          this.controller.addImageSpan($r("app.media.icon"),
            {
              imageStyle:
              {
                size: [200, 200]
              },
              gesture:
              {
                onDoubleClick: () => {
                  console.info("onHover_onDoubleClick TextSpan_text1 onDoubleClick")
                  this.onDoubleClick = 'onDoubleClick succ'
                }
              }
            })
        })
        .borderWidth(1)
        .borderColor(Color.Green)
        .width(200)
        .height(200)
    }
    .borderWidth(1)
    .borderColor(Color.Red)
  }
}