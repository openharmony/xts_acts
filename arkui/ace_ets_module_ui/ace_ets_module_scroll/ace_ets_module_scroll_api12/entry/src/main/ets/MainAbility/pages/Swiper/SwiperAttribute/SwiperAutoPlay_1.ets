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
struct SwiperAutoPlay_1 {
  build() {
    Swiper() {
      Column() {
        Text('1')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAutoPlay_101')

      Column() {
        Text('2')
      }.width('100%').height('100%').backgroundColor(0xD2B48C).id('swiperAutoPlay_102')

      Column() {
        Text('3')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAutoPlay_103')

      Column() {
        Text('4')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAutoPlay_104')

      Column() {
        Text('5')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAutoPlay_105')

      Column() {
        Text('6')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperAutoPlay_106')
    }
    .id('swiperAutoPlay_1')
    .autoPlay(false)
  }
}