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
struct PathResource {
  build() {
    Column({space:5}) {

      Path({
        commands: 'M0 300 S100 0 240 300 Z',
        width: 100,
        height: 50
      })
        .id('PathResource1')

      Path({
        commands: $r('app.string.Path_commands'),
        width: $r('app.string.Width_100'),
        height: $r('app.string.Height_50')
      }).id('PathResource2')

      Path()
        .commands($r('app.string.Path_commands'))
        .width($r('app.string.Width_100'))
        .height($r('app.string.Height_50'))
        .id('PathResource3')

    }.width('100%')
  }
}