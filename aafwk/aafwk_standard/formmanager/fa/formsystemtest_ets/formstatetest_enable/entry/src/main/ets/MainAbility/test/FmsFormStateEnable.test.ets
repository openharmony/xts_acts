/*
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

import featureAbility from "@ohos.ability.featureAbility";
import commonEvent from '@ohos.commonEvent';
import { beforeAll, describe, expect, it } from "deccjsunit/index.ets";

var onErrorForm_Event = {
    events: ["FMS_FormOnError_commonEvent"],
};
var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

var onDeletedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};

var onStateFormEvent = {
    events: ["FMS_FormOnState_commonEvent"],
};

var onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

var deleteForm_Event = "FMS_FormDelete_commonEvent";

export default function test() {
    describe(`FmsStateFormTest`, () => {

        beforeAll(async (done) => {
            done();
        })

        /**
         * @tc.number: FMS_enableFormsUpdate_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0200`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0200 start`);
            let subscriberOnState;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                commonEvent.unsubscribe(subscriberOnState, unsubscribeOnStateCallBack);
                setTimeout(function () {
                    console.info('FMS_enableFormsUpdate_0200 onStateCallBack end');
                    console.log(`FMS_enableFormsUpdate_0200 end`);
                    done();
                }, 1000);
            }
            function unsubscribeOnStateCallBack() {
                console.debug("====>FMS_enableFormsUpdate_0200 unsubscribeOnStateCallBack====>");
            }            
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_0200 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });

            console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbility again start`);
            featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "enable",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0300`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0300 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {
                    console.info('FMS_enableFormsUpdate_0300 delPublishCallBack end');
                    console.log(`FMS_enableFormsUpdate_0300 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_enableFormsUpdate_0300 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_0300 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "enable",
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0400`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0400 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {
                    console.info('FMS_enableFormsUpdate_0400 delPublishCallBack end');
                    console.log(`FMS_enableFormsUpdate_0400 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_enableFormsUpdate_0400 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_0400 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "enable",
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0500`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0500 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {
                    console.info('FMS_enableFormsUpdate_0500 delPublishCallBack end');
                    console.log(`FMS_enableFormsUpdate_0500 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_enableFormsUpdate_0500 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_0500 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "enable",
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0600`, 0, async (done) => {
            console.info(`FMS_enableFormsUpdate_0600 start`);
            let subscriberOnAcquired;
            let subscriberEnable;
            let hostFormId;

            const delPublishCallback = (err, data) => {
                console.info("!!!====>FMS_enableFormsUpdate_0600 delPublishCallback====>");
                setTimeout(() => {
                    console.info('FMS_enableFormsUpdate_0600 delPublishCallback end');
                    console.info(`FMS_enableFormsUpdate_0600 end`);
                    done();
                }, 1000);
            }

            const onEnableCallback = (err, data) => {
                if (data.parameters.kind != "enable") {
                    return;
                }
                console.debug("====>FMS_enableFormsUpdate_0600 onEnableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberEnable, () => {
                    console.info("====>FMS_enableFormsUpdate_0600 unSubscribeOnEnableCallback====>");
                });
                const commonEventPublishData = {
                    data: hostFormId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
            }

            const onAcquiredCallBack = async (err, data) => {
                console.debug("====>FMS_enableFormsUpdate_0600 onAcquiredCallback data:====>" + JSON.stringify(data));
                hostFormId = data.data;

                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId": hostFormId,
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicef.hmservice",
                            "ability": "com.form.formsystemtestservicef.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "stateForm": "enable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                commonEvent.unsubscribe(subscriberOnAcquired, () => {
                    console.info("====>FMS_enableFormsUpdate_0600 unSubscribeOnAcquiredCallback====>");
                });
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_0600 onAcquiredFormEvent Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.info("====>FMS_enableFormsUpdate_0600 onStateFormEvent Enable Subscriber====>");
                subscriberEnable = data;
                await commonEvent.subscribe(subscriberEnable, onEnableCallback);
            });

            console.info(`FMS_enableFormsUpdate_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicef.hmservice",
                        "ability": "com.form.formsystemtestservicef.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_enableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });
        /**
         * @tc.number: FMS_enableFormsUpdate_0700
         * @tc.name: formID id is error because formId is not exist
         * @tc.desc: 1.The form user calls the enable update interface.
         *           2.Verify the result of the enable update interface.
         */
        it(`FMS_enableFormsUpdate_0700`, 0, async (done) => {
            console.info(`FMS_enableFormsUpdate_0700 start`);
            let subscriberDel;
            let subscriberEnable;
            let hostFormId;

            const onEnableCallback = (err, data) => {
                if (data.parameters.kind != "enable") {
                    return;
                }
                console.debug("====>FMS_enableFormsUpdate_0700 onEnableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberEnable, () => {
                    console.info("====>FMS_enableFormsUpdate_0700 unSubscribeOnEnableCallback====>");
                });
                done();
            }

            const onDeleteCallback = async (err, data) => {
                console.debug("====>FMS_enableFormsUpdate_0700 onDeleteCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters.formId;

                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicef.hmservice",
                            "ability": "com.form.formsystemtestservicef.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "stateForm": "enable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_enableFormsUpdate_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.createSubscriber(onDeletedFormEvent).then(async (data) => {
                console.info("====>FMS_enableFormsUpdate_0700 onDeletedFormEvent Invisible Subscriber====>");
                subscriberDel = data;
                await commonEvent.subscribe(subscriberDel, onDeleteCallback);
            });
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.info("====>FMS_enableFormsUpdate_0700 onStateFormEvent Enable Subscriber====>");
                subscriberEnable = data;
                await commonEvent.subscribe(subscriberEnable, onEnableCallback);
            });

            console.info(`FMS_enableFormsUpdate_0700 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicef.hmservice",
                        "ability": "com.form.formsystemtestservicef.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "deleteForm": true,
                        "deleteId": "self",
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_enableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });

        /**
         * @tc.number: FMS_enableFormsUpdate_0900
         * @tc.name: Use -1 form Id and created 2 form card Id notify the form to be invisible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_enableFormsUpdate_0900`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_0900 start`);
            let subscriberOnAcquired;
            let subscriberStatus;
            let subscriberEnable;
            let subscriberSupply;
            let formIds = [];

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 300 }, () => {
                console.log(`FMS_enableFormsUpdate_0900 time speed up`);
            });

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_enableFormsUpdate_0900 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_enableFormsUpdate_0900 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_enableFormsUpdate_0900 delPublishCallBack end');
                    console.log(`FMS_enableFormsUpdate_0900 end`);
                    done();
                }, 1000);
            }

            function onUpdateCallBack(err, data) {
                if (data.parameters.kind == "onUpdate") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_enableFormsUpdate_0900 onUpdateCallBack====>" + JSON.stringify(data));
                    expect(data.parameters.parameters).assertEqual(formIds[0]);

                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);

                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_enableFormsUpdate_0900 time reset`);
                    });

                    setTimeout(() => {
                        let commonEventPublishData = {
                            data: formIds[0]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }, 2000);
                }
            }

            function onFormEnableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_enableFormsUpdate_0900 onFormEnableCallBack====>" + JSON.stringify(data));
                expect(data.parameters.formId).assertEqual(formIds[0]);
                expect(data.parameters.kind).assertEqual("enable");
                commonEvent.unsubscribe(subscriberEnable, unSubscribeSupplyCallback);
            }

            function onFormDisableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_enableFormsUpdate_0900 onFormDisableCallBack====>" + JSON.stringify(data));
                expect(data.parameters.formId).assertEqual(formIds[0]);
                expect(data.parameters.kind).assertEqual("disable");
                commonEvent.unsubscribe(subscriberStatus, unSubscribeSupplyCallback);

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_0900 onStateFormEvent Subscriber====>");
                    subscriberEnable = data;
                    await commonEvent.subscribe(subscriberEnable, onFormEnableCallBack);
                });

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_0900 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onUpdateCallBack);
                });

                setTimeout(() => {
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notifyVisible start`);
                    featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostg",
                            abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                            parameters: {
                                "formId" : "0",
                                "name" : "name",
                                "bundle" : "bundle",
                                "ability" : "ability",
                                "moduleName" : "entry",
                                "temporary" : false,
                                "stateForm" : "enable",
                                "stateIds" : formIds,
                                "isCreate" : false
                            }
                        }
                    }).then((res: any) => {
                        console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    });
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notifyVisible end`);
                }, 10000);
            }

            function onAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_enableFormsUpdate_0900 onAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_0900 onStateFormEvent Subscriber====>");
                    subscriberStatus = data;
                    await commonEvent.subscribe(subscriberStatus, onFormDisableCallBack);
                });

                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notify disable start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "name",
                            "bundle" : "bundle",
                            "ability" : "ability",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility notify disable end`);
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_0900 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicee.hmservice",
                        "ability" : "com.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_0900 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_enableFormsUpdate_1000
         * @tc.name: Use -1 form Id and created 2 form card Id notify the form to be invisible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_enableFormsUpdate_1000`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_1000 start`);
            let subscriberOnAcquired;
            let subscriberStatus;
            let subscriberEnable;
            let subscriberSupply;
            let formIds = [];

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 300 }, () => {
                console.log(`FMS_enableFormsUpdate_1000 time speed up`);
            });

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_enableFormsUpdate_1000 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_enableFormsUpdate_1000 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_enableFormsUpdate_1000 delPublishCallBack end');
                    console.log(`FMS_enableFormsUpdate_1000 end`);
                    done();
                }, 1000);
            }

            function onUpdateCallBack(err, data) {
                if (data.parameters.kind == "onUpdate") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_enableFormsUpdate_1000 onUpdateCallBack====>" + JSON.stringify(data));
                    expect(data.parameters.parameters).assertEqual(formIds[0]);

                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);

                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_enableFormsUpdate_1000 time reset`);
                    });

                    setTimeout(() => {
                        let commonEventPublishData = {
                            data: formIds[0]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }, 2000);
                }
            }

            function onFormEnableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_enableFormsUpdate_1000 onFormEnableCallBack====>" + JSON.stringify(data));
                expect(data.parameters.formId).assertEqual(formIds[0]);
                expect(data.parameters.kind).assertEqual("enable");
                commonEvent.unsubscribe(subscriberEnable, unSubscribeSupplyCallback);
            }

            function onFormDisableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_enableFormsUpdate_1000 onFormDisableCallBack====>" + JSON.stringify(data));
                expect(data.parameters.formId).assertEqual(formIds[0]);
                expect(data.parameters.kind).assertEqual("disable");
                commonEvent.unsubscribe(subscriberStatus, unSubscribeSupplyCallback);

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_1000 onStateFormEvent Subscriber====>");
                    subscriberEnable = data;
                    await commonEvent.subscribe(subscriberEnable, onFormEnableCallBack);
                });

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_1000 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onUpdateCallBack);
                });

                setTimeout(() => {
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notifyVisible start`);
                    formIds.push("0");
                    featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostg",
                            abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                            parameters: {
                                "formId" : "0",
                                "name" : "name",
                                "bundle" : "bundle",
                                "ability" : "ability",
                                "moduleName" : "entry",
                                "temporary" : false,
                                "stateForm" : "enable",
                                "stateIds" : formIds,
                                "isCreate" : false
                            }
                        }
                    }).then((res: any) => {
                        console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    });
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notifyVisible end`);
                }, 10000);
            }

            function onAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_enableFormsUpdate_1000 onAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_1000 onStateFormEvent Subscriber====>");
                    subscriberStatus = data;
                    await commonEvent.subscribe(subscriberStatus, onFormDisableCallBack);
                });

                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notify disable start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "name",
                            "bundle" : "bundle",
                            "ability" : "ability",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility notify disable end`);
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_1000 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicee.hmservice",
                        "ability" : "com.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_1000 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_enableFormsUpdate_1200
         * @tc.name: Use -1 form Id and created 2 form card Id notify the form to be visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_enableFormsUpdate_1200`, 0, async (done) => {
            console.log(`FMS_enableFormsUpdate_1200 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formIds = new Array();
            let retFormId;
            let subscriberStatus;
            let subscriberEnable;
            let count = 0;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 300 }, () => {
                console.log(`FMS_enableFormsUpdate_1200 time speed up`);
            });

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_enableFormsUpdate_1200 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack1(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1400 delPublishCallBack1====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_1400 delPublishCallBack1 end');
                    console.log(`FMS_notifyInvisibleForms_1400 end`);
                }, 1000);
            }
            function delPublishCallBack2(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1400 delPublishCallBack2====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_1400 delPublishCallBack2 end');
                    console.log(`FMS_notifyInvisibleForms_1400 end`);
                    done();
                }, 1000);
            }

            function onUpdateCallBack(err, data) {
                if (data.parameters.kind == "onUpdate") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_enableFormsUpdate_1200 onUpdateCallBack====>" + JSON.stringify(data));
                    expect(formIds.includes(data.parameters.parameters)).assertEqual(true);

                    ++count;
                    if (count == 2) {
                        console.debug("====>FMS_notifyInvisibleForms_1400 OK====>");
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);

                        commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                            console.log(`FMS_enableFormsUpdate_1200 time reset`);
                        });

                        setTimeout(() => {
                            let commonEventPublishData1 = {
                                data: formIds[0]
                            };
                            commonEvent.publish(deleteForm_Event, commonEventPublishData1, delPublishCallBack1);
                            let commonEventPublishData2 = {
                                data: formIds[1]
                            };
                            commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack2);
                        }, 2000);
                    }
                }
            }

            function onFormEnableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_enableFormsUpdate_1200 onFormEnableCallBack====>" + JSON.stringify(data));
                expect(data.parameters.kind).assertEqual("enable");
                commonEvent.unsubscribe(subscriberEnable, unSubscribeSupplyCallback);
            }

            function onFormDisableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_enableFormsUpdate_1200 onFormDisableCallBack====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberStatus, unSubscribeSupplyCallback);

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_1200 onStateFormEvent Subscriber====>");
                    subscriberEnable = data;
                    await commonEvent.subscribe(subscriberEnable, onFormEnableCallBack);
                });

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_1200 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onUpdateCallBack);
                });

                setTimeout(() => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notifyVisible start`);
                    formIds.push("0");
                    featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostg",
                            abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                            parameters: {
                                "formId" : "0",
                                "name" : "name",
                                "bundle" : "bundle",
                                "ability" : "ability",
                                "moduleName" : "entry",
                                "temporary" : false,
                                "stateForm" : "enable",
                                "stateIds" : formIds,
                                "isCreate" : false
                            }
                        }
                    }).then((res: any) => {
                        console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    });
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notifyVisible end`);
                }, 10000);
            }

            async function onSecondAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_enableFormsUpdate_1200 onSecondAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);
                console.debug("====>FMS_enableFormsUpdate_1200 formIds====>" + formIds);

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_1200 onStateFormEvent Subscriber====>");
                    subscriberStatus = data;
                    await commonEvent.subscribe(subscriberStatus, onFormDisableCallBack);
                });

                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notify disable start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "name",
                            "bundle" : "bundle",
                            "ability" : "ability",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "stateForm" : "disable",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility notify disable end`);
            }

            async function onFirstAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_enableFormsUpdate_1200 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);

                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_enableFormsUpdate_1200 onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onSecondAcquiredCallBack);
                });

                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility serviceb start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestserviceh.hmservice",
                            "ability" : "com.form.formsystemtestserviceh.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility serviceb end`);
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_enableFormsUpdate_1200 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onFirstAcquiredCallBack);
            });
            console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicee.hmservice",
                        "ability" : "com.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_enableFormsUpdate_1200 featureAbility.startAbility servicea end`);
        });
    });
}
