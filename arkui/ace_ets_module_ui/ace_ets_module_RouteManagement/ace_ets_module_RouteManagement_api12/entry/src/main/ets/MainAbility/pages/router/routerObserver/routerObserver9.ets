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
struct routerObserver9 {
  @State str:string = 'routerObserver9'

  testFunc(info: observer.RouterPageInfo) {
    if (info) {
      AppStorage.setOrCreate('routerObserver9_observer', AppStorage.get('routerObserver9_observer') + `index:${info.index};name:${info.name};path:${info.path};state:${info.state};`);
      console.log('testTag routerPageUpdate9 ' + JSON.stringify(info));
    }
  }

  aboutToAppear(): void {
    console.log('testTag routerObserver9 aboutToAppear');
    AppStorage.setOrCreate('routerObserver9_observer', 'routerObserver9_observer:')
    AppStorage.setOrCreate('routerObserver9_LifeCycle', 'routerObserver9_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver9 aboutToDisappear');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver9_aboutToDisappear')
    observer.off('routerPageUpdate', this.getUIContext(), this.testFunc)
  }

  onPageShow(){
    console.log('testTag routerObserver9 onPageShow');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver9_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver9 onPageHide');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver9_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver9 onBackPress');
    AppStorage.setOrCreate('routerObserver9_LifeCycle', AppStorage.get('routerObserver9_LifeCycle') + ';routerObserver9_onPageHide')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver9_text1')

      Button('ObserverOn')
        .onClick(()=>{
          observer.on('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver9_on')

      Button('ObserverOff')
        .onClick(()=>{
          observer.off('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver9_off')

      Button('clear')
        .id('routerObserver9_clear')
        .onClick(()=>{
          router.clear()
        })

      Button('push')
        .id('routerObserver9_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver09',
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

