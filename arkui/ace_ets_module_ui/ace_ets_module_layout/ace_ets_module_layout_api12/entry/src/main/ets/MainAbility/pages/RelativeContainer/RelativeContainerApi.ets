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
struct RelativeContainerApi {
  build() {
    Row() {
      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .key('row1')

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: {anchor: "row1", align: HorizontalAlign.End},
            top: {anchor: "row1", align: VerticalAlign.Bottom}
          })
          .key('row2')

        Row().width(100).height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            left: {anchor: "barrier1", align: HorizontalAlign.End},
            top: {anchor: "row1", align: VerticalAlign.Top}
          })
          .key('row3')

      }
      .width(300).height(300)
      .margin({left: 50})
      .border({width:2, color: "#6699FF"})
      .barrier([{id: "barrier1", direction: BarrierDirection.RIGHT, referencedId:["row1", "row2"]}])

    }
    .height('100%')
  }
}