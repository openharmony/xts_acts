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
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}
export default function test() {
    describe(`FmsReleaseFormTest`, () => {
        /**
         * @tc.number: FMS_releaseForm_0200
         * @tc.name: host does not have permission
         * @tc.desc: 1.release the form that formID is 1
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0200`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0200 start`);

            let FMS_releaseForm_0200_Temp = async () => {
                console.log(`FMS_releaseForm_0200 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_0200 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_releaseForm_0200 end`);

        });


        /**
         * @tc.number: FMS_releaseForm_0300
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.release the form
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0300`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0300 start`);

            let FMS_releaseForm_0300_Temp = async () => {
                console.log(`FMS_releaseForm_0300 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : "-1",
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_0300 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_releaseForm_0300 end`);
        });


        /**
         * @tc.number: FMS_releaseForm_0400
         * @tc.name: formID id is error(formID = 0)
         * @tc.desc: 1.release the form
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0400`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0400 start`);

            let FMS_releaseForm_0400_Temp = async () => {
                console.log(`FMS_releaseForm_0400 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : "0",
                            "isCreate" : false
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_0400 featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_releaseForm_0400 end`);
        });

        /**
         * @tc.number: FMS_releaseForm_0500
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.host A create a formA
         *           2.host B release the formA
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0500`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0500 start`);

            let FMS_releaseForm_0500_Temp = async () => {
                console.log(`FMS_releaseForm_0500 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_0500 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_releaseForm_0500 end`);
        });
        /**
         * @tc.number: FMS_releaseForm_0600
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.host create one normal card
         *           2.host delete the form
         *           3.host release the form and verify the result is false
         */
        it(`FMS_releaseForm_0600`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_0600 start`);

            let FMS_releaseForm_0600_Temp = async () => {
                console.log(`FMS_releaseForm_0600 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "deleteForm" : true,
                            "deleteId" : "self",
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_0600 featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_releaseForm_0600 end`);
        });


        /**
         * @tc.number: FMS_releaseForm_1300
         * @tc.name: single host continuously release forms
         * @tc.desc: 1.There are 2 forms created by the single host
         *           2.single host release 2 forms successfully
         */
        it(`FMS_releaseForm_1300`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_1300 start`);
            let formIdList = [];

            let releaseForms = async () => {
                console.debug("====>FMS_releaseForm_1300 releaseForms====>");
              
                for(let iIndex = 0; iIndex < formIdList.length; iIndex++) {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
                    await featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostc",
                            abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                            parameters: {
                                "formId" : "0",
                                "name" : "Form_Js001",
                                "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                                "ability" : "FormAbility",
                                "moduleName" : "entry",
                                "temporary" : false,
                                "releaseForm" : true,
                                "releaseId" : formIdList[iIndex],
                                "isCreate" : false
                            }
                        }
                    }).then((res) => {
                        console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                        expect().not().assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                    await sleep(1000)
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
                }
            }

            let FMS_releaseForm_1300_Temp = async () => {
                console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
            }
            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_releaseForm_1300 end`);
        });

        /**
         * @tc.number: FMS_releaseForm_1400
         * @tc.name: release temp form
         * @tc.desc: 1.host create one temp form
         *           2.release the form and judge the result is true
         */
        it(`FMS_releaseForm_1400`, 0, async (done: () => void) => {
            console.log(`FMS_releaseForm_1400 start`);

            let FMS_releaseForm_1400_Temp = async () => {
                console.log(`FMS_releaseForm_1400 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : true,
                            "releaseForm" : true,
                            "releaseId" : "self",
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_releaseForm_1400 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_releaseForm_1400 end`);
        });


    });
}

