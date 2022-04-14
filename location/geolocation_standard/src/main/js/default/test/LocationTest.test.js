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

import geolocation from '@ohos.geolocation';
import { LocationEventListener } from '@ohos.geolocation';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
let LocationRequestScenario = {UNSET : 0x300 ,NAVIGATION : 0x301 ,
    TRAJECTORY_TRACKING : 0x302 ,CAR_HAILING : 0x303,
    DAILY_LIFE_SERVICE : 0x304 ,NO_POWER : 0x305}
let LocationRequestPriority = {UNSET : 0x200 ,ACCURACY : 0x201 ,LOW_POWER : 0x202 ,FIRST_FIX :0x203}

let LocationPrivacyType = {
    OTHERS : 0,
    STARTUP: 1,
    CORE_LOCATION : 2
}
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode(){
    await geolocation.isLocationEnabled().then(async(result) => {
        console.info('[lbs_js] getLocationSwitchState result: ' + result);
        if(!result){
            await geolocation.enableLocation().then(async(result) => {
                await sleep(3000);
                console.info('[lbs_js] test enableLocation promise result:' + result);
                expect(result).assertTrue();
            }).catch((error) => {
                console.info("[lbs_js] promise then error." + error.message);
                expect().assertFail();
            });
        }
    })
}

async function applyPermission() {
    let appInfo = await bundle.getApplicationInfo('ohos.acts.location.geolocation.function', 0, 100);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName1 = 'ohos.permission.LOCATION';
        let permissionName2 = 'ohos.permission.LOCATION_IN_BACKGROUND';
        await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + result);
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + err);
        });
        await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + result);
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + err);
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}

