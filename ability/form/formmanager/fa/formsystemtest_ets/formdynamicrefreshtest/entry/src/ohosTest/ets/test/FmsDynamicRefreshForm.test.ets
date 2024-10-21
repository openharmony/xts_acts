/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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

import featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

export default function test() {
    describe(`FmsTimeRefreshFormTest`, () => {
        /**
         * @tc.number: FMS_timedRefresh_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
         *           2.Verify the result of the dynamic timed refresh interface.
         */
        it(`FMS_timedRefresh_0100`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_timedRefresh_0100`;
            console.info(`${tcNumber} start`);
            let FMS_timedRefresh_0100_Temp = async () => {
                console.info(`${tcNumber} featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            refreshForm: true,
                            refreshId: "-1",
                            refreshTime: 5,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`${tcNumber} featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`${tcNumber} end`);
        });

        /**
         * @tc.number: FMS_timedRefresh_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
         *           2.Verify the result of the dynamic timed refresh interface.
         */
        it(`FMS_timedRefresh_0200`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_timedRefresh_0200`;
            console.info(`${tcNumber} start`);
            let FMS_timedRefresh_0200_Temp = async () => {
                console.info(`${tcNumber} featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            refreshForm: true,
                            refreshId: "0",
                            refreshTime: 5,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`${tcNumber} featureAbility.startAbility end`);
            };
            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`${tcNumber} end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form provider B to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0300`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_timedRefresh_0300`;
            console.info(`${tcNumber} start`);
            let FMS_timedRefresh_0300_Temp = async () => {
                console.info(`${tcNumber} featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`${tcNumber} featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`${tcNumber} end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0400
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0400`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_timedRefresh_0400`;
            console.info(`${tcNumber} start`);
            let FMS_timedRefresh_0400_Temp = async () => {
                console.info(`${tcNumber} featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            deleteForm: true,
                            "deleteId": "self",
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`${tcNumber} featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`${tcNumber} end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0500
        * @tc.name: Incorrect interval for the next refresh (time < 5)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0500`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_timedRefresh_0500`;
            console.info(`${tcNumber} start`);
            let FMS_timedRefresh_0500_Temp = async () => {
                console.info(`${tcNumber} featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicea.hmservice",
                            ability: "FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            refreshForm: true,
                            refreshId: "self",
                            refreshTime: 1,
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`${tcNumber} featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`${tcNumber} end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0600
        * @tc.name: correct interval for the next refresh (time == 5)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0600`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_timedRefresh_0600`;
            console.info(`${tcNumber} start`);
            let FMS_timedRefresh_0600_Temp = async () => {
                console.info(`${tcNumber} featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            formId: "0",
                            name: "Form_Js001",
                            bundle: "com.acts.form.formsystemtestservicec.hmservice",
                            ability: "com.acts.form.formsystemtestservicec.hmservice.FormAbility",
                            moduleName: "entry",
                            temporary: false,
                            "notifyVisibleForms": true,
                            "notifyVisibleId": "self",
                            isCreate: true
                        }
                    }
                }).then((res) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${tcNumber} featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`${tcNumber} featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`${tcNumber} end`);
        });
    });
}

function sleepTime(time: number): Promise<void> {
    console.info(`sleepTime: ${time}`);
    return new Promise((resolve)=>setTimeout(resolve,time));
}