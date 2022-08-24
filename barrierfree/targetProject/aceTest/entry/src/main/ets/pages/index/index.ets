/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import config from '@ohos.accessibility.config'
import commonEvent from '@ohos.commonEvent';

@Entry
@Component
struct Index {
    @State message: string = 'Target App';
    private isEnable: boolean = false;
    private subScriber = undefined;

    onPageShow() {
        console.info(`TargetApp onPageShow start`);
        config.enableAbility(
            'com.example.accessibilityxts/AccessibilityExtAbility',
            ["retrieve", "touchGuide", "gesture"]
        ).then(() => {
            console.info('TargetApp enableAbility finish');
            this.isEnable = true;
        });
    }

    aboutToAppear() {
        console.info('TargetApp aboutToAppear');
        commonEvent.createSubscriber({ events: ['disableExtAbility' ]}).then((subScriber) => {
            this.subScriber = subScriber;
            commonEvent.subscribe(this.subScriber, (err, data) => {
                console.info('TargetApp disableExtAbility subscribe callback: ' + JSON.stringify(data));
                if (data && data.data == 'disable') {
                    this.disableAccAbility();
                }
            });
        });
    }

    aboutToDisappear() {
        console.info('TargetApp aboutToDisappear');
        commonEvent.unsubscribe(this.subScriber);
        this.subScriber = undefined;
        this.disableAccAbility();
    }

    disableAccAbility() {
        if (!this.isEnable) {
            console.info(`TargetApp disableAccAbility: accessibilityConfig not enabled`);
            return;
        }

        config.disableAbility("com.example.accessibilityxts/AccessibilityExtAbility").then(() => {
            console.info(`TargetApp disableAccAbility finish`);
            this.isEnable = false;
        });
    }

    build() {
        Row() {
            Column() {
                Text(this.message)
                  .fontSize(50)
                  .fontWeight(FontWeight.Bold)
                  .margin({bottom: 10})

                Row() {
                    Button('left')
                    Button('button1')
                      .margin({
                          left: 10,
                          right: 10
                      })
                    Button('right')
                }
                .margin({bottom: 10})

                Button('button2')
                  .margin({bottom: 10})

                Button('button3')
                  .margin({bottom: 10})

                Button('disableAbility')
                  .onClick(() => {
                      console.info('TargetApp onClick');
                      this.disableAccAbility();
                  })
            }
            .width('100%')
        }
        .height('100%')
    }
}