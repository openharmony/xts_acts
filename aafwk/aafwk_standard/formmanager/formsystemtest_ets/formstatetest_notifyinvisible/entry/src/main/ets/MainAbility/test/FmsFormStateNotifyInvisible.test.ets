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
import { describe, expect, it } from "deccjsunit/index.ets";

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

        /**
         * @tc.number: FMS_notifyInvisibleForms_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0200`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0200 start`);
            let subscriberOnState;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                commonEvent.unsubscribe(subscriberOnState, unsubscribeOnStateCallBack);
                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_0200 onStateCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0200 end`);
                    done();
                }, 1000)
            }
            function unsubscribeOnStateCallBack() {
                console.debug("====>FMS_notifyInvisibleForms_0200 unsubscribeOnStateCallBack====>");
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0200 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });

            console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbility again start`);
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
                        "stateForm" : "invisible",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0300`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0300 start`);
            let subscriberOnState;
            
            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_0300 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0300 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0300 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0300 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbility start`);
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
                        "stateForm" : "invisible",
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0400`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0400 start`);
            let subscriberOnState;
            
            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_0400 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0400 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0400 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0400 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbility start`);
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
                        "stateForm" : "invisible",
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0500`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0500 start`);
            let subscriberOnState;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_0500 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0500 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0500 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0500 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbility start`);
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
                        "stateForm" : "invisible",
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0600`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0600 start`);
            let subscriberOnState;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_notifyInvisibleForms_0600 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_0600 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0600 end`);
                    done();
                }, 1000);
            }

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0600 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unsubscribeOnStateCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unsubscribeOnStateCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0600 unsubscribeOnStateCallback====>");
            }            
            
            async function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");                
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_0600 onStateFormEvent Subscriber====>");
                    subscriberOnState = data;
                    await commonEvent.subscribe(subscriberOnState, onStateCallBack);
                });

                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility again start`);
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
                            "stateForm" : "invisible",
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0600 OnAcquired UnSubscribe CallBack====>");
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0600 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0600 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0700
         * @tc.name: form has been deleted
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0700`, 0, async (done) => {
            console.info(`FMS_notifyInvisibleForms_0700 start`);
            let subscriberInvisible;
            let subscriberDel;
            let subscriberSupply;
            let hostFormId;

            const onSupplyCallback = (err, data) => {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_0700 onSupplyCallback data:====>" + JSON.stringify(data));
                expect().assertFail();
            }

            const onInvisibleCallback = (err, data) => {
                if (data.parameters.kind != "invisible") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_0700 onInvisibleCallback data:====>" + JSON.stringify(data));

                expect(data.data).assertEqual("0");
                expect(data.parameters.formId).assertEqual(hostFormId);
                commonEvent.unsubscribe(subscriberInvisible, () => {
                    console.info("====>FMS_notifyInvisibleForms_0700 unSubscribeOnInvisibleCallback====>");
                });
                setTimeout(() => {
                    commonEvent.unsubscribe(subscriberSupply, () => {
                        console.info("====>FMS_notifyInvisibleForms_0700 unSubscribeSupplyCallback====>");
                    });
                    done();
                }, 2000);
            }

            const onDeleteCallback = async (err, data) => {
                console.debug("====>FMS_notifyInvisibleForms_0700 onDeleteCallback data:====>" + JSON.stringify(data));
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
                            "stateForm": "invisible",
                            "stateIds": [hostFormId],
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                commonEvent.unsubscribe(subscriberDel, () => {
                    console.info("====>FMS_notifyInvisibleForms_0700 unSubscribeDelCallback====>");
                });
            }

            commonEvent.createSubscriber(onDeletedFormEvent).then(async (data) => {
                console.info("====>FMS_notifyInvisibleForms_0700 onDeletedFormEvent Invisible Subscriber====>");
                subscriberDel = data;
                await commonEvent.subscribe(subscriberDel, onDeleteCallback);
            });
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.info("====>FMS_notifyInvisibleForms_0700 onStateFormEvent Invisible Subscriber====>");
                subscriberInvisible = data;
                await commonEvent.subscribe(subscriberInvisible, onInvisibleCallback);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_notifyInvisibleForms_0700 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallback);
            });

            console.info(`FMS_notifyInvisibleForms_0700 featureAbility.startAbility start`);
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
                console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_notifyInvisibleForms_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_0800
         * @tc.name: The form provider is the system application and config When form visiblenotify is true,
         * the form provider can be notified that the form is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_0800`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0800 start`);
            let subscriberInvisible;
            let subscriberVisible;
            let subscriberSupply;
            let formIdInvisible;
            let formIdVisible;
            let onSupplyCount = 0;
            
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0800 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0800 delPublishCallBack====>");                
                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_0800 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0800 end`);
                    done();
                }, 1000);
            }

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_0800 onSupplyCallBack====>" + JSON.stringify(data));
                    onSupplyCount++;
                    if (onSupplyCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    }
                    if (formIdInvisible && formIdVisible) {                        
                        let commonEventPublishData = {
                            data: formIdInvisible
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }

            function OnInvisibleCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0800 OnInvisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formIdInvisible = data.parameters.formId;
                commonEvent.unsubscribe(subscriberInvisible, unSubscribeOnInvisibleCallback);
                if (formIdInvisible && formIdVisible && onSupplyCount == 2) {
                    let commonEventPublishData = {
                        data: formIdInvisible
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnVisibleCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0800 unSubscribeOnVisibleCallback CallBack====>");
            }            
            function unSubscribeOnInvisibleCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0800 unSubscribeOnInvisibleCallback CallBack====>");
            }            
            async function onVisibleCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0800 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberVisible, unSubscribeOnVisibleCallback);
                formIdVisible = data.parameters.formId;
                
                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_0800 onStateFormEvent Invisible Subscriber====>");
                    subscriberInvisible = data;
                    await commonEvent.subscribe(subscriberInvisible, OnInvisibleCallBack);
                });

                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility again start`);
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
                            "stateForm" : "invisible",
                            "stateIds" : [formIdVisible],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility again end`);
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0800 onStateFormEvent Subscriber====>");
                subscriberVisible = data;
                await commonEvent.subscribe(subscriberVisible, onVisibleCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0800 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility start`);
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
                        "stateForm" : "visible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0800 featureAbility.startAbility end`);
        });
    });
}
