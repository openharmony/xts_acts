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
struct SwiperAttribute_2 {
  onPageShow() {
    console.info('SwiperAttribute_0090 onPageShow');
  }

  build() {
    Column() {
      Swiper() {
        Column() {
          Text('1')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAttributeColumn_201')

        Column() {
          Text('2')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).id('swiperAttributeColumn_202')

        Column() {
          Text('3')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAttributeColumn_203')

        Column() {
          Text('4')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).id('swiperAttributeColumn_204')

        Column() {
          Text('5')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAttributeColumn_205')

        Column() {
          Text('6')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).id('swiperAttributeColumn_206')
      }
      .id('swiperAttribute_2')
      .loop(true)
      .displayCount(1)
      .indicator(true)
      .margin(20)
      .width('90%')
      .height('60%')
    }.id('swiperAttributeParentColumn_2')
  }
}