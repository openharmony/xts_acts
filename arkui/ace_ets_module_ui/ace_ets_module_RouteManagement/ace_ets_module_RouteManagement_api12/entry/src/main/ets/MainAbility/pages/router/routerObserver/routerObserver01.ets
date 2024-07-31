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
struct routerObserver01 {
  @State str:string = 'routerObserver01'


  aboutToAppear(): void {
    console.log('testTag routerObserver01 aboutToAppear');
    AppStorage.setOrCreate('routerObserver1_LifeCycle', 'routerObserver01_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver01 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver1_LifeCycle', AppStorage.get('routerObserver1_LifeCycle') + ';routerObserver01_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver01 onPageShow');
    AppStorage.setOrCreate('routerObserver1_LifeCycle', AppStorage.get('routerObserver1_LifeCycle') + ';routerObserver01_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver01 onPageHide');
    AppStorage.setOrCreate('routerObserver1_LifeCycle', AppStorage.get('routerObserver1_LifeCycle') + ';routerObserver01_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver01 onBackPress');
    AppStorage.setOrCreate('routerObserver1_LifeCycle', AppStorage.get('routerObserver1_LifeCycle') + ';routerObserver01_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver01_text1')

      Button('Single push')
        .id('routerObserver01_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver01',
            params: {age:18}
          }, router.RouterMode.Single)
            .then()
            .catch((err:BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%')
  }
}

