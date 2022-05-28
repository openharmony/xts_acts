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
import commonEvent from '@ohos.commonEvent';

var onErrorForm_Event = {
    events: ["FMS_FormOnError_commonEvent"],
};
var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};

var onDetetedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
var onUpdateRefreshEvent = {
    events: ["FMS_FormUpdateRefresh_commonEvent"],
};
var onRequestFormEvent = {
    events: ["FMS_FormOnRequest_commonEvent"],
};

var deleteForm_Event = "FMS_FormDelete_commonEvent";

export default function test() {
    describe(`FmsUpdateRefreshFormTest`, () => {

        beforeAll(async (done) => {
            done();
        })

        /**
         * @tc.number: FMS_updateForm_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0100`, 0, async (done) => {
            console.log(`FMS_updateForm_0100 start`);
            let subscriberOnRefresh;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_updateForm_0100 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_updateForm_0100 delPublishCallBack end');
                    console.log(`FMS_updateForm_0100 end`);
                    done();
                }, 1000)
            }          
            
            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_updateForm_0100 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                // expect(data.data).assertEqual("8585224");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_updateForm_0100 unSubscribeOnRefreshCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onUpdateRefreshEvent).then(async (data) => {
                console.debug("====>FMS_updateForm_0100 onUpdateRefreshEvent Subscriber====>");
                subscriberOnRefresh = data;
                await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            });
            console.log(`FMS_updateForm_0100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "-1",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_updateForm_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0200`, 0, async (done) => {
            console.log(`FMS_updateForm_0200 start`);
            let subscriberOnRefresh;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_updateForm_0200 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_updateForm_0200 delPublishCallBack end');
                    console.log(`FMS_updateForm_0200 end`);
                    done();
                }, 1000)
            }          
            
            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_updateForm_0200 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                // expect(data.data).assertEqual("8585224");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_updateForm_0200 unSubscribeOnRefreshCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onUpdateRefreshEvent).then(async (data) => {
                console.debug("====>FMS_updateForm_0200 onUpdateRefreshEvent Subscriber====>");
                subscriberOnRefresh = data;
                await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            });
            console.log(`FMS_updateForm_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "0",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0200 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_updateForm_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form provider B to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_updateForm_0300`, 0, async (done) => {
            console.log(`FMS_updateForm_0300 start`);
            let subscriberOnRefresh;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_updateForm_0300 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_updateForm_0300 delPublishCallBack end');
                    console.log(`FMS_updateForm_0300 end`);
                    done();
                }, 1000)
            }

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_updateForm_0300 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                // expect(data.data).assertEqual("8585223");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, unsubscribeOnRefreshCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unsubscribeOnRefreshCallback() {
                console.debug("====>FMS_updateForm_0300 unsubscribeOnRefreshCallback====>");
            }            
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_updateForm_0300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onUpdateRefreshEvent).then(async (data) => {
                    console.debug("====>FMS_updateForm_0300 onUpdateRefreshEvent Subscriber====>");
                    subscriberOnRefresh = data;
                    await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
                });

                console.log(`FMS_updateForm_0300 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_updateForm_0300 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_updateForm_0300 OnAcquired UnSubscribe CallBack====>");
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_updateForm_0300 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_updateForm_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_updateForm_0400
         * @tc.name: Form ID error (FormID does not exist)
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0400`, 0, async (done) => {
            console.log(`FMS_updateForm_0400 start`);
            let subscriberOnRefresh;
            let subscriberOnDeleted;
            let formId;

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_updateForm_0400 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                // expect(data.data).assertEqual("8585236");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback);
                setTimeout(function () {
                    console.info('FMS_updateForm_0400 delPublishCallBack end');
                    console.log(`FMS_updateForm_0400 end`);   
                    done();
                }, 1000);  
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_updateForm_0400 unSubscribeOnRefreshCallback CallBack====>");
            }            
            
            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_updateForm_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeDeletedCallback)
                formId = data.parameters.formId;
                commonEvent.createSubscriber(onUpdateRefreshEvent).then(async (data) => {
                    console.debug("====>FMS_updateForm_0400 B onUpdateRefreshEvent Subscriber====>");
                    subscriberOnRefresh = data;
                    await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
                });

                console.log(`FMS_updateForm_0400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostf",
                        abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "updateForm" : true,
                            "updateId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_updateForm_0400 featureAbility.startAbility again end`);
            }
            function unSubscribeDeletedCallback() {
                console.debug("====>FMS_updateForm_0400 unSubscribeDeletedCallback====>");
            }
           commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                console.debug("====>FMS_releaseForm_1400 onDetetedFormEvent Subscriber====>");
                subscriberOnDeleted = data;
                await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            });
            console.log(`FMS_updateForm_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "deleteForm" : true,
                        "deleteId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_updateForm_0500
         * @tc.name: The jsonData of form in the provider is empty.
         * @tc.desc: 1.The form provider A to invoke the intiative timed refresh interface.
         */
        it(`FMS_updateForm_0500`, 0, async (done) => {
            console.log(`FMS_updateForm_0500 start`);
            let subscriberOnRefresh;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_updateForm_0500 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_updateForm_0500 delPublishCallBack end');
                    console.log(`FMS_updateForm_0500 end`);
                    done();
                }, 1000)
            }          
            
            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_updateForm_0500 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormUpdateRefresh_commonEvent");
                // expect(data.data).assertEqual("8585225");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_updateForm_0500 unSubscribeOnRefreshCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onUpdateRefreshEvent).then(async (data) => {
                console.debug("====>FMS_updateForm_0500 onUpdateRefreshEvent Subscriber====>");
                subscriberOnRefresh = data;
                await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            });
            console.log(`FMS_updateForm_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "updateForm" : true,
                        "updateId" : "self",
                        "jsonEmpty" : true,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_updateForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_updateForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_updateForm_0500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_hostRefresh_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_hostRefresh_0100`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0100 start`);
            let subscriberOnReQuest;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_hostRefresh_0100 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_hostRefresh_0100 delPublishCallBack end');
                    console.log(`FMS_hostRefresh_0100 end`);
                    done();
                }, 1000)
            }          
            
            function onRequestCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0100 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                // expect(data.data).assertEqual("8585224");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReQuest, unSubscribeOnRequestCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRequestCallback() {
                console.debug("====>FMS_hostRefresh_0100 unSubscribeOnRequestCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onRequestFormEvent).then(async (data) => {
                console.debug("====>FMS_hostRefresh_0100 onRequestFormEvent Subscriber====>");
                subscriberOnReQuest = data;
                await commonEvent.subscribe(subscriberOnReQuest, onRequestCallBack);
            });
            console.log(`FMS_hostRefresh_0100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "-1",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_hostRefresh_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
         *           2.Verify the result of the intiative timed refresh interface.
         */
        it(`FMS_hostRefresh_0200`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0200 start`);
            let subscriberOnReQuest;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_hostRefresh_0200 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_hostRefresh_0200 delPublishCallBack end');
                    console.log(`FMS_hostRefresh_0200 end`);
                    done();
                }, 1000)
            }          
            
            function onRequestCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0200 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                // expect(data.data).assertEqual("8585224");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReQuest, unSubscribeOnRequestCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRequestCallback() {
                console.debug("====>FMS_hostRefresh_0200 unSubscribeOnRequestCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onRequestFormEvent).then(async (data) => {
                console.debug("====>FMS_hostRefresh_0200 onRequestFormEvent Subscriber====>");
                subscriberOnReQuest = data;
                await commonEvent.subscribe(subscriberOnReQuest, onRequestCallBack);
            });
            console.log(`FMS_hostRefresh_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "0",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0200 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_hostRefresh_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form user B to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0300`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0300 start`);
            let subscriberOnReQuest;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_hostRefresh_0300 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_hostRefresh_0300 delPublishCallBack end');
                    console.log(`FMS_hostRefresh_0300 end`);
                    done();
                }, 1000)
            }

            function onRequestCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0300 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReQuest, unsubscribeOnRefreshCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unsubscribeOnRefreshCallback() {
                console.debug("====>FMS_hostRefresh_0300 unsubscribeOnRefreshCallback====>");
            }            
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onRequestFormEvent).then(async (data) => {
                    console.debug("====>FMS_hostRefresh_0300 onRequestFormEvent Subscriber====>");
                    subscriberOnReQuest = data;
                    await commonEvent.subscribe(subscriberOnReQuest, onRequestCallBack);
                });

                console.log(`FMS_hostRefresh_0300 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_hostRefresh_0300 OnAcquired UnSubscribe CallBack====>");
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_hostRefresh_0300 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_hostRefresh_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0300 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_hostRefresh_0400
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0400`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0400 start`);
            let subscriberOnReQuest;
            let subscriberOnDeleted;
            let formId;

            function onRequestCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0400 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                // expect(data.data).assertEqual("8585236");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReQuest, unSubscribeOnRequestCallback);
                setTimeout(function () {
                    console.info('FMS_hostRefresh_0400 onRequestCallBack end');
                    console.log(`FMS_hostRefresh_0400 end`);   
                    done();
                }, 10);

            }
            function unSubscribeOnRequestCallback() {
                console.debug("====>FMS_hostRefresh_0400 unSubscribeOnRequestCallback CallBack====>");
            }            
            
            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeDeletedCallback)
                formId = data.parameters.formId;
                commonEvent.createSubscriber(onRequestFormEvent).then(async (data) => {
                    console.debug("====>FMS_hostRefresh_0400 onRequestFormEvent Subscriber====>");
                    subscriberOnReQuest = data;
                    await commonEvent.subscribe(subscriberOnReQuest, onRequestCallBack);
                });

                console.log(`FMS_hostRefresh_0400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "requestForm" : true,
                            "requestId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbility again end`);
            }
            function unSubscribeDeletedCallback() {
                console.debug("====>FMS_hostRefresh_0400 unSubscribeDeletedCallback====>");
            }
           commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                console.debug("====>FMS_hostRefresh_0400 onDetetedFormEvent Subscriber====>");
                subscriberOnDeleted = data;
                await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            });
            console.log(`FMS_hostRefresh_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "deleteForm" : true,
                        "deleteId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0400 featureAbility.startAbility end`);
        });
       /**
        * @tc.number: FMS_hostRefresh_0600
        * @tc.name: The form user has no form permission.
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefresh_0600`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0600 start`);
            let subscriberOnReQuest;

            function onRequestCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0600 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnReQuest, unSubscribeOnRequestCallback)

                setTimeout(function () {
                    console.info('FMS_hostRefresh_0600 delPublishCallBack end');
                    console.log(`FMS_hostRefresh_0600 end`);
                    done();
                }, 1000)
            }
            function unSubscribeOnRequestCallback() {
                console.debug("====>FMS_hostRefresh_0600 unSubscribeOnRequestCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onRequestFormEvent).then(async (data) => {
                console.debug("====>FMS_hostRefresh_0600 onRequestFormEvent Subscriber====>");
                subscriberOnReQuest = data;
                await commonEvent.subscribe(subscriberOnReQuest, onRequestCallBack);
            });
            console.log(`FMS_hostRefresh_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "1",
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0600 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_hostRefresh_0700
        * @tc.name: Refresh form successfully by the form user.
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify that pulling up the form provider.
        */
        it(`FMS_hostRefresh_0700`, 0, async (done) => {
            console.log(`FMS_hostRefresh_0700 start`);
            let subscriberOnReQuest;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_hostRefresh_0700 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_hostRefresh_0700 delPublishCallBack end');
                    console.log(`FMS_hostRefresh_0700 end`);
                    done();
                }, 1000)
            }          
            
            function onRequestCallBack(err, data) {
                console.info("!!!====>FMS_hostRefresh_0700 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnReQuest, unSubscribeOnRequestCallback)
                formId = data.parameters.formId;
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRequestCallback() {
                console.debug("====>FMS_hostRefresh_0700 unSubscribeOnRequestCallback CallBack====>");
            }
            
            commonEvent.createSubscriber(onRequestFormEvent).then(async (data) => {
                console.debug("====>FMS_hostRefresh_0700 onRequestFormEvent Subscriber====>");
                subscriberOnReQuest = data;
                await commonEvent.subscribe(subscriberOnReQuest, onRequestCallBack);
            });
 
            console.log(`FMS_hostRefresh_0700 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.form.formsystemtestservicea.hmservice",
                        "ability" : "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefresh_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_hostRefresh_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_hostRefresh_0700 featureAbility.startAbility end`);
        });
    });
}
