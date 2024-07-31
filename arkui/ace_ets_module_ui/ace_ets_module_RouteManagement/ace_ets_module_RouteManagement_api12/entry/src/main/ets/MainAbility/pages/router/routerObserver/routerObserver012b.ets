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
struct routerObserver012b {
  @State str:string = 'routerObserver012b'

  aboutToAppear(): void {
    console.log('testTag routerObserver012b aboutToAppear');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012b_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver012b aboutToDisappear');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012b_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver012b onPageShow');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012b_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver012b onPageHide');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012b_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver012b onBackPress');
    AppStorage.setOrCreate('routerObserver12_LifeCycle', AppStorage.get('routerObserver12_LifeCycle') + ';routerObserver012b_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver012b_text1')

    }.width('100%')
  }
}

