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
struct routerObserver07 {
  @State str:string = 'routerObserver07'


  aboutToAppear(): void {
    console.log('testTag routerObserver07 aboutToAppear');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver07_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver07 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver07_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver07 onPageShow');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver07_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver07 onPageHide');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver07_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver07 onBackPress');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver07_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver07_text1')

      Button('back')
        .id('routerObserver07_btn')
        .onClick(()=>{
          router.back()
        })

    }.width('100%')
  }
}

