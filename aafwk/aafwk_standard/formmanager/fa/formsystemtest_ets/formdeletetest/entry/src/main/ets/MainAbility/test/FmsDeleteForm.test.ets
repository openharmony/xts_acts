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
import { setTime } from '@ohos.systemTime';
import { beforeAll, describe, expect, it } from "deccjsunit/index.ets";

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
         * Set time
         *
         * @param hour hour of 24H clock
         * @param min minute
         * @param second second
         */
         const changeTime = async (hour, min, second) => {
            console.info(`FMS_deleteForm changeTime start`);
            const datetime = new Date();
            const year = datetime.getFullYear();
            const month = datetime.getMonth() + 1;
            const day = datetime.getDate();
            const formatTime = year + '-' + fill(month) + '-' + fill(day)
                + 'T' + fill(hour) + ':' + fill(min) + ':' + fill(second);
            const s = (new Date(formatTime)).getTime();
            console.log(`FMS_deleteForm changeTime formatTime: ${formatTime}`);
            console.log(`FMS_deleteForm changeTime s: ${s}`);

            try {
                await setTime(s);
                console.log(`FMS_deleteForm set time success: ${formatTime}`);
            } catch (error) {
                console.log(`FMS_deleteForm set time failure: ${error}`);
            }
            console.info(`FMS_deleteForm changeTime end`);
        }

        const fill = value => {
            return (value > 9 ? "" : "0") + value;
        }

        /**
         * @tc.number: FMS_deleteForm_0200
         * @tc.name: host does not have permission
         * @tc.desc: 1.delete the form that formID is 1
         *           2.Verify the result is false
         */
        it(`FMS_deleteForm_0200`, 0, async (done) => {
            console.log(`FMS_deleteForm_0200 start`);
            let subscriberOnDeleted;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0200 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_deleteForm_0200 delPublishCallBack end');
                    console.log(`FMS_deleteForm_0200 end`);
                    done();
                }, 1000)
            }

            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0200 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0200 unSubscribeOnDetetedCallback====>");
            }
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0200 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                    console.debug("====>FMS_deleteForm_0200 onDetetedFormEvent Subscriber====>");
                    subscriberOnDeleted = data;
                    await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
                });

                console.log(`FMS_deleteForm_0200 featureAbility.startAbility again start`);
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
                            "deleteForm" : true,
                            "deleteId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_0200 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_deleteForm_0200 OnAcquired UnSubscribe CallBack====>");
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_deleteForm_0200 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_deleteForm_0200 featureAbility.startAbility start`);
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
                console.log(`FMS_deleteForm_0200 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0200 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0200 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0300
        * @tc.name: formID id is error(formID < 0)
        * @tc.desc: 1.delete the form
        *           2.Verify the result is false
        */
        it(`FMS_deleteForm_0300`, 0, async (done) => {
            console.log(`FMS_deleteForm_0300 start`);
            let subscriberOnDeleted;
            let subscriberOnAcquired;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0300 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_deleteForm_0300 delPublishCallBack end');
                    console.log(`FMS_deleteForm_0300 end`);
                    done();
                }, 1000)
            }

            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0300 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0300 unSubscribeOnDetetedCallback CallBack====>");
            }
            commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_0300 onDetetedFormEvent Subscriber====>");
                subscriberOnDeleted = data;
                await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            });

            console.log(`FMS_deleteForm_0300 featureAbility.startAbility start`);
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
                        "deleteId" : "-1",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_deleteForm_0300 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0300 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0300 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0400
        * @tc.name: formID id is error(formID = 0)
        * @tc.desc: 1.delete the form
        *           2.Verify the result is false
        */
        it(`FMS_deleteForm_0400`, 0, async (done) => {
            console.log(`FMS_deleteForm_0400 start`);
            let subscriberOnDeleted;
            let subscriberOnAcquired;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0400 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_deleteForm_0400 delPublishCallBack end');
                    console.log(`FMS_deleteForm_0400 end`);
                    done();
                }, 1000)
            }

            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0400 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    data: data.parameters.formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0400 unSubscribeOnDetetedCallback CallBack====>");
            }
            commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_0400 onDetetedFormEvent Subscriber====>");
                subscriberOnDeleted = data;
                await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            });

            console.log(`FMS_deleteForm_0400 featureAbility.startAbility start`);
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
                        "deleteId" : "0",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_deleteForm_0400 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0400 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0400 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0500
        * @tc.name: formID id is error because formId is not self
        * @tc.desc: 1.host A create a formA
        *           2.host B delete the formA
        *           2.Verify the result is false
        */
        it(`FMS_deleteForm_0500`, 0, async (done) => {
            console.log(`FMS_deleteForm_0500 start`);
            let subscriberOnDeleted;
            let subscriberOnAcquired;
            let formId;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0500 delPublishCallBack====>");
                setTimeout(function () {                    
                    console.info('FMS_deleteForm_0500 delPublishCallBack end');
                    console.log(`FMS_deleteForm_0500 end`);
                    done();
                }, 1000)
            }

            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0500 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0500 unSubscribeOnDetetedCallback CallBack====>");
            }
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0500 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                    console.debug("====>FMS_deleteForm_0500 onDetetedFormEvent Subscriber====>");
                    subscriberOnDeleted = data;
                    await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
                });

                console.log(`FMS_deleteForm_0500 featureAbility.startAbility again start`);
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
                            "deleteForm" : true,
                            "deleteId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_0500 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_deleteForm_0500 OnAcquired UnSubscribe CallBack====>");
            }
            
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_deleteForm_0500 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            console.log(`FMS_deleteForm_0500 featureAbility.startAbility start`);
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
                console.log(`FMS_deleteForm_0500 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0500 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0500 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0600
        * @tc.name: Delete a normal form and the form reference is not 0 after deletion
        * @tc.desc: 1.host A create a normal formA
        *           2.host B create a form with formA's ID
        *           3.delete formA, and verify the result is true
        */
        it(`FMS_deleteForm_0600`, 0, async (done) => {
            console.log(`FMS_deleteForm_0600 start`);
            let subscriberOnDeleted;
            let subscriberOnAcquired;
            let formId;
            let subscriberSupply;
            let supplyFlag = false;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0600 delPublishCallBack====>");
                setTimeout(function () {       
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);            
                    if(supplyFlag) {
                        deleteFormB();
                        expect().assertFail();
                    } else {
                        deleteFormB();       
                    }
                    console.info('FMS_deleteForm_0600 delPublishCallBack end');
                }, 1000)
            }

            function delPublishCallBackB() {
                console.info("!!!====>FMS_deleteForm_0600 delPublishCallBackB====>");
                setTimeout(function () {
                    console.info('FMS_deleteForm_0600 delPublishCallBackB end');
                    console.log(`FMS_deleteForm_0600 end`);   
                    done();
                }, 500);
            }

            function deleteFormB() {
                console.info("!!!====>FMS_deleteForm_0600 deleteFormB start====>");
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostd",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBackB);
                console.info("!!!====>FMS_deleteForm_0600 deleteFormB end====>");
            }
            function onAcquiredCallBackB(err, data) {
                console.info("!!!====>FMS_deleteForm_0600 onAcquiredCallBackB data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                expect(data.data).assertEqual(formId);
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0600 unSubscribeOnDetetedCallback CallBack====>");
            }
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0600 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_deleteForm_0600 B onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackB);
                });

                console.log(`FMS_deleteForm_0600 featureAbility.startAbility again start`);
                featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            "formId" : formId,
                            "name" : "Form_Js001",
                            "bundle" : "com.form.formsystemtestservicea.hmservice",
                            "ability" : "com.form.formsystemtestservicea.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_0600 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_deleteForm_0600 OnAcquired UnSubscribe CallBack====>");
            }
            function onSupplyCallBack(err, data) {
                if(data.parameters.kind == "onDestroy") {
                    console.debug("====>FMS_deleteForm_0600 onSupplyCallBack====>" + JSON.stringify(data));
                    supplyFlag = true;
                }
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_deleteForm_0600 unSubscribeSupplyCallback====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_deleteForm_0600 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_0600 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_deleteForm_0600 featureAbility.startAbility start`);
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
                console.log(`FMS_deleteForm_0600 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0600 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0600 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0700
        * @tc.name: After deleting a normal form, the form reference is 0.
        *     After deleting a form, there are still created normal forms in FMS.
        * @tc.desc: 1.host A an host B create one normal card respectively
        *           2.host A delete the form and verify the result is true
        */
        it(`FMS_deleteForm_0700`, 0, async (done) => {
            console.log(`FMS_deleteForm_0700 start`);
            let subscriberOnDeleted;
            let subscriberOnAcquired;
            let formId;
            let formIdB;
            let subscriberSupply;
            let supplyFlag = false;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0700 delPublishCallBack====>");
                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    if(supplyFlag) {
                        deleteFormB();
                    } else {
                        deleteFormB();
                        expect().assertFail();
                    }
                    console.info('FMS_deleteForm_0700 delPublishCallBack end');
                }, 1000)
            }

            function delPublishCallBackB() {
                console.info("!!!====>FMS_deleteForm_0700 delPublishCallBackB====>");
                setTimeout(function () {
                    console.info('FMS_deleteForm_0700 delPublishCallBackB end');
                    console.log(`FMS_deleteForm_0700 end`);   
                    done();
                }, 1000);
            }

            function deleteFormB() {
                console.info("!!!====>FMS_deleteForm_0700 deleteFormB start====>");
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostd",
                    data: formIdB
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBackB);
                console.info("!!!====>FMS_deleteForm_0700 deleteFormB end====>");
            }
            function onAcquiredCallBackB(err, data) {
                console.info("!!!====>FMS_deleteForm_0700 onAcquiredCallBackB data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                formIdB = data.data;
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0700 unSubscribeOnDetetedCallback CallBack====>");
            }
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0700 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_deleteForm_0700 B onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackB);
                });

                console.log(`FMS_deleteForm_0700 featureAbility.startAbility again start`);
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
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_0700 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_deleteForm_0700 OnAcquired UnSubscribe CallBack====>");
            }
            function onSupplyCallBack(err, data) {
                if(data.parameters.kind == "onDestroy") {
                    console.debug("====>FMS_deleteForm_0700 onSupplyCallBack====>" + JSON.stringify(data));
                    expect(data.parameters.parameters).assertEqual(formId);
                    supplyFlag = true;
                }
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_deleteForm_0700 unSubscribeSupplyCallback====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_deleteForm_0700 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_0700 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_deleteForm_0700 featureAbility.startAbility start`);
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
                console.log(`FMS_deleteForm_0700 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0700 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0700 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0700_1
        * @tc.name: After deleting a normal form, the form reference is 0.
        *     After deleting a form, there are still created normal forms in FMS.
        * @tc.desc: 1.host A an host B create one normal card respectively
        *           2.host A delete the form and verify the result is true
        */
        it(`FMS_deleteForm_0700_1`, 0, async (done) => {
            console.log(`FMS_deleteForm_0700_1 start`);
            let subscriberOnAcquired;
            let formId;
            let formIdB;
            let subscriberSupply;
            let supplyFlag = false;
            let supplyFlagUpdate = false;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 900 }, () => {
                console.log(`FMS_deleteForm_0700_1 time speed up`);
            });
            await changeTime(10, 29, 55);
            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0700_1 delPublishCallBack====>");
                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    if(supplyFlag && supplyFlagUpdate) {
                        deleteFormB();
                    } else {
                        deleteFormB();
                        expect().assertFail();
                    }
                    console.info('FMS_deleteForm_0700_1 delPublishCallBack end');
                }, 5000)
            }

            function delPublishCallBackB() {
                console.info("!!!====>FMS_deleteForm_0700_1 delPublishCallBackB====>");
                setTimeout(function () {
                    console.info('FMS_deleteForm_0700_1 delPublishCallBackB end');
                    console.log(`FMS_deleteForm_0700_1 end`);
                    done();
                }, 1000);
            }

            function deleteFormB() {
                console.info("!!!====>FMS_deleteForm_0700_1 deleteFormB start====>");
                // timer speed reset
                commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                    console.log(`FMS_deleteForm_0700_1 time speed up`);
                });
                setTimeout(function () {
                    let commonEventPublishData = {
                        bundleName: "com.ohos.st.formsystemhostc",
                        data: formIdB
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBackB);
                    console.info("!!!====>FMS_deleteForm_0700_1 deleteFormB end====>");
                }, 1000)
            }
            function onAcquiredCallBackB(err, data) {
                console.info("!!!====>FMS_deleteForm_0700_1 onAcquiredCallBackB data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                formIdB = data.data;
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostd",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0700_1 unSubscribeOnDetetedCallback CallBack====>");
            }
            
            async function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0700_1 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_deleteForm_0700_1 B onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackB);
                });

                console.log(`FMS_deleteForm_0700_1 featureAbility.startAbility again start`);
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
                    console.log(`FMS_deleteForm_0700_1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_0700_1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_0700_1 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_deleteForm_0700_1 OnAcquired UnSubscribe CallBack====>");
            }
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onDestroy") {
                    console.debug("====>FMS_deleteForm_0700_1 onSupplyCallBack====>" + JSON.stringify(data));
                    expect(data.parameters.parameters).assertEqual(formId);
                    supplyFlag = true;
                }
                if (data.parameters.kind == "onUpdate") {
                    if (data.parameters.parameters == formId) {
                        expect().assertFail();
                    } else if (data.parameters.parameters == formIdB) {
                        supplyFlagUpdate = true;
                    }
                }
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_deleteForm_0700_1 unSubscribeSupplyCallback====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_deleteForm_0700_1 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_0700_1 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_deleteForm_0700_1 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostd",
                    abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js002",
                        "bundle" : "com.form.formsystemtestserviceb.hmservice",
                        "ability" : "com.form.formsystemtestserviceb.hmservice.FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_deleteForm_0700_1 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0700_1 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0700_1 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0700_2
        * @tc.name: After deleting a normal form, the form reference is 0.
        *     After deleting a form, there are still created normal forms in FMS.
        * @tc.desc: 1.host A an host B create one normal card respectively
        *           2.host A delete the form and verify the result is true
        */
         it(`FMS_deleteForm_0700_2`, 0, async (done) => {
            console.log(`FMS_deleteForm_0700_2 start`);
            let subscriberOnAcquired;
            let formId;
            let formIdB;
            let subscriberSupply;
            let supplyFlag = false;
            let supplyFlagUpdate = false;

            // timer speed up
            commonEvent.publish(`fms.time_speed`, { code: 900 }, () => {
                console.log(`FMS_deleteForm_0700_2 time speed up`);
            });
            await changeTime(10, 29, 55);
            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0700_2 delPublishCallBack====>");
                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    if(supplyFlag && supplyFlagUpdate) {
                        deleteFormB();
                    } else {
                        deleteFormB();
                        expect().assertFail();
                    }
                    console.info('FMS_deleteForm_0700_2 delPublishCallBack end');
                }, 5000)
            }

            function delPublishCallBackB() {
                console.info("!!!====>FMS_deleteForm_0700_2 delPublishCallBackB====>");
                setTimeout(function () {
                    console.info('FMS_deleteForm_0700_2 delPublishCallBackB end');
                    console.log(`FMS_deleteForm_0700_2 end`);
                    done();
                }, 1000);
            }

            function deleteFormB() {
                console.info("!!!====>FMS_deleteForm_0700_2 deleteFormB start====>");
                // timer speed reset
                commonEvent.publish(`fms.time_speed`, { code: 1 }, () => {
                    console.log(`FMS_deleteForm_0700_2 time speed up`);
                });
                setTimeout(function () {
                    let commonEventPublishData = {
                        bundleName: "com.ohos.st.formsystemhostd",
                        data: formIdB
                    };
                    commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBackB);
                    console.info("!!!====>FMS_deleteForm_0700_2 deleteFormB end====>");
                }, 1000)
            }
            function onAcquiredCallBackB(err, data) {
                console.info("!!!====>FMS_deleteForm_0700_2 onAcquiredCallBackB data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                formIdB = data.data;
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0700_2 unSubscribeOnDetetedCallback CallBack====>");
            }
            
            async function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0700_2 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback)
                formId = data.data;
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_deleteForm_0700_2 B onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackB);
                });

                console.log(`FMS_deleteForm_0700_2 featureAbility.startAbility again start`);
                await featureAbility.startAbility({
                    want: {
                        bundleName: "com.ohos.st.formsystemhostd",
                        abilityName: "com.ohos.st.formsystemhostd.MainAbility",
                        parameters: {
                            "formId" : "0",
                            "name" : "Form_Js002",
                            "bundle" : "com.form.formsystemtestserviceb.hmservice",
                            "ability" : "com.form.formsystemtestserviceb.hmservice.FormAbility",
                            "moduleName" : "entry",
                            "temporary" : false,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_0700_2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_0700_2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_0700_2 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_deleteForm_0700_2 OnAcquired UnSubscribe CallBack====>");
            }
            function onSupplyCallBack(err, data) {
                if (data.parameters.kind == "onDestroy") {
                    console.debug("====>FMS_deleteForm_0700_2 onSupplyCallBack====>" + JSON.stringify(data));
                    expect(data.parameters.parameters).assertEqual(formId);
                    supplyFlag = true;
                }
                if (data.parameters.kind == "onUpdate") {
                    if (data.parameters.parameters == formId) {
                        expect().assertFail();
                    } else if (data.parameters.parameters == formIdB) {
                        supplyFlagUpdate = true;
                    }
                }
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_deleteForm_0700_2 unSubscribeSupplyCallback====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_deleteForm_0700_2 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_0700_2 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_deleteForm_0700_2 featureAbility.startAbility start`);
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
                console.log(`FMS_deleteForm_0700_2 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0700_2 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0700_2 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_0900
        * @tc.name: Form ID error (FormID does not exist)
        * @tc.desc: 1.host create one normal card
        *           2.host delete the form
        *           3.host delete the form again and verify the result is false
        */
        it(`FMS_deleteForm_0900`, 0, async (done) => {
            console.log(`FMS_deleteForm_0900 start`);
            let subscriberOnDeleted;
            let formId;
            let formIdB;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_0900 delPublishCallBack====>");
                setTimeout(function () {
                    console.info('FMS_deleteForm_0900 delPublishCallBack end');
                    console.log(`FMS_deleteForm_0900 end`);   
                    done();
                }, 1000);
            }

            function onDetetedCallBack2(err, data) {
                console.info("!!!====>FMS_deleteForm_0900 onDetetedCallBack2 data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data != "0").assertEqual(true);
                console.info("!!!====>FMS_deleteForm_0900 failed to delete form again.====>");
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_0900 unSubscribeOnDetetedCallback CallBack====>");
            }
            
            function onDeletedCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_0900 onDeletedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnDeleted_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnDeleted, unSubscribeOnDetetedCallback)
                formId = data.parameters.formId;
                commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                    console.debug("====>FMS_deleteForm_0900 B onDetetedFormEvent Subscriber====>");
                    subscriberOnDeleted = data;
                    await commonEvent.subscribe(subscriberOnDeleted, onDetetedCallBack2);
                });

                console.log(`FMS_deleteForm_0900 featureAbility.startAbility again start`);
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
                            "deleteForm" : true,
                            "deleteId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_0900 featureAbility.startAbility again end`);
            }
            commonEvent.createSubscriber(onDetetedFormEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_0900 onDetetedFormEvent Subscriber====>");
                subscriberOnDeleted = data;
                await commonEvent.subscribe(subscriberOnDeleted, onDeletedCallBack);
            });

            console.log(`FMS_deleteForm_0900 featureAbility.startAbility start`);
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
                console.log(`FMS_deleteForm_0900 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_0900 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_0900 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_1000
        * @tc.name: You can delete a card after releasing it
        * @tc.desc: 1.host create one normal card
        *           2.host release the form
        *           3.host delete the form and verify the result is true
        */
        it(`FMS_deleteForm_1000`, 0, async (done) => {
            console.log(`FMS_deleteForm_1000 start`);
            let subscriberOnReleased;
            let formId;
            let formIdB;
            let subscriberSupply;
          
            function unSubscribeOnReleasedCallback() {
                console.debug("====>FMS_deleteForm_1000 unSubscribeOnReleasedCallback CallBack====>");
            }   
            function onReleasedCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_1000 onReleasedCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnReleased_commonEvent");
                expect(data.data).assertEqual("0");
                commonEvent.unsubscribe(subscriberOnReleased, unSubscribeOnReleasedCallback);
                formId = data.parameters.formId;

                console.log(`FMS_deleteForm_1000 featureAbility.startAbility again start`);
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
                            "deleteForm" : true,
                            "deleteId" : formId,
                            "isCreate" : false
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_1000 featureAbility.startAbility again end`);
            }
            commonEvent.createSubscriber(onReleasedFormEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_1000 onReleasedFormEvent Subscriber====>");
                subscriberOnReleased = data;
                await commonEvent.subscribe(subscriberOnReleased, onReleasedCallBack);
            });
            function onSupplyCallBack(err, data) {
                if(data.parameters.kind == "onDestroy") {
                    console.debug("====>FMS_deleteForm_1000 onSupplyCallBack====>" + JSON.stringify(data));
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    expect(data.parameters.parameters).assertEqual(formId);
                    setTimeout(function () {
                        console.info('FMS_deleteForm_1000 onDeletedCallback end');
                        console.log(`FMS_deleteForm_1000 end`);   
                        done();
                    }, 1000); 
                }
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_deleteForm_1000 unSubscribeSupplyCallback====>");
            }

            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_1000 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_deleteForm_1000 featureAbility.startAbility start`);
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
                        "releaseId" : "self",
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_deleteForm_1000 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_1000 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_1000 featureAbility.startAbility end`);
        });
        /**
        * @tc.number: FMS_deleteForm_1100
        * @tc.name: When deleting a temporary form, cache data is deleted.
        * @tc.desc: 1.host a and b create one temporary card respectively
        *           2.host a delete the form and verify the result is true
        */
        it(`FMS_deleteForm_1100`, 0, async (done) => {
            console.log(`FMS_deleteForm_1100 start`);
            let subscriberOnDeleted;
            let subscriberOnAcquired;
            let formId;
            let formIdB;
            let subscriberSupply;
            let supplyFlag = false;

            function delPublishCallBack() {
                console.info("!!!====>FMS_deleteForm_1100 delPublishCallBack====>");
                setTimeout(function () {
                    commonEvent.unsubscribe(subscriberSupply, unSubscribeSupplyCallback);
                    if(supplyFlag) {
                        deleteFormB();
                    } else {
                        deleteFormB();
                        expect().assertFail();
                    }
                    console.info('FMS_deleteForm_1100 delPublishCallBack end');
                }, 1000);
            }

            function delPublishCallBackB() {
                console.info("!!!====>FMS_deleteForm_1100 delPublishCallBackB====>");
                setTimeout(function () {
                    console.info('FMS_deleteForm_1100 delPublishCallBackB end');
                    console.log(`FMS_deleteForm_1100 end`);   
                    done();
                }, 1000);
            }

            function deleteFormB() {
                console.info("!!!====>FMS_deleteForm_1100 deleteFormB start====>");
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostd",
                    data: formIdB
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBackB);
                console.info("!!!====>FMS_deleteForm_1100 deleteFormB end====>");
            }
            function onAcquiredCallBackB(err, data) {
                console.info("!!!====>FMS_deleteForm_1100 onAcquiredCallBackB data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                formIdB = data.data;
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnDetetedCallback);
                let commonEventPublishData = {
                    bundleName: "com.ohos.st.formsystemhostc",
                    data: formId
                };
                commonEvent.publish(deleteForm_Event, commonEventPublishData, delPublishCallBack);
            }
            function unSubscribeOnDetetedCallback() {
                console.debug("====>FMS_deleteForm_1100 unSubscribeOnDetetedCallback CallBack====>");
            }
            
            function onAcquiredCallBack(err, data) {
                console.info("!!!====>FMS_deleteForm_1100 onAcquiredCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnAcquired_commonEvent");
                commonEvent.unsubscribe(subscriberOnAcquired, unSubscribeOnAcquiredCallback);
                formId = data.data;
                commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                    console.debug("====>FMS_deleteForm_1100 B onAcquiredForm_Event Subscriber====>");
                    subscriberOnAcquired = data;
                    await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBackB);
                });

                console.log(`FMS_deleteForm_1100 featureAbility.startAbility again start`);
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
                            "temporary" : true,
                            "isCreate" : true
                        }
                    }
                }).then((res: any) => {
                    console.log(`FMS_deleteForm_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                }).catch((err: any) => {
                    console.log(`FMS_deleteForm_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                });
                console.log(`FMS_deleteForm_1100 featureAbility.startAbility again end`);
            }
            function unSubscribeOnAcquiredCallback() {
                console.debug("====>FMS_deleteForm_1100 OnAcquired UnSubscribe CallBack====>");
            }
            function onSupplyCallBack(err, data) {
                if(data.parameters.kind == "onDestroy") {
                    console.debug("====>FMS_deleteForm_1100 onSupplyCallBack====>" + JSON.stringify(data));
                    expect(data.parameters.parameters).assertEqual(formId);
                    supplyFlag = true;
                }
            }
            function unSubscribeSupplyCallback() {
                console.debug("====>FMS_deleteForm_1100 unSubscribeSupplyCallback====>");
            }
            commonEvent.createSubscriber(onAcquiredForm_Event).then(async (data) => {
                console.debug("====>FMS_deleteForm_1100 Create OnAcquired Subscriber====>");
                subscriberOnAcquired = data;
                await commonEvent.subscribe(subscriberOnAcquired, onAcquiredCallBack);
            });
            commonEvent.createSubscriber(onSupplyEvent).then(async (data) => {
                console.debug("====>FMS_deleteForm_1100 onSupplyEvent Subscriber====>");
                subscriberSupply = data;
                await commonEvent.subscribe(subscriberSupply, onSupplyCallBack);
            });
            console.log(`FMS_deleteForm_1100 featureAbility.startAbility start`);
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
                        "isCreate" : true
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_deleteForm_1100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
            }).catch((err: any) => {
                console.log(`FMS_deleteForm_1100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
            });
            console.log(`FMS_deleteForm_1100 featureAbility.startAbility end`);
        });
    });
}
