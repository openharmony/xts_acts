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
struct springBackExample {
  @State isShow: Boolean = false;
  @State springBack: string = "springBack";
  @State message: string = 'text';

  @Builder
  myBuilder() {
    Column() {
      Button() {
        Text("CONTEXT")
      }.height(50).key("springBackButton")
    }
  }

  build() {
    Column() {
      Text(this.message).id("Dismiss_3")
      Text(this.springBack).key("onWillSpringBackWhenDismiss").margin(30)
      Button("RegisterSpringback")
        .id("RegisterSpringback")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          height: SheetSize.MEDIUM,
          blurStyle: BlurStyle.Thick,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          preferType: SheetType.CENTER,


          onWillDismiss: ((DismissSheetAction: DismissSheetAction) => {
            this.message = 'reason: ' + JSON.stringify(DismissSheetAction.reason)
            if (DismissSheetAction.reason == DismissReason.SLIDE_DOWN) {
              DismissSheetAction.dismiss() //注册dismiss行为
            }
          }),

          onWillSpringBackWhenDismiss: ((SpringBackAction: SpringBackAction) => {
            //没有注册springBack, 下拉半模态页面无回弹行为
            this.springBack = "springBack success"
            SpringBackAction.springBack()
          }),
        })
    }
  }
}