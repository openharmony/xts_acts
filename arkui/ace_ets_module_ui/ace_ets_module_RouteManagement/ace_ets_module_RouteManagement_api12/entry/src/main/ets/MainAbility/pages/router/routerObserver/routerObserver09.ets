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
struct routerObserver09 {
  @State str:string = 'routerObserver09'


  aboutToAppear(): void {
    console.log('testTag routerObserver09 aboutToAppear');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver09_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver09 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver09_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver09 onPageShow');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver09_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver09 onPageHide');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver09_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver09 onBackPress');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver09_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver09_text1')

      Button('clear')
        .id('routerObserver09_clear')
        .onClick(()=>{
          router.clear()
        })

    }.width('100%')
  }
}

