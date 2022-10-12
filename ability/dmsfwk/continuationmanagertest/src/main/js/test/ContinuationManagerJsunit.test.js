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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import continuationManager from '@ohos.continuation.continuationManager';

const TEST_DEVICE_ID = "test_deviceId";
const TEST_CONNECT_STATUS = continuationManager.DeviceConnectState.CONNECTED;
let token = -1;

export default function continuationManagerTest() {
describe('continuationManagerTest', function() {

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
            console.info("testRegister001Begin ");
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
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0200
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 002
     */
    it('testRegister002', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: [],
                targetBundle: "",
                description: "",
                filter: "",
                continuationMode: null,
                authInfo: {}
            };
            continuationManager.register(continuationExtraParams, function(err, data){
                console.info("testRegister002 " + err.message);
                expect(err.message == "Invalidate params.").assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0300
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 003
     */
    it('testRegister003', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 10,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams, function(err, data) {
                expect(err.code == 29360216).assertTrue();
                console.info("testRegister003 "+ err);
                done();
            });
        } catch (e) {
            console.info("testRegister003 " + e);
            expect(null).assertFail();
            done();
        }
    })

     /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0400
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 004
     */
    it('testRegister004', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams, function(err, data) {
                expect(err.code == 0).assertTrue();
                expect(data - token == 1).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister004 " + e);
            expect(null).assertFail();
            done();
        }
    })


     /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0500
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 005
     */
      it('testRegister005', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams, function(err, data) {
                expect(err.code == 0).assertTrue();
                expect(data - token == 1).assertTrue();
                done();
            });
        } catch (e) {
            console.info("testRegister005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0600
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 006
     */
     it('testRegister006', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                targetBundle: "ohos.example.test",
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data - token == 1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister006 " + e);
            expect(null).assertFail();
        }
        done();
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0700
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 007
     */
     it('testRegister007', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data - token == 1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister007 " + e);
            expect(null).assertFail();
        }
        done();
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0800
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 008
     */
     it('testRegister008', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: [],
                description: "",
                filter: "",
                continuationMode: null,
                authInfo: {}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data - token != 1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister008 " + e);
            expect(null).assertFail();
        }
        done();
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_0900
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 009
     */
     it('testRegister009', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 10,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.register(continuationExtraParams).then((data) => {
                expect(data - token != 1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testRegister009 " + e);
            expect(null).assertFail();
            done();
        }
    })

    
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_REGISTER_1000
     * @tc.name [JS-API8]ContinuationManager.register().
     * @tc.desc Test Js Api ContinuationManager.register() testcase 010
     */
     it('testRegister010', 0, async function(done) {
        try {
            continuationManager.register().then((data) => {
                expect(data - token == 1).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
        } catch (e) {
            console.info("testRegister010 " + e);
            expect(null).assertFail();
        }
        done();
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
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0200
     * @tc.name [JS-API8]ContinuationManager.unregister().
     * @tc.desc Test Js Api ContinuationManager.unregister() testcase 002
     */
    it('testUnregister002', 0, async function(done) {
        try {
            continuationManager.unregister(null, function (err, data) {
                console.info("testUnregister002 " + data);
                expect(err.message == "Invalidate params.").assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister002 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0300
    * @tc.name [JS-API8]ContinuationManager.unregister().
    * @tc.desc Test Js Api ContinuationManager.unregister() testcase 003
    */
    it('testUnregister003', 0, async function(done) {
        try {
            continuationManager.unregister(300, function (err, data) {
                expect(err.code == 29360208).assertTrue();
                expect(data == undefined).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister003 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0400
    * @tc.name [JS-API8]ContinuationManager.unregister().
    * @tc.desc Test Js Api ContinuationManager.unregister() testcase 004
    */
     it('testUnregister004', 0, async function(done) {
        try {
            continuationManager.unregister(300, function (data) {
                expect(data.code == 29360208).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    
    /**
    * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UNREGISTER_0500
    * @tc.name [JS-API8]ContinuationManager.unregister().
    * @tc.desc Test Js Api ContinuationManager.unregister() testcase 005
    */
     it('testUnregister005', 0, async function(done) {
        try {
            continuationManager.unregister(token, function (data) {
                console.info("testUnregister005 " + JSON.stringify(data));
                expect(data.code == 0).assertTrue();
            })
            done();
        } catch (e) {
            console.info("testUnregister005 " + e);
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
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOn001 " + e);
            expect(e.toString().includes("must be 3")).assertTrue();
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
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOn002 " + e);
            expect(e.toString().includes("must be 3")).assertTrue();
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
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOff001 " + e);
            expect(e.toString().includes("must be string")).assertTrue();
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
                expect(data != null).assertFail();
            });
            done();
        } catch (e) {
            console.info("testOff002 " + e);
            expect(e.toString().includes("must be string")).assertTrue();
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
            done();
        } catch (e) {
            console.info("testOff003 " + e);
            expect(e.toString().includes("Callback is not registered")).assertTrue();
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
            expect(e.toString().includes("Callback is not registered")).assertTrue();
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
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0200
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 002
     */
     it('testStartDeviceManager002', 0, async function(done) {
        try {
            continuationManager.startDeviceManager(null, function (err, data) {
                expect(err.code == -1).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0300
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 003
     */
    it('testStartDeviceManager003', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(null, continuationExtraParams, function (err, data) {
                expect(err.code == -1).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager003 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0400
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 004
     */
    it('testStartDeviceManager004', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MULTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(52, continuationExtraParams, function (err, data) {
                console.info("testStartDeviceManager004 " + err.code);
                expect(err.code == 29360208).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager004 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0500
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 005
     */
    it('testStartDeviceManager005', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: 30,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                console.info("testStartDeviceManager005 " + err.code);
                expect(err.code == 29360216).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager005 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0600
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 006
     */
    it('testStartDeviceManager006', 0, async function(done) {
        try {
            let continuationExtraParams = {
            };
            continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                console.info("testStartDeviceManager006 " + err.code);
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager006 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0700
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 007
     */
    it('testStartDeviceManager007', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_MUTIPLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(token, continuationExtraParams, function (err, data) {
                expect(err.code != 0).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager007 " + e);
            expect(null).assertFail();
            done();
        }
    })
    
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0800
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 008
     */
     it('testStartDeviceManager008', 0, async function(done) {
        try {
            let continuationExtraParams = {
                deviceType: ["00E"],
                description: "description",
                filter: {"name": "authInfo","length": 8},
                continuationMode: continuationManager.ContinuationMode.COLLABORATION_SINGLE,
                authInfo: {"name": "authInfo","length": 8}
            };
            continuationManager.startDeviceManager(token, continuationExtraParams).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager008 " + e);
            expect(null).assertFail();
            done();
        }
    })

        
    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_STARTDEVICEMANAGER_0900
     * @tc.name [JS-API8]ContinuationManager.startDeviceManager().
     * @tc.desc Test Js Api ContinuationManager.startDeviceManager() testcase 009
     */
     it('testStartDeviceManager009', 0, async function(done) {
        try {
            continuationManager.startDeviceManager(token).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testStartDeviceManager009 " + e);
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

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0200
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 002
     */
    it('testUpdateConnectStatus002', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(null, TEST_DEVICE_ID, TEST_CONNECT_STATUS, function (err, data) {
                console.info("testUpdateConnectStatus002 " + err.code);
                expect(err.code == -1).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus002 " + e);
            expect(null).assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0300
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 003
     */
    it('testUpdateConnectStatus003', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, -2, function (err, data) {
                console.info("testUpdateConnectStatus003 " + err.code);
                expect(err.code == 29360215).assertTrue();
                expect(data == undefined).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus003 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0400
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 004
     */
     it('testUpdateConnectStatus004', 0, async function(done) {
        try {
            console.info('testUpdateConnectStatus004 begin');
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.IDLE).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus004 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0500
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 005
     */
     it('testUpdateConnectStatus005', 0, async function(done) {
        try {
            console.info('testUpdateConnectStatus005 begin');
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.CONNECTING).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus005 " + e);
            expect(null).assertFail();
            done();
        }
    })


    /**
     * @tc.number SUB_DISTRIBUTEDSCHEDULE_CONTINUATIONMANAGER_UPDATECONNECTSTATUS_0600
     * @tc.name [JS-API8]ContinuationManager.updateConnectStatus().
     * @tc.desc Test Js Api ContinuationManager.updateConnectStatus() testcase 006
     */
     it('testUpdateConnectStatus006', 0, async function(done) {
        try {
            continuationManager.updateConnectStatus(token, TEST_DEVICE_ID, 
                continuationManager.DeviceConnectState.DISCONNECTING).then((data) => {
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                expect(err.code == 29360210).assertTrue();
            });
            done();
        } catch (e) {
            console.info("testUpdateConnectStatus006 " + e);
            expect(null).assertFail();
            done();
        }
    })


})}
