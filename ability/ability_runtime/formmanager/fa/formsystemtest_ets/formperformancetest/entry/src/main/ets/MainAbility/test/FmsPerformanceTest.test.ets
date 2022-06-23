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
import formHost from '@ohos.application.formHost';
import commonEvent from '@ohos.commonEvent';
import systemTime from '@ohos.systemTime';
import { beforeEach, describe, expect, it } from 'deccjsunit/index';

const onAcquiredEvent = {
    events: [`FMS_FormOnAcquired_commonEvent`],
};
const onSupplyEvent = {
    events: [`FMS_FormSupply_commonEvent`],
};
const formOnDeleteEvent = `FMS_FormDelete_commonEvent`;

const unsubscribeOnAcquiredCallback = (tcNumber) => {
    console.info(`${tcNumber} unsubscribeOnAcquired callback`);
}
const unsubscribeOnSupplyCallback = (tcNumber) => {
    console.info(`${tcNumber} unsubscribeOnSupply callback`);
}
const publishOnDeleteCallback = (tcNumber, done) => {
    console.info(`${tcNumber} publishOnDelete callback`);
    done();
}

let onAcquiredEventSubscriber;
let onSupplyEventSubscriber;

export default function test() {
    describe(`FmsPerformanceTest`, () => {

        beforeEach(async () => {
            onAcquiredEventSubscriber = await commonEvent.createSubscriber(onAcquiredEvent);
            onSupplyEventSubscriber = await commonEvent.createSubscriber(onSupplyEvent);
        });

        /**
         * @tc.number: FMS_performanceTest_0100
         * @tc.name: Performance test.
         * @tc.desc: Create form.
         */
        it(`FMS_performanceTest_0100`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0100`;
            const timeout = 1000;
            let endflag = 0;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                const hostEndTime = data.parameters.time;
                const hostTime = hostEndTime - startTime
                console.info(`${tcNumber} hostTime: ${JSON.stringify(hostTime)}`);
                expect(hostTime < timeout).assertEqual(true);
                commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                console.info(`${tcNumber} onAcquiredCallback end`);

                if (++endflag == 2) {
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [data.data]
                            }
                        }, () => publishOnDeleteCallback(tcNumber, done));
                    }, 500);
                }
            });

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onCreate` == kind) {
                    const providerEndTime = data.parameters.time;
                    const providerTime = providerEndTime - startTime;
                    console.info(`${tcNumber} providerTime: ${JSON.stringify(providerTime)}`);
                    expect(providerTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                    console.info(`${tcNumber} onSupplyCallback_onCreate end`);

                    if (++endflag == 2) {
                        setTimeout(() => {
                            commonEvent.publish(formOnDeleteEvent, {
                                parameters: {
                                    formIds: [supplyFormId]
                                }
                            }, () => publishOnDeleteCallback(tcNumber, done));
                        }, 500);
                    }
                }
            });

            const startTime = await systemTime.getCurrentTime();
            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0200
         * @tc.name: Performance test.
         * @tc.desc: Delete form.
         */
        it(`FMS_performanceTest_0200`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0200`;
            const timeout = 1000;
            let startTime = -1;
            let endflag = 0;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`deleteForm` == data.parameters.kind) {
                    startTime = data.parameters.startTime;
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${JSON.stringify(hostTime)}`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback_deleteForm end`);

                    if (++endflag == 2) {
                        setTimeout(() => {
                            commonEvent.publish(formOnDeleteEvent, {
                                parameters: {
                                    formIds: [data.data]
                                }
                            }, () => publishOnDeleteCallback(tcNumber, done));
                        }, 500);
                    }
                }
            });

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onDestroy` == kind) {
                    setTimeout(() => {
                        const providerEndTime = data.parameters.time;
                        const providerTime = providerEndTime - startTime;
                        console.info(`${tcNumber} providerTime: ${JSON.stringify(providerTime)}`);
                        expect(providerTime < timeout).assertEqual(true);
                        commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                        console.info(`${tcNumber} onSupplyCallback_onDestroy end`);

                        if (++endflag == 2) {
                            setTimeout(() => {
                                commonEvent.publish(formOnDeleteEvent, {
                                    parameters: {
                                        formIds: [supplyFormId]
                                    }
                                }, () => publishOnDeleteCallback(tcNumber, done));
                            }, 500);
                        }
                    }, 2000);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            deleteForm: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0300
         * @tc.name: Performance test.
         * @tc.desc: Release form.
         */
        it(`FMS_performanceTest_0300`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0300`;
            const timeout = 1000;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`release` == data.parameters.kind) {
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${hostTime}`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback_release end`);
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [data.data]
                            }
                        }, () => publishOnDeleteCallback(tcNumber, done));
                    }, 500);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            releaseForm: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0400
         * @tc.name: Performance test.
         * @tc.desc: Cast temp form.
         */
        it(`FMS_performanceTest_0400`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0400`;
            const timeout = 500;
            let startTime = -1;
            let endflag = 0;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`castTempForm` == data.parameters.kind) {
                    startTime = data.parameters.startTime;
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${JSON.stringify(hostTime)}`);
                    console.info(`${tcNumber} onAcquiredCallback_castTempForm end`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));

                    if (++endflag == 2) {
                        setTimeout(() => {
                            commonEvent.publish(formOnDeleteEvent, {
                                parameters: {
                                    formIds: [data.data]
                                }
                            }, () => publishOnDeleteCallback(tcNumber, done));
                        }, 500);
                    }
                }
            });

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onCastToNormal` == kind) {
                    setTimeout(() => {
                        const providerEndTime = data.parameters.time;
                        const providerTime = providerEndTime - startTime;
                        console.info(`${tcNumber} providerTime: ${JSON.stringify(providerTime)}`);
                        expect(providerTime < timeout).assertEqual(true);
                        commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                        console.info(`${tcNumber} onSupplyCallback_onCastToNormal end`);

                        if (++endflag == 2) {
                            setTimeout(() => {
                                commonEvent.publish(formOnDeleteEvent, {
                                    parameters: {
                                        formIds: [supplyFormId]
                                    }
                                }, () => publishOnDeleteCallback(tcNumber, done));
                            }, 500);
                        }
                    }, 2000);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            castTempForm: true,
                            temporary: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0500
         * @tc.name: Performance test.
         * @tc.desc: Notify visible forms.
         */
        it(`FMS_performanceTest_0500`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0500`;
            const timeout = 500;
            let startTime = -1;
            let endflag = 0;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`notifyVisibleForms` == data.parameters.kind) {
                    startTime = data.parameters.startTime;
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${JSON.stringify(hostTime)}`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback_notifyVisibleForms end`);

                    if (++endflag == 2) {
                        setTimeout(() => {
                            commonEvent.publish(formOnDeleteEvent, {
                                parameters: {
                                    formIds: [data.data]
                                }
                            }, () => publishOnDeleteCallback(tcNumber, done));
                        }, 500);
                    }
                }
            });

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : `onVisibilityChange` == kind
                        ? Object.keys(JSON.parse(data.parameters.parameters))[0]
                        : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onVisibilityChange` == kind) {
                    setTimeout(() => {
                        const providerEndTime = data.parameters.time;
                        const providerTime = providerEndTime - startTime;
                        console.info(`${tcNumber} providerTime: ${JSON.stringify(providerTime)}`);
                        expect(providerTime < timeout).assertEqual(true);
                        commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                        console.info(`${tcNumber} onSupplyCallback_onVisibilityChange end`);

                        if (++endflag == 2) {
                            setTimeout(() => {
                                commonEvent.publish(formOnDeleteEvent, {
                                    parameters: {
                                        formIds: [supplyFormId]
                                    }
                                }, () => publishOnDeleteCallback(tcNumber, done));
                            }, 500);
                        }
                    }, 2000);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            notifyVisibleForms: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0600
         * @tc.name: Performance test.
         * @tc.desc: Notify invisible forms.
         */
        it(`FMS_performanceTest_0600`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0600`;
            const timeout = 500;
            let startTime = -1;
            let endflag = 0;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`notifyInvisibleForms` == data.parameters.kind) {
                    startTime = data.parameters.startTime;
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${JSON.stringify(hostTime)}`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback_notifyInvisibleForms end`);

                    if (++endflag == 2) {
                        setTimeout(() => {
                            commonEvent.publish(formOnDeleteEvent, {
                                parameters: {
                                    formIds: [data.data]
                                }
                            }, () => publishOnDeleteCallback(tcNumber, done));
                        }, 500);
                    }
                }
            });

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : `onVisibilityChange` == kind
                        ? Object.keys(JSON.parse(data.parameters.parameters))[0]
                        : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onVisibilityChange` == kind) {
                    setTimeout(() => {
                        const providerEndTime = data.parameters.time;
                        const providerTime = providerEndTime - startTime;
                        console.info(`${tcNumber} providerTime: ${JSON.stringify(providerTime)}`);
                        expect(providerTime < timeout).assertEqual(true);
                        commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                        console.info(`${tcNumber} onSupplyCallback_onVisibilityChange end`);

                        if (++endflag == 2) {
                            setTimeout(() => {
                                commonEvent.publish(formOnDeleteEvent, {
                                    parameters: {
                                        formIds: [supplyFormId]
                                    }
                                }, () => publishOnDeleteCallback(tcNumber, done));
                            }, 500);
                        }
                    }, 2000);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            notifyInvisibleForms: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0700
         * @tc.name: Performance test.
         * @tc.desc: Request forms.
         */
        it(`FMS_performanceTest_0700`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0700`;
            const timeout = 100;
            let startTime = -1;
            let endflag = 0;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`request` == data.parameters.kind) {
                    startTime = data.parameters.startTime;
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${JSON.stringify(hostTime)}`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback end`);

                    if (++endflag == 2) {
                        setTimeout(() => {
                            commonEvent.publish(formOnDeleteEvent, {
                                parameters: {
                                    formIds: [data.data]
                                }
                            }, () => publishOnDeleteCallback(tcNumber, done));
                        }, 500);
                    }
                }
            });

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onUpdate` == kind) {
                    setTimeout(() => {
                        const providerEndTime = data.parameters.time;
                        console.info(`${tcNumber} providerTime: ${JSON.stringify(providerEndTime - startTime)}`);
                        expect(providerEndTime - startTime < timeout).assertEqual(true);
                        commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                        console.info(`${tcNumber} onSupplyCallback_onUpdate end`);

                        if (++endflag == 2) {
                            setTimeout(() => {
                                commonEvent.publish(formOnDeleteEvent, {
                                    parameters: {
                                        formIds: [supplyFormId]
                                    }
                                }, () => publishOnDeleteCallback(tcNumber, done));
                            }, 500);
                        }
                    }, 2000);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            requestForm: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0800
         * @tc.name: Performance test.
         * @tc.desc: Update form.
         */
        it(`FMS_performanceTest_0800`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0800`;
            const timeout = 100;

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : `onVisibilityChange` == kind
                        ? Object.keys(JSON.parse(data.parameters.parameters))[0]
                        : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onUpdateForm` == kind) {
                    const providerTime = data.parameters.time;
                    console.info(`${tcNumber} providerTime: ${JSON.stringify(providerTime)}`);
                    expect(providerTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                    console.info(`${tcNumber} onSupplyCallback_onUpdateForm end`);
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [supplyFormId]
                            }
                        }, () => publishOnDeleteCallback(tcNumber, done));
                    }, 500);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            notifyVisibleForms: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_0900
         * @tc.name: Performance test.
         * @tc.desc: Set next refresh time.
         */
        it(`FMS_performanceTest_0900`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_0900`;
            const timeout = 100;

            commonEvent.subscribe(onSupplyEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onSupplyCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                const kind = data.parameters.kind;
                const supplyFormId = `onCreate` == kind
                    ? JSON.parse(data.parameters.parameters).parameters[`ohos.extra.param.key.form_identity`]
                    : `onVisibilityChange` == kind
                        ? Object.keys(JSON.parse(data.parameters.parameters))[0]
                        : data.parameters.parameters;
                console.info(`${tcNumber} onSupplyCallback formId: ${supplyFormId} kind: ${kind}`);

                if (`onSetFormNextRefreshTime` == kind) {
                    const providerTime = data.parameters.time;
                    console.info(`${tcNumber} providerTime: ${JSON.stringify(providerTime)}`);
                    expect(providerTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onSupplyEventSubscriber, () => unsubscribeOnSupplyCallback(tcNumber));
                    console.info(`${tcNumber} onSupplyCallback_onSetFormNextRefreshTime end`);
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [supplyFormId]
                            }
                        }, () => publishOnDeleteCallback(tcNumber, done));
                    }, 500);
                }
            });

            setTimeout(async () => {
                try {
                    const res = await featureAbility.startAbility({
                        want: {
                            bundleName: `com.ohos.st.formsystemhostk`,
                            abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                            parameters: {
                                formId: `0`,
                                name: `Form_Js001`,
                                bundle: `com.form.formsystemtestserviceg.hmservice`,
                                ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                                moduleName: `entry`,
                                isCreate: true,
                                notifyVisibleForms: true,
                            }
                        }
                    });
                    console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                } catch (error) {
                    console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                    console.info(`${tcNumber} should not reach here`);
                    expect().assertFail();
                }
            }, 2000);
        });

        /**
         * @tc.number: FMS_performanceTest_1000
         * @tc.name: Performance test.
         * @tc.desc: Enable update forms.
         */
        it(`FMS_performanceTest_1000`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_1000`;
            const timeout = 100;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`enableUpdate` == data.parameters.kind) {
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${hostTime}`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback_enableUpdate end`);
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [data.data]
                            }
                        }, () => publishOnDeleteCallback(tcNumber, done));
                    }, 500);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            enableUpdate: true,
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_1100
         * @tc.name: Performance test.
         * @tc.desc: Disable update forms.
         */
        it(`FMS_performanceTest_1100`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_1100`;
            const timeout = 100;

            commonEvent.subscribe(onAcquiredEventSubscriber, async (err, data) => {
                console.info(`${tcNumber} onAcquiredCallback data: ${JSON.stringify(data)}, error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} onAcquiredCallback formId: ${data.data}`);

                if (`disableUpdate` == data.parameters.kind) {
                    const hostTime = data.parameters.hostTime;
                    console.info(`${tcNumber} hostTime: ${hostTime}`);
                    expect(hostTime < timeout).assertEqual(true);
                    commonEvent.unsubscribe(onAcquiredEventSubscriber, () => unsubscribeOnAcquiredCallback(tcNumber));
                    console.info(`${tcNumber} onAcquiredCallback_disableUpdate end`);
                    setTimeout(() => {
                        commonEvent.publish(formOnDeleteEvent, {
                            parameters: {
                                formIds: [data.data]
                            }
                        }, () => publishOnDeleteCallback(tcNumber, done));
                    }, 500);
                }
            });

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.form.formsystemtestserviceg.hmservice`,
                            ability: `com.form.formsystemtestserviceg.hmservice.FormAbility`,
                            moduleName: `entry`,
                            isCreate: true,
                            disableUpdate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
            }
        });

        /**
         * @tc.number: FMS_performanceTest_1300
         * @tc.name: Performance test.
         * @tc.desc: Get forms info.
         */
        it(`FMS_performanceTest_1300`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_1300`;
            const timeout = 10;

            const startTime = await systemTime.getCurrentTime();
            const data = await formHost.getAllFormsInfo();
            console.info(`${tcNumber} getAllFormsInfo result: ${JSON.stringify(data)}`);
            const endTime = await systemTime.getCurrentTime();

            console.info(`${tcNumber} hostTime: ${JSON.stringify(endTime - startTime)}`);
            expect(endTime - startTime < timeout);
            done();
        });

        /**
         * @tc.number: FMS_performanceTest_1400
         * @tc.name: Performance test.
         * @tc.desc: Get forms info by bundle.
         */
        it(`FMS_performanceTest_1400`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_1400`;
            const timeout = 10;

            const startTime = await systemTime.getCurrentTime();
            const data = await formHost.getFormsInfo(`com.form.formsystemtestserviceg.hmservice`);
            console.info(`${tcNumber} getFormsInfoByBundle result: ${JSON.stringify(data)}`);
            const endTime = await systemTime.getCurrentTime();

            console.info(`${tcNumber} hostTime: ${JSON.stringify(endTime - startTime)}`);
            expect(endTime - startTime < timeout);
            done();
        });

        /**
         * @tc.number: FMS_performanceTest_1500
         * @tc.name: Performance test.
         * @tc.desc: Get forms info by module.
         */
        it(`FMS_performanceTest_1500`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_1500`;
            const timeout = 10;

            const startTime = await systemTime.getCurrentTime();
            const data = await formHost.getFormsInfo(`com.form.formsystemtestserviceg.hmservice`, `entry`);
            console.info(`${tcNumber} getFormsInfoByModule result: ${JSON.stringify(data)}`);
            const endTime = await systemTime.getCurrentTime();

            console.info(`${tcNumber} hostTime: ${JSON.stringify(endTime - startTime)}`);
            expect(endTime - startTime < timeout);
            done();
        });

        /**
         * @tc.number: FMS_performanceTest_1600
         * @tc.name: Performance test.
         * @tc.desc: Form System Ready.
         */
        it(`FMS_performanceTest_1600`, 0, async (done) => {
            const tcNumber = `FMS_performanceTest_1600`;
            const timeout = 10;

            const startTime = await systemTime.getCurrentTime();
            const data = await formHost.isSystemReady();
            console.info(`${tcNumber} isSystemReady result: ${JSON.stringify(data)}`);
            const endTime = await systemTime.getCurrentTime();

            console.info(`${tcNumber} hostTime: ${JSON.stringify(endTime - startTime)}`);
            expect(endTime - startTime < timeout);
            done();
        });
    });
}
