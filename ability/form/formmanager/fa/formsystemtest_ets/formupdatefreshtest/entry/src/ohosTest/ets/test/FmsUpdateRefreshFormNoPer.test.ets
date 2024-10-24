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
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';


function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function FmsUpdateRefreshNoPerTest() {
    describe(`FmsUpdateRefreshNoPerTest`, () => {
       /**
        * @tc.number: FMS_hostRefreshNoPer_0100
        * @tc.name: The form user has no form permission.
        * @tc.desc: 1.The form user A to invoke the intiative timed refresh interface.
        *           2.Verify the result of the intiative timed refresh interface.
        */
        it(`FMS_hostRefreshNoPer_0100`, 0, async (done: () => void) => {
            console.log(`FMS_hostRefreshNoPer_0100 start`);

            let FMS_hostRefreshNoPer_0100_Temp = () => {
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
                }).then((res) => {
                    console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbilityhost res: ${JSON.stringify(res)}`);
                    expect().not().assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbilityhost error: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
                console.log(`FMS_hostRefreshNoPer_0100 featureAbility.startAbility end`);
            }

            expect().not().assertFail();
            done();
            await sleep(2000);
            console.log(`FMS_hostRefreshNoPer_0100 end`);
        });

    });
}
