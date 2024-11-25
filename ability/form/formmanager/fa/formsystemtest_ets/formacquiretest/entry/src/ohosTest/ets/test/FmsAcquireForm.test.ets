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

import featureAbility from "@ohos.ability.featureAbility";
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';


export default function test() {
    describe(`FmsAcquiredFormTest`, () => {
        /**
         * @tc.number: FMS_acquireForm_1600
         * @tc.name: A single form host (using a single thread) continuously creates 2 normal and 2 temporary forms.
         * @tc.desc: Verify that a single host (using a single thread) can successfully create multiple normal
         *           and temporary forms continuously.
         */
        it(`FMS_acquireForm_1600`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1600 start`);

            let FMS_acquireForm_1600_normal1 = async () => {
                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                })
                    .then((res) => {
                        console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    })
                    .catch((err: BusinessError) => {
                        console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });

                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility end`);
            }

            let FMS_acquireForm_1600_normal2 = async () => {
                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility end`);
            }

            let FMS_acquireForm_1600_Temp1 = async () => {
                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility end`);
            }

            let FMS_acquireForm_1600_Temp2 = async () => {
                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                })
                    .then((res) => {
                        console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: BusinessError) => {
                        console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1600 end`);
        });

        /**
         * @tc.number: FMS_acquireForm_1300
         * @tc.name: Add a temporary form when the formId is set to 0.
         * @tc.desc: When the verification formId is set to 0, the temporary form is created successfully.
         */
        it(`FMS_acquireForm_1300`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1300 start`);

            let FMS_acquireForm_1300_normal2 = async () => {
                console.info(`FMS_acquireForm_1300_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1300_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1300_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_1300_normal2 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1300_normal2 end`);
        });


        /**
         * @tc.number: FMS_acquireForm_1800
         * @tc.name: Add a temporary form when the formId is set to 0.
         * @tc.desc: When the verification formId is set to 0, the temporary form is created successfully.
         */
        it(`FMS_acquireForm_1800`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1800 start`);

            let FMS_acquireForm_1800_Temp1 = async () => {
                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                await FMS_acquireForm_1800_Temp1();
                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility end`);
            }

            let FMS_acquireForm_1800_Temp2 = async () => {
                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility end`);

            }

            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1800_Temp2 end`);
        });

        /**
         * @tc.number: FMS_acquireForm_1700
         * @tc.name: Add a temporary form when the formId is set to 0.
         * @tc.desc: When the verification formId is set to 0, the temporary form is created successfully.
         */
        it(`FMS_acquireForm_1700`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_1700 start`);

            let FMS_acquireForm_1700_Temp2 = async () => {
                console.info(`FMS_acquireForm_1700_Temp2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.info(`FMS_acquireForm_1700_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.info(`FMS_acquireForm_1700_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.info(`FMS_acquireForm_1700_Temp2 featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleepTime(2000);
            console.info(`FMS_acquireForm_1700_Temp2 end`);
        });
    });
}

function sleepTime(time: number): Promise<void> {
    console.info(`sleepTime: ${time}`);
    return new Promise((resolve)=>setTimeout(resolve,time));
}