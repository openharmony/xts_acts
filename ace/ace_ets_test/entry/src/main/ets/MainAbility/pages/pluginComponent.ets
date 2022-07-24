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
import pluginComponentManager from '@ohos.pluginComponent'
@Entry
@Component
struct pluginComponent {
  private content: string = "pluginComponent Page";
  @State isPlaying: boolean = false

  onPageShow() {
    console.info('pluginComponent page show called');
  }

  onBuildDone() {
    console.info('pluginComponent page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Scroll() {
        Column() {

        }
      }
    }
    .key('flex')
    .width('100%')
    .height('100%')
  }
}
