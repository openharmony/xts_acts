/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium'


export default function BatteryStatisticsEmptyTest() {
describe('BatteryStatisticsEmptyTest', function () {
    /**
     * @tc.number SUB_PowerSystem_BatteryStatisticsEmpty_JSTest_0010
     * @tc.name testBatteryStatisticsEmptyTest_0100
     * @tc.desc BatteryStatisticsEmptyTest
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('BatteryStatisticsEmptyTest_0100', 0, async function (done) {
        let TAG = 'BatteryStatisticsEmptyTest_0100';
        let isSupport = canIUse('SystemCapability.PowerManager.BatteryStatistics');
        console.info(`${TAG} this testcase is empty, isSupport:${isSupport}`);
        expect(isSupport).assertFalse();
    })
})
}
