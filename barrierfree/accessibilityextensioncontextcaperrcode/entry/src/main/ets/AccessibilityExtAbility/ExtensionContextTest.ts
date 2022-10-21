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
import commonEvent from '@ohos.commonEvent';
import display from '@ohos.display'
import { GesturePath } from '@ohos.accessibility.GesturePath';
import { GesturePoint } from '@ohos.accessibility.GesturePoint';

export class ExtensionContextTest {
    private context = undefined;
    private subScriber = undefined;

    constructor(context) {
        this.context = context;
    }

    async init() {
        this.subScriber = await commonEvent.createSubscriber({events: ['caseExecute']});
        commonEvent.subscribe(this.subScriber, (err, data) => {
            console.info('ExtensionContextTest subscribe callback data:' + JSON.stringify(data));
            this.processCase(data.data);
        });
    }

    clear() {
        commonEvent.unsubscribe(this.subScriber);
        this.subScriber = undefined;
        this.context = undefined;
    }

    private publishCaseResult(caseName: string, result: boolean) {
        let commonEventPublishData = {
            data: (result ? 'pass' : 'fail'),
            parameters: {
                case: caseName
            }
        }
        commonEvent.publish('caseResult', commonEventPublishData, (err) => {
            console.info("ExtensionContextTest publishCaseResult finish: " + JSON.stringify(commonEventPublishData));
        });
    }

    private async processCase(caseName) {
        console.info('ExtensionContextTest processCase: ' + caseName);
        let gesturePath;

        switch (caseName) {
            case 'ActsAccessibilityExtensionContextCapErrCodeTest_getFocusElement_asyncCallback_0100':
                this.getFocusElementByTypeCallback(caseName);
                break;
            case 'ActsAccessibilityExtensionContextCapErrCodeTest_getWindowRootElement_asyncCallback_0200':
                this.getWindowRootElementCallback(caseName);
                break;
            case 'ActsAccessibilityExtensionContextCapErrCodeTest_getWindows_Callback_0300':
                this.getWindowsCallback(caseName);
                break;
            case 'ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0400':
                gesturePath = new GesturePath(60000);
                gesturePath.points.push(new GesturePoint(50, 50),
                                        new GesturePoint(100, 100),
                                        new GesturePoint(1000, 1000));
                this.gestureInjectCallback(caseName, gesturePath);
                break;
            case 'ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0500':
                gesturePath = new GesturePath(60000);
                gesturePath.points.push(new GesturePoint(50, 50));
                this.gestureInjectPromise(caseName, gesturePath);
                break;
            default:
                console.warn('ExtensionContextTest processCase unknown!!!!!!!!!!');
                break;
        }
    }

    private async getFocusElementByTypeCallback(caseName: string) {
        let result = false;
        this.context.getFocusElement(async (err, res) => {
            if (err && err.code != 0) {
                console.error(caseName + "err: " + JSON.stringify(err.code));
                if (err.code == 9300003) {
                    result = true;
                }
            }
	    this.publishCaseResult(caseName, result);
        });
    }

    private async getWindowRootElementCallback(caseName: string) {
        let result = false;
        this.context.getWindowRootElement(async (err, res) => {
            console.info(caseName + " res: " + JSON.stringify(res));
            if (err && err.code != 0) {
                console.error(caseName + " err: " + JSON.stringify(err.code));
                if (err.code == 9300003) {
                    result = true;
                }
            }
            this.publishCaseResult(caseName, result);
        });
    }

    private async getWindowsCallback(caseName: string) {
        let result = false;
        this.context.getWindows((err, res) => {
            console.info(caseName + " res: " + JSON.stringify(res));
            if (err && err.code != 0) {
                console.error(caseName + " err: " + JSON.stringify(err.code));
                if (err.code == 9300003) {
                    result = true;
                }
            }
            this.publishCaseResult(caseName, result);
        });
    }

    private async gestureInjectCallback(caseName: string, gesturePath: object) {
        let result = false;
        this.context.injectGesture(gesturePath, (err, res) => {
            console.info(caseName + " res: " + JSON.stringify(res));
            if (err && err.code != 0) {
                console.error(caseName + " err: " + JSON.stringify(err.code));
                if (err.code == 9300003) {
                    result = true;
                }
            }
            this.publishCaseResult(caseName, result);
        });
    }

    private async gestureInjectPromise(caseName: string, gesturePath: object) {
        let result = false;
        this.context.injectGesture(gesturePath).then((res) => {
            console.info(caseName + "err");
            this.publishCaseResult(caseName, result);
        }).catch ((err) => {
            if (err && err.code != 0) {
                console.error(caseName + " err: " + JSON.stringify(err.code));
                if (err.code == 9300003) {
                    result = true;
                }
            }
            this.publishCaseResult(caseName, result);
        });
    }
}