describe('geolocationTest', function () {
    let data = {
        title: "",
        locationChange: null,
        locatlocationServiceState: null
    }
    console.log('#start AccessTokenTests#');
    beforeAll(async function (done) {
        await applyPermission();
            setTimeout(function () {
                this.locationChange = (err, location) => {
                console.log(' locationChange: ' + err + " data: " + JSON.stringify(location));
                };
                this.locationServiceState = (err, state) => {
                console.log('locationServiceState: ' + err + " data: " + state);
                };
                done();
            },3000);
        console.info('beforeAll case');
    })

    beforeEach(function () {
        sleep(3000);
        console.info('beforeEach case');
    })
    afterEach(function () {
    })

    /**
     * @tc.number LocRequest_0001
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0001
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0001', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
    })

    /**
     * @tc.number LocRequest_0002
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0002
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0002', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x200, "scenario":0x302, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
    })

    /**
     * @tc.number LocRequest_0003
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0003
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0003', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x200, "scenario":0x303, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
    })

    /**
     * @tc.number LocRequest_0004
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0004
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0004', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x200, "scenario":0x304, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
    })

    /**
     * @tc.number LocRequest_0005
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0005
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0005', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x200, "scenario":0x305, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
    })

    /**
     * @tc.number LocRequest_0006
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0006
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0006', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo1 = {"priority":0x201, "scenario":0x300, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let requestInfo2 = {"priority":0x202, "scenario":0x300, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo1,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.disableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  disableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] disableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        geolocation.on('locationChange',requestInfo2,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
    })

    /**
     * @tc.number LocRequest_0007
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0007
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0007', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x201, "scenario":0x300, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            async(locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                geolocation.off('locationChange',requestInfo,
                    (locationChange) => {
                        if(err){
                            return console.info("onLocationChange callback  err:  " + err);
                        }
                        console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                        expect(true).assertEqual(locationChange !=null);
                        done();
                    });
            });
    })

    /**
     * @tc.number LocRequest_0008
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0008
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0008', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x203, "scenario":0x300, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
       geolocation.on('locationChange',requestInfo,
            async(locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                geolocation.off('locationChange',requestInfo,
                    (locationChange) => {
                        if(err){
                            return console.info("onLocationChange callback  err:  " + err);
                        }
                        console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                        expect(true).assertEqual(locationChange !=null);
                        done();
                    });
            });
    })

    /**
     * @tc.number LocRequest_0009
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0009
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0009', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x202, "scenario":0x300, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            async(locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                geolocation.off('locationChange',requestInfo,
                    (locationChange) => {
                        if(err){
                            return console.info("onLocationChange callback  err:  " + err);
                        }
                        console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                        expect(true).assertEqual(locationChange !=null);
                        done();
                    });
            });
    })

    /**
     * @tc.number LocRequest_0010
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0010
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0010', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x202, "scenario":0x300, "timeInterval":3,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            async(locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                geolocation.off('locationChange',requestInfo,
                    (locationChange) => {
                        if(err){
                            return console.info("onLocationChange callback  err:  " + err);
                        }
                        console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                        expect(true).assertEqual(locationChange !=null);
                        done();
                    });
            });
    })

    /**
     * @tc.number LocRequest_0011
     * @tc.name SUB_HSS_LocationSystem_LocRequest_0011
     * @tc.desc Test locationChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0011', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x202, "scenario":0x300, "timeInterval":100,
            "distanceInterval": 5, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            async(locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                geolocation.off('locationChange',requestInfo,
                    (locationChange) => {
                        if(err){
                            return console.info("onLocationChange callback  err:  " + err);
                        }
                        console.info("offLocationChange callback, result:  " + JSON.stringify(locationChange));
                        expect(true).assertEqual(locationChange !=null);
                        done();
                    });
            });
    })

    /**
     * @tc.number LastLoc_0001
     * @tc.name SUB_HSS_LocationSystem_LastLoc_0001
     * @tc.desc Test getLastLocation api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LastLoc_0001', 0, async function(done) {
        await geolocation.enableLocation().then(async(result) => {
            console.info('[lbs_js] test enableLocation result: ' + result);
            expect(result).assertTrue();
            let currentLocationRequest = { "priority": 0x200, "scenario": 0x301, "timeoutMs": 10, "maxAccuracy": 0 };
            geolocation.getCurrentLocation(currentLocationRequest,
                (err, result) => {
                    if (err){
                        return console.info("getCurrentLocation callback err:  " + err)
                    }
                    console.info("getCurrentLocation callback, result:  " + JSON.stringify(result));
                    let resultLength = Object.keys(result).length;
                    expect(true).assertEqual(resultLength >= 0);
                });
            done()
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
        let requestInfo = {"priority":0x202, "scenario":0x301, "timeInterval":10,
            "distanceInterval": 5, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.getLastLocation().then( (result) => {
            console.info('[lbs_js] getLastLocation promise result '+ JSON.stringify(result));
            let resultLength = Object.keys(result).length;
            expect(true).assertEqual(resultLength >= 0);
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect(true).assertEqual(error != null);
        });
        geolocation.getLastLocation((err, data) => {
            if (err) {
                console.info('[lbs_js] getLastLocation callback err is : ' + err);
            }else {
                console.info("[lbs_js] getLastLocation callback data is: " + JSON.stringify(data));
                let resultLength = Object.keys(data).length;
                expect(true).assertEqual(resultLength >= 0);
                console.info('[lbs_js] getLastLocation latitude: ' + data[0].latitude +
                ' longitude: ' + data[0].longitude +' altitude: ' + data[0].altitude
                +' accuracy: ' + data[0].accuracy+' speed: ' + data[0].speed +
                'timeStamp: ' + data[0].timeStamp+'direction:' + data[0].direction+' timeSinceBoot: '
                + data[0].timeSinceBoot +'additions: ' + data[0].additions+' additionSize' + data[0].additionSize);
            }
        });
        done()
    })

    /**
     * @tc.number LastLoc_0002
     * @tc.name SUB_HSS_LocationSystem_LastLoc_0002
     * @tc.desc Test getLastLocation api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LastLoc_0002', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let requestInfo = {"priority":0x202, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.off('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("offLocationChange callback  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        await geolocation.getLastLocation().then( (result) => {
            console.info('[lbs_js] getLastLocation promise result '+ JSON.stringify(result));
            let resultLength = Object.keys(result).length;
            expect(true).assertEqual(resultLength >= 0);
            done();
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect(true).assertEqual(error != null);
            done();
        });
    })

    /**
     * @tc.number Privacy_0001
     * @tc.name SUB_HSS_LocationSystem_Privacy_0001
     * @tc.desc Test setLocationPrivacyConfirmStatus api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Privacy_0001', 0, async function (done) {
        let reqType = 1;
        let value = true;
        await geolocation.setLocationPrivacyConfirmStatus(reqType, value, async(err, resp)=>{
            console.log("[lbs_js] setLocationPrivacyConfirmStatus current type1 is "+ JSON.stringify(resp))
            await geolocation.isLocationPrivacyConfirmed(reqType ,async(err,resp) => {
                console.log("[lbs_js] isLocationPrivacyConfirmed current type1 is "+ JSON.stringify(resp))
                expect(resp).assertTrue();
                await geolocation.setLocationPrivacyConfirmStatus(reqType, false, async(err, resp)=>{
                    console.log("[lbs_js] setLocationPrivacyConfirmStatus current type2 is "+ JSON.stringify(resp))
                    await geolocation.isLocationPrivacyConfirmed(reqType ,(err,resp) => {
                        console.log("[lbs_js] isLocationPrivacyConfirmed current type2 is "+ JSON.stringify(resp))
                        expect(resp).assertFalse();
                        done();
                    });
                });
            });
        });
    })

    /**
     * @tc.number Privacy_0002
     * @tc.name SUB_HSS_LocationSystem_Privacy_0002
     * @tc.desc Test setLocationPrivacyConfirmStatus api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Privacy_0002', 0, async function (done) {
        await geolocation.setLocationPrivacyConfirmStatus(1,true).then(async(result) => {
            console.info('[lbs_js] setLocationPrivacyConfirmStatus promise1 result: ' + result);
            expect(result).assertTrue();
            await geolocation.isLocationPrivacyConfirmed(1).then( async(result) => {
                console.info('[lbs_js] isLocationPrivacyConfirmed promise1 result: ' + result);
                expect(result).assertTrue();
                await geolocation.setLocationPrivacyConfirmStatus(1,false).then(async(result) => {
                    console.info('[lbs_js] setLocationPrivacyConfirmStatus promise2 result: ' + result);
                    expect(result).assertTrue();
                    await geolocation.isLocationPrivacyConfirmed(1).then( (result) => {
                        console.info('[lbs_js] isLocationPrivacyConfirmed promise2 result: ' + result);
                        expect(result).assertFalse();
                        done()
                    });
                }).catch((error) => {
                    console.info("[lbs_js] setLocationPrivacyConfirmStatus then error." + error.message);
                    expect().assertFail();
                });
            });
        }).catch((error) => {
            console.info("[lbs_js] setLocationPrivacyConfirmStatus then error." + error.message);
            expect().assertFail();
        });
    })

    /**
     * @tc.number Privacy_0003
     * @tc.name SUB_HSS_LocationSystem_Privacy_0003
     * @tc.desc Test setLocationPrivacyConfirmStatus api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Privacy_0003', 0, async function (done) {
        let reqType = 2;
        let value = true;
        await geolocation.setLocationPrivacyConfirmStatus(reqType, value, async(err, resp)=>{
            console.log("[lbs_js] setLocationPrivacyConfirmStatus current type1 is "+ JSON.stringify(resp))
            await geolocation.isLocationPrivacyConfirmed(reqType ,async(err,resp) => {
                console.log("[lbs_js] isLocationPrivacyConfirmed current type1 is "+ JSON.stringify(resp))
                expect(resp).assertTrue();
                await geolocation.setLocationPrivacyConfirmStatus(reqType, false, async(err, resp)=>{
                    console.log("[lbs_js] setLocationPrivacyConfirmStatus current type2 is "+ JSON.stringify(resp))
                    await geolocation.isLocationPrivacyConfirmed(reqType ,(err,resp) => {
                        console.log("[lbs_js] isLocationPrivacyConfirmed current type2 is "+ JSON.stringify(resp))
                        expect(resp).assertFalse();
                        done();
                    });
                });
            });
        });
    })

    /**
     * @tc.number Privacy_0004
     * @tc.name SUB_HSS_LocationSystem_Privacy_0004
     * @tc.desc Test setLocationPrivacyConfirmStatus api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Privacy_0004', 0, async function (done) {
        await geolocation.setLocationPrivacyConfirmStatus(2,true).then(async(result) => {
            console.info('[lbs_js] setLocationPrivacyConfirmStatus promise1 result: ' + result);
            expect(result).assertTrue();
            await geolocation.isLocationPrivacyConfirmed(2).then( async(result) => {
                console.info('[lbs_js] isLocationPrivacyConfirmed promise1 result: ' + result);
                expect(result).assertTrue();
                await geolocation.setLocationPrivacyConfirmStatus(2,false).then(async(result) => {
                    console.info('[lbs_js] setLocationPrivacyConfirmStatus promise2 result: ' + result);
                    expect(result).assertTrue();
                    await geolocation.isLocationPrivacyConfirmed(2).then( (result) => {
                        console.info('[lbs_js] isLocationPrivacyConfirmed promise2 result: ' + result);
                        expect(result).assertFalse();
                        done()
                    });
                }).catch((error) => {
                    console.info("[lbs_js] setLocationPrivacyConfirmStatus then error." + error.message);
                    expect().assertFail();
                });
            });
        }).catch((error) => {
            console.info("[lbs_js] setLocationPrivacyConfirmStatus then error." + error.message);
            expect().assertFail();
        });
    })

    /**
     * @tc.number Privacy_0005
     * @tc.name SUB_HSS_LocationSystem_Privacy_0005
     * @tc.desc Test setLocationPrivacyConfirmStatus api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Privacy_0005', 0, async function (done) {
        await geolocation.setLocationPrivacyConfirmStatus(1,true).then(async(resp) => {
            console.log("[lbs_js] setLocationPrivacyConfirmStatus current type1 is "+ JSON.stringify(resp))
            expect(resp).assertTrue();
            await geolocation.setLocationPrivacyConfirmStatus(2,false).then(async(resp) => {
                console.log("[lbs_js] setLocationPrivacyConfirmStatus current type1 is "+ JSON.stringify(resp))
                expect(resp).assertTrue();
                await geolocation.isLocationPrivacyConfirmed(1).then(async(resp) => {
                    console.log("[lbs_js] isLocationPrivacyConfirmed current type2 is "+ JSON.stringify(resp))
                    expect(resp).assertTrue();
                    await geolocation.isLocationPrivacyConfirmed(2).then(resp => {
                        console.log("[lbs_js] isLocationPrivacyConfirmed current type2 is "+ JSON.stringify(resp))
                        expect(resp).assertFalse();
                        done();
                    });
                }).catch((error) => {
                    console.info("[lbs_js] setLocationPrivacyConfirmStatus then error." + error.message);
                    expect().assertFail();
                });
            });
        }).catch((error) => {
            console.info("[lbs_js] setLocationPrivacyConfirmStatus then error." + error.message);
            expect().assertFail();
        });

    })

    /**
     * @tc.number Privacy_0006
     * @tc.name SUB_HSS_LocationSystem_Privacy_0006
     * @tc.desc Test setLocationPrivacyConfirmStatus api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Privacy_0006', 0, async function (done) {
        await geolocation.setLocationPrivacyConfirmStatus(1,false).then(async(resp) => {
            console.log("[lbs_js] setLocationPrivacyConfirmStatus current type1 is "+ JSON.stringify(resp))
            expect(resp).assertTrue();
            await geolocation.setLocationPrivacyConfirmStatus(2,true).then(async(resp) => {
                console.log("[lbs_js] setLocationPrivacyConfirmStatus current type1 is "+ JSON.stringify(resp))
                expect(resp).assertTrue();
                await geolocation.isLocationPrivacyConfirmed(1).then(async(resp) => {
                    console.log("[lbs_js] isLocationPrivacyConfirmed current type2 is "+ JSON.stringify(resp))
                    expect(resp).assertFalse();
                    await geolocation.isLocationPrivacyConfirmed(2).then(resp => {
                        console.log("[lbs_js] isLocationPrivacyConfirmed current type2 is "+ JSON.stringify(resp))
                        expect(resp).assertTrue();
                        done();
                    })
                })
            })
        })
    })

    /**
     * @tc.number Gnss_0001
     * @tc.name SUB_HSS_LocationSystem_Gnss_0001
     * @tc.desc Test gnssStatusChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Gnss_0001', 0, async function (done) {
        await changedLocationMode();
        try {
             geolocation.on('gnssStatusChange', function (data) {
                console.info('[lbs_js] gnssStatusChangestart' +JSON.stringify(data) );
                expect(true).assertEqual((JSON.stringify(data)) !=null);
                console.info('[lbs_js] SatelliteStatusInfo satellitesNumber: ' + data[0].satellitesNumber +
                'satelliteIds' + data[0].satelliteIds +'carrierToNoiseDensitys'+ data[0].carrierToNoiseDensitys
                +'altitudes' + data[0].altitudes+' azimuths: ' + data[0].azimuths +
                'carrierFrequencies: ' + data[0].carrierFrequencies);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        try {
             geolocation.off('gnssStatusChange', function (data) {
                console.info("[lbs_js] gnssStatusChange off data:" + JSON.stringify(data));
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number Gnss_0002
     * @tc.name SUB_HSS_LocationSystem_Gnss_0002
     * @tc.desc Test gnssStatusChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Gnss_0002', 0, async function (done) {
        await changedLocationMode();
        try {
             geolocation.on('nmeaMessageChange', function (data) {
                console.info('[lbs_js] nmeaMessageChange' +JSON.stringify(data) );
            });
        }catch(e) {
            expect(null).assertFail();
        }
        try {
             geolocation.off('nmeaMessageChange', function (data) {
                console.info("[lbs_js] nmeaMessageChange off data:" + JSON.stringify(data));
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number GeoFence_0001
     * @tc.name SUB_HSS_LocationSystem_GeoFence_0001
     * @tc.desc Test fenceStatusChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_HSS_LocationSystem_GeoFence_0001', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
        let geofenceRequest = {"priority":0x200, "scenario":0x301, "geofence": geofence};
        let want = (wantAgent) => {
            console.log('wantAgent: ' + JSON.stringify(wantAgent));
        };
         geolocation.on('fenceStatusChange', geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange on callback  err:  " + err);
                }
                console.info("fenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
                done();
            });
         geolocation.off('fenceStatusChange',geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange callback  err:  " + err);
                }
                console.info("offfenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
            });
        done();
    })

    /**
     * @tc.number GeoFence_0003
     * @tc.name SUB_HSS_LocationSystem_GeoFence_0003
     * @tc.desc Test fenceStatusChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_HSS_LocationSystem_GeoFence_0003', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
        let geofenceRequest = {"priority":0x200, "scenario":0x304, "geofence": geofence};
        let want = (wantAgent) => {
            console.log('wantAgent: ' + JSON.stringify(wantAgent));
        };
         geolocation.on('fenceStatusChange', geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange on callback  err:  " + err);
                }
                console.info("fenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
            });
         geolocation.off('fenceStatusChange',geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange callback  err:  " + err);
                }
                console.info("off fenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
            });
        done();
    })

    /**
     * @tc.number GeoFence_0004
     * @tc.name SUB_HSS_LocationSystem_GeoFence_0004
     * @tc.desc Test fenceStatusChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_HSS_LocationSystem_GeoFence_0004', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
        let geofenceRequest = {"priority":0x203, "scenario":0x300, "geofence": geofence};
        let want = (wantAgent) => {
            console.log('wantAgent: ' + JSON.stringify(wantAgent));
        };
         geolocation.on('fenceStatusChange', geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange on callback  err:  " + err);
                }
                console.info("fenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
                done();
            });
         geolocation.off('fenceStatusChange',geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange callback  err:  " + err);
                }
                console.info("offfenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
            });
        done();
    })

    /**
     * @tc.number GeoFence_0005
     * @tc.name SUB_HSS_LocationSystem_GeoFence_0005
     * @tc.desc Test fenceStatusChange api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_HSS_LocationSystem_GeoFence_0005', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": 5000};
        let geofenceRequest = {"priority":0x203, "scenario":0x300, "geofence": geofence};
        let want = (wantAgent) => {
            console.log('wantAgent: ' + JSON.stringify(wantAgent));
        };
         geolocation.on('fenceStatusChange', geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange on callback  err:  " + err);
                }
                console.info("fenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
                done();
            });
         geolocation.off('fenceStatusChange',geofenceRequest,
            (want) => {
                if(err){
                    return console.info("fenceStatusChange callback  err:  " + err);
                }
                console.info("offfenceStatusChange callback, result:  " + JSON.stringify(want));
                expect(true).assertEqual(want !=null);
            });
        done();
    })

    /**
     * @tc.number Batching_0001
     * @tc.name SUB_HSS_LocationSystem_Batching_0001
     * @tc.desc Test cachedGnssLocationsReporting api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0001', 0, async function (done) {
        await changedLocationMode();
        let request = {"reportingPeriodSec": 5, "wakeUpCacheQueueFull": false};
         geolocation.on('cachedGnssLocationsReporting',request,
            (result) => {
                if(err){
                    return console.info("oncachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("cachedGnssLocationsReporting result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 30, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
         geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
            });
        let request1 = {"reportingPeriodSec": 10, "wakeUpCacheQueueFull": false};
         geolocation.on('cachedGnssLocationsReporting',request1,
            (result) => {
                if(err){
                    return console.info("oncachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("cachedGnssLocationsReporting result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
            });
        done();
    })

    /**
     * @tc.number Batching_0002
     * @tc.name SUB_HSS_LocationSystem_Batching_0002
     * @tc.desc Test cachedGnssLocationsReporting api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0002', 0, async function (done) {
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
            }
            done()
        });
        let request = {"reportingPeriodSec": 5, "wakeUpCacheQueueFull": false};
         geolocation.on('cachedGnssLocationsReporting',request,
            result => {
                if(err){
                    return console.info("oncachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("cachedGnssLocationsReporting result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 30, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
         geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done()
            });
         geolocation.off('cachedGnssLocationsReporting',request,
            (result) => {
                if(err){
                    return console.info("cachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("offcachedGnssLocationsReporting callback " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
    })

    /**
     * @tc.number Batching_0003
     * @tc.name SUB_HSS_LocationSystem_Batching_0003
     * @tc.desc Test cachedGnssLocationsReporting api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0003', 0, async function (done) {
        await changedLocationMode();
        let request = {"reportingPeriodSec": 5, "wakeUpCacheQueueFull": true};
         geolocation.on('cachedGnssLocationsReporting',request,
            (result) => {
                if(err){
                    return console.info("oncachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("cachedGnssLocationsReporting result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 30, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
         geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.getCachedGnssLocationsSize((err, data) => {
            if (err) {
                console.info('[lbs_js]  getCachedGnssLocationsSize callback err is : ' + err);
            }else {
                console.info("[lbs_js] getCachedGnssLocationsSize callback data is: " + JSON.stringify(data));
                expect(true).assertTrue(data != null);
                done()
            }
        });

    })

    /**
     * @tc.number Batching_0004
     * @tc.name SUB_HSS_LocationSystem_Batching_0004
     * @tc.desc Test cachedGnssLocationsReporting api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0004', 0, async function (done) {
        await changedLocationMode();
        let request = {"reportingPeriodSec": 5, "wakeUpCacheQueueFull": true};
         geolocation.on('cachedGnssLocationsReporting',request,
            (result) => {
                if(err){
                    return console.info("oncachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("cachedGnssLocationsReporting result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 30, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        await geolocation.getCachedGnssLocationsSize().then( (result) => {
            console.info('[lbs_js] getCachedGnssLocationsSiz promise '+ JSON.stringify(result));
            expect(true).assertTrue(result != null);
            done();
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
            done();
        });
    })

    /**
     * @tc.number Batching_0005
     * @tc.name SUB_HSS_LocationSystem_Batching_0005
     * @tc.desc Test cachedGnssLocationsReporting api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0005', 0, async function (done) {
        await changedLocationMode();
        let request = {"reportingPeriodSec": 5, "wakeUpCacheQueueFull": true};
        geolocation.on('cachedGnssLocationsReporting',request,
            (result) => {
                if(err){
                    return console.info("oncachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("cachedGnssLocationsReporting result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 30, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        geolocation.flushCachedGnssLocations((err, data) => {
            if (err) {
                console.info('[lbs_js]  flushCachedGnssLocations callback err is : ' + err);
            }else {
                console.info("[lbs_js] flushCachedGnssLocations callback data is: " + JSON.stringify(data));
                expect(true).assertTrue(data);
                done();
            }
        });

    })

    /**
     * @tc.number Batching_0006
     * @tc.name SUB_HSS_LocationSystem_Batching_0006
     * @tc.desc Test cachedGnssLocationsReporting api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0006', 0, async function (done) {
        await changedLocationMode();
        let request = {"reportingPeriodSec": 5, "wakeUpCacheQueueFull": true};
        geolocation.on('cachedGnssLocationsReporting',request,
            (result) => {
                if(err){
                    return console.info("oncachedGnssLocationsReporting callback  err:  " + err);
                }
                console.info("cachedGnssLocationsReporting result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
                done();
            });
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 30, "maxAccuracy": 0};
        let locationChange = (location) => {
            console.log('locationChanger: ' + JSON.stringify(location));
        };
        geolocation.on('locationChange',requestInfo,
            (locationChange) => {
                if(err){
                    return console.info("onLocationChange callback  err:  " + err);
                }
                console.info("onLocationChange callback, result:  " + JSON.stringify(locationChange));
                expect(true).assertEqual(locationChange !=null);
                done();
            });
        await geolocation.flushCachedGnssLocations().then( (result) => {
            console.info('[lbs_js] flushCachedGnssLocations promise '+ JSON.stringify(result));
            expect(true).assertTrue(result);
            done();
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
            done();
        });
    })
})


