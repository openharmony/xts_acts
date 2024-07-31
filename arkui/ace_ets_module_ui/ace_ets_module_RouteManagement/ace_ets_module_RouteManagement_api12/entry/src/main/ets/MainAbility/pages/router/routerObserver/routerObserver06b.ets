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
struct routerObserver06b {
  @State str:string = 'routerObserver06b'

  aboutToAppear(): void {
    console.log('testTag routerObserver06b aboutToAppear');
    AppStorage.setOrCreate('routerObserver6_LifeCycle', AppStorage.get('routerObserver6_LifeCycle') + ';routerObserver06b_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver06b aboutToDisappear');
    AppStorage.setOrCreate('routerObserver6_LifeCycle', AppStorage.get('routerObserver6_LifeCycle') + ';routerObserver06b_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver06b onPageShow');
    AppStorage.setOrCreate('routerObserver6_LifeCycle', AppStorage.get('routerObserver6_LifeCycle') + ';routerObserver06b_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver06b onPageHide');
    AppStorage.setOrCreate('routerObserver6_LifeCycle', AppStorage.get('routerObserver6_LifeCycle') + ';routerObserver06b_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver06b onBackPress');
    AppStorage.setOrCreate('routerObserver6_LifeCycle', AppStorage.get('routerObserver6_LifeCycle') + ';routerObserver06b_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver06b_text1')

    }.width('100%')
  }
}

