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
@Entry
@Component
struct OnAccessibilityHoverEventExample {
  @State hoverText: string = 'no hover';
  @State color: Color = Color.Blue;
  @State text1 :string = ""
  @State text2 :string = ""
  @State text3 :string = ""
  @State text4 :string = ""

  build() {
    Column({ space: 20 }) {
      Text(this.text1).key('hoverTest1')
      Text(this.text2).key('hoverTest2')
      Text(this.text3).key('hoverTest3')
      Text(this.text4).key('hoverTest4')
      Button(this.hoverText)
        .width(180).height(80)
        .key('hoverButton')
        .backgroundColor(this.color)
        .onTouch((event)=>{
           console.info("onTouch")
        })
        .onAccessibilityHover((isHover: boolean, event: AccessibilityHoverEvent) => {
          // 通过onAccessibilityHover事件动态修改按钮在是否有鼠标悬浮时的文本内容与背景颜色
          console.info('testHover_' + JSON.stringify(event))
          if(event.type == AccessibilityHoverType.HOVER_ENTER) {
             this.text1 = 'HOVER_ENTER'
          }
          if(event.type == AccessibilityHoverType.HOVER_MOVE) {
             this.text2 = 'HOVER_MOVE'
          }
          if(event.type == AccessibilityHoverType.HOVER_EXIT) {
             this.text3 = 'HOVER_EXIT'
          }
          if(event.type == AccessibilityHoverType.HOVER_CANCEL) {
             this.text4 = 'HOVER_CANCEL'
          }
          if (isHover) {
            this.hoverText = 'hover';
            this.color = Color.Pink;
          } else {
            this.hoverText = 'no hover';
            this.color = Color.Black;
          }
        })
    }.padding({ top: 30 }).width('100%')
  }
}