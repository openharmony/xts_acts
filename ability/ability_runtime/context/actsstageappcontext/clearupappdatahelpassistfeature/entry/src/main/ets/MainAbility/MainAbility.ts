/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility'
import fs from '@ohos.file.fs';
import commonEventManager from '@ohos.commonEventManager';

let TAG = 'clearUpApplicationDataHelpFeature';
let startType;
let createFile;
export default class MainAbility extends Ability {
    async onCreate(want, launchParam) {
        startType = want.parameters?.startType;
        createFile = want.parameters?.createFile;
        globalThis.abilityContext = this.context;
        console.log(TAG+"_onCreate");
        let context = this.context;
        let filePathName = '/test.txt';
        let cacheDirPath = context.cacheDir + filePathName;
        let filesDirPath = context.filesDir + filePathName;
        let preferencesDirPath = context.preferencesDir + filePathName;
        let tempDirPath = context.tempDir + filePathName;
        let databaseDirPath = context.databaseDir + filePathName;
        if (createFile) {
            console.log(TAG + " ---try create file  ");
            try {
                let file1 = fs.openSync(cacheDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let file2 = fs.openSync(filesDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let file3 = fs.openSync(preferencesDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let file4 = fs.openSync(tempDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let file5 = fs.openSync(databaseDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                if (fs.accessSync(cacheDirPath) && fs.accessSync(filesDirPath) && fs.accessSync(preferencesDirPath) && fs.accessSync(tempDirPath) && fs.accessSync(databaseDirPath)) {
                    let options = {
                        parameters: {
                          result: true
                        }
                      }
                    commonEventManager.publish('clearUpApplicationDataEventFeature', options, (err) => {
                        console.log(TAG + " --- create file success and send msg ");
                    });
                }
                fs.closeSync(file1);
                fs.closeSync(file2);
                fs.closeSync(file3);
                fs.closeSync(file4);
                fs.closeSync(file5);
            } catch (error) {
                console.error(TAG + "error ", JSON.stringify(error));
            }
        } else {
            let options = {
                parameters: {
                  result: true
                }
              }
            if (fs.accessSync(cacheDirPath) && fs.accessSync(filesDirPath) && fs.accessSync(preferencesDirPath) && fs.accessSync(tempDirPath) && fs.accessSync(databaseDirPath)) {
                commonEventManager.publish('clearUpApplicationDataEventFeature', options, (err) => {
                    console.log(TAG + " --- create file and send msg clerupapp");
                });
            } else {
                options.parameters.result = false;
                commonEventManager.publish('clearUpApplicationDataEventFeature', options, (err) => {
                    console.log(TAG + " --- create file and send msg clerupapp");
                });
            }
        }
    }

    onDestroy() {
        console.log('MainAbility onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.log('MainAbility onWindowStageCreate')
        windowStage.setUIContent(this.context, 'pages/index', null)
    }

    onWindowStageDestroy() {
        console.log('MainAbility onWindowStageDestroy')
    }

    onForeground() {
        console.log('MainAbility onForeground')
    }

    onBackground() {
        console.log(TAG + 'MainAbility onBackground' + startType)
        if (startType === 'Promise') {
            this.context.getApplicationContext().clearUpApplicationData()
                .then((data) => {
                    console.log(TAG + " --- data", data);
                })
                .catch((err) => {
                    console.error(TAG + "  err.code: " + JSON.stringify(err));
                })
        }
        if (startType === 'Callback') {
            this.context.getApplicationContext().clearUpApplicationData((err) => {
                console.error(TAG + "  err.code: " + JSON.stringify(err));
            })
        }
    }
};