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
struct routerObserver017 {
  @State str:string = 'routerObserver017'


  aboutToAppear(): void {
    console.log('testTag routerObserver017 aboutToAppear');
    AppStorage.setOrCreate('routerObserver17_LifeCycle', AppStorage.get('routerObserver17_LifeCycle') + ';routerObserver017_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver017 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver17_LifeCycle', AppStorage.get('routerObserver17_LifeCycle') + ';routerObserver017_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver017 onPageShow');
    AppStorage.setOrCreate('routerObserver17_LifeCycle', AppStorage.get('routerObserver17_LifeCycle') + ';routerObserver017_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver017 onPageHide');
    AppStorage.setOrCreate('routerObserver17_LifeCycle', AppStorage.get('routerObserver17_LifeCycle') + ';routerObserver017_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver017 onBackPress');
    AppStorage.setOrCreate('routerObserver17_LifeCycle', AppStorage.get('routerObserver17_LifeCycle') + ';routerObserver017_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver017_text1')

      Button('back')
        .id('routerObserver017_btn')
        .onClick(()=>{
          router.back()
        })

    }.width('100%')
  }
}

