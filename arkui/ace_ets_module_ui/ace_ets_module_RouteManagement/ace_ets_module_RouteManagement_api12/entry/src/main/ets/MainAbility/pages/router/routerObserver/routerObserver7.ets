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
struct routerObserver7 {
  @State str:string = 'routerObserver7'

  testFunc(info: observer.RouterPageInfo) {
    if (info) {
      AppStorage.setOrCreate('routerObserver7_observer', AppStorage.get('routerObserver7_observer') + `index:${info.index};name:${info.name};path:${info.path};state:${info.state};`);
      console.log('testTag routerPageUpdate7 ' + JSON.stringify(info));
    }
  }

  aboutToAppear(): void {
    console.log('testTag routerObserver7 aboutToAppear');
    AppStorage.setOrCreate('routerObserver7_observer', 'routerObserver7_observer:')
    AppStorage.setOrCreate('routerObserver7_LifeCycle', 'routerObserver7_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver7 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver7_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver7 onPageShow');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver7_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver7 onPageHide');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver7_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver7 onBackPress');
    AppStorage.setOrCreate('routerObserver7_LifeCycle', AppStorage.get('routerObserver7_LifeCycle') + ';routerObserver7_onPageHide')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver7_text1')

      Button('ObserverOn')
        .onClick(()=>{
          observer.on('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver7_on')


      Button('ObserverOff')
        .onClick(()=>{
          observer.off('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver7_off')

      Button('push')
        .id('routerObserver7_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver07',
            params: {age:18}
          })
            .then()
            .catch((err:BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%')
  }
}

