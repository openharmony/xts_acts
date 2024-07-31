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
struct routerObserver011b {
  @State str:string = 'routerObserver011b'

  aboutToAppear(): void {
    console.log('testTag routerObserver011b aboutToAppear');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011b_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver011b aboutToDisappear');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011b_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver011b onPageShow');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011b_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver011b onPageHide');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011b_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver011b onBackPress');
    AppStorage.setOrCreate('routerObserver11_LifeCycle', AppStorage.get('routerObserver11_LifeCycle') + ';routerObserver011b_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver011b_text1')

    }.width('100%')
  }
}

