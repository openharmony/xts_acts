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
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
@Entry({ routeName: 'pushNamedRoute12' })
@Component
struct pushNamedRoute12 {
  @State text1:string = ''

  build() {
    Column() {
      Text('pushNamedRoute12').id('pushNamedRoute12_text1')
      Text(this.text1).id('pushNamedRoute12_text2')
      Button('pushNamedRoute').onClick((event: ClickEvent) => {
        try {
          router.pushNamedRoute({
            name: 'page2'
          },router.RouterMode.Standard).then()
            .catch((err:BusinessError) => {
              this.text1 = '' +  (err as BusinessError).code
            })
        } catch (err) {
          console.error(`pushNamedRoute failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);

        }
      })
        .id('pushNamedRoute12_btn1')
    }
  }
}