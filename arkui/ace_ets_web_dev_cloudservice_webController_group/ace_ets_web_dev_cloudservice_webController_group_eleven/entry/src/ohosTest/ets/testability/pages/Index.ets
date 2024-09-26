/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

class TestObj {
  constructor(){
  }

  test(testStr: string): string{
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(): void{
    console.log('Web Component toString');
  }

  testNumber(testNum: number): number{
    console.log('Web Component number' + testNum);
    return testNum;
  }

  asyncTestBool(testBol: boolean): void{
    console.log('Web Component boolean' + testBol);
  }
}

class WebObj {
  constructor(){
  }

  webTest(): string{
    console.log('Web test');
    return 'Web test';
  }

  webString(): void{
    console.log('Web test toString');
  }
}

class AsyncObj {
  constructor(){
  }

  asyncTest(): void{
    console.log('Async test');
  }

  asyncString(testStr: string): void{
    console.log('Web async string' + testStr);
  }
}

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  @State testObjtest: TestObj = new TestObj();
  @State webTestObj: WebObj = new WebObj();
  @State asyncTestObj: AsyncObj = new AsyncObj();

  aboutToAppear(): void{
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build(){
    Column() {
      Button('refresh')
        .id('refresh')
        .onClick(() => {
          try {
            this.controller.refresh();
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('Register JavaScript To Window')
        .id('Register')
        .onClick(() => {
          try {
            this.controller.registerJavaScriptProxy(this.testObjtest, 'objName', ['test', 'toString', 'testNumber'],
              ['asyncTestBool']);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('Register JavaScript To Window')
        .id('Sub_WEB_javaScriptProxy_asyncMethodList_0200')
        .onClick(() => {
          try {
            this.controller.registerJavaScriptProxy(this.webTestObj, 'objTestName', ['webTest', 'webString']);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })


      Button('Register JavaScript To Window')
        .id('Sub_WEB_registerJavaScriptProxy_asyncMethodList_0100')
        .onClick(() => {
          try {
            this.controller.registerJavaScriptProxy(this.asyncTestObj, 'objAsyncName', [],
              ['asyncTest', 'asyncString']);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('跳转safeBrowser').onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'testability/pages/safeBrowser'
        })
      }).id('safeBrowser')

      Button('跳转illegalBrowser').onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'testability/pages/illegal'
        })
      }).id('illegalBrowser')

      Button('跳转riskBrowser').onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'testability/pages/risk'
        })
      }).id('riskBrowser')
      Button('跳转warningBrowser').onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'testability/pages/warning'
        })
      }).id('warningBrowser')
      Button('跳转fraudBrowser').onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'testability/pages/fraud'
        })
      }).id('fraudBrowser')
      Button('跳转进程测试').onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'testability/pages/RenderProcess'
        })
      }).id('RenderProcess')

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
    }
  }
}