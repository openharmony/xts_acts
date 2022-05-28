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

var onDetetedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};

var onRefreshFormEvent = {
    events: ["FMS_FormDynamicRefresh_commonEvent"],
};

var onSupplyEvent = {
    events: ["FMS_FormSupply_commonEvent"],
};

var deleteForm_Event = "FMS_FormDelete_commonEvent";

export default function test() {
    describe(`FmsTimeRefreshFormTest`, () => {

        /**
         * @tc.number: FMS_timedRefresh_0100
         * @tc.name: formID id is error(formID < 0)
         * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
         *           2.Verify the result of the dynamic timed refresh interface.
         */
        it(`FMS_timedRefresh_0100`, 0, async (done) => {
            console.log(`FMS_timedRefresh_0100 start`);
            let subscriberOnRefresh;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_timedRefresh_0100 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_timedRefresh_0100 delPublishCallBack end');
                    console.log(`FMS_timedRefresh_0100 end`);
                    done();
                }, 1000)
            }

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0100 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormDynamicRefresh_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_timedRefresh_0100 unSubscribeOnRefreshCallback CallBack====>");
            }

            commonEvent.createSubscriber(onRefreshFormEvent).then(async (data) => {
                console.debug("====>FMS_timedRefresh_0100 onRefreshFormEvent Subscriber====>");
                subscriberOnRefresh = data;
                await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            });
            console.log(`FMS_timedRefresh_0100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "refreshForm": true,
                        "refreshId": "-1",
                        "refreshTime": 5,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_timedRefresh_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_timedRefresh_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_timedRefresh_0100 featureAbility.startAbility end`);
        });
        /**
         * @tc.number: FMS_timedRefresh_0200
         * @tc.name: formID id is error(formID == 0)
         * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
         *           2.Verify the result of the dynamic timed refresh interface.
         */
        it(`FMS_timedRefresh_0200`, 0, async (done) => {
            console.log(`FMS_timedRefresh_0200 start`);
            let subscriberOnRefresh;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_timedRefresh_0200 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_timedRefresh_0200 delPublishCallBack end');
                    console.log(`FMS_timedRefresh_0200 end`);
                    done();
                }, 1000)
            }

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0200 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormDynamicRefresh_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_timedRefresh_0200 unSubscribeOnRefreshCallback CallBack====>");
            }

            commonEvent.createSubscriber(onRefreshFormEvent).then(async (data) => {
                console.debug("====>FMS_timedRefresh_0200 onRefreshFormEvent Subscriber====>");
                subscriberOnRefresh = data;
                await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            });
            console.log(`FMS_timedRefresh_0200 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "refreshForm": true,
                        "refreshId": "0",
                        "refreshTime": 5,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_timedRefresh_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_timedRefresh_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_timedRefresh_0200 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0300
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.The form provider B to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0300`, 0, async (done) => {
            console.log(`FMS_timedRefresh_0300 start`);
            let subscriberOnRefresh;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_timedRefresh_0300 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_timedRefresh_0300 delPublishCallBack end');
                    console.log(`FMS_timedRefresh_0300 end`);
                    done();
                }, 1000)
            }

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0300 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormDynamicRefresh_commonEvent");
                expect(data.data).assertEqual("13");
                commonEvent.unsubscribe(subscriberOnRefresh, unsubscribeOnRefreshCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unsubscribeOnRefreshCallback() {
                console.debug("====>FMS_timedRefresh_0300 unsubscribeOnRefreshCallback====>");
            }

            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0300 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onRefreshFormEvent).then(async (data) => {
                    console.debug("====>FMS_timedRefresh_0300 onRefreshFormEvent Subscriber====>");
                    subscriberOnRefresh = data;
                    await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
                });

                console.log(`FMS_timedRefresh_0300 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "refreshForm": true,
                            "refreshId": formId,
                            "refreshTime": 5,
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_timedRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_timedRefresh_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_timedRefresh_0300 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_timedRefresh_0300 OnAcquired UnSubscribe CallBack====>");
            }

            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_timedRefresh_0300 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_timedRefresh_0300 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_timedRefresh_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_timedRefresh_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_timedRefresh_0300 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_timedRefresh_0400
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0400`, 0, async (done) => {
            console.log(`FMS_timedRefresh_0400 start`);
            let subscriberOnRefresh;
            let subscriberOnDeleted;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_timedRefresh_0400 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_timedRefresh_0400 delPublishCallBack end');
                    console.log(`FMS_timedRefresh_0400 end`);
                    done();
                }, 1000);
            }

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0400 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormDynamicRefresh_commonEvent");
                expect(data.data).assertEqual("9");
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_timedRefresh_0400 unSubscribeOnRefreshCallback CallBack====>");
            }

            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeDeletedCallback)
                formId = data.parameters.formId;
                commonEvent.createSubscriber(onRefreshFormEvent).then(async (data) => {
                    console.debug("====>FMS_timedRefresh_0400 B onRefreshFormEvent Subscriber====>");
                    subscriberOnRefresh = data;
                    await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
                });

                console.log(`FMS_timedRefresh_0400 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhoste",
                        abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                        parameters: {
                            "formId": "0",
                            "name": "Form_Js001",
                            "bundle": "com.form.formsystemtestservicea.hmservice",
                            "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
                            "moduleName": "entry",
                            "temporary": false,
                            "refreshForm": true,
                            "refreshId": formId,
                            "refreshTime": 5,
                            "isCreate": false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_timedRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_timedRefresh_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_timedRefresh_0400 featureAbility.startAbility again end`);
            }
            function unSubscribeDeletedCallback() {
                console.debug("====>FMS_timedRefresh_0400 unSubscribeDeletedCallback====>");
            }
            commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                console.debug("====>FMS_releaseForm_1400 onDetetedFormEvent Subscriber====>");
                subscriberOnDeleted = data;
                await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            });
            console.log(`FMS_timedRefresh_0400 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostf",
                    abilityName: "com.ohos.st.formsystemhostf.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "deleteForm": true,
                        "deleteId": "self",
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_timedRefresh_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_timedRefresh_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_timedRefresh_0400 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0500
        * @tc.name: Incorrect interval for the next refresh (time < 5)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0500`, 0, async (done) => {
            console.log(`FMS_timedRefresh_0500 start`);
            let subscriberOnRefresh;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_timedRefresh_0500 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_timedRefresh_0500 delPublishCallBack end');
                    console.log(`FMS_timedRefresh_0500 end`);
                    done();
                }, 1000)
            }

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0500 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormDynamicRefresh_commonEvent");
                expect(data.data).assertEqual("7");
                commonEvent.unsubscribe(subscriberOnRefresh, unSubscribeOnRefreshCallback)

                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_timedRefresh_0500 unSubscribeOnRefreshCallback CallBack====>");
            }

            commonEvent.createSubscriber(onRefreshFormEvent).then(async (data) => {
                console.debug("====>FMS_timedRefresh_0500 onRefreshFormEvent Subscriber====>");
                subscriberOnRefresh = data;
                await commonEvent.subscribe(subscriberOnRefresh, onRefreshCallBack);
            });
            console.log(`FMS_timedRefresh_0500 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicea.hmservice",
                        "ability": "com.form.formsystemtestservicea.hmservice.MainAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "refreshForm": true,
                        "refreshId": "self",
                        "refreshTime": 1,
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_timedRefresh_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_timedRefresh_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_timedRefresh_0500 featureAbility.startAbility end`);
        });

        /**
        * @tc.number: FMS_timedRefresh_0600
        * @tc.name: correct interval for the next refresh (time == 5)
        * @tc.desc: 1.The form provider A to invoke the dynamic timed refresh interface.
        *           2.Verify the result of the dynamic timed refresh interface.
        */
        it(`FMS_timedRefresh_0600`, 0, async (done) => {
            console.log(`FMS_timedRefresh_0600 start`);
            let formId;
            let subscriberSupply;

            function delPublishCallBack() {
                console.info("!!!====>FMS_timedRefresh_0600 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_timedRefresh_0600 delPublishCallBack end');
                    console.log(`FMS_timedRefresh_0600 end`);
                    done();
                }, 1000)
            }

            function onRefreshCallBack(err, data) {
                console.info("!!!====>FMS_timedRefresh_0600 onRefreshCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormSupply_commonEvent");
                if (data.parameters.kind == "onVisibilityChange") {
                    console.info("!!!====>FMS_timedRefresh_0600 onRefreshCallBack kind:====>" + data.parameters.kind);
                    console.info("!!!====>FMS_timedRefresh_0600 onRefreshCallBack error:====>" + data.parameters.errorData);
                    expect(data.parameters.errorData).assertEqual("0");
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeOnRefreshCallback)

                    let commonEventPublishData = {
                        data: data.parameters.formId
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
                }
            }
            function unSubscribeOnRefreshCallback() {
                console.debug("====>FMS_timedRefresh_0600 unSubscribeOnRefreshCallback CallBack====>");
            }

            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_timedRefresh_0600 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onRefreshCallBack);
            });
            console.log(`FMS_timedRefresh_0600 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhoste",
                    abilityName: "com.ohos.st.formsystemhoste.MainAbility",
                    parameters: {
                        "formId": "0",
                        "name": "Form_Js001",
                        "bundle": "com.form.formsystemtestservicec.hmservice",
                        "ability": "com.form.formsystemtestservicec.hmservice.MainAbility",
                        "moduleName": "entry",
                        "temporary": false,
                        "notifyVisibleForms": true,
                        "notifyVisibleId": "self",
                        "isCreate": true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_timedRefresh_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_timedRefresh_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_timedRefresh_0600 featureAbility.startAbility end`);
        });
    });
}
