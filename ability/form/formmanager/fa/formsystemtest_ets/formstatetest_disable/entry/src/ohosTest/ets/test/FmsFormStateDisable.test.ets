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
import { beforeAll, afterAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';

export default function test() {
    describe(`FmsStateFormTest`, () => {
        /**
         * @tc.number: FMS_disableFormsUpdate_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0200`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0200 start`);

            let FMS_disableFormsUpdate_0200_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostnoperm",
                        abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : ["1"],
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail()
                    done()
                });
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbility again end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0200 end`);
        });

        /**
         * @tc.number: FMS_disableFormsUpdate_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0300`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0300 start`);

            let FMS_disableFormsUpdate_0300_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : [],
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail()
                    done()
                });
                console.log(`FMS_disableFormsUpdate _0300 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0300 end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0400`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0400 start`);

            let FMS_disableFormsUpdate_0400_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : ["-1"],
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_disableFormsUpdate _0400 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0400 end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0500`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0500 start`);

            let FMS_disableFormsUpdate_0500_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : ["0"],
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0500 end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0600`, 0, async (done: () => void) => {
            console.info(`FMS_disableFormsUpdate_0600 start`);

            let FMS_disableFormsUpdate_0600_Temp = async () => {
                console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicef.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0600 end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0700
         * @tc.name: formID id is error because formId is not exist
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0700`, 0, async (done: () => void) => {
            console.info(`FMS_disableFormsUpdate_0700 start`);

            let FMS_disableFormsUpdate_0700_Temp = async () => {
                console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.acts.form.formsystemtestservicef.hmservice",
                            "ability": "FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "deleteForm": true,
                            "deleteId": "self",
                            "isCreate": true
                        }
                    }
                }).then((res) => {
                    console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0700 end`);
        });

        /**
         * @tc.number: FMS_disableFormsUpdate_0800
         * @tc.name: The form user has form permission.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0800`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0800 start`);

            let FMS_disableFormsUpdate_0800_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : ["self"],
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0800 end`);
        });

        /**
         * @tc.number: FMS_disableFormsUpdate_0900
         * @tc.name: There are correct and wrong formId in the form ID parameter list.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0900`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_0900 start`);

            let FMS_disableFormsUpdate_0900_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "enable",
                            "stateIds" : ["self"],
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_0900 end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_1000
         * @tc.name: Set next refresh time is invalid when disable form. (cache data < 1k)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Call the disableFormsUpdate interface.
         *           3.Call the setFormNextRefreshTime interface and verify the form can not refresh.
         */
        it(`FMS_disableFormsUpdate_1000`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_1000 start`);

            let FMS_disableFormsUpdate_1000_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicef.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true,
                            "stateIds" : ["self"],
                            "stateForm" : "visible"
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_1000 end`);
        });

        /**
         * @tc.number: FMS_disableFormsUpdate_1100
         * @tc.name: Set next refresh time is invalid when disable form. (cache data > 1k)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Call the disableFormsUpdate interface.
         *           3.Call the setFormNextRefreshTime interface and verify the form can not refresh.
         */
        it(`FMS_disableFormsUpdate_1100`, 0, async (done: () => void) => {
            console.log(`FMS_disableFormsUpdate_1100 start`);

            let FMS_disableFormsUpdate_1100_Temp = async () => {
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestserviceg.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true,
                            "stateIds" : ["self"],
                            "stateForm" : "visible"
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_disableFormsUpdate_1100 end`);
        });

    });
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}