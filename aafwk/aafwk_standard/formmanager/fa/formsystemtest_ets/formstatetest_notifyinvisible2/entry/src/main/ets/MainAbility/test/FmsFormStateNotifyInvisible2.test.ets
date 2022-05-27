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
         * @tc.number: FMS_notifyInvisibleForms_0900
         * @tc.name: There are correct and wrong formId in the form ID parameter list
         * that informs that the form is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
         it(`FMS_notifyInvisibleForms_0900`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_0900 start`);
            let subscriberInvisible;
            let subscriberVisible;
            let subscriberSupply;
            let formIdInvisible;
            let formIdVisible;
            let onSupplyCount = 0;
            
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0900 unSubscribeSupplyCallback====>");
            }
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0900 delPublishCallBack====>");                
                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_0900 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_0900 end`);
                    done();
                }, 1000);
            }

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_0900 onSupplyCallBack====>" + JSON.stringify(data));
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
                console.info("!!!====>FMS_notifyInvisibleForms_0900 OnInvisibleCallBack data:====>" + JSON.stringify(data));
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
                console.debug("====>FMS_notifyInvisibleForms_0900 unSubscribeOnVisibleCallback CallBack====>");
            }            
            function unSubscribeOnInvisibleCallback() {
                console.debug("====>FMS_notifyInvisibleForms_0900 unSubscribeOnInvisibleCallback CallBack====>");
            }            
            async function onVisibleCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_0900 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberVisible, unSubscribeOnVisibleCallback);
                formIdVisible = data.parameters.formId;
                
                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_0900 onStateFormEvent Invisible Subscriber====>");
                    subscriberInvisible = data;
                    await commonEvent.subscribe(subscriberInvisible, OnInvisibleCallBack);
                });

                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility again start`);
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
                            "stateIds" : [formIdVisible, "0"],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility again end`);
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0900 onStateFormEvent Subscriber====>");
                subscriberVisible = data;
                await commonEvent.subscribe(subscriberVisible, onVisibleCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_0900 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility start`);
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
                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_0900 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1000
         * @tc.name: When the form provider is not a system application, notify the form to be invisible
         *           and do not pull up the form provider.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
         it(`FMS_notifyInvisibleForms_1000`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1000 start`);
            let subscriberOnVisible;
            let subscriberOnSupply;

            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1000 delPublishCallBack====>" + JSON.stringify(data));
                setTimeout(function () {
                    console.info('FMS_notifyInvisibleForms_1000 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_1000 end`);
                    done();
                }, 1000);
            }

            function unSubscribeOnVisibleCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1000 unSubscribeOnVisibleCallback CallBack====>");
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1000 unSubscribeSupplyCallback CallBack====>");
            }
            function onVisibleCallBack(err, data) {
                if (data.parameters.kind != "invisible") {
                    return;
                }
                console.info("!!!====>FMS_notifyInvisibleForms_1000 onVisibleCallBack data:====>" + JSON.stringify(data));
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
                console.debug("====>FMS_notifyInvisibleForms_1000 onSupplyEventCallBack====>" + JSON.stringify(data));
                console.log(`FMS_notifyInvisibleForms_1000 error`);
                expect().assertFail();
            }
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_1000 onStateFormEvent Invisible Subscriber====>");
                subscriberOnVisible = data;
                await commonEvent.subscribe(subscriberOnVisible, onVisibleCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_1000 onSupplyEvent Invisible Subscriber====>");
                subscriberOnSupply = data;
                await commonEvent.subscribe(subscriberOnSupply, onSupplyEventCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbility start`);
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
                        "stateForm" : "invisible",
                        "stateIds" : ["self"],
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_1000 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1100
         * @tc.name: When formVisibleNotify is false in config.json,
         * the form provider will not be pulled when the card is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_1100`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1100 start`);
            let subscriberInvisible;
            let subscriberVisible;
            let subscriberSupply;
            let supplyFlag = false;
            let formIdInvisible;
            let formIdVisible;
            
            function delPublishCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1100 delPublishCallBack====>");                
                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    if (supplyFlag) {
                        expect().assertFail();
                    }
                    console.info('FMS_notifyInvisibleForms_1100 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_1100 end`);
                    done();
                }, 1000);
            }

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1100 unSubscribeSupplyCallback====>");
            }
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_1100 onSupplyCallBack====>" + JSON.stringify(data));
                    supplyFlag = true;
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);

                    if (formIdInvisible && formIdVisible) {                        
                        let commonEventPublishData = {
                            data: formIdInvisible
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }

            function OnInvisibleCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1100 OnInvisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                formIdInvisible = data.parameters.formId;
                commonEvent.unsubscribe(subscriberInvisible, unSubscribeOnInvisibleCallback);
                if (formIdInvisible && formIdVisible) {
                    let commonEventPublishData = {
                        data: formIdInvisible
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnVisibleCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1100 unSubscribeOnVisibleCallback CallBack====>");
            }            
            function unSubscribeOnInvisibleCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1100 unSubscribeOnInvisibleCallback CallBack====>");
            }            
            async function onVisibleCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1100 onVisibleCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberVisible, unSubscribeOnVisibleCallback);
                formIdVisible = data.parameters.formId;
                
                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_1100 onStateFormEvent Invisible Subscriber====>");
                    subscriberInvisible = data;
                    await commonEvent.subscribe(subscriberInvisible, OnInvisibleCallBack);
                });

                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility again start`);
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
                            "stateForm" : "invisible",
                            "stateIds" : [formIdVisible],
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility again end`);
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_1100 onStateFormEvent Subscriber====>");
                subscriberVisible = data;
                await commonEvent.subscribe(subscriberVisible, onVisibleCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_1100 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility start`);
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
                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_1100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1200
         * @tc.name: When formVisibleNotify in config.json is true,
         *           the provider can be notified of the visibility of the form.
         * @tc.desc: 1. The form is created successfully.
         *           2. The invisible interface is invoked successfully,
         *              and the visibility notification of form providers A and B is triggered.
         *              The formId is the same as the created formId, and the visibility status is invisible.
         */
        it(`FMS_notifyInvisibleForms_1200`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1200 start`);
            let subscriberOnAcquired;
            let subscriberOnState;
            let subscriberSupply;
            let formId1;
            let formId2;
            let delCount = 0;
            let onSupplyCount = 0;

            function delPublishCallBack() {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 delPublishCallBack====>");
                delCount++;
                if (delCount == 2) {
                    setTimeout(function () {
                        console.info('FMS_notifyInvisibleForms_1200 delPublishCallBack end');
                        console.info('FMS_notifyInvisibleForms_1200 end');
                        done();
                    }, 500);
                }
            }
            function onAcquiredCallBack_Normal1(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                formId1 = data.data;

                FMS_notifyInvisibleForms_1200_normal2();
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.debug("====>FMS_notifyInvisibleForms_1200 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }
            
            async function FMS_notifyInvisibleForms_1200_normal1() {
                console.log(`FMS_notifyInvisibleForms_1200_normal1 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_1200_normal1 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                });

                console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbility start`);
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
                    console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.log(`FMS_notifyInvisibleForms_1200_normal1 featureAbility.startAbility end`);
                console.log(`FMS_notifyInvisibleForms_1200_normal1 end`);
            }

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack formId1:====>" + formId1);
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack formId2:====>" + formId2);
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onStateCallBack onSupplyCount:====>" + onSupplyCount);
                if (formId1 && formId2 && onSupplyCount == 2) {
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
                console.debug("====>FMS_notifyInvisibleForms_1200 unSubscribeOnStateCallback CallBack====>");
            }

            async function onAcquiredCallBack_Normal2(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1200 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");                
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2);
                formId2 = data.data;

                commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_1200 onStateFormEvent Subscriber====>");
                    subscriberOnState = data;
                    await commonEvent.subscribe(subscriberOnState, onStateCallBack);
                });
                
                console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbility start`);
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
                            "stateIds" : [formId1, formId2],
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_1200 featureAbility.startAbility end`);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.debug("====>FMS_notifyInvisibleForms_1200 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            async function FMS_notifyInvisibleForms_1200_normal2() {
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_1200_normal2 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                });

                console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbility start`);
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
                    console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.log(`FMS_notifyInvisibleForms_1200_normal2 featureAbility.startAbility end`);
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1200 unSubscribeSupplyCallback====>");
            }
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_1200 onSupplyCallBack====>" + JSON.stringify(data));
                    let parameters = JSON.parse(data.parameters.parameters);
                    if(parameters[formId1]) {
                        expect(parameters[formId1]).assertEqual(2);
                    }
                    if(parameters[formId2]) {
                        expect(parameters[formId2]).assertEqual(2);
                    }

                    onSupplyCount++;
                    if (onSupplyCount == 2) {
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
                console.debug("====>FMS_notifyInvisibleForms_1200 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            FMS_notifyInvisibleForms_1200_normal1();
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1300
         * @tc.name: When formVisibleNotify is true in config.json,
         * the form provider will be pulled when the card is invisible.
         * @tc.desc: 1.The form user calls the invisible notification interface.
         *           2.Verify the result of the invisible notification interface.
         */
        it(`FMS_notifyInvisibleForms_1300`, 0, async (done) => {
            console.info(`FMS_notifyInvisibleForms_1300 start`);
            let subscriberInvisible;
            let subscriberSupply;
            let hostFormId;
            let providerFormId;
            let counter = 0;

            const delPublishCallback = (err, data) => {
                console.info("!!!====>FMS_notifyInvisibleForms_1300 delPublishCallback====>");
                setTimeout(() => {
                    expect(hostFormId).assertEqual(providerFormId);
                    console.info('FMS_notifyInvisibleForms_1300 delPublishCallback end');
                    console.info(`FMS_notifyInvisibleForms_1300 end`);
                    done();
                }, 1000);
            }

            const onSupplyCallback = (err, data) => {
                if (data.parameters.kind != "onVisibilityChange") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_1300 onSupplyCallback data:====>" + JSON.stringify(data));
                providerFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                const visibilityStatus = JSON.parse(data.parameters.parameters)[providerFormId];

                expect(visibilityStatus).assertEqual(2);
                commonEvent.unsubscribe(subscriberSupply, () => {
                    console.info("====>FMS_notifyInvisibleForms_1300 unSubscribeSupplyCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: providerFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            const onInvisibleCallback = (err, data) => {
                if (data.parameters.kind != "invisible") {
                    return;
                }
                console.debug("====>FMS_notifyInvisibleForms_1300 onInvisibleCallback data:====>" + JSON.stringify(data));
                hostFormId = data.parameters.formId;

                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberInvisible, () => {
                    console.info("====>FMS_notifyInvisibleForms_1300 unSubscribeOnInvisibleCallback====>");
                });
                if (++counter == 2) {
                    const commonEventPublishData = {
                        data: hostFormId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallback);
                }
            }

            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.info("====>FMS_notifyInvisibleForms_1300 onStateFormEvent Invisible Subscriber====>");
                subscriberInvisible = data;
                await commonEvent.subscribe(subscriberInvisible, onInvisibleCallback);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_notifyInvisibleForms_1300 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallback);
            });

            console.info(`FMS_notifyInvisibleForms_1300 featureAbility.startAbility start`);
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
                        "stateIds": ["self"],
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.debug(`FMS_notifyInvisibleForms_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.debug(`FMS_notifyInvisibleForms_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
        });

        /**
         * @tc.number: FMS_notifyInvisibleForms_1400
         * @tc.name: Use -1 form Id and created 2 form card Id notify the form to be invisible.
         * @tc.desc: 1.The form user calls the visible notification interface.
         *           2.Verify the result of the visible notification interface.
         */
        it(`FMS_notifyInvisibleForms_1400`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1400 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formIds = new Array();
            let retFormId;
            let formId1;
            let formId2;
            let count = 0;

            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1400 unSubscribeSupplyCallback====>");
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

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onVisibilityChange") {
                    expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                    console.debug("====>FMS_notifyInvisibleForms_1400 onSupplyCallBack====>" + JSON.stringify(data));

                    let retFormId = Object.keys(JSON.parse(data.parameters.parameters))[0];
                    const visibilityStatus = JSON.parse(data.parameters.parameters)[retFormId];
                    expect(formIds.includes(retFormId)).assertTrue();
                    expect(visibilityStatus).assertEqual(2);

                    ++count;
                    if (count == 2) {
                        console.debug("====>FMS_notifyInvisibleForms_1400 OK====>");
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
                console.debug("====>FMS_notifyInvisibleForms_1400 onSecondAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);
                formIds.push("-1");
                console.debug("====>FMS_notifyInvisibleForms_1400 formIds====>" + formIds);

                commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_1400 onSupplyEvent Subscriber====>");
                    subscriberSupply = data;
                    await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
                });

                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility notifyInVisible start`);
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
                            "stateForm" : "invisible",
                            "stateIds" : formIds,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility notifyInVisible end`);
            }

            async function onFirstAcquiredCallBack(err, data) {
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeSupplyCallback);
                console.debug("====>FMS_notifyInvisibleForms_1400 onFirstAcquiredCallBack====>" + JSON.stringify(data));
                formIds.push(data.data);

                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_notifyInvisibleForms_1400 onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onSecondAcquiredCallBack);
                });

                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility serviceb start`);
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
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility serviceb end`);
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_1400 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onFirstAcquiredCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility servicea start`);
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
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_1400 featureAbility.startAbility servicea end`);
        });
        /**
         * @tc.number: FMS_notifyInvisibleForms_1500
         * @tc.name: The size of invisible form ids in the notification form array exceeds 32.
         * @tc.desc: 1. Failed to invoke the invisibility interface (parameter error).
         */
        it(`FMS_notifyInvisibleForms_1500`, 0, async (done) => {
            console.log(`FMS_notifyInvisibleForms_1500 start`);
            let subscriberOnState;
            let formId;

            function onStateCallBack(err, data) {
                console.info("!!!====>FMS_notifyInvisibleForms_1500 onStateCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnState_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnState, unSubscribeOnStateCallback)

                setTimeout(function () {                    
                    console.info('FMS_notifyInvisibleForms_1500 delPublishCallBack end');
                    console.log(`FMS_notifyInvisibleForms_1500 end`);
                    done();
                }, 100)
            }
            function unSubscribeOnStateCallback() {
                console.debug("====>FMS_notifyInvisibleForms_1500 unSubscribeOnStateCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onStateFormEvent).then(async (data) => {
                console.debug("====>FMS_notifyInvisibleForms_1500 onStateFormEvent Subscriber====>");
                subscriberOnState = data;
                await commonEvent.subscribe(subscriberOnState, onStateCallBack);
            });
            console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbility start`);
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
                        "stateIds" : [
                            "1","2","3","4","5","6","7","8","9","10","11","12","13","14",
                            "15","16","17","18","19","20","21","22","23","24","25","26",
                            "27","28","29","30","31","32","33"
                        ],
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_notifyInvisibleForms_1500 featureAbility.startAbility end`);
        });
    });
}
