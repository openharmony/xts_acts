// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import router from '@system.router';
import routery from '@ohos.router';


@Entry
@Component
struct OhosRouterA {
  build() {
    Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}) {
      Text('A Page')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('Push')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          router.push({
            uri: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            }
          });
        });
      Button('back')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          router.push({
            uri: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            }
          });
        });
        Button('pushUrl')
        .key('pushButtonA1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          try {
            routery.pushUrl({
              url: 'pages/routerpage2',
              params: {
                data1: 'message',
                data2: {
                  data3: [123, 456, 789]
                },
              },
            }, (err) => {
              if (err) {
                console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
                return;
              }
              console.info('pushUrl success');
            });
          } catch (error) {
            console.error(`pushUrl args error code is ${error.code}, message is ${error.message}`);
          };
        });
      Button('pushUrl')
      .key('pushButtonA1')
      .backgroundColor('#FF0B8FE2')
      .fontSize(20)
      .margin({top: 20})
      .onClick(() => {
        try {
          routery.pushUrl({
            url: 'pages/routerpage2',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              },
            },
          }, (err) => {
            if (err) {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('pushUrl success');
          });
        } catch (error) {
          console.error(`pushUrl args error code is ${error.code}, message is ${error.message}`);
        };
      });

      Button('replaceUrl')
      .key('pushButtonA1')
      .backgroundColor('#FF0B8FE2')
      .fontSize(20)
      .margin({top: 20})
      .onClick(() => {
        try {
          routery.replaceUrl({
            url: 'pages/detail',
            params: {
              data1: 'message',
            },
          }, routery.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('replaceUrl success');
          });
        } catch (error) {
          console.error(`replaceUrl args error code is ${error.code}, message is ${error.message}`);
        };
      });
      Button('replaceUrl')
      .key('pushButtonA1')
      .backgroundColor('#FF0B8FE2')
      .fontSize(20)
      .margin({top: 20})
      .onClick(() => {
        try {
          routery.replaceUrl({
            url: 'pages/detail',
            params: {
              data1: 'message',
            },
          }, (err) => {
            if (err) {
              console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('replaceUrl success');
          });
        } catch (error) {
          console.error(`replaceUrl args error code is ${error.code}, message is ${error.message}`);
        };
        });

      Button('clear')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          router.push({
            uri: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            }
          });
        });
      Button('getLength')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          router.push({
            uri: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            }
          });
        });
      Button('enableAlertBeforeBackPage')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          router.push({
            uri: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            }
          });
        });
        Button('enableBackPageAlert')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          routery.push({
            uri: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            }
          });
        });

      Button('disableAlertBeforeBackPage')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
        .onClick(() => {
          router.push({
            uri: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            }
          });
        });
    }.width('100%').height('100%')
  }
}