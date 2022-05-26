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
         * @tc.number: FMS_notifyVisibleForms_0200
         * @tc.name: The form user does not have permission.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0200`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0200 start`);
            let subscriberOnState;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("2");
                commonEvent.unsubscribe(subscriberOnState, unsubscribeOnStateCallBack);
                setTimeout(function () {                    
                    console.info('FMS_notifyVisibleForms_0200 onStateCallBack end');
                    console.log(`FMS_notifyVisibleForms_0200 end`);
                    done();
                }, 1000)
            }
            function unsubscribeOnStateCallBack() {
                console.debug("====>FMS_notifyVisibleForms_0200 unsubscribeOnStateCallBack====>");
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_0200 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });

            console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbility again start`);
            await featureAbility.startAbility({
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
                        "stateForm" : "visible",
                        "stateIds" : ["1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0200 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0300
         * @tc.name: The length of the formId list is 0 (no formId)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0300`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0300 start`);
            let subscriberOnState;
            let formId;       
            
            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0300 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback);

                setTimeout(function () {                    
                    console.info('FMS_notifyVisibleForms_0300 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_0300 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyVisibleForms_0300 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_0300 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbility start`);
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
                        "stateIds" : [],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0400
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0400`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0400 start`);
            let subscriberOnState;
            let formId;
            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_notifyVisibleForms_0400 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_0400 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyVisibleForms_0400 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_0400 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbility start`);
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
                        "stateIds" : ["-1"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0500
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0500`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0500 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_notifyVisibleForms_0500 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_0500 end`);
                    done();
                }, 100);
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyVisibleForms_0500 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_0500 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbility start`);
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
                        "stateIds" : ["0"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0600
         * @tc.name: formID id is error because formId is not self
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0600`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0600 start`);
            let subscriberOnState;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_notifyVisibleForms_0600 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_notifyVisibleForms_0600 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_0600 end`);
                    done();
                }, 1000);
            }

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0600 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unsubscribeOnStateCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unsubscribeOnStateCallback() {
                console.debug("====>FMS_notifyVisibleForms_0600 unsubscribeOnStateCallback====>");
            }            
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_notifyVisibleForms_0600 OnAcquired UnSubscribe CallBack====>");
            }
            async function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");                
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_0600 onStateFormEvent Subscriber====>");
                    subscriberOnState = data;
                    await commonEvent.subscribe(subscriberOnState, onStateCallBack);
                });

                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility again start`);
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
                            "stateIds" : [formId],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility again end`);
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_0600 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility start`);
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
                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0600 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_0700
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_0700`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_0700 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_0700 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback);
                
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_0700 onStateCallBack end');
                    console.log(`FMS_notifyVisibleForms_0700 end`);   
                    done();
                }, 100);  
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyVisibleForms_0700 unSubscribeOnStateCallback CallBack====>");
            }            
            function unSubscribeDeletedCallback() {
                console.debug("====>FMS_notifyVisibleForms_0700 unSubscribeDeletedCallback CallBack====>");
            }

           commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_0700 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });

            console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbility again start`);
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
                        "stateIds" : ["123456789"],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_0700 featureAbility.startAbility again end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1000
         * @tc.name: The form provider is the system application and config When form visiblenotify is true,
         * the form provider can be notified that the form is visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1000`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1000 start`);
            let subscriberInvisible;
            let subscriberVisible;
            let subscriberSupply;
            let supplyFlag = false;
            let formIdInvisible;
            let formIdVisible;
            let onSupplyCount = 0;
            
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyVisibleForms_1000 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1000 delPublishCallBack====>");                
                setTimeout(function () {                    
                    console.info('FMS_notifyVisibleForms_1000 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_1000 end`);
                    done();
                }, 1000);
            }

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1000 onSupplyCallBack====>" + JSON.stringify(data));
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

            function onVisibleCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1000 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formIdVisible = data.parameters.formId;
                commonEvent.unsubscribe(subscriberVisible, unSubscribeOnVisibleCallback);
                 if (formIdInvisible && formIdVisible && onSupplyCount == 2) {
                    let commonEventPublishData = {
                        data: formIdInvisible
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnVisibleCallback() {
                console.debug("====>FMS_notifyVisibleForms_1000 unSubscribeOnVisibleCallback CallBack====>");
            }
            function unSubscribeOnInvisibleCallback(){
                console.debug("====>FMS_notifyVisibleForms_1000 unSubscribeOnInvisibleCallback CallBack====>");
            }            
            async function OnInvisibleCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1000 OnInvisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberInvisible, unSubscribeOnInvisibleCallback)
                formIdInvisible = data.parameters.formId;
                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1000 B onStateFormEvent Subscriber====>");
                    subscriberVisible = data;
                    await commonEvent.subscribe(subscriberVisible, onVisibleCallBack);
                });

                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility again start`);
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
                            "stateIds" : [formIdInvisible],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility again end`);
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1300 onStateFormEvent Invisible Subscriber====>");
                subscriberInvisible = data;
                await commonEvent.subscribe(subscriberInvisible, OnInvisibleCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1300 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility start`);
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
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1000 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1100
         * @tc.name: Use 0 and created form card Id notify the form to be visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1100`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1100 start`);
            let subscriberSupply;
            let subscriberOnVisible;
            let assertFormId;

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyVisibleForms_1100 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1100 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1100 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_1100 end`);
                    done();
                }, 1000);
            }
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    console.debug("====>FMS_notifyVisibleForms_1100 onSupplyCallBack====>" + JSON.stringify(data));
                    let formId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[formId];
                    expect(formId).assertEqual(assertFormId);
                    expect(visibilityStatus).assertEqual(1);

                    let commonEventPublishData = {
                        data: formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }

            function unSubscribeOnVisibleCallback() {
                console.debug("====>FMS_notifyVisibleForms_1100 unSubscribeOnVisibleCallback CallBack====>");
            }

            function onVisibleCallBack(err, data) {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.info("!!!====>FMS_notifyVisibleForms_1100 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                assertFormId = data.parameters.formId;

                commonEvent.unsubscribe(subscriberOnVisible, unSubscribeOnVisibleCallback);
            }
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1100 onStateFormEvent Visible Subscriber====>");
                subscriberOnVisible = data;
                await commonEvent.subscribe(subscriberOnVisible, onVisibleCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1100 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbility start`);
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
                        "stateIds" : ["self", "0"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1100 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1200
         * @tc.name: When the form provider is not a system application, notify the form to be visible
         *           and do not pull up the form provider.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1200`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1200 start`);
            let subscriberOnVisible;
            let subscriberOnSupply;

            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1200 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1200 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_1200 end`);
                    done();
                }, 1000);
            }

            function unSubscribeOnVisibleCallback() {
                console.debug("====>FMS_notifyVisibleForms_1200 unSubscribeOnVisibleCallback CallBack====>");
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyVisibleForms_1200 unSubscribeSupplyCallback CallBack====>");
            }
            function onVisibleCallBack(err, data) {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.info("!!!====>FMS_notifyVisibleForms_1200 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");

                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberOnVisible, unSubscribeOnVisibleCallback);
                    commonEvent.unsubscribe(subscriberOnSupply, unSubscribeSupplyCallback);

                    let commonEventPublishData = {
                        data: data.parameters.formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }, 2000);
            }
            function onSupplyEventCallBack(err, data) {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                commonEvent.unsubscribe(subscriberOnSupply, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyVisibleForms_1200 onSupplyEventCallBack====>" + JSON.stringify(data));
                console.log(`FMS_notifyVisibleForms_1200 error`);
                expect().assertFail();
            }
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1200 onStateFormEvent Visible Subscriber====>");
                subscriberOnVisible = data;
                await commonEvent.subscribe(subscriberOnVisible, onVisibleCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1200 onSupplyEvent Visible Subscriber====>");
                subscriberOnSupply = data;
                await commonEvent.subscribe(subscriberOnSupply, onSupplyEventCallBack);
            });
            console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicenotsysapp.hmservice",
                        "ability" : "com.form.formsystemtestservicenotsysapp.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "visible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1200 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1300
         * @tc.name: Provider onVisibleChange can not be called when formVisibleNotify is false.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the onVisibleChange interface.
         */
        it(`FMS_notifyVisibleForms_1300`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1300 start`);
            let subscriberOnVisible;

            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1300 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1300 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_1300 end`);
                    done();
                }, 1000);
            }

            function unSubscribeOnVisibleCallback() {
                console.debug("====>FMS_notifyVisibleForms_1300 unSubscribeOnVisibleCallback CallBack====>");
            }
            function OnVisibleCallBack(err, data) {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.info("!!!====>FMS_notifyVisibleForms_1300 OnVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");

                commonEvent.unsubscribe(subscriberOnVisible, unSubscribeOnVisibleCallback);

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1300 onStateFormEvent Visible Subscriber====>");
                subscriberOnVisible = data;
                await commonEvent.subscribe(subscriberOnVisible, OnVisibleCallBack);
            });
            console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostg",
                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestserviced.hmservice",
                        "ability" : "com.form.formsystemtestserviced.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "stateForm" : "visible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1400
         * @tc.name: formVisibleNotify in config.json is true,
         *           it can notify the form provider that the form is not visible.
         * @tc.desc: 1. The card is created successfully.
         *           2. The visibility interface is successfully invoked. 
         *              The visibility notification of form provider A is triggered, 
         *              and the formId is the same as that of the created formId.
         */
         it(`FMS_notifyVisibleForms_1400`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1400 start`);
            let subscriberOnAcquired;
            let subscriberOnState;
            let subscriberSupply;
            let supplyFlag = false;
            let formId1;
            let formId2;
            let delCount = 0;
            let onSupplyCount = 0;

            function delPublishCallBack() {
                console.info("!!!====>FMS_notifyVisibleForms_1400 delPublishCallBack====>");
                delCount++;
                if (delCount == 2) {
                    setTimeout(function () {
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                        if (supplyFlag) {
                            expect().assertFail();
                        }
                        console.info('FMS_notifyVisibleForms_1400 delPublishCallBack end');
                        console.info('FMS_notifyVisibleForms_1400 end');
                        done();
                    }, 1000);
                }
            }
            function onAcquiredCallBack_Normal1(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1400 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                formId1 = data.data;

                FMS_notifyVisibleForms_1400_normal2();
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.debug("====>FMS_notifyVisibleForms_1400 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }
            
            async function FMS_notifyVisibleForms_1400_normal1() {
                console.log(`FMS_notifyVisibleForms_1400_normal1 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1400_normal1 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                });

                console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbility start`);
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
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.log(`FMS_notifyVisibleForms_1400_normal1 featureAbility.startAbility end`);
                console.log(`FMS_notifyVisibleForms_1400_normal1 end`);
            }

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack formId1:====>" + formId1);
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack formId2:====>" + formId2);
                console.info("!!!====>FMS_notifyVisibleForms_1400 onStateCallBack onSupplyCount:====>" + onSupplyCount);
                if (formId1 && formId2 && onSupplyCount == 1) {
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    let commonEventPublishData2 = {
                        data: formId2
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack);
                }
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyVisibleForms_1400 unSubscribeOnStateCallback CallBack====>");
            }

            async function onAcquiredCallBack_Normal2(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1400 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");                
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2);
                formId2 = data.data;

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1400 onStateFormEvent Subscriber====>");
                    subscriberOnState = data;
                    await commonEvent.subscribe(subscriberOnState, onStateCallBack);
                });
                
                console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbility start`);
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
                            "stateIds" : [formId1,formId2],
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1400 featureAbility.startAbility end`);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.debug("====>FMS_notifyVisibleForms_1400 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            async function FMS_notifyVisibleForms_1400_normal2() {
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1400_normal2 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                });

                console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbility start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestserviced.hmservice",
                            "ability" : "com.form.formsystemtestserviced.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.log(`FMS_notifyVisibleForms_1400_normal2 featureAbility.startAbility end`);
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyVisibleForms_1400 unSubscribeSupplyCallback====>");
            }
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1400 onSupplyCallBack====>" + JSON.stringify(data));
                    let parameters = JSON.parse(data.parameters.parameters);
                    if(parameters[formId1]) {
                        expect(parameters[formId1]).assertEqual(1);
                    }
                    if(parameters[formId2]) {
                        expect(parameters[formId2]).assertEqual(1);
                    }

                    onSupplyCount++;
                    if (onSupplyCount == 2) {
                        supplyFlag = true;
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    }

                    if (formId1 && formId2) {                        
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                        let commonEventPublishData2 = {
                            data: formId2
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack);
                    }
                }
            }
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1400 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            FMS_notifyVisibleForms_1400_normal1();
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1500
         * @tc.name: Created provider A and B form card, notify the form to be visible 3times.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
         it(`FMS_notifyVisibleForms_1500`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1500 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formIds = new Array();
            let retFormId;
            let count = 0;

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyVisibleForms_1500 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack1(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1500 delPublishCallBack1====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1500 delPublishCallBack1 end');
                    console.log(`FMS_notifyVisibleForms_1500 end`);
                }, 1000);
            }
            function delPublishCallBack2(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1500 delPublishCallBack2====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1500 delPublishCallBack2 end');
                    console.log(`FMS_notifyVisibleForms_1500 end`);
                    done();
                }, 1000);
            }

            function onInVisibleSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1500 onInVisibleSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(2);

                    ++count;
                    if (count == 12) {
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                        let commonEventPublishData1 = {
                            data: formIds[0]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData1, delPublishCallBack1);
                        let commonEventPublishData2 = {
                            data: formIds[1]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack2);
                    }
                }
            }

            async function onVisibleSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1500 onVisibleSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(1);

                    ++count;
                    if (count == 6) {
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                        commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                            console.debug("====>FMS_notifyVisibleForms_1500 onSupplyEvent Subscriber====>");
                            subscriberSupply = data;
                            await commonEvent.subscribe(subscriberSupply, onInVisibleSupplyCallBack);
                        });
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyInvisible start`);
                        for (var i = 0; i < 3; i++) {
                            await featureAbility.startAbility({
                                want: {
                                    bundleName: "com.ohos.st.formsystemhostg",
                                    abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                                    parameters: {
                                        "stateForm": "invisible",
                                        "stateIds": formIds,
                                        "isCreate": false
                                    }
                                }
                            }).then((res: any) => {
                                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                            }).catch((err: any) => {
                                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                            });
                        }
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyInvisible end`);
                    }
                }
            }

            async function onAcquiredCallBack2(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyVisibleForms_1500 onAcquiredCallBack2====>" + JSON.stringify(data));
                formIds.push(data.data);
                console.debug("====>FMS_notifyVisibleForms_1500 formIds====>" + formIds);

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1500 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onVisibleSupplyCallBack);
                });

                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyVisible start`);
                for (var i = 0; i < 3; i++) {
                    await featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostg",
                            abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                            parameters: {
                                "stateForm": "visible",
                                "stateIds": formIds,
                                "isCreate": false
                            }
                        }
                    }).then((res: any) => {
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    });
                }
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility notifyVisible end`);
            }

            async function onAcquiredCallBack1(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyVisibleForms_1500 onAcquiredCallBack1====>" + JSON.stringify(data));
                formIds.push(data.data);
                console.debug("====>FMS_notifyVisibleForms_1500 formIds====>" + JSON.stringify(formIds));

                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1500 onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack2);
                });

                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility serviceb start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestserviceb.hmservice",
                            "ability" : "com.form.formsystemtestserviceb.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility serviceb end`);
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1500 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack1);
            });
            console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility servicea start`);
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
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1500 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1600
         * @tc.name: Use -1 and created form card Id notify the form to be visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1600`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1600 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formIds = new Array();
            let retFormId;
            let count = 0;

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyVisibleForms_1600 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack1(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1600 delPublishCallBack1====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1600 delPublishCallBack1 end');
                    console.log(`FMS_notifyVisibleForms_1600 end`);
                }, 1000);
            }
            function delPublishCallBack2(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1600 delPublishCallBack2====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1600 delPublishCallBack2 end');
                    console.log(`FMS_notifyVisibleForms_1600 end`);
                    done();
                }, 1000);
            }

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyVisibleForms_1600 onSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(1);

                    ++count;
                    if (count == 2) {
                        console.debug("====>FMS_notifyVisibleForms_1600 OK====>");
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);

                        let commonEventPublishData1 = {
                            data: formIds[0]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData1, delPublishCallBack1);
                        let commonEventPublishData2 = {
                            data: formIds[1]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData2, delPublishCallBack2);
                    }
                }
            }

            async function onSecondAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyVisibleForms_1600 onSecondAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);
                formIds.push("-1");
                console.debug("====>FMS_notifyVisibleForms_1600 formIds====>" + formIds);

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1600 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
                });

                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility notifyVisible start`);
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
                            "stateForm" : "visible",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility notifyVisible end`);
            }

            async function onFirstAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyVisibleForms_1600 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);

                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_notifyVisibleForms_1600 onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onSecondAcquiredCallBack);
                });

                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility serviceb start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostg",
                        abilityName: "com.ohos.st.formsystemhostg.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestserviceb.hmservice",
                            "ability" : "com.form.formsystemtestserviceb.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility serviceb end`);
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1600 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onFirstAcquiredCallBack);
            });
            console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility servicea start`);
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
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1600 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1700
         * @tc.name: Use -1 and created form card Id notify the form to be visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1700`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1700 start`);
            let subscriberVisible;
            let subscriberSupply;

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyVisibleForms_1700 unSubscribeSupplyCallback====>");
            }

            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1700 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyVisibleForms_1700 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_1700 end`);
                    done();
                }, 1000);
            }

            function onFormVisibleCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                commonEvent.unsubscribe(subscriberVisible, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyVisibleForms_1700 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                expect(data.parameters.kind).assertEqual("visible");
                expect(data.data).assertEqual("0");

                setTimeout(function () {
                    let commonEventPublishData = {
                        data: data.parameters.formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }, 2000);
            }

            function onFormSupplyCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyVisibleForms_1700 onFormSupplyCallBack====>" + JSON.stringify(data));
                if (data.parameters.kind == "onVisibilityChange") {
                    console.debug("====>FMS_notifyVisibleForms_1700 error");
                    expect().assertFail();
                }
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1700 onStateFormEvent Subscriber====>");
                subscriberVisible = data;
                await commonEvent.subscribe(subscriberVisible, onFormVisibleCallBack);
            });

            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1700 onStateFormEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onFormSupplyCallBack);
            });

            console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbility servicea start`);
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
                        "isCreate" : true,
                        "isStartOtherApp" : true,
                        "otherAppState" : "visible"
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1700 featureAbility.startAbility servicea end`);
        });

        /**
         * @tc.number: FMS_notifyVisibleForms_1800
         * @tc.name: When formVisibleNotify is true in config.json,
         * the form provider will be pulled when the card is visible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyVisibleForms_1800`, 0, async (done) => {
            console.info(`FMS_notifyVisibleForms_1800 start`);
            let subscriberVisible;
            let subscriberSupply;
            let hostFormId;
            let providerFormId;
            let counter = 0;

            const delPublishCallback = (err, data) => {
                console.info("!!!====>FMS_notifyVisibleForms_1800 delPublishCallback====>");
                setTimeout(() => {
                    expect(hostFormId).assertEqual(providerFormId);
                    console.info('FMS_notifyVisibleForms_1800 delPublishCallback end');
                    console.info(`FMS_notifyVisibleForms_1800 end`);
                    done();
                }, 1000);
            }

            const onSupplyCallback = (err, data) => {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                console.debug("====>FMS_notifyVisibleForms_1800 onSupplyCallback data:====>" + JSON.stringify(data));
                providerFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                const visibilityStatus = JSON.parse(data.parameters.parameters)[providerFormId];

                expect(visibilityStatus).assertEqual(1);
                commonEvent.unsubscribe(subscriberSupply, () => {
                    console.info("====>FMS_notifyVisibleForms_1800 unSubscribeSupplyCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: providerFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            const onVisibleCallback = (err, data) => {
                if (data.parameters.kind != "visible") {
                    return;
                }
                console.debug("====>FMS_notifyVisibleForms_1800 onVisibleCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters.formId;

                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberVisible, () => {
                    console.info("====>FMS_notifyVisibleForms_1800 unSubscribeOnVisibleCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: hostFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.info("====>FMS_notifyVisibleForms_1800 onStateFormEvent Visible Subscriber====>");
                subscriberVisible = data;
                await commonEvent.subscribe(subscriberVisible, onVisibleCallback);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_notifyVisibleForms_1800 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallback);
            });

            console.info(`FMS_notifyVisibleForms_1800 featureAbility.startAbility start`);
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
                        "stateForm": "visible",
                        "stateIds": ["self"],
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_notifyVisibleForms_1800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_notifyVisibleForms_1800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });
        /**
         * @tc.number: FMS_notifyVisibleForms_1900
         * @tc.name: The size of visible form ids in the notification form array exceeds 32.
         * @tc.desc: 1. Failed to invoke the visibility interface (parameter error).
         */
        it(`FMS_notifyVisibleForms_1900`, 0, async (done) => {
            console.log(`FMS_notifyVisibleForms_1900 start`);
            let subscriberOnState;
            let formId;
            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyVisibleForms_1900 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_notifyVisibleForms_1900 delPublishCallBack end');
                    console.log(`FMS_notifyVisibleForms_1900 end`);
                    done();
                }, 100);  
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyVisibleForms_1900 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyVisibleForms_1900 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbility start`);
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
                        "stateIds" : [
                            "1","2","3","4","5","6","7","8","9","10","11","12","13","14",
                            "15","16","17","18","19","20","21","22","23","24","25","26",
                            "27","28","29","30","31","32","33"
                        ],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyVisibleForms_1900 featureAbility.startAbility end`);
        });
    });
}
