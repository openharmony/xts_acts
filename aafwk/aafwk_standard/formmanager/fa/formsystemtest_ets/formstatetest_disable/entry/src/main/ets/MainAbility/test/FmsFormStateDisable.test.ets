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
         * @tc.number: FMS_disableFormsUpdate_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0200`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0200 start`);
            let subscriberOnState;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                commonEvent.unsubscribe(subscriberOnState, unsubscribeOnStateCallBack);
                setTimeout(function () {                    
                    console.info('FMS_disableFormsUpdate_0200 onStateCallBack end');
                    console.log(`FMS_disableFormsUpdate_0200 end`);
                    done();
                }, 1000)
            }
            function unsubscribeOnStateCallBack() {
                console.debug("====>FMS_disableFormsUpdate_0200 unsubscribeOnStateCallBack====>");
            }            

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_0200 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });

            console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbility again start`);
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
                        "stateForm" : "disable",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0300`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0300 start`);
            let subscriberOnState;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {
                    console.info('FMS_disableFormsUpdate_0300 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_0300 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_disableFormsUpdate_0300 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_0300 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbility start`);
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
                        "stateForm" : "disable",
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate _0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0400`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0400 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_disableFormsUpdate_0400 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_0400 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_disableFormsUpdate_0400 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_0400 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbility start`);
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
                        "stateForm" : "disable",
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate _0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0500`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0500 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_disableFormsUpdate_0500 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_0500 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_disableFormsUpdate_0500 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_0500 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility start`);
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
                        "stateForm" : "disable",
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0600`, 0, async (done) => {
            console.info(`FMS_disableFormsUpdate_0600 start`);
            let subscriberOnAcquired;
            let subscriberDisable;
            let hostFormId;

            const delPublishCallback = (err, data) => {
                console.info("!!!====>FMS_disableFormsUpdate_0600 delPublishCallback====>");
                setTimeout(() => {
                    console.info('FMS_disableFormsUpdate_0600 delPublishCallback end');
                    console.info(`FMS_disableFormsUpdate_0600 end`);
                    done();
                }, 1000);
            }

            const onDisableCallback = (err, data) => {
                if (data.parameters.kind != "disable") {
                    return;
                }
                console.debug("====>FMS_disableFormsUpdate_0600 onDisableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberDisable, () => {
                    console.info("====>FMS_disableFormsUpdate_0600 unSubscribeOnDisableCallback====>");
                });
                const commonEventPublishData = {
                    data: hostFormId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
            }

            const onAcquiredCallBack = async (err, data) => {
                console.debug("====>FMS_disableFormsUpdate_0600 onAcquiredCallback data:====>" + JSON.stringify(data));
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
                            "stateForm": "disable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                commonEvent.unsubscribe(subscriberOnAcquired, () => {
                    console.info("====>FMS_disableFormsUpdate_0600 unSubscribeOnAcquiredCallback====>");
                });
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_0600 onAcquiredFormEvent Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.info("====>FMS_disableFormsUpdate_0600 onStateFormEvent Disable Subscriber====>");
                subscriberDisable = data;
                await commonEvent.subscribe(subscriberDisable, onDisableCallback);
            });

            console.info(`FMS_disableFormsUpdate_0600 featureAbility.startAbility start`);
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
                console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_disableFormsUpdate_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0700
         * @tc.name: formID id is error because formId is not exist
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0700`, 0, async (done) => {
            console.info(`FMS_disableFormsUpdate_0700 start`);
            let subscriberDel;
            let subscriberDisable;
            let hostFormId;

            const onDisableCallback = (err, data) => {
                if (data.parameters.kind != "disable") {
                    return;
                }
                console.debug("====>FMS_disableFormsUpdate_0700 onDisableCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberDisable, () => {
                    console.info("====>FMS_disableFormsUpdate_0700 unSubscribeOnDisableCallback====>");
                });
                done();
            }

            const onDeleteCallback = async (err, data) => {
                console.debug("====>FMS_disableFormsUpdate_0700 onDeleteCallback data:====>" + JSON.stringify(data));
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
                            "stateForm": "disable",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_disableFormsUpdate_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.createSubscriber(onDeletedFormEvent).then(async (data) => {
                console.info("====>FMS_disableFormsUpdate_0700 onDeletedFormEvent Invisible Subscriber====>");
                subscriberDel = data;
                await commonEvent.subscribe(subscriberDel, onDeleteCallback);
            });
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.info("====>FMS_disableFormsUpdate_0700 onStateFormEvent Disable Subscriber====>");
                subscriberDisable = data;
                await commonEvent.subscribe(subscriberDisable, onDisableCallback);
            });

            console.info(`FMS_disableFormsUpdate_0700 featureAbility.startAbility start`);
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
                console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_disableFormsUpdate_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_0800
         * @tc.name: The form user has form permission.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0800`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0800 start`);
            let subscriberOnState;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_disableFormsUpdate_0800 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_disableFormsUpdate_0800 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_0800 end`);
                    done();
                }, 1000);
            }

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0800 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formId = data.parameters.formId;
                commonEvent.unsubscribe(subscriberOnState, unsubscribeOnStateCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unsubscribeOnStateCallback() {
                console.debug("====>FMS_disableFormsUpdate_0800 unsubscribeOnStateCallback====>");
            }            
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_0800 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility start`);
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
                        "stateForm" : "disable",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0800 featureAbility.startAbility end`);
        });
        
        /**
         * @tc.number: FMS_disableFormsUpdate_0900
         * @tc.name: There are correct and wrong formId in the form ID parameter list.
         * @tc.desc: 1.The form user calls the disable update interface.
         *           2.Verify the result of the disable update interface.
         */
        it(`FMS_disableFormsUpdate_0900`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_0900 start`);
            let subscriberDisable;
            let subscriberEnable;
            let formId;
            
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0900 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_disableFormsUpdate_0900 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_0900 end`);
                    done();
                }, 1000);
            }

            function unSubscribeOnDisableCallback() {
                console.info("!!!====>FMS_disableFormsUpdate_0900 unSubscribeOnDisableCallback====>");
            }
            function OnDisableCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0900 OnDisableCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberDisable, unSubscribeOnDisableCallback);

                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnEnableCallback() {
                console.info("!!!====>FMS_disableFormsUpdate_0900 unSubscribeOnEnableCallback====>");
            }
            function OnEnableCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_0900 OnEnableCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberEnable, unSubscribeOnEnableCallback);
                formId = data.parameters.formId;
                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_disableFormsUpdate_0900 onStateFormEvent Invisible Subscriber====>");
                    subscriberDisable = data;
                    await commonEvent.subscribe(subscriberDisable, OnDisableCallBack);
                });
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility start`);
                featureAbility.startAbility({
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
                        "stateForm" : "disable",
                        "stateIds" : [formId, "0"],
                        "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility end`);
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_0900 onStateFormEvent Invisible Subscriber====>");
                subscriberEnable = data;
                await commonEvent.subscribe(subscriberEnable, OnEnableCallBack);
            });
            console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility start`);
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
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_0900 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_disableFormsUpdate_1000
         * @tc.name: Set next refresh time is invalid when disable form. (cache data < 1k)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Call the disableFormsUpdate interface.
         *           3.Call the setFormNextRefreshTime interface and verify the form can not refresh.
         */
        it(`FMS_disableFormsUpdate_1000`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_1000 start`);
            let subscriberOnAcquired;
            let subscriberStatus;
            let subscriberEnable;
            let subscriberSupply;
            let formId;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 100 }, () => {
                console.log(`FMS_disableFormsUpdate_1000 time speed up`);
            });

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_disableFormsUpdate_1000 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_1000 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_disableFormsUpdate_1000 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_1000 end`);
                    done();
                }, 1000);
            }

            function onSupplyEventCallBack(err, data) {
                console.debug("====>FMS_disableFormsUpdate_1000 onSupplyEventCallBack====>" + JSON.stringify(data));
                if ("onUpdate" == data.parameters.kind) {
                    console.debug("FMS_disableFormsUpdate_1000 error, onUpdate called.");
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    expect().assertFail();
                }
            }

            function onFormDisableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_disableFormsUpdate_1000 onFormDisableCallBack====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberStatus, unSubscribeSupplyCallback);
                expect(data.parameters.kind).assertEqual("disable");
                expect(data.data).assertEqual("0");

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_disableFormsUpdate_1000 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);
                });

                setTimeout(() => {
                    // timer reset
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_disableFormsUpdate_1000 time reset`);
                    });
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                }, 9000);

                setTimeout(() => {
                    console.log(`FMS_disableFormsUpdate_1000 onFormDisableCallBack end`);
                    let commonEventPublishData = {
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }, 10000);
            }

            function onAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_disableFormsUpdate_1000 onAcquiredCallBack====>" + JSON.stringify(data));
                expect(data.parameters.kind).assertEqual("visible");
                expect(data.data).assertEqual("0");
                formId = data.parameters.formId;

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_disableFormsUpdate_1000 onStateFormEvent Subscriber====>");
                    subscriberStatus = data;
                    await commonEvent.subscribe(subscriberStatus, onFormDisableCallBack);
                });

                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility notify disable start`);
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
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility notify disable end`);
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_1000 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicef.hmservice",
                        "ability" : "com.form.formsystemtestservicef.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true,
                        "stateIds" : ["self"],
                        "stateForm" : "visible"
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_1000 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_disableFormsUpdate_1100
         * @tc.name: Set next refresh time is invalid when disable form. (cache data > 1k)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Call the disableFormsUpdate interface.
         *           3.Call the setFormNextRefreshTime interface and verify the form can not refresh.
         */
        it(`FMS_disableFormsUpdate_1100`, 0, async (done) => {
            console.log(`FMS_disableFormsUpdate_1100 start`);
            let subscriberOnAcquired;
            let subscriberStatus;
            let subscriberEnable;
            let subscriberSupply;
            let formId;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 100 }, () => {
                console.log(`FMS_disableFormsUpdate_1100 time speed up`);
            });

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_disableFormsUpdate_1100 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_disableFormsUpdate_1100 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_disableFormsUpdate_1100 delPublishCallBack end');
                    console.log(`FMS_disableFormsUpdate_1100 end`);
                    done();
                }, 1000);
            }

            function onSupplyEventCallBack(err, data) {
                console.debug("====>FMS_disableFormsUpdate_1100 onSupplyEventCallBack====>" + JSON.stringify(data));
                if ("onUpdate" == data.parameters.kind) {
                    console.debug("FMS_disableFormsUpdate_1100 error, onUpdate called.");
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    expect().assertFail();
                }
            }

            function onFormDisableCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                console.debug("====>FMS_disableFormsUpdate_1100 onFormDisableCallBack====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberStatus, unSubscribeSupplyCallback);
                expect(data.parameters.kind).assertEqual("disable");
                expect(data.data).assertEqual("0");

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_disableFormsUpdate_1100 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onSupplyEventCallBack);
                });

                setTimeout(() => {
                    // timer reset
                    commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                        console.log(`FMS_disableFormsUpdate_1100 time reset`);
                    });
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                }, 9000);

                setTimeout(() => {
                    console.log(`FMS_disableFormsUpdate_1100 onFormDisableCallBack end`);
                    let commonEventPublishData = {
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }, 10000);
            }

            function onAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_disableFormsUpdate_1100 onAcquiredCallBack====>" + JSON.stringify(data));
                expect(data.parameters.kind).assertEqual("visible");
                expect(data.data).assertEqual("0");
                formId = data.parameters.formId;

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_disableFormsUpdate_1100 onStateFormEvent Subscriber====>");
                    subscriberStatus = data;
                    await commonEvent.subscribe(subscriberStatus, onFormDisableCallBack);
                });

                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility notify disable start`);
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
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility notify disable end`);
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_disableFormsUpdate_1100 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestserviceg.hmservice",
                        "ability" : "com.form.formsystemtestserviceg.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true,
                        "stateIds" : ["self"],
                        "stateForm" : "visible"
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_disableFormsUpdate_1100 featureAbility.startAbility servicea end`);
        });
    });
}
