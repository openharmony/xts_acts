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

import nativerender from 'libnativerender.so'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Column({ space: 10 }) {
        Text('TextWidthTest')
          .fontSize('32fp')
          .fontWeight(500)
          .margin({ bottom: 24 })

        XComponent({
          id: 'xComponentId',
          type: XComponentType.NODE,
          libraryname: 'nativerender'
        }).onDestroy(() => {
          console.log('onDestroy');
        }).onAppear(() => {

        }).width('100%')
          .height('100%')
      }.margin({
        top: 27,
        left: 12,
        right: 12
      })
      .height('40%')
      .width('90%')
    }
    .width('100%')
    .height('100%')
  }
}