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
struct routerObserver8 {
  @State str:string = 'routerObserver8'

  testFunc(info: observer.RouterPageInfo) {
    if (info) {
      AppStorage.setOrCreate('routerObserver8_observer', AppStorage.get('routerObserver8_observer') + `index:${info.index};name:${info.name};path:${info.path};state:${info.state};`);
      console.log('testTag routerPageUpdate8 ' + JSON.stringify(info));
    }
  }

  aboutToAppear(): void {
    console.log('testTag routerObserver8 aboutToAppear');
    AppStorage.setOrCreate('routerObserver8_observer', 'routerObserver8_observer:')
    AppStorage.setOrCreate('routerObserver8_LifeCycle', 'routerObserver8_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver8 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver8_LifeCycle', AppStorage.get('routerObserver8_LifeCycle') + ';routerObserver8_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver8 onPageShow');
    AppStorage.setOrCreate('routerObserver8_LifeCycle', AppStorage.get('routerObserver8_LifeCycle') + ';routerObserver8_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver8 onPageHide');
    AppStorage.setOrCreate('routerObserver8_LifeCycle', AppStorage.get('routerObserver8_LifeCycle') + ';routerObserver8_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver8 onBackPress');
    AppStorage.setOrCreate('routerObserver8_LifeCycle', AppStorage.get('routerObserver8_LifeCycle') + ';routerObserver8_onPageHide')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver8_text1')

      Button('ObserverOn')
        .onClick(()=>{
          observer.on('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver8_on')


      Button('ObserverOff')
        .onClick(()=>{
          observer.off('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver8_off')

      Button('push')
        .id('routerObserver8_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver08',
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

