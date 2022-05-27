/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the `License`);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an `AS IS` BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';
import { beforeEach, describe, expect, it } from 'deccjsunit/index.ets';

const onAcquiredEvent = {
    events: [`FMS_FormOnAcquired_commonEvent`],
};
const onSupplyEvent = {
    events: [`FMS_FormSupply_commonEvent`],
};
const onRequestEvent = {
    events: [`FMS_FormOnRequest_commonEvent`],
};
const formOnTerminateEvent = `FMS_FormTerminate_commonEvent`;

let tcNumber;
let hostCounter;
let providerCounter;
let onAcquiredEventSubscriber;
let onSupplyEventSubscriber;
let onRequestEventSubscriber;

export default function test() {
    describe(`FmsHostDeathRecipientTest`, () => {

        beforeEach(async () => {
            tcNumber = `FmsHostDeathRecipientTest`;
            hostCounter = 0;
            providerCounter = 0;
            onAcquiredEventSubscriber = await commonEvent.createSubscriber(onAcquiredEvent);
            onSupplyEventSubscriber = await commonEvent.createSubscriber(onSupplyEvent);
            onRequestEventSubscriber = await commonEvent.createSubscriber(onRequestEvent);
        });

        /**
         * @tc.number: FMS_hostDeathRecipient_0100
         * @tc.name: Reset host ability.
         * @tc.desc: The provider's onDestroy event will be triggered.
         */
        it(`FMS_hostDeathRecipient_0100`, 0, async (done) => {
            tcNumber = `FMS_hostDeathRecipient_0100`;
            let tempFormId;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const hostFormId = data.data;
                console.info(`${tcNumber} onAcquiredCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallBack formId: ${hostFormId}`);

                if (data.parameters?.cast) {
                    tempFormId = hostFormId;
                }
                if (++hostCounter == 2) {
                    // onAcquired * 2
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, unsubscribeOnAcquiredCallback);
                    // terminate host
                    commonEvent.publish(formOnTerminateEvent, publishOnTerminateCallback);
                    console.info(`${tcNumber} onAcquiredCallBack end`);
                }
            });
            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const supplyFormId = getSupplyFormId(data);
                console.info(`${tcNumber} onSupplyCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onSupplyCallBack formId: ${supplyFormId} kind: ${kind}`);

                if (`onDestroy` == kind) {
                    expect(tempFormId).assertEqual(supplyFormId);
                    commonEvent.unsubscribe(onSupplyEventSubscriber, unsubscribeOnSupplyCallback);

                    await sleep(1000);
                    done();
                }
            });
            await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                isCreate: true,
                createTempAndNormal: true,
                subscribeTerminate: true
            });
        });

        /**
         * @tc.number: FMS_hostDeathRecipient_0200
         * @tc.name: Reset host ability and requestForm.
         * @tc.desc: The provider's onDestroy event will be triggered.
         */
        it(`FMS_hostDeathRecipient_0200`, 0, async (done) => {
            tcNumber = `FMS_hostDeathRecipient_0200`;
            let normalFormId;
            let tempFormId;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const hostFormId = data.data;
                console.info(`${tcNumber} onAcquiredCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallBack formId: ${hostFormId}`);

                if (data.parameters?.cast) {
                    tempFormId = hostFormId;
                } else {
                    normalFormId = hostFormId;
                }
                if (++hostCounter == 2) {
                    // onAcquired * 2
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, unsubscribeOnAcquiredCallback);
                    // terminate host
                    commonEvent.publish(formOnTerminateEvent, publishOnTerminateCallback);
                    await sleep(2000);
                    // reset host
                    await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                        formId: normalFormId,
                        isCreate: true,
                        requestForm: true,
                        requestId: normalFormId,
                        subscribeTerminate: true
                    });
                    console.info(`${tcNumber} onAcquiredCallBack end`);
                }
            });
            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const supplyFormId = getSupplyFormId(data);
                console.info(`${tcNumber} onSupplyCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onSupplyCallBack formId: ${supplyFormId} kind: ${kind}`);

                if (`onDestroy` == kind) {
                    expect(tempFormId).assertEqual(supplyFormId);
                } else if (`onUpdate` == kind) {
                    expect(normalFormId).assertEqual(supplyFormId);
                }
                if (++providerCounter == 4) {
                    // onCreate * 2 onDestroy * 1 onUpdate * 1
                    commonEvent.unsubscribe(onSupplyEventSubscriber, unsubscribeOnSupplyCallback);
                    console.info(`${tcNumber} onSupplyCallBack end`);
                    await sleep(1000);
                    done();
                }
            });
            await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                isCreate: true,
                createTempAndNormal: true,
                subscribeTerminate: true
            });
        });

        /**
         * @tc.number: FMS_hostDeathRecipient_0300
         * @tc.name: Reset host ability.
         * @tc.desc: The provider's onDestroy event will be triggered but requestForm will be failed.
         */
        it(`FMS_hostDeathRecipient_0300`, 0, async (done) => {
            tcNumber = `FMS_hostDeathRecipient_0300`;
            let tempFormId;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                const hostFormId = data.data;
                console.info(`${tcNumber} onAcquiredCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallBack formId: ${hostFormId}`);

                if (data.parameters) {
                    tempFormId = hostFormId;
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, unsubscribeOnAcquiredCallback);
                    // terminate host
                    commonEvent.publish(formOnTerminateEvent, publishOnTerminateCallback);
                    console.info(`${tcNumber} onAcquiredCallBack end`);
                }
            });
            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const supplyFormId = getSupplyFormId(data);
                console.info(`${tcNumber} onSupplyCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onSupplyCallBack formId: ${supplyFormId} kind: ${kind}`);

                if (`onDestroy` == kind) {
                    expect(tempFormId).assertEqual(supplyFormId);
                }
                if (++providerCounter == 2) {
                    // onCreate * 1
                    // onDestroy * 1
                    commonEvent.unsubscribe(onSupplyEventSubscriber, unsubscribeOnSupplyCallback);

                    await sleep(1000);
                    await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                        requestForm: true,
                        requestId: tempFormId
                    });
                    console.info(`${tcNumber} onSupplyCallBack end`);
                }
            });
            commonEvent.subscribe(onRequestEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onRequestCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                commonEvent.unsubscribe(onRequestEventSubscriber, unsubscribeOnRequestCallback);

                const error = data.parameters.error;
                expect(error.code).assertEqual(9);
                expect(error.message).assertEqual(`the ID of the form to be operated does not exist`);
                console.info(`${tcNumber} onRequestCallBack end`);

                await sleep(1000);
                done();
            });
            await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                isCreate: true,
                temporary: true,
                subscribeTerminate: true
            });
        });

        /**
         * @tc.number: FMS_hostDeathRecipient_0500
         * @tc.name: Reset host ability and requestForm.
         * @tc.desc: The provider's onUpdate event will be triggered.
         */
        it(`FMS_hostDeathRecipient_0500`, 0, async (done) => {
            tcNumber = `FMS_hostDeathRecipient_0500`;
            let hostFormId;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                hostFormId = data.data;
                console.info(`${tcNumber} onAcquiredCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallBack formId: ${hostFormId}`);

                commonEvent.unsubscribe(onAcquiredEventSubscriber, unsubscribeOnAcquiredCallback);
                // start abilityb
                await startAbility(`com.ohos.st.formsystemhostl`, `com.ohos.st.formsystemhostl.MainAbility`, {
                    formId: hostFormId,
                    isCreate: true
                });
                // terminate host
                commonEvent.publish(formOnTerminateEvent, publishOnTerminateCallback);
                await sleep(2000);
                // reset host a
                await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                    formId: hostFormId,
                    requestForm: true,
                    requestId: hostFormId,
                });
                console.info(`${tcNumber} onAcquiredCallBack end`);
            });
            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const supplyFormId = getSupplyFormId(data);
                console.info(`${tcNumber} onSupplyCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onSupplyCallBack formId: ${supplyFormId} kind: ${kind}`);

                if (`onUpdate` == kind) {
                    expect(hostFormId).assertEqual(supplyFormId);
                }
                if (++providerCounter == 2) {
                    // onCreate * 1 host A
                    // onUpdate * 1
                    commonEvent.unsubscribe(onSupplyEventSubscriber, unsubscribeOnSupplyCallback);
                    console.info(`${tcNumber} onSupplyCallBack end`);

                    await sleep(1000);
                    done();
                }
            });
            await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                isCreate: true,
                subscribeTerminate: true
            });
        });

        /**
         * @tc.number: FMS_hostDeathRecipient_0600
         * @tc.name: Reset host ability and requestForm.
         * @tc.desc: The provider's onUpdate event will be triggered.
         */
        it(`FMS_hostDeathRecipient_0600`, 0, async (done) => {
            tcNumber = `FMS_hostDeathRecipient_0600`;
            let hostFormId;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                hostFormId = data.data;
                console.info(`${tcNumber} onAcquiredCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallBack formId: ${hostFormId}`);

                commonEvent.unsubscribe(onAcquiredEventSubscriber, unsubscribeOnAcquiredCallback);
                // start abilityb
                await startAbility(`com.ohos.st.formsystemhostl`, `com.ohos.st.formsystemhostl.MainAbility`, {
                    formId: hostFormId,
                    isCreate: true
                });
                // terminate host
                commonEvent.publish(formOnTerminateEvent, publishOnTerminateCallback);
                await sleep(2000);
                await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                    formId: hostFormId,
                    isCreate: true,
                    requestForm: true,
                    requestId: hostFormId,
                    subscribeTerminate: true
                });
                await sleep(2000);
                await startAbility(`com.ohos.st.formsystemhostl`, `com.ohos.st.formsystemhostl.MainAbility`, {
                    formId: hostFormId,
                    requestForm: true,
                    requestId: hostFormId,
                });
                console.info(`${tcNumber} onAcquiredCallBack end`);
            });
            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                const kind = data.parameters.kind;
                const supplyFormId = getSupplyFormId(data);
                console.info(`${tcNumber} onSupplyCallBack data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onSupplyCallBack formId: ${supplyFormId} kind: ${kind}`);

                if (`onUpdate` == kind) {
                    expect(hostFormId).assertEqual(supplyFormId);
                }
                if (++providerCounter == 3) {
                    // onCreate * 1 host A
                    // onUpdate * 2
                    commonEvent.unsubscribe(onSupplyEventSubscriber, unsubscribeOnSupplyCallback);
                    console.info(`${tcNumber} onSupplyCallBack end`);

                    await sleep(1000);
                    done();
                }
            });
            await startAbility(`com.ohos.st.formsystemhostk`, `com.ohos.st.formsystemhostk.MainAbility`, {
                isCreate: true,
                subscribeTerminate: true
            });
        });
    });
}

