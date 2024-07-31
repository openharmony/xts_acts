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
struct routerObserver03a {
  @State str:string = 'routerObserver03a'


  aboutToAppear(): void {
    console.log('testTag routerObserver03a aboutToAppear');
    AppStorage.setOrCreate('routerObserver3_LifeCycle', 'routerObserver03a_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver03a aboutToDisappear');
    AppStorage.setOrCreate('routerObserver3_LifeCycle', AppStorage.get('routerObserver3_LifeCycle') + ';routerObserver03a_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver03a onPageShow');
    AppStorage.setOrCreate('routerObserver3_LifeCycle', AppStorage.get('routerObserver3_LifeCycle') + ';routerObserver03a_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver03a onPageHide');
    AppStorage.setOrCreate('routerObserver3_LifeCycle', AppStorage.get('routerObserver3_LifeCycle') + ';routerObserver03a_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver03a onBackPress');
    AppStorage.setOrCreate('routerObserver3_LifeCycle', AppStorage.get('routerObserver3_LifeCycle') + ';routerObserver03a_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver03a_text1')

      Button('Standard push')
        .id('routerObserver03a_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver03b',
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

