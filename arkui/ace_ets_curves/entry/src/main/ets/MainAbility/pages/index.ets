// @ts-nocheck
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

import router from '@ohos.router';

globalThis.flag =true
@Entry
@Component
struct Index {
  onPageShow() {

    let options = {
      url: 'pages/curve',
    }
    try {
      console.info("lanyi Index flag: " + globalThis.flag);
      if(globalThis.flag) {
        router.push(options)
      }



    } catch (err) {
    }


  }

  build() {
    Row() {
      Column() {
        Text("Curve test index")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)


      }
      .width('100%')
    }
    .height('100%')
  }
}