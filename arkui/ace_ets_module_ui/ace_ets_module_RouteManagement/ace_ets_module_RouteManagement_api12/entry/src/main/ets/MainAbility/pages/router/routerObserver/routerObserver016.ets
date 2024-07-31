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
struct routerObserver016 {
  @State str:string = 'routerObserver016'


  aboutToAppear(): void {
    console.log('testTag routerObserver016 aboutToAppear');
    AppStorage.setOrCreate('routerObserver16_LifeCycle', AppStorage.get('routerObserver16_LifeCycle') + ';routerObserver016_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver016 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver16_LifeCycle', AppStorage.get('routerObserver16_LifeCycle') + ';routerObserver016_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver016 onPageShow');
    AppStorage.setOrCreate('routerObserver16_LifeCycle', AppStorage.get('routerObserver16_LifeCycle') + ';routerObserver016_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver016 onPageHide');
    AppStorage.setOrCreate('routerObserver16_LifeCycle', AppStorage.get('routerObserver16_LifeCycle') + ';routerObserver016_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver016 onBackPress');
    AppStorage.setOrCreate('routerObserver16_LifeCycle', AppStorage.get('routerObserver16_LifeCycle') + ';routerObserver016_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver016_text1')

      Button('back')
        .id('routerObserver016_btn')
        .onClick(()=>{
          router.back()
        })

    }.width('100%')
  }
}

