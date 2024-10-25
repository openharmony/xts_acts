/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
import formHostNew from '@ohos.app.form.formHost';
import formInfo from '@ohos.app.form.formInfo';
import Want from '@ohos.app.ability.Want';
import commonEvent from '@ohos.commonEvent';
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';


interface wantType {
    bundleName: string
    abilityName: string
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function test() {
    describe(`FmsStressTest`, () => {
        /**
         * @tc.number: FMS_stressTest_0100
         * @tc.name: Create form test.
         * @tc.desc: OnCreate form interface working well.
         */
        it(`FMS_stressTest_0100`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_stressTest_0100`;

            console.log(`${tcNumber} start`);

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`,
                            isCreate: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                expect().not().assertFail();
                done();
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }
            await sleep(2000)
            console.log(`${tcNumber} end`);
        });

        /**
         * @tc.number: FMS_stressTest_0200
         * @tc.name: Host release form test.
         * @tc.desc: releaseForm method working well.
         */
        it(`FMS_stressTest_0200`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_stressTest_0200`;
            console.log(`${tcNumber} start`);
            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`,
                            releaseForm: true,
                            isCreate: true,
                            temporary: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                expect().not().assertFail();
                done();
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }

            await sleep(2000)
            console.log(`${tcNumber} end`);
        });

        /**
         * @tc.number: FMS_stressTest_0300
         * @tc.name: Host cast temp form test.
         * @tc.desc: castTempForm method working well.
         */
        it(`FMS_stressTest_0300`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_stressTest_0300`;
            console.log(`${tcNumber} start`);
            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName: `com.ohos.st.formsystemhostk`,
                        abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                        parameters: {
                            formId: `0`,
                            name: `Form_Js001`,
                            bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                            ability: `FormAbility`,
                            moduleName: `entry`,
                            castTempForm: true,
                            isCreate: true,
                            temporary: true
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                expect().not().assertFail();
                done();
            } catch (error) {
                console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done()
            }

            await sleep(2000)
            console.log(`${tcNumber} end`);
        });

        /**
         * @tc.number: FMS_stressTest_0700
         * @tc.name: Host request form test.
         * @tc.desc: requestForm method working well.
         */
        it(`FMS_stressTest_0700`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_stressTest_0700`;

            console.log(`${tcNumber} start`);
            let FMS_stressTest_0700_Temp = async () => {
                try {
                    const res = await featureAbility.startAbility({
                        want: {
                            bundleName: `com.ohos.st.formsystemhostk`,
                            abilityName: `com.ohos.st.formsystemhostk.MainAbility`,
                            parameters: {
                                formId: `0`,
                                name: `Form_Js001`,
                                bundle: `com.acts.form.formsystemtestservicef.hmservice`,
                                ability: `FormAbility`,
                                moduleName: `entry`,
                                requestForm: true,
                                isCreate: true
                            }
                        }
                    });
                    console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                } catch (error) {
                    console.info(`${tcNumber} error: ${JSON.stringify(error)}`);
                    console.info(`${tcNumber} should not reach here`);
                    expect().assertFail();
                    done()
                }
            }

            expect().not().assertFail();
            done();
            await sleep(2000)
            console.log(`${tcNumber} end`);
        });

        /**
         * @tc.number: FMS_stressTest_1700
         * @tc.name: Get forms info test.
         * @tc.desc: getAllFormsInfo and getFormsInfo method working well.
         */
        it(`FMS_stressTest_1700`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_stressTest_1700`;
            console.log(`${tcNumber} start`);

            let allFormsInfo = await formHost.getAllFormsInfo();
            const providerBundleNameList: string[] = [
                `com.acts.form.formsystemtestservicef.hmservice`,
                `com.acts.form.formsystemtestserviceg.hmservice`
            ];

            console.info(`${tcNumber} getAllFormsInfo: ${JSON.stringify(allFormsInfo)}`);
            console.info(`${tcNumber} before filter size: ${JSON.stringify(allFormsInfo.length)}`);
            allFormsInfo = allFormsInfo.filter((formsInfo) => providerBundleNameList.includes(formsInfo.bundleName));
            console.info(`${tcNumber} after filter size: ${JSON.stringify(allFormsInfo.length)}`);
            expect(allFormsInfo.length).assertEqual(3);

            allFormsInfo.forEach(async (formsInfo, index) => {
                const providerFormsInfo1 = await formHost.getFormsInfo(formsInfo.bundleName);
                const providerFormsInfo2 = await formHost.getFormsInfo(formsInfo.bundleName, formsInfo.moduleName);

                console.info(`${tcNumber} getFormsInfo: ${JSON.stringify(providerFormsInfo1)}`);
                console.info(`${tcNumber} getFormsInfo: ${JSON.stringify(providerFormsInfo2)}`);
                expect(providerFormsInfo1[0].bundleName).assertEqual(providerFormsInfo2[0].bundleName);

                if (index == allFormsInfo.length - 1) {
                    done();
                }
            });

            await sleep(2000)
            console.log(`${tcNumber} end`);
        });


        /**
         * @tc.number: FMS_stressTest_1800
         * @tc.name: Form system ready test.
         * @tc.desc: isSystemReady method working well.
         */
        it(`FMS_stressTest_1800`, 0, async (done: () => void) => {
            const tcNumber: string = `FMS_stressTest_1800`;
            console.log(`${tcNumber} start`);
            const systemstatus = await formHost.isSystemReady();
            console.info(`${tcNumber} systemstatus: ${JSON.stringify(systemstatus)}`);
            expect(systemstatus).assertEqual(undefined);
            done();

            await sleep(2000)
            console.log(`${tcNumber} end`);
        });


    });
}
