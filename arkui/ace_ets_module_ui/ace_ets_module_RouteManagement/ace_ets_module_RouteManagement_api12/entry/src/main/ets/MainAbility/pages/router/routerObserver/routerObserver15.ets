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
import common from '@ohos.app.ability.common';

@Entry
@Component
struct routerObserver15 {
  @State str:string = 'routerObserver15'
  private context = getContext(this) as common.UIAbilityContext

  testFunc(info: observer.RouterPageInfo) {
    if (info) {
      AppStorage.setOrCreate('routerObserver15_observer', AppStorage.get('routerObserver15_observer') + `index:${info.index};name:${info.name};path:${info.path};state:${info.state};`);
      console.log('testTag routerPageUpdate15 ' + JSON.stringify(info));
    }
  }

  aboutToAppear(): void {
    console.log('testTag routerObserver15 aboutToAppear');
    AppStorage.setOrCreate('routerObserver15_observer', 'routerObserver15_observer:')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver15 aboutToDisappear');
  }

  onPageShow(){
    console.log('testTag routerObserver15 onPageShow');
  }

  onPageHide(){
    console.log('testTag routerObserver15 onPageHide');
  }

  onBackPress(){
    console.log('testTag routerObserver15 onBackPress');
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver15_text1')

      Button('ObserverOn')
        .onClick(()=>{
          observer.on('routerPageUpdate', this.context, this.testFunc)
        })
        .id('routerObserver15_on')


      Button('ObserverOff')
        .onClick(()=>{
          observer.off('routerPageUpdate', this.context, this.testFunc)
        })
        .id('routerObserver15_off')

      Button('Standard push')
        .id('routerObserver15_btn')
        .onClick(()=>{
          router.pushUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver015a',
            params: {age:18}
          }, router.RouterMode.Standard)
            .then()
            .catch((err:BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%')
  }
}

