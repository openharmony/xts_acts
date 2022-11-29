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
import app from '@system.app'
import devicestatus from '@ohos.devicestatus';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

var reportLatencyNs = 100;

describe('msdpInfoTest', function () {

    /**
     * @tc.number DeviceStatus_001
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
    it('msdp_test_devices_status_001',0, async function(done) {
        console.log("device_status_type_001 start")
        devicestatus.on('still',deviceStatus.ActivityEvent.ENTER,reportLatencyNs,(data) => {
            expect(data.ActivityState == 1).assertTrue();
            //unregister
            devicestatus.off('still',deviceStatus.ActivityEvent.ENTER,() => {
                console.log("msdp_test_devices_status_001 off success");
                done();
                console.log("msdp_test_devices_status_001 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_002
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
    it('msdp_test_devices_status_002',0, async function(done) {
        console.log("device_status_type_002 start")
        devicestatus.on('relativeStill',deviceStatus.ActivityEvent.ENTER,reportLatencyNs,(data) => {
            expect(data.ActivityState == 1).assertTrue();
            //unregister
            devicestatus.off('relativeStill',deviceStatus.ActivityEvent.ENTER,() => {
                console.log("msdp_test_devices_status_002 off success");
                 done();
                console.log("msdp_test_devices_status_002 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_003
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
    it('msdp_test_devices_status_003',0, async function(done) {
        console.log("device_status_type_003 start")
        devicestatus.on('still',deviceStatus.ActivityEvent.EXIT,reportLatencyNs,(data) => {
            expect(data.ActivityState == 2).assertTrue();
            //unregister
            devicestatus.off('still',deviceStatus.ActivityEvent.EXIT,() => {
                console.log("msdp_test_devices_status_003 off success");
                done();
                console.log("msdp_test_devices_status_003 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_004
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
     it('msdp_test_devices_status_004',0, async function(done) {
        console.log("device_status_type_004 start")
        devicestatus.on('relativeStill',deviceStatus.ActivityEvent.EXIT,reportLatencyNs,(data) => {
            expect(data.ActivityState == 2).assertTrue();
            //unregister
            devicestatus.off('relativeStill',deviceStatus.ActivityEvent.EXIT,() => {
                console.log("msdp_test_devices_status_004 off success");
                done();
                console.log("msdp_test_devices_status_004 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_005
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
     it('msdp_test_devices_status_005',0, async function(done) {
        console.log("device_status_type_005 start")
        devicestatus.on('still',deviceStatus.ActivityEvent.ENTER_EXIT,reportLatencyNs,(data) => {
            expect(data.ActivityState !== -1).assertTrue();
            //unregister
            devicestatus.off('still',deviceStatus.ActivityEvent.ENTER_EXIT,() => {
                console.log("msdp_test_devices_status_005 off success");
                done();
                console.log("msdp_test_devices_status_005 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_006
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
     it('msdp_test_devices_status_006',0, async function(done) {
        console.log("device_status_type_006 start")
        devicestatus.on('relativeStill',deviceStatus.ActivityEvent.ENTER_EXIT,reportLatencyNs,(data) => {
            expect(data.ActivityState !== -1).assertTrue();
            //unregister
            devicestatus.off('relativeStill',deviceStatus.ActivityEvent.ENTER_EXIT,() => {
                console.log("msdp_test_devices_status_006 off success");
                done();
                console.log("msdp_test_devices_status_006 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_007
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
     it('msdp_test_devices_status_007',0, async function(done) {
        console.log("device_status_type_007 start")
        devicestatus.on('still',deviceStatus.ActivityEvent.ENTER,reportLatencyNs,(data) => {
            expect(data.ActivityState == 1).assertTrue();
            //unregister
            devicestatus.off('still',deviceStatus.ActivityEvent.ENTER,() => {
                console.log("msdp_test_devices_status_007 off success");
                done();
                console.log("msdp_test_devices_status_007 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_008
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse>
     * -1 
     */
     it('msdp_test_devices_status_008',0, async function(done) {
        console.log("msdp_test_devices_status_008 start");
        devicestatus.once('still',(data) => {
            console.log("data="+ JSON.stringify(data));
            expect(data.ActivityState == 1).assertTrue();
            done();
            console.log("msdp_test_devices_status_008 once success");
        })
    })

    /**
     * @tc.number DeviceStatus_009
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse> 
     * Normal
     */
     it('msdp_test_devices_status_009',0, async function(done) {
        console.log("device_status_type_009 start")
        devicestatus.on('relativeStill',deviceStatus.ActivityEvent.EXIT,reportLatencyNs,(data) => {
            expect(data.ActivityState == 2).assertTrue();
            //unregister
            devicestatus.off('relativeStill',deviceStatus.ActivityEvent.ENTER,() => {
                console.log("msdp_test_devices_status_009 off success");
                 done();
                console.log("msdp_test_devices_status_009 success");
            })
        })
    })

    /**
     * @tc.number DeviceStatus_010
     * @tc.name 
     * @tc.callback:AsyncCallback<HighStillResponse>
     * -1 
     */
     it('msdp_test_devices_status_010',0, async function(done) {
        console.log("msdp_test_devices_status_010 start");
        devicestatus.once('relativeStill',(data) => {
            console.log("data="+ JSON.stringify(data));
            expect(data.ActivityState == 2).assertTrue();
            done();
            console.log("msdp_test_devices_status_010 once success");
        })
    })
})


