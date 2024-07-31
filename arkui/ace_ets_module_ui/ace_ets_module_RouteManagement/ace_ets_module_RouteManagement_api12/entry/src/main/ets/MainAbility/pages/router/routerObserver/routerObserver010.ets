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
struct routerObserver010 {
  @State str:string = 'routerObserver010'


  aboutToAppear(): void {
    console.log('testTag routerObserver010 aboutToAppear');
    AppStorage.setOrCreate('routerObserver10_LifeCycle', 'routerObserver010_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver010 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver10_LifeCycle', AppStorage.get('routerObserver10_LifeCycle') + ';routerObserver010_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver010 onPageShow');
    AppStorage.setOrCreate('routerObserver10_LifeCycle', AppStorage.get('routerObserver10_LifeCycle') + ';routerObserver010_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver010 onPageHide');
    AppStorage.setOrCreate('routerObserver10_LifeCycle', AppStorage.get('routerObserver10_LifeCycle') + ';routerObserver010_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver010 onBackPress');
    AppStorage.setOrCreate('routerObserver10_LifeCycle', AppStorage.get('routerObserver10_LifeCycle') + ';routerObserver010_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver010_text1')

      Button('Single push')
        .id('routerObserver010_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver010',
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

