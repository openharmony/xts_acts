/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
// import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonEventManager from '@ohos.commonEventManager';
import Utils from './Util.test';

// let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}
let subscriberForm: CommonEventManager.CommonEventSubscriber;

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

export default function formExtensionAbilityTest() {

    describe("formExtensionAbilityTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formExtensionAbilityTest describe start');

        beforeAll(() => {
            // before run xts, please clean background process.
            // hilog.info(DOMAIN, TAG, 'beforeAll start');
            // await abilityDelegator.executeShellCommand("hilog -r");
            // await abilityDelegator.executeShellCommand("setenforce 0");
            // hilog.info(DOMAIN, TAG, 'beforeAll set selinux to 0');
            //
            // let data: abilityDelegatorRegistry.ShellCmdResult =
            //     await abilityDelegator.executeShellCommand("getenforce");
            // let message: string = data.stdResult;
            // hilog.info(DOMAIN, TAG, 'beforeAll check selinux : %{public}s', message);
            //
            // let data2: abilityDelegatorRegistry.ShellCmdResult =
            //     await abilityDelegator.executeShellCommand("hilog -G 16M");
            // let message2: string = data2.stdResult;
            // hilog.info(DOMAIN, TAG, 'beforeAll set hilog buffer size: %{public}s', message2);
            //
            // await Utils.msSleep(1000);
            // hilog.info(DOMAIN, TAG, 'beforeAll end');
        })

        it("OnStopTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, 'OnStopTest001 start');

            let FormExtensionAbilityOnStopTest_Event: CommonEventManager.CommonEventSubscribeInfo = {
                events: ["XTS_FormExtensionAbilityOnStopTest_commonEvent"],
            };
            let isChecked: boolean = false;
            subscriberForm = CommonEventManager.createSubscriberSync(FormExtensionAbilityOnStopTest_Event);
            let onStopCallBack = (_: BusinessError | null, data: CommonEventManager.CommonEventData) => {
                isChecked = true;
                hilog.info(DOMAIN, TAG, 'OnStopTest001 onStopCallBack' + JSON.stringify(data));
                expect(data.event).assertEqual("XTS_FormExtensionAbilityOnStopTest_commonEvent");
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("OnStopTest001"));
            }
            CommonEventManager.subscribe(subscriberForm, onStopCallBack);

            expect(Utils.startAbility(
                "EntryAbility",
                "com.example.myapplication0515",
            )).assertTrue();

            // second method to assert, need to trigger off setenforce by `hdc shell setenforce 0`
            // wait the interface OnStop 10 seconds if want to check callback.
            // await Utils.msSleep(200);
            // 15000ms the test runner will timeout.
            // await Utils.msSleep(12000);
            // let cmdCheckFormComponent: string ='hilog -x | grep OnStop';
            // let res: boolean = await Utils.executeCmd(cmdCheckFormComponent, 'OnStop callback success');
            // expect(res).assertTrue();

            await Utils.msSleep(12000); // waiting for the async subscribe.
            if (!isChecked) {
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("OnStopTest001"));
                expect(false).assertTrue();
            }

            done();
            hilog.info(DOMAIN, TAG, 'OnStopTest001 end');
        })
    })
}