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

var onErrorForm_Event = {
    events: ["FMS_FormOnError_commonEvent"],
};
var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
var subscriberFormCastEvent = {
    events: ["FMS_FormCast_commonEvent"],
};
var onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

var deleteForm_Event = "FMS_FormDelete_commonEvent";

export default function test() {
    describe(`FmsAcquiredFormTest`, () => {

        /**
         * @tc.number: FMS_acquireForm_0200
         * @tc.name: The form host does not have permission to use the form
         * @tc.desc: Failed to create a form when verifying that the form host does not have form permission.
         */
        it(`FMS_acquireForm_0200`, 0, async (done) => {
            console.info(`FMS_acquireForm_0200 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_0200 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("check permission deny, need to request ohos.permission.REQUIRE_FORM.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_0200 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_0200 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_0200 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_0200 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_0300
         * @tc.name: Failed to add form when parameter formId is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (formId) of creating form is wrong.
         */
        it(`FMS_acquireForm_0300`, 0, async (done) => {
            console.info(`FMS_acquireForm_0300 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_0300 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_0300 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_0300 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_0300 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_0300 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_acquireForm_0400
        * @tc.name: Failed to add form when parameter bundlename is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (bundlename) of form creation.
        */
        it(`FMS_acquireForm_0400`, 0, async (done) => {
            console.info(`FMS_acquireForm_0400 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_0400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_0400 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_0400 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_0400 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice123",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_0400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_0500
         * @tc.name: Failed to add form when parameter moduleName is wrong.
         * @tc.desc: Form creation failed when verifying the wrong parameter (moduleName) of form creation.
         */
        it(`FMS_acquireForm_0500`, 0, async (done) => {
            console.info(`FMS_acquireForm_0500 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_0500 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_0500 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_0500 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_0500 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry123",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_0500 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_acquireForm_0600
        * @tc.name: Failed to add form when parameter formName is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (formName) of form creation.
        */
        it(`FMS_acquireForm_0600`, 0, async (done) => {
            console.info(`FMS_acquireForm_0600 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_0600 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_0600 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_0600 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_0600 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001987",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_0600 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_acquireForm_0700
        * @tc.name: Failed to add form when parameter abilityName is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (abilityName) of form creation.
        */
        it(`FMS_acquireForm_0700`, 0, async (done) => {
            console.info(`FMS_acquireForm_0700 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_0700 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_0700 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_0700 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_0700 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_0700 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility123",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_0700 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_acquireForm_1000
        * @tc.name: Failed to add form when parameter form dimension is wrong.
        * @tc.desc: Form creation failed when verifying the wrong parameter (form dimension) of form creation.
        */
        it(`FMS_acquireForm_1000`, 0, async (done) => {
            console.info(`FMS_acquireForm_1000 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_1000 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_1000 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_1000 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_1000 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_1000 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "-1",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "dimension": 4,
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1000 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_acquireForm_1100
        * @tc.name: When the formId is set to 0, a non cached form is added.
        * @tc.desc: Verify that the non cache form can be successfully created.
        */
        it(`FMS_acquireForm_1100`, 0, async (done) => {
            console.info(`FMS_acquireForm_1100 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formId1;
            let formId2;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_1100 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1100 delPublishCallBack end');
                    console.info(`FMS_acquireForm_1100 end`);
                    done();
                }, 1000);
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_1100 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback);
                formId1 = data.data;

                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_1100 unSubscribeOnAcquiredCallback CallBack====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_1100 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1100 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    let retData = JSON.parse(data.parameters.parameters);

                    let bundleName = retData.bundleName;
                    expect(bundleName).assertEqual("com.form.formsystemtestservicea.hmservice");
                    let abilityName = retData.abilityName;
                    expect(abilityName).assertEqual("com.form.formsystemtestservicea.hmservice.FormAbility");
                    let moduleName = retData.parameters['ohos.extra.param.key.module_name'];
                    expect(moduleName).assertEqual("entry");
                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    let formDimension = retData.parameters['ohos.extra.param.key.form_dimension'];
                    expect(formDimension).assertEqual(1);
                    let tempFormFlag = retData.parameters['ohos.extra.param.key.form_temporary'];
                    expect(tempFormFlag).assertEqual(false);

                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];

                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }
            function unSubscribeSupplyCallback() {
                console.info("====>FMS_acquireForm_1100 unSubscribeSupplyCallback====>");
            }
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_1100 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.info(`FMS_acquireForm_1100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1100 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_acquireForm_1200
        * @tc.name: When the formId is set to 0, a non cached form is added.
        * @tc.desc: Verify that the non cache form can be successfully created.
        */
        it(`FMS_acquireForm_1200`, 0, async (done) => {
            console.info(`FMS_acquireForm_1200 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formId1;
            let formId2;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_1200 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1200 delPublishCallBack end');
                    console.info(`FMS_acquireForm_1200 end`);
                    done();
                }, 1000);
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_1200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId1 = data.data;
                console.info("!!!====>FMS_acquireForm_1200 onAcquiredCallBack formId1:====>" + formId1);
                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_1200 OnAcquired UnSubscribe CallBack====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_1200 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1200 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    let retData = JSON.parse(data.parameters.parameters);

                    let bundleName = retData.bundleName;
                    expect(bundleName).assertEqual("com.form.formsystemtestservicee.hmservice");
                    let abilityName = retData.abilityName;
                    expect(abilityName).assertEqual("com.form.formsystemtestservicee.hmservice.FormAbility");
                    let moduleName = retData.parameters['ohos.extra.param.key.module_name'];
                    expect(moduleName).assertEqual("entry");
                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    let formDimension = retData.parameters['ohos.extra.param.key.form_dimension'];
                    expect(formDimension).assertEqual(1);
                    let tempFormFlag = retData.parameters['ohos.extra.param.key.form_temporary'];
                    expect(tempFormFlag).assertEqual(false);

                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];
                    console.info("!!!====>FMS_acquireForm_1200 onAcquiredCallBack formId2:====>" + formId2);
                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }
            function unSubscribeSupplyCallback() {
                console.info("====>FMS_acquireForm_1200 unSubscribeSupplyCallback====>");
            }
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_1200 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.info(`FMS_acquireForm_1200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostb",
                    abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicee.hmservice",
                        "ability": "com.form.formsystemtestservicee.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1200 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_acquireForm_1400
        * @tc.name: FormId does not match other parameters when adding a cached form.
        * @tc.desc: Failed to create a cached form when verifying that FormId does not match other parameters.
        */
        it(`FMS_acquireForm_1400`, 0, async (done) => {
            console.info(`FMS_acquireForm_1400 start`);
            var subscriberOnAcquired;
            var subscriberOnError;
            var formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_1400 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1400 delPublishCallBack end');
                    console.info(`FMS_acquireForm_1400 end`);
                    done();
                }, 1000)
            }
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_1400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("the requested form id is not existed on fms.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallBackCache);
                var commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnErrorCallBackCache() {
                console.info("====>FMS_acquireForm_1400 unSubscribeOnErrorCallBackCache CallBack====>");
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_1400 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                // add cache form
                commonEvent.createSubscriber(onErrorForm_Event).then(async (data1) => {
                    console.info("====>FMS_acquireForm_1400 onErrorForm_Event Subscriber====>");
                    subscriberOnError = data1;
                    await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
                });
                console.info(`FMS_acquireForm_1400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "1",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_1400 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_1400 unSubscribeOnAcquiredCallback====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_1400 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            console.info(`FMS_acquireForm_1400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1400 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_acquireForm_1500
        * @tc.name: Add a cached form.
        * @tc.desc: Verify that the cached form can be successfully created.
        */
        it(`FMS_acquireForm_1500`, 0, async (done) => {
            console.info(`FMS_acquireForm_1500 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formId1;
            let formId2;
            let onCreateCount = 0;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_1500 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1500 delPublishCallBack end');
                    console.info(`FMS_acquireForm_1500 end`);
                    done();
                }, 1000)
            }
            function onAcquiredCallBackCache(err, data) {
                console.info("!!!====>FMS_acquireForm_1500 onAcquiredCallBackCache data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBackCache);
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                formId2 = data.data;
                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnAcquiredCallBackCache() {
                console.info("====>FMS_acquireForm_1500 OnAcquired Cache UnSubscribe CallBack====>");
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_1500 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId1 = data.data;
                // add cache form
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data1) => {
                    console.info("====>FMS_acquireForm_1500 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data1;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackCache);
                });
                console.info(`FMS_acquireForm_1500 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": formId1,
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_1500 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_1500 OnAcquired UnSubscribe CallBack====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_1500 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1500 onSupplyCallBack====>" + JSON.stringify(data));
                    onCreateCount++;
                    if (onCreateCount == 2) {
                        commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback)
                    }
                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }
            function unSubscribeSupplyCallback() {
                console.info("====>FMS_acquireForm_1500 unSubscribeSupplyCallback====>");
            }

            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_1500 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.info(`FMS_acquireForm_1500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_1500 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_1600
         * @tc.name: A single form host (using a single thread) continuously creates 2 normal and 2 temporary forms.
         * @tc.desc: Verify that a single host (using a single thread) can successfully create multiple normal
         *           and temporary forms continuously.
         */
        it(`FMS_acquireForm_1600`, 0, async (done) => {
            console.info(`FMS_acquireForm_1600 start`);

            var subscriberOnAcquired;

            function delPublishCallBack_Normal1() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Normal1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Normal1 end');
                    FMS_acquireForm_1600_normal2();
                }, 50);
            }
            function onAcquiredCallBack_Normal1(err, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal1);
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }

            function FMS_acquireForm_1600_normal1() {
                console.info(`FMS_acquireForm_1600_normal1 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1600_normal1 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                });

                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1600_normal1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_normal1 end`);
            }

            function delPublishCallBack_Normal2() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Normal2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Normal2 end');
                    FMS_acquireForm_1600_Temp1();
                }, 50);
            }
            function onAcquiredCallBack_Normal2(err, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal2);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            function FMS_acquireForm_1600_normal2() {
                console.info(`FMS_acquireForm_1600_normal2 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1600_normal2 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                });

                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1600_normal2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_normal2 end`);
            }

            function delPublishCallBack_Temp1() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Temp1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Temp1 end');
                    FMS_acquireForm_1600_Temp2();
                }, 50);
            }
            function onAcquiredCallBack_Temp1(err, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Temp1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp1);
            }
            function unSubscribeOnAcquiredCallBack_Temp1() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Temp1====>");
            }

            function FMS_acquireForm_1600_Temp1() {
                console.info(`FMS_acquireForm_1600_Temp1 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1600_Temp1 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp1);
                });

                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1600_Temp1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_Temp1 end`);
            }

            function delPublishCallBack_Temp2() {
                console.info("!!!====>FMS_acquireForm_1600 delPublishCallBack_Temp2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1600 delPublishCallBack_Temp2 end');
                    console.info(`FMS_acquireForm_1600 end`);
                    done();
                }, 500);
            }
            function onAcquiredCallBack_Temp2(err, data) {
                console.info("!!!====>FMS_acquireForm_1600 onAcquiredCallBack_Temp2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp2);
            }
            function unSubscribeOnAcquiredCallBack_Temp2() {
                console.info("====>FMS_acquireForm_1600 unSubscribeOnAcquiredCallBack_Temp2====>");
            }

            function FMS_acquireForm_1600_Temp2() {
                console.info(`FMS_acquireForm_1600_Temp2 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1600_Temp2 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp2);
                });

                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1600_Temp2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1600_Temp2 end`);
            }

            FMS_acquireForm_1600_normal1();
        });
        /**
         * @tc.number: FMS_acquireForm_1800
         * @tc.name: Multiple form hosts create one normal form and one temporary form respectively.
         * @tc.desc: Verify that multiple hosts can successfully create multiple normal and temporary forms respectively.
         */
        it(`FMS_acquireForm_1800`, 0, async (done) => {
            console.info(`FMS_acquireForm_1800 start`);

            var subscriberOnAcquired;

            function delPublishCallBack_Normal1() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Normal1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Normal1 end');
                    FMS_acquireForm_1800_normal2();
                }, 50);
            }
            function onAcquiredCallBack_Normal1(err, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal1);
            }
            function unSubscribeOnAcquiredCallBack_Normal1() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Normal1 CallBack====>");
            }

            function FMS_acquireForm_1800_normal1() {
                console.info(`FMS_acquireForm_1800_normal1 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1800_normal1 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal1);
                });

                console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_normal1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_normal1 end`);
            }

            function delPublishCallBack_Normal2() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Normal2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Normal2 end');
                    FMS_acquireForm_1800_Temp1();
                }, 50);
            }
            function onAcquiredCallBack_Normal2(err, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Normal2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Normal2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostb",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Normal2);
            }
            function unSubscribeOnAcquiredCallBack_Normal2() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Normal2====>");
            }
            function FMS_acquireForm_1800_normal2() {
                console.info(`FMS_acquireForm_1800_normal2 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1800_normal2 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Normal2);
                });

                console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_normal2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_normal2 end`);
            }

            function delPublishCallBack_Temp1() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Temp1====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Temp1 end');
                    FMS_acquireForm_1800_Temp2();
                }, 50);
            }
            function onAcquiredCallBack_Temp1(err, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp1 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp1)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhost",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp1);
            }
            function unSubscribeOnAcquiredCallBack_Temp1() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Temp1====>");
            }

            function FMS_acquireForm_1800_Temp1() {
                console.info(`FMS_acquireForm_1800_Temp1 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1800_Temp1 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp1);
                });

                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_Temp1 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_Temp1 end`);
            }

            function delPublishCallBack_Temp2() {
                console.info("!!!====>FMS_acquireForm_1800 delPublishCallBack_Temp2====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1800 delPublishCallBack_Temp2 end');
                    console.info(`FMS_acquireForm_1800 end`);
                    done();
                }, 500);
            }
            function onAcquiredCallBack_Temp2(err, data) {
                console.info("!!!====>FMS_acquireForm_1800 onAcquiredCallBack_Temp2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack_Temp2)
                var commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostb",
                    data: data.data
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack_Temp2);
            }
            function unSubscribeOnAcquiredCallBack_Temp2() {
                console.info("====>FMS_acquireForm_1800 unSubscribeOnAcquiredCallBack_Temp2====>");
            }

            function FMS_acquireForm_1800_Temp2() {
                console.info(`FMS_acquireForm_1800_Temp2 start`);
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_1800_Temp2 Create OnAcquired Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack_Temp2);
                });

                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",

                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });

                console.info(`FMS_acquireForm_1800_Temp2 featureAbility.startAbility end`);
                console.info(`FMS_acquireForm_1800_Temp2 end`);
            }

            FMS_acquireForm_1800_normal1();
        });
        /**
         * @tc.number: FMS_acquireForm_1900
         * @tc.name: Add a temporary form when the formId is set to 0.
         * @tc.desc: When the verification formId is set to 0, the temporary form is created successfully.
         */
        it(`FMS_acquireForm_1900`, 0, async (done) => {
            console.info(`FMS_acquireForm_1900 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formId1;
            let formId2;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_1900 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_1900 delPublishCallBack end');
                    console.info(`FMS_acquireForm_1900 end`);
                    done();
                }, 500);
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_1900 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack)
                formId1 = data.data;

                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnAcquiredCallBack() {
                console.info("====>FMS_acquireForm_1900 unSubscribeOnAcquiredCallBack====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_1900 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_1900 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    let retData = JSON.parse(data.parameters.parameters);

                    let bundleName = retData.bundleName;
                    expect(bundleName).assertEqual("com.form.formsystemtestservicea.hmservice");
                    let abilityName = retData.abilityName;
                    expect(abilityName).assertEqual("com.form.formsystemtestservicea.hmservice.FormAbility");
                    let moduleName = retData.parameters['ohos.extra.param.key.module_name'];
                    expect(moduleName).assertEqual("entry");
                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    let formDimension = retData.parameters['ohos.extra.param.key.form_dimension'];
                    expect(formDimension).assertEqual(1);
                    let tempFormFlag = retData.parameters['ohos.extra.param.key.form_temporary'];
                    expect(tempFormFlag).assertEqual(true);
                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];
                    console.info("!!!====>FMS_acquireForm_1900 onAcquiredCallBack formId2:====>" + formId2);
                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }
            function unSubscribeSupplyCallback() {
                console.info("====>FMS_acquireForm_1900 unSubscribeSupplyCallback====>");
            }

            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_1900 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });

            console.info(`FMS_acquireForm_1900 featureAbility.startAbility start`);
            featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_1900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_1900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });

            console.info(`FMS_acquireForm_1900 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2100
         * @tc.name: When creating a temporary form, the formId is specified as the created normal formId.
         * @tc.desc: Failed to create a temporary form when verifying that the formId is set to create a normal formId.
         */
        it(`FMS_acquireForm_2100`, 0, async (done) => {
            console.info(`FMS_acquireForm_2100 start`);
            var subscriberOnAcquired;
            var subscriberOnError;
            var formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_2100 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_2100 delPublishCallBack end');
                    console.info(`FMS_acquireForm_2100 end`);
                    done();
                }, 1000)
            }
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2100 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallBackCache);
                var commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnErrorCallBackCache() {
                console.info("====>FMS_acquireForm_2100 unSubscribeOnErrorCallBackCache CallBack====>");
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2100 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                // add cache form
                commonEvent.createSubscriber(onErrorForm_Event).then(async (data1) => {
                    console.info("====>FMS_acquireForm_2100 onErrorForm_Event Subscriber====>");
                    subscriberOnError = data1;
                    await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
                });
                console.info(`FMS_acquireForm_2100 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": data.data,
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_2100 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_2100 unSubscribeOnAcquiredCallback====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_2100 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            console.info(`FMS_acquireForm_2100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2200
         * @tc.name: Cast to normal form when the temporary formId is set to negative.
         * @tc.desc: Failed to Cast to normal form when the temporary formId is set to negative
         */
        it(`FMS_acquireForm_2200`, 0, async (done) => {
            console.info(`FMS_acquireForm_2200 start`);
            var subscriberCast;
            var subscriberOnError;
            var formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_2200 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_2200 delPublishCallBack end');
                    console.info(`FMS_acquireForm_2200 end`);
                    done();
                }, 1000)
            }

            function onCastCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2200 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, unSubscribeOnCastCallback)
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnCastCallback() {
                console.info("====>FMS_acquireForm_2200 unSubscribeOnCastCallback====>");
            }

            commonEvent.createSubscriber(subscriberFormCastEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_2200 subscriberFormCastEvent Subscriber====>");
                subscriberCast = data;
                await commonEvent.subscribe(subscriberCast, onCastCallBack);
            });

            console.info(`FMS_acquireForm_2200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "-1",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2200 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2300
         * @tc.name: Cast to normal form when the temporary formIdis set to 0.
         * @tc.desc: Failed to convert to normal form when verifying that the temporary formIdis set to 0
         */
        it(`FMS_acquireForm_2300`, 0, async (done) => {
            console.info(`FMS_acquireForm_2300 start`);
            var subscriberCast;
            var formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_2300 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_2300 delPublishCallBack end');
                    console.info(`FMS_acquireForm_2300 end`);
                    done();
                }, 1000)
            }

            function onCastCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2300 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, unSubscribeOnCastCallback)
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnCastCallback() {
                console.info("====>FMS_acquireForm_2300 unSubscribeOnCastCallback====>");
            }

            commonEvent.createSubscriber(subscriberFormCastEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_2300 subscriberFormCastEvent Subscriber====>");
                subscriberCast = data;
                await commonEvent.subscribe(subscriberCast, onCastCallBack);
            });

            console.info(`FMS_acquireForm_2300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "0",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2300 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2400
         * @tc.name: Non affiliated temporary form ID to normal form.
         * @tc.desc: Failed to convert non affiliated temporary form ID to normal form.
         */
        it(`FMS_acquireForm_2400`, 0, async (done) => {
            console.info(`FMS_acquireForm_2400 start`);
            var subscriberOnAcquired;
            var subscriberCast;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_2400 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_2400 delPublishCallBack end');
                    console.info(`FMS_acquireForm_2400 end`);
                    done();
                }, 1000)
            }

            function onCastCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2400 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, unSubscribeOnCastCallback)
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnCastCallback() {
                console.info("====>FMS_acquireForm_2400 unSubscribeOnCastCallback====>");
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2400 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)

                commonEvent.createSubscriber(subscriberFormCastEvent).then(async (data) => {
                    console.info("====>FMS_acquireForm_2400 subscriberFormCastEvent Subscriber====>");
                    subscriberCast = data;
                    await commonEvent.subscribe(subscriberCast, onCastCallBack);
                });

                console.info(`FMS_acquireForm_2400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostb",
                        abilityName: "com.ohos.st.formsystemhostb.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "temporaryId": data.data,
                            "castForm": true,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_2400 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_2400 OnAcquired UnSubscribe CallBack====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_2400 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            console.info(`FMS_acquireForm_2400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2400 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2500
         * @tc.name: cast non-existent temporary formId to normal form.
         * @tc.desc: Failed to verify that the temporary formId that does not exist is casted to normal form.
         */
        it(`FMS_acquireForm_2500`, 0, async (done) => {
            console.info(`FMS_acquireForm_2500 start`);
            var subscriberCast;
            var formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_2500 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_2500 delPublishCallBack end');
                    console.info(`FMS_acquireForm_2500 end`);
                    done();
                }, 1000)
            }

            function onCastCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2500 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberCast, unSubscribeOnCastCallback)
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnCastCallback() {
                console.info("====>FMS_acquireForm_2500 unSubscribeOnCastCallback====>");
            }

            commonEvent.createSubscriber(subscriberFormCastEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_2500 subscriberFormCastEvent Subscriber====>");
                subscriberCast = data;
                await commonEvent.subscribe(subscriberCast, onCastCallBack);
            });

            console.info(`FMS_acquireForm_2500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "temporaryId": "123456789",
                        "castForm": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2500 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_2600
         * @tc.name: When the normal form does not reach the maximum value created by the form, the temporary form changes to the normal form.
         * @tc.desc: Verify that when the normal form does not reach the maximum value created by the form.
         *           the temporary form can be successfully casted to the normal form.
         */
        it(`FMS_acquireForm_2600`, 0, async (done) => {
            console.info(`FMS_acquireForm_2600 start`);
            let subscriberOnAcquired;
            let subscriberCast;
            let subscriberSupply;
            let formId1;
            let formId2;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_2600 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_2600 delPublishCallBack end');
                    console.info(`FMS_acquireForm_2600 end`);
                    done();
                }, 1000)
            }

            function onCastCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2600 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberCast, unSubscribeOnCastCallback)
                formId1 = data.parameters.formId;
                if (formId1 && formId2) {
                    expect(formId1).assertEqual(formId2);
                    let commonEventPublishData = {
                        data: formId1
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnCastCallback() {
                console.info("====>FMS_acquireForm_2600 unSubscribeOnCastCallback====>");
            }

            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_2600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)

                console.info(`FMS_acquireForm_2600 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhost",
                        abilityName: "com.ohos.st.formsystemhost.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "temporaryId": data.data,
                            "castForm": true,
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_2600 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_2600 OnAcquired UnSubscribe CallBack====>");
            }

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onCastToNormal") {
                    console.info("====>FMS_acquireForm_2600 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    formId2 = data.parameters.parameters;

                    if (formId1 && formId2) {
                        expect(formId1).assertEqual(formId2);
                        let commonEventPublishData = {
                            data: formId1
                        };
                        commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                    }
                }
            }
            function unSubscribeSupplyCallback() {
                console.info("====>FMS_acquireForm_2600 unSubscribeSupplyCallback====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_2600 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(subscriberFormCastEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_2600 subscriberFormCastEvent Subscriber====>");
                subscriberCast = data;
                await commonEvent.subscribe(subscriberCast, onCastCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_2600 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });

            console.info(`FMS_acquireForm_2600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": true,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_2600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_2600 featureAbility.startAbility end`);
        });
    });
}
