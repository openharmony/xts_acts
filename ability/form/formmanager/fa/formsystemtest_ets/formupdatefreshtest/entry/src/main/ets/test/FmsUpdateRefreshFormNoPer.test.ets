/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium'

var onAcquiredForm_Event = {
    events: ["FMS_FormOnAcquired_commonEvent"],
};
var onDeletedFormEvent = {
    events: ["FMS_FormOnDeleted_commonEvent"],
};
var onUpdateRefreshEvent = {
    events: ["FMS_FormUpdateRefresh_commonEvent"],
};
var onRequestFormEvent = {
    events: ["FMS_FormOnRequest_commonEvent"],
};

const unsubscribeCallback = (tcNumber) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}

var deleteForm_Event = "FMS_FormDelete_commonEvent";


var subscriberOnAcquired;
var subscriberOnDeleted;
var subscriberOnRefresh;
var subscriberOnRequest;

function sleep(time) {
    return new Promise((resolve)=>setTimeout(resolve,time));
  }

export default function FmsUpdateRefreshNoPerTest() {
    describe(`FmsUpdateRefreshNoPerTest`, () => {

        beforeAll(async (done) => {
            done();
        })

        beforeEach(async () => {
            subscriberOnAcquired = await commonEvent.createSubscriber(onAcquiredForm_Event);
            subscriberOnDeleted = await commonEvent.createSubscriber(onDeletedFormEvent);
            subscriberOnRefresh = await commonEvent.createSubscriber(onUpdateRefreshEvent);
            subscriberOnRequest = await commonEvent.createSubscriber(onRequestFormEvent);
        })

        afterEach(async() => {
            commonEvent.unsubscribe(subscriberOnAcquired, () => unsubscribeCallback("afterEach unsubscribe subscriberOnAcquired"));
            commonEvent.unsubscribe(subscriberOnDeleted, () => unsubscribeCallback("afterEach unsubscribe subscriberOnDeleted"));
            commonEvent.unsubscribe(subscriberOnRefresh, () => unsubscribeCallback("afterEach unsubscribe subscriberOnRefresh"));
            commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeCallback("afterEach unsubscribe subscriberOnRequest"));
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formupdaterefreshtest",
                    abilityName: "com.ohos.st.formupdaterefreshtest.MainAbility"
                }
            }).then((data) => {
                console.log("FmsUpdateRefreshFormTest startAbility data: " + JSON.stringify(data));
            }).catch((err) => {
                console.log("FmsUpdateRefreshFormTest startAbility err: " + JSON.stringify(err));
            })
        })

       /**
        * @tc.number: FMS_hostRefreshNoPer_0100
        * @tc.name: The form user has no form permission.
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefreshNoPer_0100`, 0, async (done) => {
            console.log(`FMS_hostRefreshNoPer_0100 start`);

            function onRequestCallBack(_, data) {
                console.info("!!!====>FMS_hostRefreshNoPer_0100 onRequestCallBack data:====>" + JSON.stringify(data));
                expect(data.event).assertEqual("FMS_FormOnRequest_commonEvent");
                expect(data.data != "0").assertEqual(true);
                commonEvent.unsubscribe(subscriberOnRequest, () => unsubscribeOnRequestCallback("FMS_hostRefreshNoPer_0100"));

                setTimeout(function () {
                    console.info('FMS_hostRefreshNoPer_0100 onRequestCallBack end');
                    console.log(`FMS_hostRefreshNoPer_0100 end`);
                    done();
                }, 1000)
            }

            commonEvent.subscribe(subscriberOnRequest, onRequestCallBack);
            console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbility start`);
            await featureAbility.startAbility({
                want: {
                    bundleName: "com.ohos.st.formsystemhostnoperm",
                    abilityName: "com.ohos.st.formsystemhostnoperm.MainAbility",
                    parameters: {
                        "formId" : "0",
                        "name" : "Form_Js001",
                        "bundle" : "com.acts.form.formsystemtestservicea.hmservice",
                        "ability" : "FormAbility",
                        "moduleName" : "entry",
                        "temporary" : false,
                        "requestForm" : true,
                        "requestId" : "1",
                        "isCreate" : false
                    }
                }
            }).then((res: any) => {
                console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                expect(res.result).assertEqual(undefined);
                done();
            }).catch((err: any) => {
                console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            });
            console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbility end`);
        });
    });
}

const delPublishCallBack = async (tcNumber, done) => {
    console.info(`${tcNumber} delPublishCallBack start`);
    setTimeout(function () {
        console.info(`${tcNumber} delPublishCallBack end`);
        done();
    }, 1000)
}

const unsubscribeOnRequestCallback = (tcNumber) => {
    console.debug(`====>${tcNumber} unsubscribeOnRequestCallback CallBack====>`);
}
