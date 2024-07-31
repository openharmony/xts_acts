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
import observer  from '@ohos.arkui.observer';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct routerObserver012a {
  @State str:string = 'routerObserver012a'


  aboutToAppear(): void {
    console.log('testTag routerObserver012a aboutToAppear');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', 'routerObserver012a_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver012a aboutToDisappear');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012a_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver012a onPageShow');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012a_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver012a onPageHide');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012a_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver012a onBackPress');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012a_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver012a_text1')

      Button('Standard push')
        .id('routerObserver012a_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver012b',
            params: {age:18}
          }, router.RouterMode.Standard)
            .then()
            .catch((err:BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%')
  }
}

