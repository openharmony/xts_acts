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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index.ets"
import featureAbility from "@ohos.ability.featureAbility";
import commonEvent from '@ohos.commonEvent'

var onErrorForm_Event = {
    events: ["FMS_FormOnError_commonEvent"],
};
var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

var onDetetedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
var onReleasedFormEvent = {
    events: ["FMS_FormOnReleased_commonEvent"],
};

var onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

var deleteForm_Event = "FMS_FormDelete_commonEvent";

export default function test() {
    describe(`FmsDeleteFormTest`, () => {

        beforeAll(async (done) => {
            done();
        })

        /**
         * @tc.number: FMS_releaseForm_0200
         * @tc.name: host does not have permission
         * @tc.desc: 1.release the form that formID is 1
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0200`, 0, async (done) => {
            console.log(`FMS_releaseForm_0200 start`);
            let subscriberOnReleased;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_releaseForm_0200 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_releaseForm_0200 delPublishCallBack end');
                    console.log(`FMS_releaseForm_0200 end`);
                    done();
                }, 1000)
            }

            function onReleasedCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0200 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_releaseForm_0200 unSubscribeOnReleasedCallback====>");
            }            
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");                
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                    console.debug("====>FMS_releaseForm_0200 onReleasedFormEvent Subscriber====>");
                    subscriberOnReleased = data;
                    await commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                });

                console.log(`FMS_releaseForm_0200 featureAbility.startAbility again start`);
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
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_releaseForm_0200 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_releaseForm_0200 OnAcquired UnSubscribe CallBack====>");
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_releaseForm_0200 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_releaseForm_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0200 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_releaseForm_0300
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.release the form
         *           2.Verify the result is false
         */
        it(`FMS_releaseForm_0300`, 0, async (done) => {
            console.log(`FMS_releaseForm_0300 start`);
            let subscriberOnReleased;
            let subscriberOnAcquired;

            function onReleasedCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0300 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);
                setTimeout(function () {                    
                    console.info('FMS_releaseForm_0300 delPublishCallBack end');
                    console.log(`FMS_releaseForm_0300 end`);
                    done();
                }, 100);
            }
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_releaseForm_0300 unSubscribeOnReleasedCallback CallBack====>");
            }            
            commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                console.debug("====>FMS_releaseForm_0300 onReleasedFormEvent Subscriber====>");
                subscriberOnReleased = data;
                await commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
            });

            console.log(`FMS_releaseForm_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "releaseForm" : true,
                        "releaseId" : "-1",
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0300 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_0400
        * @tc.name: formID id is error(formID = 0)
        * @tc.desc: 1.release the form
        *           2.Verify the result is false
        */
        it(`FMS_releaseForm_0400`, 0, async (done) => {
            console.log(`FMS_releaseForm_0400 start`);
            let subscriberOnReleased;
            let subscriberOnAcquired;

            function onReleaseCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0400 onReleaseCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);
                setTimeout(function () {                    
                    console.info('FMS_releaseForm_0400 delPublishCallBack end');
                    console.log(`FMS_releaseForm_0400 end`);
                    done();
                }, 100);
            }
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_releaseForm_0400 unSubscribeOnReleasedCallback CallBack====>");
            }            
            commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                console.debug("====>FMS_releaseForm_0400 onReleasedFormEvent Subscriber====>");
                subscriberOnReleased = data;
                await commonEvent.subscribe(subscriberOnReleased, onReleaseCallBack);
            });

            console.log(`FMS_releaseForm_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "releaseForm" : true,
                        "releaseId" : "0",
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0400 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_0500
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.host A create a formA
        *           2.host B release the formA
        *           2.Verify the result is false
        */
        it(`FMS_releaseForm_0500`, 0, async (done) => {
            console.log(`FMS_releaseForm_0500 start`);
            let subscriberOnReleased;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_releaseForm_0500 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_releaseForm_0500 delPublishCallBack end');
                    console.log(`FMS_releaseForm_0500 end`);
                    done();
                }, 1000)
            }

            function onReleasedCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0500 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_releaseForm_0500 unSubscribeOnReleasedCallback CallBack====>");
            }            
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0500 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");                
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                    console.debug("====>FMS_releaseForm_0500 onReleasedFormEvent Subscriber====>");
                    subscriberOnReleased = data;
                    await commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                });

                console.log(`FMS_releaseForm_0500 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_releaseForm_0500 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_releaseForm_0500 OnAcquired UnSubscribe CallBack====>");
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_releaseForm_0500 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_releaseForm_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0500 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_0600
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.host create one normal card
        *           2.host delete the form
        *           3.host release the form and verify the result is false
        */
        it(`FMS_releaseForm_0600`, 0, async (done) => {
            console.log(`FMS_releaseForm_0600 start`);
            let subscriberOnReleased;
            let subscriberOnDeleted;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_releaseForm_0600 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_releaseForm_0600 delPublishCallBack end');
                    console.log(`FMS_releaseForm_0600 end`);   
                    done();
                }, 1000);                
            }

            function onReleasedCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0600 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_releaseForm_0600 unSubscribeOnReleasedCallback CallBack====>");
            }            
            
            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_0600 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeDeletedCallback)
                formId = data.parameters.formId;
                commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                    console.debug("====>FMS_releaseForm_0600 B onReleasedFormEvent Subscriber====>");
                    subscriberOnReleased = data;
                    await commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                });

                console.log(`FMS_releaseForm_0600 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "releaseForm" : true,
                            "releaseId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_releaseForm_0600 featureAbility.startAbility again end`);
            }
            function unSubscribeDeletedCallback() {
                console.debug("====>FMS_releaseForm_0600 unSubscribeDeletedCallback====>");
            }
           commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                console.debug("====>FMS_releaseForm_0600 onDetetedFormEvent Subscriber====>");
                subscriberOnDeleted = data;
                await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            });
            console.log(`FMS_releaseForm_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "deleteForm" : true,
                        "deleteId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_0600 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_releaseForm_1300
        * @tc.name: single host continuously release forms
        * @tc.desc: 1.There are 2 forms created by the single host
        *           2.single host release 2 forms successfully
        */
        it(`FMS_releaseForm_1300`, 0, async (done) => {
            console.log(`FMS_releaseForm_1300 start`);
            let subscriberOnReleased;
            let subscriberOnAcquired;
            let formIdList = [];
            let releasedIdList = [];
            let formCount = 2;
            let delCount = 0;

            function delPublishCallBack() {
                console.info("!!!====>FMS_releaseForm_1300 delPublishCallBack====>");
                delCount++;
                if(delCount == formCount) {
                    setTimeout(function () {
                        console.info('FMS_releaseForm_1300 delPublishCallBack end');
                        console.log(`FMS_releaseForm_1300 end`);   
                        done();
                    }, 1000);
                }
            }

            function onReleasedCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_1300 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data).assertEqual("0");
                let formId = data.parameters.formId;
                formIdList.forEach(function(item, index, arr) {
                    if(item === formId) {
                        releasedIdList.push(formId);
                    }
                });
                if(releasedIdList.length == formCount) {
                    commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);
                    for(var iIndex = 0; iIndex < releasedIdList.length; iIndex++) {
                        let commonEventPublishData = {
                            bundleName: "com.ohos.st.formsystemhostc",
                            data: releasedIdList[iIndex]
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_releaseForm_1300 unSubscribeOnReleasedCallback CallBack====>");
            }            
            function releaseForms() {
                console.debug("====>FMS_releaseForm_1300 releaseForms====>");
                commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                    console.debug("====>FMS_releaseForm_1300 B onReleasedFormEvent Subscriber====>");
                    subscriberOnReleased = data;
                    await commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
                });
                for(var iIndex = 0; iIndex < formIdList.length; iIndex++) {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
                    featureAbility.startAbility({
                        want: {
                            bundleName: "com.ohos.st.formsystemhostc",
                            abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                            parameters: {
                                "formId" : "0",
                                "name" : "Form_Js001",
                                "bundle" : "com.form.formsystemtestservicea.hmservice",
                                "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                                "moduleName" : "entry",
                                "temporary" : false,
                                "releaseForm" : true,
                                "releaseId" : formIdList[iIndex],
                                "isCreate" : false
                            }
                        }
                    }).then((res: any) => {
                        console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    }).catch((err: any) => {
                        console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    });
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
                }
            }
            function onAcquiredCallBack1(err, data) {
                console.info("!!!====>FMS_releaseForm_1300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback);
                formIdList.push(data.data);

                releaseForms();
            }

            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_1300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback);
                formIdList.push(data.data);

                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_releaseForm_1300 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack1);
                });
                
                console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostc",
                        abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_releaseForm_1300 OnAcquired UnSubscribe CallBack====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_releaseForm_1300 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            
            console.log(`FMS_releaseForm_1300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
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
                console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_1300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_1300 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_releaseForm_1400
        * @tc.name: release temp form
        * @tc.desc: 1.host create one temp form
        *           2.release the form and judge the result is true
        */
        it(`FMS_releaseForm_1400`, 0, async (done) => {
            console.log(`FMS_releaseForm_1400 start`);
            let subscriberOnReleased;

            function delPublishCallBack() {
                console.info("!!!====>FMS_releaseForm_1400 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_releaseForm_1400 delPublishCallBack end');
                    console.log(`FMS_releaseForm_1400 end`);   
                    done();
                }, 1000);                
            }
     
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_releaseForm_1400 unSubscribeOnReleasedCallback CallBack====>");
            }            
            
            function onReleasedCallBack(err, data) {
                console.info("!!!====>FMS_releaseForm_1400 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);

                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);                
            }
            commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                console.debug("====>FMS_releaseForm_1400 onReleasedFormEvent Subscriber====>");
                subscriberOnReleased = data;
                await commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
            });

            console.log(`FMS_releaseForm_1400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostc",
                    abilityName: "com.ohos.st.formsystemhostc.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : true,
                        "releaseForm" : true,
                        "releaseId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_releaseForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_releaseForm_1400 featureAbility.startAbility end`);
        });
    });
}
