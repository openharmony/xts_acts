/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import continuationManager from '@ohos.continuation.continuationManager';

const TEST_DEVICE_ID = "test_deviceId";
const TEST_CONNECT_STATUS = continuationManager.DeviceConnectState.CONNECTED;
let token = -1;

describe('ContinuationManagerTest', function() {

    beforeAll(async function (done) {
        console.info('beforeAll');
        done();
    })

    afterAll(async function (done) {
        console.info('afterAll');
        done();
    })

    beforeEach(async function (done) {
        console.info('beforeEach');
        await continuationManager.register(function (err, data) {
            token = data;
            console.info('beforeEach register success');
            done();
        });
        console.info('beforeEach end');
    })

    afterEach(async function (done) {
        console.info('afterEach');
        await continuationManager.unregister(token, function (err, data) {
            console.info('afterEach unregister success');
            done();
        });
        console.info('afterEach end');
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0100
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 001
     */
    it('testRegister001', 0, async function(done) {
        try {
            continuationManager.register(function (err, data) {
                expect(err.code == 0).assertTrue();
                expect(data - token == 1).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0100
     * @tc.name [JS-API8]ContinuationManager.unregister().
     * @tc.desc Test Js Api ContinuationManager.unregister() testcase 001
     */
    it('testUnregister001', 0, async function(done) {
        try {
            continuationManager.unregister(token, function (err, data) {
                expect(err.code == 0).assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0100
     * @tc.name [JS-API8]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 001
     */
    it('testOn001', 0, async function(done) {
        try {
            continuationManager.on("deviceConnect", function (data) {
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testOn001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0200
     * @tc.name [JS-API8]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 002
     */
    it('testOn002', 0, async function(done) {
        try {
            continuationManager.on("deviceDisconnect", function (data) {
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testOn002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0300
     * @tc.name [JS-API9]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 003
     */
    it('testOn003', 0, async function(done) {
        try {
            continuationManager.on("deviceConnect", token, function (data) {
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testOn003 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_ON_0400
     * @tc.name [JS-API9]ContinuationManager.on().
     * @tc.desc Test Js Api ContinuationManager.on() testcase 004
     */
    it('testOn004', 0, async function(done) {
        try {
            continuationManager.on("deviceDisconnect", token, function (data) {
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testOn004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0100
     * @tc.name [JS-API8]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 001
     */
    it('testOff001', 0, async function(done) {
        try {
            continuationManager.off("deviceConnect", function (data) {
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testOff001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0200
     * @tc.name [JS-API8]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 002
     */
    it('testOff002', 0, async function(done) {
        try {
            continuationManager.off("deviceDisconnect", function (data) {
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testOff002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0300
     * @tc.name [JS-API9]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 003
     */
    it('testOff003', 0, async function(done) {
        try {
            continuationManager.off("deviceConnect", token);
            done();
        } catch (e) {
            console.info("testOff003 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_OFF_0400
     * @tc.name [JS-API9]ContinuationManager.off().
     * @tc.desc Test Js Api ContinuationManager.off() testcase 004
     */
    it('testOff004', 0, async function(done) {
        try {
            continuationManager.off("deviceDisconnect", token);
            done();
        } catch (e) {
            console.info("testOff004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0100
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 001
     */
    it('testStartDeviceManager001', 0, async function(done) {
        try {
            continuationManager.startDeviceManager(token, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager001 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0100
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 001
     */
    it('testUpdateConnectStatus001', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus001 " + e);
            expect(null).assertFail();  
            done();
        }
    })
})