/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import stationary from "@ohos.stationary"
import { describe, it, expect } from '@ohos/hypium'
const MSEC_1000 = 1000;

export default function DeviceStatusUnitTest() {
describe('DeviceStatusUnitTest', function () {
    console.log("*************DeviceStatus API Test Begin*************");

    /**
     * @tc.number DeviceStatus_001
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_001', 0, function (done) {
        console.log("msdp_test_devices_status_001 start");
        try {
            stationary.on("highStill", ActivityEvent.ENTER_EXIT, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    
    /**
     * @tc.number DeviceStatus_002
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_002', 0, function (done) {
        console.log("msdp_test_devices_status_002 start");
        try {
            stationary.off("highStill", ActivityEvent.ENTER_EXIT, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    
    /**
     * @tc.number DeviceStatus_003
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_003', 0, function (done) {
        console.log("msdp_test_devices_status_003 start");
        try {
            devicestatus.once("highStill", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_004
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
     it('msdp_test_devices_status_004', 0, function (done) {
        console.log("msdp_test_devices_status_004 start");
        try {
            stationary.on("relativeStill", ActivityEvent.ENTER, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    
    /**
     * @tc.number DeviceStatus_005
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_005', 0, function (done) {
        console.log("msdp_test_devices_status_005 start");
        try {
            stationary.off("relativeStill", ActivityEvent.ENTER, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    
    /**
     * @tc.number DeviceStatus_006
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_006', 0, function (done) {
        console.log("msdp_test_devices_status_006 start");
        try {
            devicestatus.once("relativeStill", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_007
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
     it('msdp_test_devices_status_007', 0, function (done) {
        console.log("msdp_test_devices_status_007 start");
        try {
            stationary.on("relativeStill", ActivityEvent.EXIT, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    
    /**
     * @tc.number DeviceStatus_008
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_008', 0, function (done) {
        console.log("msdp_test_devices_status_008 start");
        try {
            stationary.off("relativeStill", ActivityEvent.EXIT, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })
})
}
