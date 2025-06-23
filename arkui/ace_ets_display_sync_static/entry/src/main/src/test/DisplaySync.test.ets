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

import { describe, beforeEach, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Utils, startAbility, stopApplication } from './Util.test';
import displaySync from "@ohos.graphics.displaySync"
let domain: number = 0x0000;
let tag: string = 'DisplaySync';
let bundleName = "com.open.harmony.displaysynctest.static";

export default function displaySyncTest() {

    describe("displaySyncTest", (): void => {
        beforeAll(async () : Promise<void> => {
            hilog.info(domain, tag, "displaySyncTest loadup start!!!!!")
            await Utils.loadAndSetUpUiTest();
            await Utils.msSleep(2000)
            hilog.info(domain, tag, "displaySyncTest loadup over!!!!!")
        })
        /*
         * @tc.number     : DISPLAY_SYNC_STATIC_0001
         * @tc.name       : displaySync_static_0001
         * @tc.desc       : 注册displaySync 回调
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 0
         */
        it("displaySync_static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            await startAbility(bundleName, 'EntryAbility');
            let driver = Driver.create();
            let start = await driver.findComponent(ON.text('start'));
            expect(start != null).assertTrue()
            await driver.delayMs(1000);
            if (start != null) {
                await start.click();
            }
            let stop = await driver.findComponent(ON.text('stop'));
            expect(stop != null).assertTrue();
            await driver.delayMs(1000);
            if (stop != null) {
                await stop.click();
            }
            let timestamp = await driver.findComponent(ON.id('timestamp'));
            let targetTimestamp = await driver.findComponent(ON.id('targetTimestamp'));
            expect(timestamp != null).assertTrue();
            expect(targetTimestamp != null).assertTrue();
            if (timestamp != null && targetTimestamp != null) {
                let timestampMsg = await timestamp.getText();
                let targetTimestampMsg = await targetTimestamp.getText();
                expect(timestampMsg != "0").assertTrue();
                expect(targetTimestampMsg != "0").assertTrue();
            }
        })
    })
}
