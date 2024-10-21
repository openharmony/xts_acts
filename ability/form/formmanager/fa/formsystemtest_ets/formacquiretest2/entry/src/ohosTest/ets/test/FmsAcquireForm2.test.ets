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
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';


function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function test() {
    describe(`FmsAcquiredFormTest2`, () => {
        /**
         * @tc.number: FMS_acquireForm_3800
         * @tc.name: Failed to add form when parameter ability is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (formId) of creating form is wrong.
         */
        it(`FMS_acquireForm_3800`, 0, async (done: () => void) => {

            console.info(`FMS_acquireForm_3800 start`);
            let FMS_acquireForm_3800_Temp = async () => {
                console.info(`FMS_acquireForm_3800_Temp featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                })
                    .then((res) => {
                        console.info(`FMS_acquireForm_3800_Temp featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    })
                    .catch((err:BusinessError) => {
                        console.info(`FMS_acquireForm_3800_Temp featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_3800_Temp featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleep(2000);
            console.info(`FMS_acquireForm_3800 end`);
        });



        /**
         * @tc.number: FMS_acquireForm_3900
         * @tc.name: Failed to add form when parameter bundleName is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (bundleName) of creating form is wrong.
         */
        it(`FMS_acquireForm_3900`, 0, async (done: () => void) => {
            console.info(`FMS_acquireForm_3900 start`);
            let FMS_acquireForm_3900_normal = async () => {
                console.info(`FMS_acquireForm_3900_normal featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                })
                    .then((res) => {
                        console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                        expect().not().assertFail();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_3900 featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleep(2000);
            console.info(`FMS_acquireForm_3800 end`)
        });

        /**
         * @tc.number: FMS_acquireForm_4000
         * @tc.name: When the form specifications are inconsistent, creating the cached form fails.
         * @tc.desc: Return failed.
         */
        it(`FMS_acquireForm_4000`, 0, async (done: () => void) => {

            console.info(`FMS_acquireForm_4000 start`);
            let FMS_acquireForm_4000_normal = async () => {
                console.info(`FMS_acquireForm_4000_normal featureAbility.startAbility start`);
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
                            "dimension": "1",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                })
                    .then((res) => {
                        console.info(`FMS_acquireForm_4000_normal featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                        expect().not().assertFail();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.info(`FMS_acquireForm_4000_normal featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_4000_normal featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.info(`FMS_acquireForm_4000 end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4200
         * @tc.name: Success to add form when parameter formName is blank.
         * @tc.desc: Success to create form when verifying that the parameter (formName) of creating form is success.
         */
        it(`FMS_acquireForm_4200`, 0, async (done: () => void) => {

            console.info(`FMS_acquireForm_4200 start`);
            let FMS_acquireForm_4200_normal = async () => {
                console.info(`FMS_acquireForm_4200_normal featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                })
                    .then((res) => {
                        console.info(`FMS_acquireForm_4200_normal featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                        expect().not().assertFail();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.info(`FMS_acquireForm_4200_normal featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_4200_normal featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.info(`FMS_acquireForm_4200 end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4300
         * @tc.name: Success to add form when parameter dimension is passed.
         * @tc.desc: Success to create form when verifying that the parameter (dimension) of creating form.
         */
        it(`FMS_acquireForm_4300`, 0, async (done: () => void) => {

            console.info(`FMS_acquireForm_4300 start`);
            let FMS_acquireForm_4300_normal = async () => {
                console.info(`FMS_acquireForm_4300_normal featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhosti",
                        abilityName: "com.ohos.st.formsystemhosti.MainAbility",
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
                        console.info(`FMS_acquireForm_4300_normal featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                        expect().not().assertFail();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.info(`FMS_acquireForm_4300_normal featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_4300_normal featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.info(`FMS_acquireForm_4300 end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4400
         * @tc.name: Failed to add form when parameter dimension is not exist.
         * @tc.desc: Failed to create form when verifying that the parameter (dimension) of creating form is wrong.
         */
        it(`FMS_acquireForm_4400`, 0, async (done: () => void) => {

            console.info(`FMS_acquireForm_4400 start`);
            let FMS_acquireForm_4300_normal = async () => {
                console.info(`FMS_acquireForm_4400_normal featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhosti",
                        abilityName: "com.ohos.st.formsystemhosti.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicea.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "dimension": "6",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                })
                    .then((res) => {
                        console.info(`FMS_acquireForm_4400_normal featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                        expect().not().assertFail();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.info(`FMS_acquireForm_4400_normal featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_4400_normal featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.info(`FMS_acquireForm_4400 end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4900
         * @tc.name: Cast temp form when the formId is created formId.
         * @tc.desc: When the verification formId is set to 0, the form is created failed.
         */
        it(`FMS_acquireForm_4900`, 0, async (done: () => void) => {

            console.info(`FMS_acquireForm_4900 start`);
            let FMS_acquireForm_4900_normal = async () => {
                console.info(`FMS_acquireForm_4900_normal featureAbility.startAbility start`);
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
                        console.info(`FMS_acquireForm_4900_normal featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                        expect().not().assertFail();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.info(`FMS_acquireForm_4900_normal featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                console.info(`FMS_acquireForm_4900_normal featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.info(`FMS_acquireForm_4900 end`);
        });
    });
}
