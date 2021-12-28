/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
struct flex {
  private content: string = "Flex Page"

  onPageShow() {
    console.info('Flex page show called');
  }

  onBuildDone() {
    console.info('Flex page build done called');
  }

  build() {
    Scroll() {
      Column() {
        Text("Flex").fontSize(16)
        Flex({
          direction: FlexDirection.Column,
          wrap: FlexWrap.NoWrap,
          justifyContent: FlexAlign.Center,
          alignContent: FlexAlign.Start,
          alignItems: ItemAlign.Auto
        }) {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Column({ space: 5 }) {
            Text('direction:RowReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
            Text('Flex01').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex02').width('20%').height(50).backgroundColor(0xD2B48C)
            Text('Flex03').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex04').width('20%').height(50).backgroundColor(0xD2B48C)
          }.width('100%').margin({ top: 5 })
        }
        .key('flex')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("Flex1").fontSize(16)
        Flex({
          direction: FlexDirection.Row,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.Start,
          alignContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Column({ space: 5 }) {
            Text('direction:RowReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
            Text('Flex10').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex12').width('20%').height(50).backgroundColor(0xD2B48C)
            Text('Flex13').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex14').width('20%').height(50).backgroundColor(0xD2B48C)
          }.width('100%').margin({ top: 5 })
        }
        .key('flex1')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("Flex2").fontSize(16)
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.WrapReverse,
          justifyContent: FlexAlign.End,
          alignContent: FlexAlign.End,
          alignItems: ItemAlign.Start
        }) {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Column({ space: 5 }) {
            Text('direction:RowReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
            Text('Flex21').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex22').width('20%').height(50).backgroundColor(0xD2B48C)
            Text('Flex23').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex24').width('20%').height(50).backgroundColor(0xD2B48C)
          }.width('100%').margin({ top: 5 })
        }
        .key('flex2')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("Flex3").fontSize(16)
        Flex({
          direction: FlexDirection.ColumnReverse,
          wrap: FlexWrap.WrapReverse,
          justifyContent: FlexAlign.SpaceBetween,
          alignContent: FlexAlign.SpaceBetween,
          alignItems: ItemAlign.Stretch
        }) {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Column({ space: 5 }) {
            Text('direction:RowReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
            Text('Flex31').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex32').width('20%').height(50).backgroundColor(0xD2B48C)
            Text('Flex33').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex34').width('20%').height(50).backgroundColor(0xD2B48C)
          }.width('100%').margin({ top: 5 })
        }
        .key('flex3')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("Flex4").fontSize(16)
        Flex({
          direction: FlexDirection.ColumnReverse,
          wrap: FlexWrap.WrapReverse,
          justifyContent: FlexAlign.SpaceEvenly,
          alignContent: FlexAlign.SpaceEvenly,
          alignItems: ItemAlign.End
        }) {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Column({ space: 5 }) {
            Text('direction:RowReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
            Text('Flex41').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex42').width('20%').height(50).backgroundColor(0xD2B48C)
            Text('Flex43').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex44').width('20%').height(50).backgroundColor(0xD2B48C)
          }.width('100%').margin({ top: 5 })
        }
        .key('flex4')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("Flex5").fontSize(16)
        Flex({
          direction: FlexDirection.ColumnReverse,
          wrap: FlexWrap.WrapReverse,
          justifyContent: FlexAlign.SpaceAround,
          alignContent: FlexAlign.SpaceAround,
          alignItems: ItemAlign.Baseline
        }) {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Column({ space: 5 }) {
            Text('direction:RowReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
            Text('Flex51').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex52').width('20%').height(50).backgroundColor(0xD2B48C)
            Text('Flex53').width('20%').height(50).backgroundColor(0xF5DEB3)
            Text('Flex54').width('20%').height(50).backgroundColor(0xD2B48C)
          }.width('100%').margin({ top: 5 })
        }
        .key('flex5')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }
    }
  }
}
