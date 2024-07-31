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
struct routerObserver013 {
  @State str:string = 'routerObserver013'


  aboutToAppear(): void {
    console.log('testTag routerObserver013 aboutToAppear');
    AppStorage.setOrCreate('routerObserver13_LifeCycle', 'routerObserver013_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver013 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver13_LifeCycle', AppStorage.get('routerObserver13_LifeCycle') + ';routerObserver013_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver013 onPageShow');
    AppStorage.setOrCreate('routerObserver13_LifeCycle', AppStorage.get('routerObserver13_LifeCycle') + ';routerObserver013_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver013 onPageHide');
    AppStorage.setOrCreate('routerObserver13_LifeCycle', AppStorage.get('routerObserver13_LifeCycle') + ';routerObserver013_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver013 onBackPress');
    AppStorage.setOrCreate('routerObserver13_LifeCycle', AppStorage.get('routerObserver13_LifeCycle') + ';routerObserver013_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver013_text1')

      Button('Single replaceUrl')
        .id('routerObserver013_btn')
        .onClick(()=>{
          router.replaceUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver013',
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

