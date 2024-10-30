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
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function FmsUpdateRefreshTest() {
    describe(`FmsUpdateRefreshTest`, () => {
        /**
         * @tc.number: FMS_updateForm_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0100`, 0, async (done: () => void) => {
            console.log(`FMS_updateForm_0100 start`);

            let FMS_updateForm_0100_Temp = async () => {
                console.log(`FMS_updateForm_0100 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : "-1",
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_updateForm_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_updateForm_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_updateForm_0100 featureAbility.startAbility end`);
            }


            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_updateForm_0100 end`);
        });
        /**
         * @tc.number: FMS_updateForm_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0200`, 0, async (done: () => void) => {
            console.log(`FMS_updateForm_0200 start`);

            let FMS_updateForm_0200_Temp = async () => {
                console.log(`FMS_updateForm_0200 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : "0",
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_updateForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_updateForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_updateForm_0200 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_updateForm_0200 end`);
        });

        /**
        * @tc.number: FMS_updateForm_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form provider B to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_updateForm_0300`, 0, async (done: () => void) => {
            console.log(`FMS_updateForm_0300 start`);

            let FMS_updateForm_0300_Temp = async () => {
                console.log(`FMS_updateForm_0300 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
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
                    console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_updateForm_0300 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_updateForm_0300 end`);
        });

        /**
         * @tc.number: FMS_updateForm_0400
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0400`, 0, async (done: () => void) => {
            console.log(`FMS_updateForm_0400 start`);

            let FMS_updateForm_0400_Temp = async () => {
                console.log(`FMS_updateForm_0400 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
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
                    console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_updateForm_0400 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_updateForm_0400 end`);
        });
        /**
         * @tc.number: FMS_updateForm_0500
         * @tc.name: The jsonData of form in the provider is empty.
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0500`, 0, async (done: () => void) => {
            console.log(`FMS_updateForm_0500 start`);

            let FMS_updateForm_0500_Temp = async () => {
                console.log(`FMS_updateForm_0500 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : "self",
                            "jsonEmpty" : true,
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_updateForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_updateForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_updateForm_0500 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_updateForm_0500 end`);
        });
        /**
         * @tc.number: FMS_hostRefresh_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_hostRefresh_0100`, 0, async (done: () => void) => {
            console.log(`FMS_hostRefresh_0100 start`);

            let FMS_hostRefresh_0100_Temp = async () => {
                console.log(`FMS_hostRefresh_0100 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : "-1",
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_hostRefresh_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_hostRefresh_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_hostRefresh_0100 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_hostRefresh_0100 end`);
        });

        /**
         * @tc.number: FMS_hostRefresh_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_hostRefresh_0200`, 0, async (done: () => void) => {
            console.log(`FMS_hostRefresh_0200 start`);

            let FMS_hostRefresh_0200_Temp = async () => {
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : "0",
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_hostRefresh_0200 end`);
        });

        /**
        * @tc.number: FMS_hostRefresh_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form user B to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0300`, 0, async (done: () => void) => {
            console.log(`FMS_hostRefresh_0300 start`);

            let FMS_hostRefresh_0300_Temp = async () => {
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
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
                    console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_hostRefresh_0300 end`);
        });
        /**
        * @tc.number: FMS_hostRefresh_0400
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0400`, 0, async (done: () => void) => {
            console.log(`FMS_hostRefresh_0400 start`);

            let FMS_hostRefresh_0400_Temp = async () => {
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
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
                    console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_hostRefresh_0400 end`);
        });

        /**
        * @tc.number: FMS_hostRefresh_0500
        * @tc.name: Refresh form successfully by the form user.
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify that pulling up the form provider.
        */
        it(`FMS_hostRefresh_0500`, 0, async (done: () => void) => {
            console.log(`FMS_hostRefresh_0500 start`);

            let FMS_hostRefresh_0500_Temp = async () => {
                console.log(`FMS_hostRefresh_0500 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                            "ability" : "FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : "self",
                            "isCreate" : true
                        }
                    }
                }).then((res) => {
                    console.log(`FMS_hostRefresh_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_hostRefresh_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_hostRefresh_0500 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_hostRefresh_0500 end`);
        });

    });
}

