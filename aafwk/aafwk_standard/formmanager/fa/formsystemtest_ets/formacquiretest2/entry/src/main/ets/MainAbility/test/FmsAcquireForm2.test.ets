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
    describe(`FmsAcquiredFormTest2`, () => {

        /**
         * @tc.number: FMS_acquireForm_3800
         * @tc.name: Failed to add form when parameter ability is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (formId) of creating form is wrong.
         */
        it(`FMS_acquireForm_3800`, 0, async (done) => {
            console.info(`FMS_acquireForm_3800 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_3800 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_3800 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_3800 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_3800 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_3800 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_3800 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_3800 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_3800 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_acquireForm_3900
         * @tc.name: Failed to add form when parameter bundleName is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (bundleName) of creating form is wrong.
         */
        it(`FMS_acquireForm_3900`, 0, async (done) => {
            console.info(`FMS_acquireForm_3900 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_3900 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_3900 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_3900 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_3900 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_3900 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_3900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_3900 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4000
         * @tc.name: When the form specifications are inconsistent, creating the cached form fails.
         * @tc.desc: Return failed.
         */
        it(`FMS_acquireForm_4000`, 0, async (done) => {
            console.info(`FMS_acquireForm_4000 start`);
            var subscriberOnAcquired;
            var subscriberOnError;
            var formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_4000 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_4000 delPublishCallBack end');
                    console.info(`FMS_acquireForm_4000 end`);
                    done();
                }, 1000)
            }
            function unSubscribeOnErrorCallback() {
                console.info("!!!====>FMS_acquireForm_4000 unSubscribeOnErrorCallback====>");
            }
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4000 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                expect(data.data).assertEqual("the form id and form config are not matched.");

                console.info(`FMS_acquireForm_4000 end`);
                var commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4000 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;

                commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                    console.info("====>FMS_acquireForm_4000 onErrorForm_Event Subscriber====>");
                    subscriberOnError = data;
                    await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
                });

                console.info(`FMS_acquireForm_4000 featureAbility.startAbility again start`);
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
                            "dimension": "2",
                            "temporary": false,
                            "isCreate": true
                        }
                    }
                }).then((res: any) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_4000 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_4000 OnAcquired UnSubscribe CallBack====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_4000 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            console.info(`FMS_acquireForm_4000 featureAbility.startAbility start`);
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
                        "dimension": "1",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_4000 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4100
         * @tc.name: Failed to add form when parameter moduleName is wrong.
         * @tc.desc: Failed to create form when verifying that the parameter (moduleName) of creating form is wrong.
         */
        it(`FMS_acquireForm_4100`, 0, async (done) => {
            console.info(`FMS_acquireForm_4100 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4100 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                expect(data.data).assertEqual("invalid params received on operating form.");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                console.info(`FMS_acquireForm_4100 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_4100 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_4100 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_4100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostj",
                    abilityName: "com.ohos.st.formsystemhostj.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_4100 featureAbility.startAbility end`);
        });


        /**
         * @tc.number: FMS_acquireForm_4200
         * @tc.name: Success to add form when parameter formName is blank.
         * @tc.desc: Success to create form when verifying that the parameter (formName) of creating form is success.
         */
        it(`FMS_acquireForm_4200`, 0, async (done) => {
            console.info(`FMS_acquireForm_4200 start`);
            let subscriberOnAcquired;
            let subscriberSupply;
            let formId1;
            let formId2;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_4200 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_4200 delPublishCallBack end');
                    console.info(`FMS_acquireForm_4200 end`);
                    done();
                }, 500);
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4200 onAcquiredCallBack data:====>" + JSON.stringify(data));
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
                console.info("====>FMS_acquireForm_4200 unSubscribeOnAcquiredCallBack====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_4200 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onCreate") {
                    console.info("====>FMS_acquireForm_4200 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    let retData = JSON.parse(data.parameters.parameters);

                    let formName = retData.parameters['ohos.extra.param.key.form_name'];
                    expect(formName).assertEqual("Form_Js001");
                    formId2 = retData.parameters['ohos.extra.param.key.form_identity'];
                    console.info("!!!====>FMS_acquireForm_4200 onAcquiredCallBack formId2:====>" + formId2);
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
                console.info("====>FMS_acquireForm_4200 unSubscribeSupplyCallback====>");
            }

            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.info("====>FMS_acquireForm_4200 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });

            console.info(`FMS_acquireForm_4200 featureAbility.startAbility start`);
            featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhost",
                    abilityName: "com.ohos.st.formsystemhost.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });

            console.info(`FMS_acquireForm_4200 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4300
         * @tc.name: Success to add form when parameter dimension is passed.
         * @tc.desc: Success to create form when verifying that the parameter (dimension) of creating form.
         */
        it(`FMS_acquireForm_4300`, 0, async (done) => {
            console.info(`FMS_acquireForm_4300 start`);
            let subscriberOnAcquired;
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallBack);
                console.info(`FMS_acquireForm_4300 end`);
                done();
            }
            function unSubscribeOnAcquiredCallBack() {
                console.info("====>FMS_acquireForm_4300 unSubscribeOnAcquiredCallBack CallBack====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_4300 onAcquiredForm_Event Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.info(`FMS_acquireForm_4300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhosti",
                    abilityName: "com.ohos.st.formsystemhosti.MainAbility",
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
                console.info(`FMS_acquireForm_4300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_4300 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4400
         * @tc.name: Failed to add form when parameter dimension is not exist.
         * @tc.desc: Failed to create form when verifying that the parameter (dimension) of creating form is wrong.
         */
        it(`FMS_acquireForm_4400`, 0, async (done) => {
            console.info(`FMS_acquireForm_4400 start`);
            var subscriberOnError;
            function onErrorCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4400 onErrorCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnError_commonEvent");
                commonEvent.unsubscribe(subscriberOnError, unSubscribeOnErrorCallback);
                expect(data.data).assertEqual("the dimension not exist in the form.");

                console.info(`FMS_acquireForm_4400 end`);
                done();
            }
            function unSubscribeOnErrorCallback() {
                console.info("====>FMS_acquireForm_4400 unSubscribeOnErrorCallback CallBack====>");
            }
            commonEvent.createSubscriber(onErrorForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_4400 onErrorForm_Event Subscriber====>");
                subscriberOnError = data;
                await commonEvent.subscribe(subscriberOnError, onErrorCallBack);
            });
            console.info(`FMS_acquireForm_4400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhosti",
                    abilityName: "com.ohos.st.formsystemhosti.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.FormAbility",
                        "moduleName": "entry",
                        "dimension": "6",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.info(`FMS_acquireForm_4400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_4400 featureAbility.startAbility end`);
        });

        /**
         * @tc.number: FMS_acquireForm_4900
         * @tc.name: Cast temp form when the formId is created formId.
         * @tc.desc: When the verification formId is set to 0, the form is created failed.
         */
        it(`FMS_acquireForm_4900`, 0, async (done) => {
            console.info(`FMS_acquireForm_4900 start`);
            var subscriberOnAcquired;
            var subscriberCast;

            function delPublishCallBack() {
                console.info("!!!====>FMS_acquireForm_4900 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_acquireForm_4900 delPublishCallBack end');
                    console.info(`FMS_acquireForm_4900 end`);
                    done();
                }, 1000)
            }

            function onCastCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4900 onCastCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormCast_commonEvent");
                expect(data.data).assertEqual("9");
                commonEvent.unsubscribe(subscriberCast, unSubscribeOnCastCallback)
                var commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnCastCallback() {
                console.info("====>FMS_acquireForm_4900 unSubscribeOnCastCallback====>");
            }
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_acquireForm_4900 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)

                commonEvent.createSubscriber(subscriberFormCastEvent).then(async (data) => {
                    console.info("====>FMS_acquireForm_4900 subscriberFormCastEvent Subscriber====>");
                    subscriberCast = data;
                    await commonEvent.subscribe(subscriberCast, onCastCallBack);
                });

                console.info(`FMS_acquireForm_4900 featureAbility.startAbility again start`);
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
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.info(`FMS_acquireForm_4900 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.info("====>FMS_acquireForm_4900 OnAcquired UnSubscribe CallBack====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.info("====>FMS_acquireForm_4900 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });

            console.info(`FMS_acquireForm_4900 featureAbility.startAbility start`);
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
                console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.info(`FMS_acquireForm_4900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.info(`FMS_acquireForm_4900 featureAbility.startAbility end`);
        });

    });
}
