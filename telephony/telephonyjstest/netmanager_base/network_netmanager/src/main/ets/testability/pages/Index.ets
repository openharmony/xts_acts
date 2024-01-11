/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import testNapi from 'libentry.so'
@Entry
@Component
struct Index {

  build() {
    Row() {
      Column() {
        Button("GetDefaultNet start")
          .width('50%')
          .height(40)
          .margin({ top: 10 })
          .onClick((event) => {
            this.GetDefaultNet()
          })
      }.width('100%')
    }.height('100%')
  }

  GetDefaultNet () {
    /** Output on the printer. */
    if (testNapi.testNetManager().valueOf() == 0) {
      console.log("Success [" + testNapi.testNetManager() + "]")
    } else if (testNapi.testNetManager().valueOf() == 201) {
      console.log("Missing permissions [" + testNapi.testNetManager() + "]")
    } else if (testNapi.testNetManager().valueOf() == 401) {
      console.log("Parameter error [" + testNapi.testNetManager() + "]")
    } else {
      console.log("Other errors [" + testNapi.testNetManager() + "]")
    }
  }
}