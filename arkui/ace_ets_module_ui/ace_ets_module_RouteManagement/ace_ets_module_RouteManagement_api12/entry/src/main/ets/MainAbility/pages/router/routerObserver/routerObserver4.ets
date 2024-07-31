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
struct routerObserver4 {
  @State str:string = 'routerObserver4'

  testFunc(info: observer.RouterPageInfo) {
    if (info) {
      AppStorage.setOrCreate('routerObserver4_observer', AppStorage.get('routerObserver4_observer') + `index:${info.index};name:${info.name};path:${info.path};state:${info.state};`);
      console.log('testTag routerPageUpdate4 ' + JSON.stringify(info));
    }
  }

  aboutToAppear(): void {
    console.log('testTag routerObserver4 aboutToAppear');
    AppStorage.setOrCreate('routerObserver4_observer', 'routerObserver4_observer:')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver4 aboutToDisappear');
  }

  onPageShow(){
    console.log('testTag routerObserver4 onPageShow');
  }

  onPageHide(){
    console.log('testTag routerObserver4 onPageHide');
  }

  onBackPress(){
    console.log('testTag routerObserver4 onBackPress');
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver4_text1')

      Button('ObserverOn')
        .onClick(()=>{
          observer.on('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver4_on')


      Button('ObserverOff')
        .onClick(()=>{
          observer.off('routerPageUpdate', this.getUIContext(), this.testFunc)
        })
        .id('routerObserver4_off')

      Button('Single push')
        .id('routerObserver4_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver04',
            params: {age:18}
          }, router.RouterMode.Single)
            .then()
            .catch((err:BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%')
  }
}