const sleep = async delay => {
    return new Promise((resolve, _) => {
        setTimeout(async () => {
            resolve(0);
        }, delay);
    });
};

const getSupplyFormId = (data) => {
    switch (data.parameters.kind) {
        case `onCreate`:
            return JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`];
        case `onVisibilityChange`:
            return Object.keys(JSON.parse(data.parameters.parameters))[0]
        default:
            return data.parameters.parameters;
    }
}

const unsubscribeOnAcquiredCallback = () => {
    console.info(`${tcNumber} unsubscribeOnAcquired callback`);
}
const unsubscribeOnSupplyCallback = () => {
    console.info(`${tcNumber} unsubscribeOnSupply callback`);
}
const unsubscribeOnRequestCallback = () => {
    console.info(`${tcNumber} unsubscribeOnRequest callback`);
}
const publishOnTerminateCallback = () => {
    console.info(`${tcNumber} publishOnTerminate callback`);
}

interface Parameters {
    formId?: String,
    name?: String,
    bundle?: String,
    ability?: String,
    moduleName?: String,
    temporary?: Boolean,
    isCreate?: Boolean,
    createTempAndNormal?: Boolean,
    subscribeTerminate?: Boolean,
    tempParam?: Object,
    [key: string]: any
}

const startAbility = async (
    bundleName,
    abilityName,
    parameters: Parameters) => {

    parameters = Object.assign({
        formId: `0`,
        name: `Form_Js001`,
        bundle: `com.form.formsystemtestservicef.hmservice`,
        ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
        moduleName: `entry`,
        temporary: false,
        isCreate: false,
        createTempAndNormal: false,
        subscribeTerminate: false,
    }, parameters);
    if (parameters.createTempAndNormal) {
        parameters.tempParam = {
            formId: `0`,
            name: `Form_Js001`,
            bundle: `com.form.formsystemtestservicef.hmservice`,
            ability: `com.form.formsystemtestservicef.hmservice.FormAbility`,
            moduleName: `entry`
        };
    }
    try {
        const res = await featureAbility.startAbility({
            want: {
                bundleName: bundleName,
                abilityName: abilityName,
                parameters: parameters
            }
        });
        console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
    } catch (error) {
        console.info(`${tcNumber} featureAbility.startAbility error: ${JSON.stringify(error)}`);
        console.info(`${tcNumber} should not reach here`);
        expect().assertFail();
    }
};
