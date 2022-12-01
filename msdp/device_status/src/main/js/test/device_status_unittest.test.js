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
            stationary.once("highStill", (data) => {
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
	 * @tc.callback:AsyncCallback<FineStillResponse>
	 * parameter unknown
	 */
    it('msdp_test_devices_status_004', 0, function (done) {
        console.log("msdp_test_devices_status_004 start");
        try {
            stationary.on("fineStill", ActivityEvent.ENTER_EXIT, 1, (data) => {
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
     * @tc.callback:AsyncCallback<FineStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_005', 0, function (done) {
        console.log("msdp_test_devices_status_005 start");
        try {
            stationary.off("fineStill", ActivityEvent.ENTER_EXIT, (data) => {
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
     * @tc.callback:AsyncCallback<FineStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_006', 0, function (done) {
        console.log("msdp_test_devices_status_006 start");
        try {
            stationary.once("fineStill", (data) => {
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
	 * @tc.callback:AsyncCallback<CarBluetoothResponse>
	 * parameter unknown
	 */
    it('msdp_test_devices_status_007', 0, function (done) {
        console.log("msdp_test_devices_status_007 start");
        try {
            stationary.on("carBluetooth", ActivityEvent.ENTER_EXIT, 1, (data) => {
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
     * @tc.callback:AsyncCallback<CarBluetoothResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_008', 0, function (done) {
        console.log("msdp_test_devices_status_008 start");
        try {
            stationary.off("carBluetooth", ActivityEvent.ENTER_EXIT, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_009
     * @tc.name
     * @tc.callback:AsyncCallback<CarBluetoothResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_009', 0, function (done) {
        console.log("msdp_test_devices_status_009 start");
        try {
            stationary.once("carBluetooth", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
	 * @tc.number DeviceStatus_010
	 * @tc.name
	 * @tc.callback:AsyncCallback<Type_Unknow>
	 * parameter unknown
	 */
    it('msdp_test_devices_status_010', 0, function (done) {
        console.log("msdp_test_devices_status_010 start");
        try {
            stationary.on("Type_Unknow", ActivityEvent.ENTER_EXIT, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_011
     * @tc.name
     * @tc.callback:AsyncCallback<Type_Unknow>
     * parameter unknown
     */
    it('msdp_test_devices_status_011', 0, function (done) {
        console.log("msdp_test_devices_status_011 start");
        try {
            stationary.off("Type_Unknow", ActivityEvent.ENTER_EXIT, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_012
     * @tc.name
     * @tc.callback:AsyncCallback<Type_Unknow>
     * parameter unknown
     */
    it('msdp_test_devices_status_012', 0, function (done) {
        console.log("msdp_test_devices_status_012 start");
        try {
            stationary.once("Type_Unknow", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_013
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_013', 0, function (done) {
        console.log("msdp_test_devices_status_013 start");
        try {
            stationary.on("highStill", ActivityEvent.ENTER, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_014
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_014', 0, function (done) {
        console.log("msdp_test_devices_status_014 start");
        try {
            stationary.off("highStill", ActivityEvent.ENTER, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_015
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_015', 0, function (done) {
        console.log("msdp_test_devices_status_015 start");
        try {
            stationary.once("highStill", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
	 * @tc.number DeviceStatus_016
	 * @tc.name
	 * @tc.callback:AsyncCallback<FineStillResponse>
	 * parameter unknown
	 */
    it('msdp_test_devices_status_016', 0, function (done) {
        console.log("msdp_test_devices_status_016 start");
        try {
            stationary.on("fineStill", ActivityEvent.ENTER, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_017
     * @tc.name
     * @tc.callback:AsyncCallback<FineStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_017', 0, function (done) {
        console.log("msdp_test_devices_status_017 start");
        try {
            stationary.off("fineStill", ActivityEvent.ENTER, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_018
     * @tc.name
     * @tc.callback:AsyncCallback<FineStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_018', 0, function (done) {
        console.log("msdp_test_devices_status_018 start");
        try {
            stationary.once("fineStill", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
	 * @tc.number DeviceStatus_019
	 * @tc.name
	 * @tc.callback:AsyncCallback<CarBluetoothResponse>
	 * parameter unknown
	 */
    it('msdp_test_devices_status_019', 0, function (done) {
        console.log("msdp_test_devices_status_019 start");
        try {
            stationary.on("carBluetooth", ActivityEvent.ENTER, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_020
     * @tc.name
     * @tc.callback:AsyncCallback<CarBluetoothResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_020', 0, function (done) {
        console.log("msdp_test_devices_status_020 start");
        try {
            stationary.off("carBluetooth", ActivityEvent.ENTER, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_021
     * @tc.name
     * @tc.callback:AsyncCallback<CarBluetoothResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_021', 0, function (done) {
        console.log("msdp_test_devices_status_021 start");
        try {
            stationary.once("carBluetooth", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
	 * @tc.number DeviceStatus_022
	 * @tc.name
	 * @tc.callback:AsyncCallback<Type_Unknow>
	 * parameter unknown
	 */
    it('msdp_test_devices_status_022', 0, function (done) {
        console.log("msdp_test_devices_status_022 start");
        try {
            stationary.on("Type_Unknow", ActivityEvent.ENTER, 1, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_023
     * @tc.name
     * @tc.callback:AsyncCallback<Type_Unknow>
     * parameter unknown
     */
    it('msdp_test_devices_status_023', 0, function (done) {
        console.log("msdp_test_devices_status_023 start");
        try {
            stationary.off("Type_Unknow", ActivityEvent.ENTER, (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_024
     * @tc.name
     * @tc.callback:AsyncCallback<Type_Unknow>
     * parameter unknown
     */
    it('msdp_test_devices_status_024', 0, function (done) {
        console.log("msdp_test_devices_status_024 start");
        try {
            stationary.once("Type_Unknow", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_025
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_025', 0, function (done) {
        console.log("msdp_test_devices_status_025 start");
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
     * @tc.number DeviceStatus_026
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_026', 0, function (done) {
        console.log("msdp_test_devices_status_026 start");
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
     * @tc.number DeviceStatus_027
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_027', 0, function (done) {
        console.log("msdp_test_devices_status_027 start");
        try {
            stationary.once("relativeStill", (data) => {
                expect(data.state == -1).assertTrue();
                done();
            })
        } catch (error) {
            console.error('error=' + error);
            done();
        }
    })

    /**
     * @tc.number DeviceStatus_028
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_028', 0, function (done) {
        console.log("msdp_test_devices_status_028 start");
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
     * @tc.number DeviceStatus_029
     * @tc.name
     * @tc.callback:AsyncCallback<HighStillResponse>
     * parameter unknown
     */
    it('msdp_test_devices_status_029', 0, function (done) {
        console.log("msdp_test_devices_status_029 start");
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
