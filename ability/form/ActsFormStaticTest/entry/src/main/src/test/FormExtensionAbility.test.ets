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
import CommonEventManager from '@ohos.commonEventManager';
import Utils from './Util.test';


const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}
let subscriberForm: CommonEventManager.CommonEventSubscriber;

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

export default function formExtensionAbilityTest() {
    describe("formExtensionAbilityTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formExtensionAbilityTest describe start');

        /**
         * @tc.number: OnStopStaticTest001
         * @tc.name: check OnStop
         * @tc.desc: check OnStop
         */
        it("OnStopStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, 'OnStopStaticTest001 start');

            let FormExtensionAbilityOnStopTest_Event: CommonEventManager.CommonEventSubscribeInfo = {
                events: ["XTS_FormExtensionAbilityOnStopTest_commonEvent"],
            };
            let isChecked: boolean = false;
            subscriberForm = CommonEventManager.createSubscriberSync(FormExtensionAbilityOnStopTest_Event);
            let onStopCallBack = (_: BusinessError | null, data: CommonEventManager.CommonEventData) => {
                isChecked = true;
                hilog.info(DOMAIN, TAG, 'OnStopStaticTest001 onStopCallBack' + JSON.stringify(data));
                expect(data.event).assertEqual("XTS_FormExtensionAbilityOnStopTest_commonEvent");
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("OnStopStaticTest001"));
            }
            CommonEventManager.subscribe(subscriberForm, onStopCallBack);

            expect(Utils.startAbility(
                "EntryAbility",
                "com.example.myapplication0515",
            )).assertTrue();

            await Utils.msSleep(12000); // waiting for the async subscribe.
            if (!isChecked) {
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("OnStopStaticTest001"));
                expect(false).assertTrue();
            }

            done();
            hilog.info(DOMAIN, TAG, 'OnStopStaticTest001 end');
        })
    })
}