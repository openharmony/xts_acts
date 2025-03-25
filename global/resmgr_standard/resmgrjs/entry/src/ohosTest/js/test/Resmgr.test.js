/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import resmgr from '@ohos.resourceManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function resMgrTest() {
describe('resMgrTest', function () {
    console.log('*************start ResmgrTest*************');

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0100
    * @tc.name    test getResourceManager method in callback mode
    * @tc.desc    get the resource manager in callback mode
    */
    it('getResourceManager_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            expect(mgr !== null).assertTrue();
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0200
    * @tc.name    test getResourceManager method in callback mode with bundlename
    * @tc.desc    get the resource manager in callback mode with bundlename
    */
    it('getResourceManager_test_002', Level.LEVEL0, async function (done) {
        console.log('getResourceManager_test_002 0');
        resmgr.getResourceManager('ohos.resmgr.test', (error, mgr) => {
            console.log('getResourceManager_test_002 1');
            expect(mgr !== null).assertTrue();
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0300
    * @tc.name    test getResourceManager method in promise mode
    * @tc.desc    get the resource manager in promise mode
    */
    it('getResourceManager_test_003', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager().then(mgr => {
            expect(mgr !== null).assertTrue();
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0400
    * @tc.name    test getResourceManager method in promise mode with bundlename
    * @tc.desc    get the resource manager in promise mode with bundlename
    */
    it('getResourceManager_test_004', Level.LEVEL0, async function (done) {
        console.log('getResourceManager_test_004 0');
        resmgr.getResourceManager('ohos.resmgr.test').then(mgr => {
            console.log('getResourceManager_test_004 1');
            expect(mgr !== null).assertTrue();
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0500
    * @tc.name    test getString method in callback mode
    * @tc.desc    get the string in callback mode
    */
    it('getString_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString(0x2000008, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getString_test_001 ' + value);
                expect(value).assertEqual('L2Test');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0600
    * @tc.name    test getString method in promise mode
    * @tc.desc    get the string in promise mode
    */
    it('getString_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString(0x2000008).then(value => {
                expect(value !== null).assertTrue();
                console.log('getString_test_002 ' + value);
                expect(value).assertEqual('L2Test');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1900
    * @tc.name    test getString method in callback mode
    * @tc.desc    get the string in callback mode
    */
    it('getString_test_003', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString(0x2000009, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getString_test_003 ' + value);
                expect(value).assertEqual('JS_Phone_Empty Feature Ability');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0500
    * @tc.name    test getString method in callback mode
    * @tc.desc    get the string in callback mode
    */
    it('getStringValue_test_003', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringValue(0x2000008, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringValue_test_003 ' + value);
                expect(value).assertEqual('L2Test');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0600
    * @tc.name    test getString method in promise mode
    * @tc.desc    get the string in promise mode
    */
    it('getStringValue_test_004', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringValue(0x2000008).then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringValue_test_004 ' + value);
                expect(value).assertEqual('L2Test');
                done();
            })
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0500
    * @tc.name test getString method in callback mode
    * @tc.desc get the string in callback mode
    */
    it('getStringValue_test_005', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // 0x1001 id not exist,throw 9001001 error code
                mgr.getStringValue(0x1001, (err, value) => {
                    if(err){
                        console.log('getStringValue_test_005 err.code' + err.code);
                        console.log('getStringValue_test_005 err.message' + err.message);
                        expect(err.code == 9001001).assertTrue();
                        done();
                    }else{
                        console.log('getStringValue_test_005 2');
                        expect(value !== null).assertTrue();
                        console.log('getStringValue_test_005 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('getStringValue_test_005 e.code' + e.code);
                console.log('getStringValue_test_005 e.message' + e.message);
            }
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0500
    * @tc.name test getString method in callback mode
    * @tc.desc get the string in callback mode
    */
    it('getStringValue_test_006', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // 0x01000000 id is integer resource,throw 9001002 error code
                mgr.getStringValue(0x2000000, (err, value) => {
                    if(err){
                        console.log('getStringValue_test_006 err.code' + err.code);
                        console.log('getStringValue_test_006 err.message' + err.message);
                        expect(err.code == 9001002).assertTrue();
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('getStringValue_test_006 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('getStringValue_test_006 e.code' + e.code);
                console.log('getStringValue_test_006 e.message' + e.message);
            }
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0500
    * @tc.name test getString method in callback mode
    * @tc.desc get the string in callback mode
    */
    it('getStringValue_test_007', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // 0x01000006 id re-ref,throw 9001006 error code
                mgr.getStringValue(0x2000006, (err, value) => {
                    if(err){
                        console.log('getStringValue_test_007 err.code' + err.code);
                        console.log('getStringValue_test_007 err.message' + err.message);
                        expect(err.code == 9001006).assertTrue();
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('getStringValue_test_007 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('getStringValue_test_007 e.code' + e.code);
                console.log('getStringValue_test_007 e.message' + e.message);
            }
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0500
    * @tc.name test getString method in callback mode
    * @tc.desc get the string in callback mode
    */
    it('getStringValue_test_008', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // param type not correct,throw 401 error code
                mgr.getStringValue('name', (err, value) => {
                    if(err){
                        console.log('getStringValue_test_008 err.code:' + err.code);
                        console.log('getStringValue_test_008 err.message:' + err.message);
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('getStringValue_test_008 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('getStringValue_test_008 e.code:' + e.code);
                console.log('getStringValue_test_008 e.message' + e.message);
                expect(e.code == 401).assertTrue();
                done();
            }
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0600
    * @tc.name test getString method in promise mode
    * @tc.desc get the string in promise mode
    */
    it('getStringValue_test_009', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // 0x1001 id not exist,throw 9001001 error code
                mgr.getStringValue(0x1001).then(value => {
                    expect(value !== null).assertTrue();
                    console.log('getStringValue_test_009 ' + value);
                    expect(value).assertEqual('L2Test');
                    done();
                }).catch(error => {
                    console.log('getStringValue_test_009 error.code' + error.code);
                    console.log('getStringValue_test_009 error.message' + error.message);
                    expect(error.code == 9001001).assertTrue();
                    done();
                })
            } catch (err){
                console.log('getStringValue_test_009 err.code' + err.code);
                console.log('getStringValue_test_009 err.message' + err.message);
                done();
            }
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0600
    * @tc.name test getString method in promise mode
    * @tc.desc get the string in promise mode
    */
    it('getStringValue_test_010', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // 0x02000000 id is integer resource,throw 9001002 error code
                console.log('getStringValue_test_010 promise start');
                mgr.getStringValue(0x2000000).then(value => {
                    console.log('getStringValue_test_010 promise try' + value);
                    expect(value !== null).assertTrue();
                    console.log('getStringValue_test_010 ' + value);
                    expect(value).assertEqual('L2Test');
                    done();
                }).catch(error => {
                    console.log('getStringValue_test_010 promise catch');
                    console.log('getStringValue_test_010 error.code' + error.code);
                    console.log('getStringValue_test_010 error.message' + error.message);
                    expect(error.code == 9001002).assertTrue();
                    done();
                })
            } catch (err){
                console.log('getStringValue_test_010 err.code' + err.code);
                console.log('getStringValue_test_010 err.message' + err.message);
                done();
            }
            console.log('getStringValue_test_010 promise end');
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0600
    * @tc.name test getString method in promise mode
    * @tc.desc get the string in promise mode
    */
    it('getStringValue_test_011', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // 0x01000006 id re-ref,throw 9001006 error code
                mgr.getStringValue(0x2000006).then(value => {
                    expect(value !== null).assertTrue();
                    console.log('getStringValue_test_011 ' + value);
                    expect(value).assertEqual('L2Test');
                    done();
                }).catch(error => {
                    console.log('getStringValue_test_011 error.code' + error.code);
                    console.log('getStringValue_test_011 error.message' + error.message);
                    expect(error.code == 9001006).assertTrue();
                    done();
                })
            } catch (err){
                console.log('getStringValue_test_011 err.code' + err.code);
                console.log('getStringValue_test_011 err.message' + err.message);
                done();
            }
        })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_0600
    * @tc.name test getString method in promise mode
    * @tc.desc get the string in promise mode
    */
    it('getStringValue_test_012', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                // param type not correct,throw 401 error code
                mgr.getStringValue('name').then(value => {
                    expect(value !== null).assertTrue();
                    console.log('getStringValue_test_012 ' + value);
                    expect(value).assertEqual('L2Test');
                    done();
                }).catch(error => {
                    console.log('getStringValue_test_012 error.code' + error.code);
                    console.log('getStringValue_test_012 error.message' + error.message);
                    expect(error.code == 401).assertTrue();
                    done();
                })
            } catch (err){
                console.log('getStringValue_test_012 err.code' + err.code);
                console.log('getStringValue_test_012 err.message' + err.message);
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0700
    * @tc.name    test getStringArray method in callback mode
    * @tc.desc    get the string array in callback mode
    */
    it('getStringArray_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArray(0x200000A, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringArray_test_001 ' + value);
                console.log('getStringArray_test_001 ' + value.length);
                console.log('getStringArray_test_001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0800
    * @tc.name    test getStringArray method in promise mode
    * @tc.desc    get the string array in promise mode
    */
    it('getStringArray_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArray(0x200000A).then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringArray_test_002 ' + value);
                console.log('getStringArray_test_002 ' + value.length);
                console.log('getStringArray_test_002 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0700
    * @tc.name    test getStringArray method in callback mode
    * @tc.desc    get the string array in callback mode
    */
    it('getStringArrayValue_test_003', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArrayValue(0x200000A, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringArrayValue_test_003 ' + value);
                console.log('getStringArrayValue_test_003 ' + value.length);
                console.log('getStringArrayValue_test_003 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0800
    * @tc.name    test getStringArray method in promise mode
    * @tc.desc    get the string array in promise mode
    */
    it('getStringArrayValue_test_004', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArrayValue(0x200000A).then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringArrayValue_test_004 ' + value);
                console.log('getStringArrayValue_test_004 ' + value.length);
                console.log('getStringArrayValue_test_004 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0900
    * @tc.name    test getMedia method in callback mode
    * @tc.desc    get the media in callback mode
    */
    it('getMedia_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMedia(0x200001C, (err, value) => {
                console.log('getMedia_test_001 ' + value.length);
                expect(value.length > 0).assertTrue();
                done();
            })
        })

    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1000
    * @tc.name    test getMedia method in promise mode
    * @tc.desc    get the media in promise mode
    */
    it('getMedia_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMedia(0x200001C).then(value => {
                console.log('getMedia_test_002 ' + value.length);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_0900
    * @tc.name    test getMedia method in callback mode
    * @tc.desc    get the media in callback mode
    */
    it('getMediaContent_test_003', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContent(0x200001C, (err, value) => {
                console.log('getMediaContent_test_003 ' + value.length);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1000
    * @tc.name    test getMedia method in promise mode
    * @tc.desc    get the media in promise mode
    */
    it('getMediaContent_test_004', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContent(0x200001C).then(value => {
                console.log('getMediaContent_test_004 ' + value.length);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1100
    * @tc.name    test getMediaBase64 method in callback mode
    * @tc.desc    get the media base64 in callback mode
    */
    it('getMediaBase64_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64(0x200001C, (err, value) => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64_test_001 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1200
    * @tc.name    test getMediaBase64 method in promise mode
    * @tc.desc    get the media base64 in promise mode
    */
    it('getMediaBase64_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64(0x200001C).then(value => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64_test_002 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1100
    * @tc.name    test getMediaBase64 method in callback mode
    * @tc.desc    get the media base64 in callback mode
    */
    it('getMediaContentBase64_test_003', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContentBase64(0x200001C, (err, value) => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaContentBase64_test_003 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1200
    * @tc.name    test getMediaBase64 method in promise mode
    * @tc.desc    get the media base64 in promise mode
    */
    it('getMediaContentBase64_test_004', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContentBase64(0x200001C).then(value => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaContentBase64_test_004 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1300
    * @tc.name    test getConfiguration method in callback mode
    * @tc.desc    get the configuration in callback mode
    */
    it('getConfiguration_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            console.log('getConfiguration_test_001 0');
            mgr.getConfiguration((error, cfg) => {
                console.log('getConfiguration_test_001 1');
                console.log('getConfiguration_test_001 1' + cfg.direction);
                console.log('getConfiguration_test_001 1' + resmgr.Direction.DIRECTION_HORIZONTAL);
                console.log('getConfiguration_test_001 11');
                if(cfg.direction == resmgr.Direction.DIRECTION_VERTICAL){
                    console.log('getConfiguration_test_001 DIRECTION_VERTICAL');
                }else if(cfg.direction == resmgr.Direction.DIRECTION_HORIZONTAL){
                    console.log('getConfiguration_test_001 DIRECTION_HORIZONTAL');
                }
                expect(cfg !== null).assertTrue();
                console.log('getConfiguration_test_001 ' + JSON.stringify(cfg));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1400
    * @tc.name    test getConfiguration method in promise mode
    * @tc.desc    get the configuration in promise mode
    */
    it('getConfiguration_test_002', Level.LEVEL2, async function (done) {
        console.log('getConfiguration_test_002 0');
        expect(resmgr.Direction.DIRECTION_HORIZONTAL).assertEqual(1);
        console.log('getConfiguration_test_002 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1400
    * @tc.name    test getConfiguration method in promise mode
    * @tc.desc    get the configuration in promise mode
    */
    it('getConfiguration_test_003', Level.LEVEL2, async function (done) {
        console.log('getConfiguration_test_003 0');
        expect(resmgr.Direction.DIRECTION_VERTICAL).assertEqual(0);
        console.log('getConfiguration_test_003 1');
        done();
    })

    /* *
        * @tc.number  SUB_GLOBAL_RESMGR_JS_1300
        * @tc.name    test getConfiguration method in promise mode
        * @tc.desc    get the configuration in promise mode
        */
    it('getConfiguration_test_004', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getConfiguration().then(cfg => {
                console.log('getConfiguration_test_004 ' + resmgr.Direction.DIRECTION_HORIZONTAL);
                if(cfg.direction == resmgr.Direction.DIRECTION_VERTICAL){
                    console.log('getConfiguration_test_004 DIRECTION_VERTICAL');
                }else if(cfg.direction == resmgr.Direction.DIRECTION_HORIZONTAL){
                    console.log('getConfiguration_test_004 DIRECTION_HORIZONTAL');
                }
                expect(cfg !== null).assertTrue();
                console.log('getConfiguration_test_004 ' + JSON.stringify(cfg));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1500
    * @tc.name    test getDeviceCapability method in callback mode
    * @tc.desc    get the device capability in callback mode
    */
    it('getDeviceCapability_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getDeviceCapability((error, dc) => {
                if(dc.deviceType == resmgr.DeviceType.DEVICE_TYPE_PHONE){
                    console.log('getDeviceCapability_test_001 DEVICE_TYPE_PHONE');
                }else if(dc.deviceType == resmgr.DeviceType.DEVICE_TYPE_TABLET){
                    console.log('getDeviceCapability_test_001 DEVICE_TYPE_TABLET');
                }else if(dc.deviceType == resmgr.DeviceType.DEVICE_TYPE_CAR){
                    console.log('getDeviceCapability_test_001 DEVICE_TYPE_CAR');
                }else if(dc.deviceType == resmgr.DeviceType.DEVICE_TYPE_PC){
                    console.log('getDeviceCapability_test_001 DEVICE_TYPE_PC');
                }else if(dc.deviceType == resmgr.DeviceType.DEVICE_TYPE_TV){
                    console.log('getDeviceCapability_test_001 DEVICE_TYPE_TV');
                }else if(dc.deviceType == resmgr.DeviceType.DEVICE_TYPE_WEARABLE){
                    console.log('getDeviceCapability_test_001 DEVICE_TYPE_WEARABLE');
                }
                expect(dc !== null).assertTrue();
                console.log('getDeviceCapability_test_001 ' + JSON.stringify(dc));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getDeviceCapability_test_002', Level.LEVEL0, async function (done) {
        console.log('getDeviceCapability_test_002 0');
        expect(resmgr.DeviceType.DEVICE_TYPE_PHONE).assertEqual(0);
        console.log('getDeviceCapability_test_002 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getDeviceCapability_test_003', Level.LEVEL2, async function (done) {
        console.log('getDeviceCapability_test_003 0');
        expect(resmgr.DeviceType.DEVICE_TYPE_TABLET).assertEqual(1);
        console.log('getDeviceCapability_test_003 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getDeviceCapability_test_004', Level.LEVEL2, async function (done) {
        console.log('getDeviceCapability_test_004 0');
        expect(resmgr.DeviceType.DEVICE_TYPE_CAR).assertEqual(2);
        console.log('getDeviceCapability_test_004 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getDeviceCapability_test_005', Level.LEVEL2, async function (done) {
        console.log('getDeviceCapability_test_005 0');
        expect(resmgr.DeviceType.DEVICE_TYPE_PC).assertEqual(3);
        console.log('getDeviceCapability_test_005 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getDeviceCapability_test_006', Level.LEVEL2, async function (done) {
        console.log('getDeviceCapability_test_006 0');
        expect(resmgr.DeviceType.DEVICE_TYPE_TV).assertEqual(4);
        console.log('getDeviceCapability_test_006 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getDeviceCapability_test_007', Level.LEVEL2, async function (done) {
        console.log('getDeviceCapability_test_007 0');
        expect(resmgr.DeviceType.DEVICE_TYPE_WEARABLE).assertEqual(6);
        console.log('getDeviceCapability_test_007 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1601
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getDeviceCapability_test_017', Level.LEVEL2, async function (done) {
        console.log('getDeviceCapability_test_017 0');
        expect(resmgr.DeviceType.DEVICE_TYPE_2IN1).assertEqual(7);
        console.log('getDeviceCapability_test_017 1');
        done();
    })

    /* *
        * @tc.number  SUB_GLOBAL_RESMGR_JS_1500
        * @tc.name    test getDeviceCapability method in callback mode
        * @tc.desc    get the device capability in callback mode
        */
    it('getDeviceCapability_test_008', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getDeviceCapability().then(dc => {
                if(dc.deviceType == resmgr.DeviceType.DEVICE_TYPE_PHONE){
                    console.log('getDeviceCapability_test_008 DEVICE_TYPE_PHONE');
                }
                if(dc.screenDensity == resmgr.ScreenDensity.SCREEN_LDPI){
                    console.log('getDeviceCapability_test_008 SCREEN_LDPI');
                }
                expect(dc !== null).assertTrue();
                console.log('getDeviceCapability_test_008 ' + JSON.stringify(dc));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1500
    * @tc.name    test getDeviceCapability method in callback mode
    * @tc.desc    get the device capability in callback mode
    */
    it('getScreenDensity_test_001', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getDeviceCapability((error, dc) => {
                if(dc.screenDensity == resmgr.ScreenDensity.SCREEN_SDPI){
                    console.log('getScreenDensity_test_001 SCREEN_SDPI');
                }else if(dc.screenDensity == resmgr.ScreenDensity.SCREEN_MDPI){
                    console.log('getScreenDensity_test_001 SCREEN_MDPI');
                }else if(dc.screenDensity == resmgr.ScreenDensity.SCREEN_LDPI){
                    console.log('getScreenDensity_test_001 SCREEN_LDPI');
                }else if(dc.screenDensity == resmgr.ScreenDensity.SCREEN_XLDPI){
                    console.log('getScreenDensity_test_001 SCREEN_XLDPI');
                }else if(dc.screenDensity == resmgr.ScreenDensity.SCREEN_XXLDPI){
                    console.log('getScreenDensity_test_001 SCREEN_XXLDPI');
                }else if(dc.screenDensity == resmgr.ScreenDensity.SCREEN_XXXLDPI){
                    console.log('getScreenDensity_test_001 SCREEN_XXXLDPI');
                }
                expect(dc !== null).assertTrue();
                console.log('getScreenDensity_test_001 ' + JSON.stringify(dc));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getScreenDensity_test_002', Level.LEVEL2, async function (done) {
        console.log('getScreenDensity_test_002 0');
        expect(resmgr.ScreenDensity.SCREEN_SDPI).assertEqual(120);
        console.log('getScreenDensity_test_002 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getScreenDensity_test_003', Level.LEVEL2, async function (done) {
        console.log('getScreenDensity_test_003 0');
        expect(resmgr.ScreenDensity.SCREEN_MDPI).assertEqual(160);
        console.log('getScreenDensity_test_003 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getScreenDensity_test_004', Level.LEVEL2, async function (done) {
        console.log('getScreenDensity_test_004 0');
        expect(resmgr.ScreenDensity.SCREEN_LDPI).assertEqual(240);
        console.log('getScreenDensity_test_004 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getScreenDensity_test_005', Level.LEVEL2, async function (done) {
        console.log('getScreenDensity_test_005 0');
        expect(resmgr.ScreenDensity.SCREEN_XLDPI).assertEqual(320);
        console.log('getScreenDensity_test_005 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getScreenDensity_test_006', Level.LEVEL2, async function (done) {
        console.log('getScreenDensity_test_006 0');
        expect(resmgr.ScreenDensity.SCREEN_XXLDPI).assertEqual(480);
        console.log('getScreenDensity_test_006 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1600
    * @tc.name    test getDeviceCapability method in promise mode
    * @tc.desc    get the device capability in promise mode
    */
    it('getScreenDensity_test_007', Level.LEVEL2, async function (done) {
        console.log('getScreenDensity_test_007 0');
        expect(resmgr.ScreenDensity.SCREEN_XXXLDPI).assertEqual(640);
        console.log('getScreenDensity_test_007 1');
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1700
    * @tc.name    test getPluralString method in callback mode
    * @tc.desc    get the plural string in callback mode
    */
    it('getPluralString_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralString(0x2000017, 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getPluralString_test_001 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1800
    * @tc.name    test getPluralString method in promise mode
    * @tc.desc    get the plural string in promise mode
    */
    it('getPluralString_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralString(0x2000017, 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('getPluralString_test_002 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1700
    * @tc.name    test getPluralString method in callback mode
    * @tc.desc    get the plural string in callback mode
    */
    it('getPluralStringValue_test_003', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralStringValue(0x2000017, 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getPluralStringValue_test_003 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1800
    * @tc.name    test getPluralString method in promise mode
    * @tc.desc    get the plural string in promise mode
    */
    it('getPluralStringValue_test_004', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralStringValue(0x2000017, 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('getPluralStringValue_test_004 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1700
    * @tc.name    test getRawFile method in callback mode
    * @tc.desc    get the getRawFile in callback mode
    */
    it('getRawFile_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFile('rawfile/rawfiletest.xml', (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getRawFile_test_001 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1800
    * @tc.name    test getRawFile method in promise mode
    * @tc.desc    get the getRawFile in promise mode
    */
    it('getRawFile_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFile('rawfile/rawfiletest.xml').then(value => {
                expect(value !== null).assertTrue();
                console.log('getRawFile_test_002 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1700
    * @tc.name    test getRawFile method in callback mode
    * @tc.desc    get the getRawFile in callback mode
    */
    it('getRawFileContent_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFileContent('rawfile/rawfiletest.xml', (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getRawFileContent_test_001 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1800
    * @tc.name    test getRawFile method in promise mode
    * @tc.desc    get the getRawFile in promise mode
    */
    it('getRawFileContent_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFileContent('rawfile/rawfiletest.xml').then(value => {
                expect(value !== null).assertTrue();
                console.log('getRawFileContent_test_002 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_1900
    * @tc.name    test release method
    * @tc.desc    get the release function
    */
    it('release_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getString(0x2000008, (err, value) => {
                expect(value !== null).assertTrue();
                done();
            })
            mgr.release();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2000
    * @tc.name    test getRawFileDescriptor method in callback mode
    * @tc.desc    get the RawFileDescriptor in callback mode
    */
    it('getRawFileDescriptor_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFileDescriptor('rawfiletest.xml', (error, rawfile) => {
                let fdValue = rawfile.fd;
                let offsetValue = rawfile.offset;
                let lengthValue = rawfile.length;
                expect(rawfile !== null).assertTrue();
                console.log('getRawFileDescriptor_test_001--'
                +'fd:' + fdValue
                + ' offset:' + offsetValue
                + ' length:' + lengthValue);
                done();
            })
            mgr.closeRawFileDescriptor('rawfiletest.xml', (error, value) => {
                console.log('getRawFileDescriptor_test_001--start close');
                expect(error !== null).assertTrue();
                console.log('getRawFileDescriptor_test_001--' + JSON.stringify(error));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2100
    * @tc.name    test getRawFileDescriptor method in promise mode
    * @tc.desc    get the RawFileDescriptor in promise mode
    */
    it('getRawFileDescriptor_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFileDescriptor('rawfiletest.xml').then(rawfile => {
                rawfile.fd = 2000;
                rawfile.offset = 20;
                rawfile.length = 200;
                expect(rawfile !== null).assertTrue();
                console.log('getRawFileDescriptor_test_002--' + rawfile);
                console.log('getRawFileDescriptor_test_002--'
                +'fd:' + rawfile.fd
                + ' offset:' + rawfile.offset
                + ' length:' + rawfile.length);
                done();
            })
            mgr.closeRawFileDescriptor('rawfiletest.xml').then(value => {
                console.log('getRawFileDescriptor_test_002--start close');
                expect(value !== null).assertTrue();
                console.log('getRawFileDescriptor_test_002--' + JSON.stringify(value));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2200
    * @tc.name    test closeRawFileDescriptor method in callback mode
    * @tc.desc    get the closeRawFileDescriptor in callback mode
    */
    it('closeRawFileDescriptor_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.closeRawFileDescriptor('rawfiletest.xml', (error, value) => {
                expect(error !== null).assertTrue();
                console.log('closeRawFileDescriptor_test_001--' + JSON.stringify(error));
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2000
    * @tc.name    test getRawFileDescriptor method in callback mode
    * @tc.desc    get the RawFileDescriptor in callback mode
    */
    it('getRawFd_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFd('rawfiletest.xml', (error, rawfile) => {
                let fdValue = rawfile.fd;
                let offsetValue = rawfile.offset;
                let lengthValue = rawfile.length;
                expect(rawfile !== null).assertTrue();
                console.log('getRawFd_test_001--'
                +'fd:' + fdValue
                + ' offset:' + offsetValue
                + ' length:' + lengthValue);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2100
    * @tc.name    test getRawFileDescriptor method in promise mode
    * @tc.desc    get the RawFileDescriptor in promise mode
    */
    it('getRawFd_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getRawFd('rawfiletest.xml').then(rawfile => {
                rawfile.fd = 2000;
                rawfile.offset = 20;
                rawfile.length = 200;
                expect(rawfile !== null).assertTrue();
                console.log('getRawFd_test_002--' + JSON.stringify(rawfile));
                console.log('getRawFd_test_002--'
                +'fd:' + rawfile.fd
                + ' offset:' + rawfile.offset
                + ' length:' + rawfile.length);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2200
    * @tc.name    test closeRawFileDescriptor method in callback mode
    * @tc.desc    get the closeRawFileDescriptor in callback mode
    */
    it('closeRawFd_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.closeRawFd('notexist.xml', (error, value) => {
                    if(error){
                        console.log('closeRawFd_test_001 err.code:' + error.code);
                        console.log('closeRawFd_test_001 err.message:' + error.message);
                        expect(error.code == 9001005).assertTrue();
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('closeRawFd_test_001 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('closeRawFd_test_001 e.code' + e.code);
                console.log('closeRawFd_test_001 e.message' + e.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2300
    * @tc.name    test closeRawFd method in promise mode throw 9001005 error code
    * @tc.desc    get the closeRawFd in promise mode
    */
    it('closeRawFd_test_005', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try {
                // param not exist throw 9001005 error code
                mgr.closeRawFd('notexist.xml').then(value => {
                    console.log('closeRawFd_test_005 ' + value);
                    done();
                }).catch(error => {
                    console.log('closeRawFd_test_005 error.code' + error.code);
                    console.log('closeRawFd_test_005 error.message' + error.message);
                    expect(error.code == 9001005).assertTrue();
                    done();
                })
            } catch (err) {
                console.log('closeRawFd_test_005 err.code' + err.code);
                console.log('closeRawFd_test_005 err.message' + err.message);
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2300
    * @tc.name    test closeRawFd method in promise mode throw 401 error code
    * @tc.desc    get the closeRawFd in promise mode
    */
    it('closeRawFd_test_006', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try {
                // param type not correct,throw 401 error code
                mgr.closeRawFd(0x2000000).then(value => {
                    console.log('closeRawFd_test_006 ' + value);
                    done();
                }).catch(error => {
                    console.log('closeRawFd_test_006 error.code' + error.code);
                    console.log('closeRawFd_test_006 error.message' + error.message);
                    expect(error.code == 401).assertTrue();
                    done();
                })
            } catch (err) {
                console.log('closeRawFd_test_006 err.code' + err.code);
                console.log('closeRawFd_test_006 err.message' + err.message);
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2400
    * @tc.name    test getStringByName method in callback mode
    * @tc.desc    get the string in callback mode
    */
    it('getStringByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringByName('app_name', (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringByName_test_001 ' + value);
                expect(value).assertEqual('L2Test');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2500
    * @tc.name    test getString method in promise mode
    * @tc.desc    get the string in promise mode
    */
    it('getStringByName_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringByName('app_name').then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringByName_test_002 ' + value);
                expect(value).assertEqual('L2Test');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2600
    * @tc.name    test getStringArrayByName method in callback mode
    * @tc.desc    get the string array in callback mode
    */
    it('getStringArrayByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArrayByName('sizeList', (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getStringArrayByName_test_001 ' + value);
                console.log('getStringArrayByName_test_001 ' + value.length);
                console.log('getStringArrayByName_test_001 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2700
    * @tc.name    test getStringArrayByName method in promise mode
    * @tc.desc    get the string array in promise mode
    */
    it('getStringArrayByName_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getStringArrayByName('sizeList').then(value => {
                expect(value !== null).assertTrue();
                console.log('getStringArrayByName_test_002 ' + value);
                console.log('getStringArrayByName_test_002 ' + value.length);
                console.log('getStringArrayByName_test_002 ' + value[0]);
                expect(value.length).assertEqual(4);
                expect(value[0]).assertEqual('small');
                expect(value[1]).assertEqual('middle');
                expect(value[2]).assertEqual('large');
                expect(value[3]).assertEqual('extra large');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2800
    * @tc.name    test getMediaByName method in callback mode
    * @tc.desc    get the media in callback mode
    */
    it('getMediaByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaByName('icon', (err, value) => {
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2900
    * @tc.name    test getMediaByName method in promise mode
    * @tc.desc    get the media in promise mode
    */
    it('getMediaByName_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaByName('icon').then(value => {
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3000
    * @tc.name    test getMediaBase64ByName method in callback mode
    * @tc.desc    get the media base64 in callback mode
    */
    it('getMediaBase64ByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64ByName('icon', (err, value) => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64ByName_test_001 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3100
    * @tc.name    test getMediaBase64ByName method in promise mode
    * @tc.desc    get the media base64 in promise mode
    */
    it('getMediaBase64ByName_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64ByName('icon').then(value => {
                expect(value.length > 0).assertTrue();
                console.log('getMediaBase64ByName_test_002 ' + value);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3200
    * @tc.name    test getPluralStringByName method in callback mode
    * @tc.desc    get the plural string in callback mode
    */
    it('getPluralStringByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralStringByName('plural_name', 1, (error, value) => {
                expect(value !== null).assertTrue();
                console.log('getPluralStringByName_test_001 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3300
    * @tc.name    test getPluralStringByName method in promise mode
    * @tc.desc    get the plural string in promise mode
    */
    it('getPluralStringByName_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getPluralStringByName('plural_name', 1).then(value => {
                expect(value !== null).assertTrue();
                console.log('getPluralStringByName_test_002 ' + value);
                expect(value).assertEqual('1 test other');
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3400
    * @tc.name    test getStringSync method
    * @tc.desc    get the string in sync mode
    */
    it('getStringSync_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getStringSync(0x2000008);
            expect(value !== null).assertTrue();
            console.log('getStringSync_test_001 ' + value);
            expect(value).assertEqual('L2Test');
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3500
    * @tc.name    test getStringByNameSync method
    * @tc.desc    get the string in sync mode
    */
    it('getStringByNameSync_test_001', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getStringByNameSync('notexist');
                console.log('getStringByNameSync_test_001 value');
                expect(value !== null).assertTrue();
                console.log('getStringByNameSync_test_001 ' + value);
                done();
            }catch(e){
                console.log('getStringByNameSync_test_001 err.code' + e.code);
                console.log('getStringByNameSync_test_001 err.message' + e.message);
                expect(e.code == 9001003).assertTrue();
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3500
    * @tc.name    test getStringByNameSync method
    * @tc.desc    get the string in sync mode
    */
    it('getStringByNameSync_test_002', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getStringByNameSync('app_name');
            expect(value !== null).assertTrue();
            expect(value).assertEqual('L2Test');
            console.log('getStringByNameSync_test_002 ' + value);
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3600
    * @tc.name    test getBoolean method
    * @tc.desc    get the boolean value
    */
    it('getBoolean_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getBoolean(0x200000C);
            console.log('getBoolean_test_001 ' + value);
            expect(value).assertTrue();
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3700
    * @tc.name    test getBooleanByName method
    * @tc.desc    get the boolean value
    */
    it('getBooleanByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getBooleanByName('boolean_1');
            console.log('getBooleanByName_test_001 ' + value);
            expect(value).assertTrue();
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3800
    * @tc.name    test getNumber method with interger id
    * @tc.desc    get the interger value
    */
    it('getinteger_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            console.log('getinteger_test_001 0');
            let value = mgr.getNumber(0x2000000);
            console.log('getinteger_test_001 1');
            console.log('getinteger_test_001 ' + value);
            expect(value).assertEqual(100);
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3900
    * @tc.name    test getNumberByName with interger
    * @tc.desc    get the interger value
    */
    it('getintegerByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getNumberByName('integer_1');
            console.log('getintegerByName_test_001 ' + value);
            expect(value).assertEqual(100);
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_4000
    * @tc.name    test getNumber with float id
    * @tc.desc    get the float value
    */
    it('getfloat_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getNumber(0x200001A);
            console.log('getfloat_test_001 ' + value);
            expect(value > 0).assertTrue();
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_4100
    * @tc.name    test getNumberByName with float
    * @tc.desc    get the float value
    */
    it('getfloatByName_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getNumberByName('float_1');
            console.log('getfloatByName_test_001 ' + value);
            expect(value > 0).assertTrue();
            done();
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0100
     * @tc.name getDrawableDescriptor with normal pic
     * @tc.desc test the getDrawableDescriptor method
     */
     it('getDrawableDescriptor_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001C);
                console.log('getDrawableDescriptor_test_0100 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0100 ' + error.code);
                console.log('getDrawableDescriptor_test_0100 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0120
     * @tc.name getDrawableDescriptor with undefined density
     * @tc.desc test the getDrawableDescriptor method
     */
     it('getDrawableDescriptor_test_0120', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001C, undefined);
                console.log('getDrawableDescriptor_test_0120 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0120 ' + error.code);
                console.log('getDrawableDescriptor_test_0120 ' + error.message);
            }
            done();
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0140
     * @tc.name getDrawableDescriptor with null density
     * @tc.desc test the getDrawableDescriptor method
     */
     it('getDrawableDescriptor_test_0140', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001C, null);
                console.log('getDrawableDescriptor_test_0140 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0140 ' + error.code);
                console.log('getDrawableDescriptor_test_0140 ' + error.message);
            }
            done();
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0200
     * @tc.name getDrawableDescriptor with normal pic and density
     * @tc.desc test the getDrawableDescriptor method
     */
    it('getDrawableDescriptor_test_0200', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001C,120);
                console.log('getDrawableDescriptor_test_0200 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0200 ' + error.code);
                console.log('getDrawableDescriptor_test_0200 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0300
     * @tc.name getDrawableDescriptor with json style pic
     * @tc.desc test the getDrawableDescriptor method
     */
    it('getDrawableDescriptor_test_0300', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001D);
                console.log('getDrawableDescriptor_test_0300 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0300 ' + error.code);
                console.log('getDrawableDescriptor_test_0300 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0400
     * @tc.name getDrawableDescriptor with json style pic and density
     * @tc.desc test the getDrawableDescriptor method
     */
    it('getDrawableDescriptor_test_0400', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001D, 240);
                console.log('getDrawableDescriptor_test_0400 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0400 ' + error.code);
                console.log('getDrawableDescriptor_test_0400 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0500
     * @tc.name getDrawableDescriptor with string param
     * @tc.desc test the getDrawableDescriptor method return 401
     */
    it('getDrawableDescriptor_test_0500', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor('0x0100001d');
                console.log('getDrawableDescriptor_test_0500 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0500 ' + error.code);
                console.log('getDrawableDescriptor_test_0500 ' + error.message);
                expect(error.code == 401).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0600
     * @tc.name getDrawableDescriptor with not exist resource id
     * @tc.desc test the getDrawableDescriptor method return 9001001
     */
    it('getDrawableDescriptor_test_0600', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x01234567);
                console.log('getDrawableDescriptor_test_0600 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0600 ' + error.code);
                console.log('getDrawableDescriptor_test_0600 ' + error.message);
                expect(error.code == 9001001).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0700
     * @tc.name getDrawableDescriptor with string resource id
     * @tc.desc test the getDrawableDescriptor method return 9001002
     */
    it('getDrawableDescriptor_test_0700', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x2000000);
                console.log('getDrawableDescriptor_test_0700 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0700 ' + error.code);
                console.log('getDrawableDescriptor_test_0700 ' + error.message);
                expect(error.code == 9001002).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0800
     * @tc.name getDrawableDescriptor with not exist density
     * @tc.desc test the getDrawableDescriptor method return 401
     */
    it('getDrawableDescriptor_test_0800', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001D, 130);
                console.log('getDrawableDescriptor_test_0800 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0800 ' + error.code);
                console.log('getDrawableDescriptor_test_0800 ' + error.message);
                expect(error.code == 401).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_0900
     * @tc.name getDrawableDescriptor with string type density
     * @tc.desc test the getDrawableDescriptor method return 401
     */
    it('getDrawableDescriptor_test_0900', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001D, '120');
                console.log('getDrawableDescriptor_test_0900 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_0900 ' + error.code);
                console.log('getDrawableDescriptor_test_0900 ' + error.message);
                expect(error.code == 401).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1000
     * @tc.name getDrawableDescriptor with 0 density
     * @tc.desc test the getDrawableDescriptor method
     */
    it('getDrawableDescriptor_test_1000', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptor(0x200001D, 0);
                console.log('getDrawableDescriptor_test_1000 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1000 ' + error.code);
                console.log('getDrawableDescriptor_test_1000 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1100
     * @tc.name getDrawableDescriptorByName with normal pic
     * @tc.desc test the getDrawableDescriptorByName method
     */
    it('getDrawableDescriptor_test_1100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('icon');
                console.log('getDrawableDescriptor_test_1100 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1100 ' + error.code);
                console.log('getDrawableDescriptor_test_1100 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1120
     * @tc.name getDrawableDescriptorByName with undefined density
     * @tc.desc test the getDrawableDescriptorByName method
     */
     it('getDrawableDescriptor_test_1120', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('icon', undefined);
                console.log('getDrawableDescriptor_test_1120 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1120 ' + error.code);
                console.log('getDrawableDescriptor_test_1120 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1140
     * @tc.name getDrawableDescriptorByName with null density
     * @tc.desc test the getDrawableDescriptorByName method
     */
     it('getDrawableDescriptor_test_1140', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('icon', null);
                console.log('getDrawableDescriptor_test_1140 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1140 ' + error.code);
                console.log('getDrawableDescriptor_test_1140 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1200
     * @tc.name getDrawableDescriptorByName with normal pic and density
     * @tc.desc test the getDrawableDescriptorByName method
     */
    it('getDrawableDescriptor_test_1200', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('icon',120);
                console.log('getDrawableDescriptor_test_1200 ' + JSON.stringify(value));
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1200 ' + error.code);
                console.log('getDrawableDescriptor_test_1200 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1300
     * @tc.name getDrawableDescriptorByName with json style pic
     * @tc.desc test the getDrawableDescriptorByName method
     */
    it('getDrawableDescriptor_test_1300', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('stratify');
                console.log('getDrawableDescriptor_test_1300 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1300 ' + error.code);
                console.log('getDrawableDescriptor_test_1300 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1400
     * @tc.name getDrawableDescriptorByName with json style pic and density
     * @tc.desc test the getDrawableDescriptorByName method
     */
    it('getDrawableDescriptor_test_1400', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('stratify', 240);
                console.log('getDrawableDescriptor_test_1400 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1400 ' + error.code);
                console.log('getDrawableDescriptor_test_1400 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1500
     * @tc.name getDrawableDescriptorByName with number param
     * @tc.desc test the getDrawableDescriptorByName method return 401
     */
    it('getDrawableDescriptor_test_1500', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName(0x200001D);
                console.log('getDrawableDescriptor_test_1500 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1500 ' + error.code);
                console.log('getDrawableDescriptor_test_1500 ' + error.message);
                expect(error.code == 401).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1600
     * @tc.name getDrawableDescriptorByName with not exist pic name
     * @tc.desc test the getDrawableDescriptorByName method return 9001003
     */
    it('getDrawableDescriptor_test_1600', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('stratify1');
                console.log('getDrawableDescriptor_test_1600 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1600 ' + error.code);
                console.log('getDrawableDescriptor_test_1600 ' + error.message);
                expect(error.code == 9001003).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1800
     * @tc.name getDrawableDescriptorByName with not exist density
     * @tc.desc test the getDrawableDescriptorByName method return 401
     */
    it('getDrawableDescriptor_test_1800', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('stratify', 130);
                console.log('getDrawableDescriptor_test_1800 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1800 ' + error.code);
                console.log('getDrawableDescriptor_test_1800 ' + error.message);
                expect(error.code == 401).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_1900
     * @tc.name getDrawableDescriptorByName with string type density
     * @tc.desc test the getDrawableDescriptorByName method return 401
     */
    it('getDrawableDescriptor_test_1900', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('stratify', '120');
                console.log('getDrawableDescriptor_test_1900 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_1900 ' + error.code);
                console.log('getDrawableDescriptor_test_1900 ' + error.message);
                expect(error.code == 401).assertTrue();
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_DRAWABLE_JS_2000
     * @tc.name getDrawableDescriptorByName with 0 density
     * @tc.desc test the getDrawableDescriptorByName method
     */
    it('getDrawableDescriptor_test_2000', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getDrawableDescriptorByName('stratify', 0);
                console.log('getDrawableDescriptor_test_2000 ' + value);
                expect(value != null).assertTrue();
            }catch(error){
                console.log('getDrawableDescriptor_test_2000 ' + error.code);
                console.log('getDrawableDescriptor_test_2000 ' + error.message);
            }
        })
        done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_0100
     * @tc.name getRawFileList with callback method
     * @tc.desc test the getRawFileList method
     */
    it('getRawFileList_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getRawFileList("", (err, value) => {
                    if(err){
                        console.log('getRawFileList_test_0100 err.code' + err.code);
                        console.log('getRawFileList_test_0100 err.message' + err.message);
                        done();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('getRawFileList_test_0100 ' + value);
                        done();
                    }
                })
            }catch(e){
                console.log('getRawFileList_test_0100 e.code' + e.code);
                console.log('getRawFileList_test_0100 e.message' + e.message);
            }
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_0110
     * @tc.name getRawFileList with callback method
     * @tc.desc test the getRawFileList method
     */
    it('getRawFileList_test_0110', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getRawFileList("bb", (err, value) => {
                    if(err){
                        console.log('getRawFileList_test_0110 err.code' + err.code);
                        console.log('getRawFileList_test_0110 err.message' + err.message);
                        expect(err.code == 9001005).assertTrue();
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('getRawFileList_test_0110 ' + value);
                    }
                    done();
                })
            }catch(e){
                console.log('getRawFileList_test_0110 e.code' + e.code);
                console.log('getRawFileList_test_0110 e.message' + e.message);
                done();
            }
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_0120
     * @tc.name getRawFileList with callback method
     * @tc.desc test the getRawFileList method
     */
    it('getRawFileList_test_0120', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getRawFileList(12345, (err, value) => {
                    if(err){
                        console.log('getRawFileList_test_0120 err.code' + err.code);
                        console.log('getRawFileList_test_0120 err.message' + err.message);
                    }else{
                        expect(value !== null).assertTrue();
                        console.log('getRawFileList_test_0120 ' + value);
                    }
                    done();
                })
            }catch(e){
                console.log('getRawFileList_test_0120 e.code' + e.code);
                console.log('getRawFileList_test_0120 e.message' + e.message);
                expect(e.code == 401).assertTrue();
                done();
            }
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_0200
     * @tc.name getRawFileList with promise method
     * @tc.desc test the getRawFileList method
     */
    it('getRawFileList_test_0200', Level.LEVEL2, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getRawFileList("").then(value => {
                    expect(value !== null).assertTrue();
                    console.log('getRawFileList_test_0200 ' + value);
                    done();
                }).catch(error => {
                    console.log('getRawFileList_test_0200 error.code' + error.code);
                    console.log('getRawFileList_test_0200 error.message' + error.message);
                    done();
                })
            } catch (err){
                console.log('getRawFileList_test_0200 err.code' + err.code);
                console.log('getRawFileList_test_0200 err.message' + err.message);
                done();
            }
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_0210
     * @tc.name getRawFileList with promise method
     * @tc.desc test the getRawFileList method
     */
    it('getRawFileList_test_0210', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getRawFileList("bb").then(value => {
                    expect(value !== null).assertTrue();
                    console.log('getRawFileList_test_0210 ' + value);
                    done();
                }).catch(error => {
                    console.log('getRawFileList_test_0210 error.code' + error.code);
                    console.log('getRawFileList_test_0210 error.message' + error.message);
                    expect(error.code == 9001005).assertTrue();
                    done();
                })
            } catch (err){
                console.log('getRawFileList_test_0210 err.code' + err.code);
                console.log('getRawFileList_test_0210 err.message' + err.message);
                done();
            }
        })
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_0220
     * @tc.name getRawFileList with promise method
     * @tc.desc test the getRawFileList method
     */
    it('getRawFileList_test_0220', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getRawFileList(12345).then(value => {
                    expect(value !== null).assertTrue();
                    console.log('getRawFileList_test_0220 ' + value);
                    done();
                }).catch(error => {
                    console.log('getRawFileList_test_0220 error.code' + error.code);
                    console.log('getRawFileList_test_0220 error.message' + error.message);
                    done();
                })
            } catch (err){
                console.log('getRawFileList_test_0220 err.code' + err.code);
                console.log('getRawFileList_test_0220 err.message' + err.message);
                expect(err.code == 401).assertTrue();
                done();
            }
        })
    })

    /**
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0100
    * @tc.name    test getMediaByName method in callback mode with density
    * @tc.desc    get the media in callback mode
    */
    it('getMediaByName_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaByName('icon', 0 , (err, value) => {
                console.log('getMediaByName_test_0100 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0200
    * @tc.name    test getMediaByName method in promise mode with density
    * @tc.desc    get the media in promise mode
    */
    it('getMediaByName_test_0200', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaByName('icon', 0).then(value => {
                console.log('getMediaByName_test_0200 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0300
    * @tc.name    test getMediaBase64ByName method in callback mode with density
    * @tc.desc    get the media in callback mode
    */
    it('getMediaBase64ByName_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64ByName('icon', 0 , (err, value) => {
                console.log('getMediaBase64ByName_test_0100 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0400
    * @tc.name    test getMediaBase64ByName method in promise mode with density
    * @tc.desc    get the media in promise mode
    */
    it('getMediaBase64ByName_test_0200', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaBase64ByName('icon', 0).then(value => {
                console.log('getMediaBase64ByName_test_0200 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0500
    * @tc.name    test getMediaContent method in callback mode with density
    * @tc.desc    get the media in callback mode
    */
    it('getMediaContent_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContent(0x200001C, 0 , (err, value) => {
                console.log('getMediaContent_test_0100 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0600
    * @tc.name    test getMediaContent method in promise mode with density
    * @tc.desc    get the media in promise mode
    */
    it('getMediaContent_test_0200', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContent(0x200001C, 0).then(value => {
                console.log('getMediaContent_test_0200 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0700
    * @tc.name    test getMediaContentBase64 method in callback mode with density
    * @tc.desc    get the media in callback mode
    */
    it('getMediaContentBase64_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContentBase64(0x200001C, 0 , (err, value) => {
                console.log('getMediaContentBase64_test_0100 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_0800
    * @tc.name    test getMediaContentBase64 method in promise mode with density
    * @tc.desc    get the media in promise mode
    */
    it('getMediaContentBase64_test_0200', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getMediaContentBase64(0x200001C, 0).then(value => {
                console.log('getMediaContentBase64_test_0200 ' + value);
                expect(value.length > 0).assertTrue();
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETSYSTEMRESOURCEMANAGER_JS_0100
    * @tc.name    test getSystemResourceManager method
    * @tc.desc    get the SystemResourceManager
    */
    it('getSystemResourceManager_test_0100', Level.LEVEL0, async function (done) {
        let value = resmgr.getSystemResourceManager();
        console.log('getSystemResourceManager_test_0100 ' + value);
        expect(value !== null).assertTrue();
        done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0100
    * @tc.name    test getColor method in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getColor(0x2000010, (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getColor_test_001 ' + value);
                expect(value).assertEqual(4294902015);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0110
    * @tc.name    test getColor method in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0110', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor('color_test1', (err, value) => {
                    done();
                })
            }catch(err){
                console.log('getColor_test_0110 err.code' + err.code);
                console.log('getColor_test_0110 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0120
    * @tc.name    test getColor method in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0120', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x21000014, (err, value) => {
                    console.log('getColor_test_0120 err.code ' + err.code + '-');
                    console.log('getColor_test_0120 err.message ' + err.message + '-');
                    expect(err.code == 9001001).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0120 error.code' + error.code);
                console.log('getColor_test_0120 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0130
    * @tc.name    test getColor method in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0130', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x2000000, (err, value) => {
                    console.log('getColor_test_0130 err.code ' + err.code + '-');
                    console.log('getColor_test_0130 err.message ' + err.message + '-');
                    expect(err.code == 9001002).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0130 error.code' + error.code);
                console.log('getColor_test_0130 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0140
    * @tc.name    test getColor method in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0140', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x2000014, (err, value) => {
                    console.log('getColor_test_0140 err.code ' + err.code + '-');
                    console.log('getColor_test_0140 err.message ' + err.message + '-');
                    expect(err.code == 9001002).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0140 error.code' + error.code);
                console.log('getColor_test_0140 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0150
    * @tc.name    test getColor method in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0150', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x2000012, (err, value) => {
                    console.log('getColor_test_0150 err.code ' + err.code + '-');
                    console.log('getColor_test_0150 err.message ' + err.message + '-');
                    expect(err.code == 9001006).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0150 error.code' + error.code);
                console.log('getColor_test_0150 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0200
    * @tc.name    test getColor method in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0200', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getColor(0x2000010).then(value => {
                expect(value !== null).assertTrue();
                console.log('getColor_test_0200 ' + value);
                expect(value).assertEqual(4294902015);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0210
    * @tc.name    test getColor method in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0210', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor('color_test1').then(value => {
                    done();
                })
            }catch(err){
                console.log('getColor_test_0210 err.code' + err.code);
                console.log('getColor_test_0210 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0220
    * @tc.name    test getColor method in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0220', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x21000014).then(value => {
                }).catch(err => {
                    console.log('getColor_test_0220 err.code ' + err.code + '-');
                    console.log('getColor_test_0220 err.message ' + err.message + '-');
                    expect(err.code == 9001001).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0220 error.code' + error.code);
                console.log('getColor_test_0220 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0230
    * @tc.name    test getColor method in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0230', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x2000000).then(value => {
                }).catch(err => {
                    console.log('getColor_test_0230 err.code ' + err.code + '-');
                    console.log('getColor_test_0230 err.message ' + err.message + '-');
                    expect(err.code == 9001002).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0230 error.code' + error.code);
                console.log('getColor_test_0230 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0240
    * @tc.name    test getColor method in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0240', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x2000014).then(value => {
                }).catch(err => {
                    console.log('getColor_test_0240 err.code ' + err.code + '-');
                    console.log('getColor_test_0240 err.message ' + err.message + '-');
                    expect(err.code == 9001002).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0240 error.code' + error.code);
                console.log('getColor_test_0240 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_0250
    * @tc.name    test getColor method in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0250', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColor(0x2000012).then(value => {
                }).catch(err => {
                    console.log('getColor_test_0250 err.code ' + err.code + '-');
                    console.log('getColor_test_0250 err.message ' + err.message + '-');
                    expect(err.code == 9001006).assertTrue();
                    expect(err.message).assertEqual('GetColorById failed state');
                    done();
                })
            }catch(error){
                console.log('getColor_test_0250 error.code' + error.code);
                console.log('getColor_test_0250 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_0100
    * @tc.name    test getColorSync method
    * @tc.desc    get the sync color
    */
    it('getColorSync_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getColorSync(0x2000010);
            expect(value !== null).assertTrue();
            console.log('getColorSync_test_001 ' + value);
            expect(value).assertEqual(4294902015);
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_0200
    * @tc.name    test getColorSync method
    * @tc.desc    get the sync color
    */
    it('getColorSync_test_002', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorSync('color_test1');
            }catch(err){
                console.log('getColorSync_test_002 err.code' + err.code);
                console.log('getColorSync_test_002 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_0300
    * @tc.name    test getColorSync method
    * @tc.desc    get the sync color
    */
    it('getColorSync_test_003', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorSync(0x21000014);
            }catch(err){
                console.log('getColorSync_test_003 err.code' + err.code);
                console.log('getColorSync_test_003 err.message' + err.message);
                expect(err.code).assertEqual('9001001');
                expect(err.message).assertEqual('Invalid resource ID');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_0400
    * @tc.name    test getColorSync method
    * @tc.desc    get the sync color
    */
    it('getColorSync_test_004', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorSync(0x2000000);
            }catch(err){
                console.log('getColorSync_test_004 err.code' + err.code);
                console.log('getColorSync_test_004 err.message' + err.message);
                expect(err.code).assertEqual('9001002');
                expect(err.message).assertEqual('No matching resource is found based on the resource ID');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_0500
    * @tc.name    test getColorSync method
    * @tc.desc    get the sync color
    */
    it('getColorSync_test_005', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorSync(0x2000014);
            }catch(err){
                console.log('getColorSync_test_005 err.code' + err.code);
                console.log('getColorSync_test_005 err.message' + err.message);
                expect(err.code).assertEqual('9001002');
                expect(err.message).assertEqual('No matching resource is found based on the resource ID');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_0600
    * @tc.name    test getColorSync method
    * @tc.desc    get the sync color
    */
    it('getColorSync_test_006', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorSync(0x2000012);
            }catch(err){
                console.log('getColorSync_test_006 err.code' + err.code);
                console.log('getColorSync_test_006 err.message' + err.message);
                expect(err.code).assertEqual('9001006');
                expect(err.message).assertEqual('The resource is referenced cyclically');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0100
    * @tc.name    test getColorByName method in callback mode
    * @tc.desc    get the color by name in callback mode
    */
    it('getColorByName_test_0100', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getColorByName('color_test1', (err, value) => {
                expect(value !== null).assertTrue();
                console.log('getColorByName_test_0100 ' + value);
                expect(value).assertEqual(4294902015);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0110
    * @tc.name    test getColorByName method in callback mode
    * @tc.desc    get the color by name in callback mode
    */
    it('getColorByName_test_0110', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName(0x2000010, (err, value) => {
                    done();
                })
            }catch(err){
                console.log('getColorByName_test_0110 err.code' + err.code);
                console.log('getColorByName_test_0110 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0120
    * @tc.name    test getColorByName method in callback mode
    * @tc.desc    get the color by name in callback mode
    */
    it('getColorByName_test_0120', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('color_notexist', (err, value) => {
                    console.log('getColorByName_test_0120 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0120 err.message ' + err.message + '-');
                    expect(err.code == 9001003).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0120 error.code' + error.code);
                console.log('getColorByName_test_0120 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0130
    * @tc.name    test getColorByName method in callback mode
    * @tc.desc    get the color by name in callback mode
    */
    it('getColorByName_test_0130', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('integer_1', (err, value) => {
                    console.log('getColorByName_test_0130 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0130 err.message ' + err.message + '-');
                    expect(err.code == 9001003).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0130 error.code' + error.code);
                console.log('getColorByName_test_0130 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0140
    * @tc.name    test getColorByName method in callback mode
    * @tc.desc    get the color by name in callback mode
    */
    it('getColorByName_test_0140', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('color_test5', (err, value) => {
                    console.log('getColorByName_test_0140 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0140 err.message ' + err.message + '-');
                    expect(err.code == 9001004).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0140 error.code' + error.code);
                console.log('getColorByName_test_0140 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0150
    * @tc.name    test getColorByName method in callback mode
    * @tc.desc    get the color by name in callback mode
    */
    it('getColorByName_test_0150', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('color_test3', (err, value) => {
                    console.log('getColorByName_test_0150 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0150 err.message ' + err.message + '-');
                    expect(err.code == 9001006).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0150 error.code' + error.code);
                console.log('getColorByName_test_0150 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0200
    * @tc.name    test getColorByName method in promise mode
    * @tc.desc    get the color by name in promise mode
    */
    it('getColorByName_test_0200', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            mgr.getColorByName('color_test1').then(value => {
                expect(value !== null).assertTrue();
                console.log('getColorByName_test_0200 ' + value);
                expect(value).assertEqual(4294902015);
                done();
            })
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0210
    * @tc.name    test getColorByName method in promise mode
    * @tc.desc    get the color by name in promise mode
    */
    it('getColorByName_test_0210', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName(0x2000010).then(value => {
                    done();
                })
            }catch(err){
                console.log('getColorByName_test_0210 err.code' + err.code);
                console.log('getColorByName_test_0210 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0220
    * @tc.name    test getColorByName method in promise mode
    * @tc.desc    get the color by name in promise mode
    */
    it('getColorByName_test_0220', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('color_notexist').then(value => {
                }).catch(err => {
                    console.log('getColorByName_test_0220 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0220 err.message ' + err.message + '-');
                    expect(err.code == 9001003).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0220 error.code' + error.code);
                console.log('getColorByName_test_0220 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0230
    * @tc.name    test getColorByName method in promise mode
    * @tc.desc    get the color by name in promise mode
    */
    it('getColorByName_test_0230', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('integer_1').then(value => {
                }).catch(err => {
                    console.log('getColorByName_test_0230 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0230 err.message ' + err.message + '-');
                    expect(err.code == 9001003).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0230 error.code' + error.code);
                console.log('getColorByName_test_0230 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0240
    * @tc.name    test getColorByName method in promise mode
    * @tc.desc    get the color by name in promise mode
    */
    it('getColorByName_test_0240', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('color_test5').then(value => {
                }).catch(err => {
                    console.log('getColorByName_test_0240 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0240 err.message ' + err.message + '-');
                    expect(err.code == 9001004).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0240 error.code' + error.code);
                console.log('getColorByName_test_0240 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0250
    * @tc.name    test getColorByName method in promise mode
    * @tc.desc    get the color by name in promise mode
    */
    it('getColorByName_test_0250', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.getColorByName('color_test3').then(value => {
                }).catch(err => {
                    console.log('getColorByName_test_0250 err.code ' + err.code + '-');
                    console.log('getColorByName_test_0250 err.message ' + err.message + '-');
                    expect(err.code == 9001006).assertTrue();
                    expect(err.message).assertEqual('getColorByNameFunc failed state');
                    done();
                })
            }catch(error){
                console.log('getColorByName_test_0250 error.code' + error.code);
                console.log('getColorByName_test_0250 error.message' + error.message);
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_0100
    * @tc.name    test getColorByNameSync method
    * @tc.desc    get the sync color by name
    */
    it('getColorByNameSync_test_001', Level.LEVEL0, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            let value = mgr.getColorByNameSync('color_test1');
            expect(value !== null).assertTrue();
            console.log('getColorByNameSync_test_001 ' + value);
            expect(value).assertEqual(4294902015);
            done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_0200
    * @tc.name    test getColorByNameSync method
    * @tc.desc    get the sync color by name
    */
    it('getColorByNameSync_test_002', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorByNameSync(0x2000010);
            }catch(err){
                console.log('getColorByNameSync_test_002 err.code' + err.code);
                console.log('getColorByNameSync_test_002 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_0300
    * @tc.name    test getColorByNameSync method
    * @tc.desc    get the sync color by name
    */
    it('getColorByNameSync_test_003', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorByNameSync('color_notexist');
            }catch(err){
                console.log('getColorByNameSync_test_003 err.code' + err.code);
                console.log('getColorByNameSync_test_003 err.message' + err.message);
                expect(err.code).assertEqual('9001003');
                expect(err.message).assertEqual('Invalid resource name');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_0400
    * @tc.name    test getColorByNameSync method
    * @tc.desc    get the sync color by name
    */
    it('getColorByNameSync_test_004', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorByNameSync('integer_1');
            }catch(err){
                console.log('getColorByNameSync_test_004 err.code' + err.code);
                console.log('getColorByNameSync_test_004 err.message' + err.message);
                expect(err.code).assertEqual('9001003');
                expect(err.message).assertEqual('Invalid resource name');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_0500
    * @tc.name    test getColorByNameSync method
    * @tc.desc    get the sync color by name
    */
    it('getColorByNameSync_test_005', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorByNameSync('color_test5');
            }catch(err){
                console.log('getColorByNameSync_test_005 err.code' + err.code);
                console.log('getColorByNameSync_test_005 err.message' + err.message);
                expect(err.code).assertEqual('9001004');
                expect(err.message).assertEqual('No matching resource is found based on the resource name');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_0600
    * @tc.name    test getColorByNameSync method
    * @tc.desc    get the sync color by name
    */
    it('getColorByNameSync_test_006', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                let value = mgr.getColorByNameSync('color_test3');
            }catch(err){
                console.log('getColorByNameSync_test_006 err.code' + err.code);
                console.log('getColorByNameSync_test_006 err.message' + err.message);
                expect(err.code).assertEqual('9001006');
                expect(err.message).assertEqual('The resource is referenced cyclically');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_ADDRESOURCE_JS_0100
    * @tc.name    test addResource method with int param
    * @tc.desc    addResource
    */
    it('addResource_test_001', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.addResource(123);
            }catch(err){
                console.log('addResource_test_001 err.code' + err.code);
                console.log('addResource_test_001 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_ADDRESOURCE_JS_0200
    * @tc.name    test addResource method with not exist path
    * @tc.desc    addResource
    */
    it('addResource_test_002', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.addResource('123');
            }catch(err){
                console.log('addResource_test_002 err.code' + err.code);
                console.log('addResource_test_002 err.message' + err.message);
                expect(err.code).assertEqual('9001010');
                expect(err.message).assertEqual('Invalid overlay path');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_REMOVERESOURCE_JS_0100
    * @tc.name    test removeResource method with int param
    * @tc.desc    removeResource
    */
    it('removeResource_test_001', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.removeResource(123);
            }catch(err){
                console.log('removeResource_test_001 err.code' + err.code);
                console.log('removeResource_test_001 err.message' + err.message);
                expect(err.code).assertEqual('401');
                expect(err.message).assertEqual('Invalid input parameter');
                done();
            }
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_REMOVERESOURCE_JS_0200
    * @tc.name    test removeResource method with not exist path
    * @tc.desc    removeResource
    */
    it('removeResource_test_002', Level.LEVEL3, async function (done) {
        resmgr.getResourceManager((error, mgr) => {
            try{
                mgr.removeResource('123');
            }catch(err){
                console.log('removeResource_test_002 err.code' + err.code);
                console.log('removeResource_test_002 err.message' + err.message);
                expect(err.code).assertEqual('9001010');
                expect(err.message).assertEqual('Invalid overlay path');
                done();
            }
        })
    })

    console.log('*************end ResmgrTest*************');
})}
