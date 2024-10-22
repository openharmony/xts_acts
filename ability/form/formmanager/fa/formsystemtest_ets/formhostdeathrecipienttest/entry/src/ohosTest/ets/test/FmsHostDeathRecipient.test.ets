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
import { beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';

let tcNumber: string;

export default function test() {
    describe(`FmsHostDeathRecipientTest`, () => {

        /**
         * @tc.number: FMS_hostDeathRecipient_0200
         * @tc.name: Reset host ability and requestForm.
         * @tc.desc: The provider's onDestroy event will be triggered.
         */
        it(`FMS_hostDeathRecipient_0200`, 0, async (done: () => void) => {
            tcNumber = `FMS_hostDeathRecipient_0200`;
            let bundleName: string = `com.ohos.st.formsystemhostk`;
            let abilityName: string = `com.ohos.st.formsystemhostk.MainAbility`;

            try {
                const res = await featureAbility.startAbility({
                    want: {
                        bundleName,
                        abilityName,
                        parameters: {
                            formId: '0',
                            name: 'Form_Js001',
                            bundle: 'com.acts.form.formsystemtestservicef.hmservice',
                            ability: 'FormAbility',
                            moduleName: 'entry',
                            temporary: false,
                            isCreate: false,
                            createTempAndNormal: false,
                            subscribeTerminate: false,
                            tempParam: {
                                formId: '0',
                                name: 'Form_Js001',
                                bundle: 'com.acts.form.formsystemtestservicef.hmservice',
                                ability: 'FormAbility',
                                moduleName: 'entry'
                            }
                        }
                    }
                });
                console.info(`${tcNumber} featureAbility.startAbility res: ${JSON.stringify(res)}`);
                expect().not().assertFail();
                done();
            } catch(err) {
                console.info(`${tcNumber} featureAbility.startAbility error: ${JSON.stringify(err)}`);
                console.info(`${tcNumber} should not reach here`);
                expect().assertFail();
                done();
            }

            await sleep(2000);
            done();
        });
    });
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}
