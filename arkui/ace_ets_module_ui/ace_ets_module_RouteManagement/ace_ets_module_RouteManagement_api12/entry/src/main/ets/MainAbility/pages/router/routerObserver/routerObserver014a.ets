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
struct routerObserver014a {
  @State str:string = 'routerObserver014a'


  aboutToAppear(): void {
    console.log('testTag routerObserver014a aboutToAppear');
    AppStorage.setOrCreate('routerObserver14_LifeCycle', 'routerObserver014a_aboutToAppear')
  }

  aboutToDisappear(): void {
    console.log('testTag routerObserver014a aboutToDisappear');
    AppStorage.setOrCreate('routerObserver14_LifeCycle', AppStorage.get('routerObserver14_LifeCycle') + ';routerObserver014a_aboutToDisappear')
  }

  onPageShow(){
    console.log('testTag routerObserver014a onPageShow');
    AppStorage.setOrCreate('routerObserver14_LifeCycle', AppStorage.get('routerObserver14_LifeCycle') + ';routerObserver014a_onPageShow')
  }

  onPageHide(){
    console.log('testTag routerObserver014a onPageHide');
    AppStorage.setOrCreate('routerObserver14_LifeCycle', AppStorage.get('routerObserver14_LifeCycle') + ';routerObserver014a_onPageHide')
  }

  onBackPress(){
    console.log('testTag routerObserver014a onBackPress');
    AppStorage.setOrCreate('routerObserver14_LifeCycle', AppStorage.get('routerObserver14_LifeCycle') + ';routerObserver014a_onBackPress')
  }

  build() {
    Column({space:5}){
      Text(this.str).id('routerObserver014a_text1')

      Button('Single replaceUrl')
        .id('routerObserver014a_btn')
        .onClick(()=>{
          router.replaceUrl({
            url: 'MainAbility/pages/router/routerObserver/routerObserver014b',
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

