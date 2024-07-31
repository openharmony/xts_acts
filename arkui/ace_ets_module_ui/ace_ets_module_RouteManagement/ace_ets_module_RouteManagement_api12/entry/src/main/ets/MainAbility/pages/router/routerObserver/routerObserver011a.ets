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
struct routerObserver011a {
  @State str:string = 'routerObserver011a'


  aboutToAppear(): void {
    console.log('testTag routerObserver011a aboutToAppear');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', 'routerObserver011a_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver011a aboutToDisappear');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011a_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver011a onPageShow');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011a_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver011a onPageHide');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011a_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver011a onBackPress');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011a_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver011a_text1')

      Button('Single push')
        .id('routerObserver011a_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver011b',
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

