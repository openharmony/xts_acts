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
struct ColumnSetFlexShinkNodeTest {
  private content: string = "ColumnSetFlexShink Page";
  onPageShow() {
    console.info('ColumnSetFlexShink onPageShow');
  }

  onBuildDone() {
    console.info('ColumnSetFlexShink page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('ColumnSetFlexShink').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Column({
          space: 30,
        }) {
          Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnSetFlexShinkNone_1')
          Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('columnSetFlexShinkNone_2')
          Column(){Text('3')}.width(300).height(300).backgroundColor(0xF5DEB3).key('columnSetFlexShinkNone_3').flexShrink(1)
        }
        .key('columnSetFlexShinkNone')
        .height(400)
        .width(350)
        .backgroundColor(0xAFEEEE)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
