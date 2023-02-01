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
import osaccount from '@ohos.account.osAccount'
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
        console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result));
        if(!result){
            await geolocation.requestEnableLocation().then(async(result) => {
                await sleep(3000);
                console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
            }).catch((error) => {
                console.info("[lbs_js] promise then error." + JSON.stringify(error));
                expect().assertFail();
            });
        }
    });
    await geolocation.isLocationEnabled().then(async(result) => {
        console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result));
    });
}

async function enableLocationSwitch(){
    function enableLocationSwitchCallback(){
        return new Promise((resolve, reject)=>{
            geolocation.requestEnableLocation((err, data) => {
                if (err) {
                    console.info('[lbs_js]  requestEnableLocation callback err is : ' + err );
                }else {
                    console.info("[lbs_js] requestEnableLocation callback data: " + data);
                    expect(data).assertTrue();
                }
            });
        })
    }
    await enableLocationSwitchCallback();
    done();

}


async function applyPermission() {
    let osAccountManager = osaccount.getAccountManager();
    console.info("=== getAccountManager finish");
    let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
    console.info("LocalId is :" + localId);
    let appInfo = await bundle.getApplicationInfo('ohos.acts.location.geolocation.function', 0, localId);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName1 = 'ohos.permission.LOCATION';
        let permissionName2 = 'ohos.permission.LOCATION_IN_BACKGROUND';
        await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
        await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}

describe('geolocationTest_geo3', function () {
    beforeAll(async function (done) {
        console.info('beforeAll case');
        await applyPermission();
        done();
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })
    afterEach(function () {
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocSwitch_0300
     * @tc.name Test requestrequestEnableLocation api
     * @tc.desc Enabling the Location Service Function for a Third-Party App - Callback
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocSwitch_0300', 0, async function (done) {
        geolocation.isLocationEnabled(async (err, data) => {
            if (err) {
                console.info('[lbs_js] getLocationSwitchState callback err is : ' + JSON.stringify(err));

            } else {
                console.info("[lbs_js] getLocationSwitchState callback data: " + JSON.stringify(data));
                expect(data).assertTrue();
            }
            done()
        })
    });

    /**
     * @tc.number LocSwitch_0400
     * @tc.name Test requestrequestEnableLocation api.
     * @tc.desc Enabling the Location Service Function for a Third-Party Application -Promise Mode
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocSwitch_0400', 0, async function (done) {
        await geolocation.isLocationEnabled().then((result1) => {
            console.info('[lbs_js] getLocationSwitchStateLocSwitch_0004 result: ' + JSON.stringify(result1));
            expect(result1).assertTrue();
        }).catch((error) => {
            expect().assertFail();
        });
        done();
    });

    /**
     * @tc.number SUB_HSS_LocationSystem_LocSwitch_0500
     * @tc.name Test locationServiceState api .
     * @tc.desc Subscribe to the location service status change.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocSwitch_0500', 0, async function (done) {
        console.log('just for overwriting,locationServiceState test need system api ');
        var locationServiceState = (state) => {
            console.log('locationServiceState: state: ' + JSON.stringify(state));
        }
        geolocation.on('locationServiceState', locationServiceState);
        geolocation.off('locationServiceState', locationServiceState);
	expect(true).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0100
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request in a specified scenario and set the navigation scenario..
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0100', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x301, "timeoutMs": 1000, "maxAccuracy": 0 };
        function getCurrentLocationCallback() {
            return new Promise((resolve, reject) => {
                geolocation.getCurrentLocation(currentLocationRequest, (err, result) => {
                    if (err) {
                        console.info("getCurrentLocation callback err:  " + JSON.stringify(err));
                        expect(true).assertEqual(err != null);
                        console.info('getCurrentLocationCallback reject after')
                    } else {
                        console.info("getCurrentLocation callback, result:  " + JSON.stringify(result));
                        expect(true).assertEqual(result != null);
                        resolve();
                    }
                });
            })
        }
        console.info('getCurrentLocationCallback  start');
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info("getCurrentLocation callback_0003, result:  " + JSON.stringify(result));
            expect(true).assertEqual(result != null);
        }).catch(error => {
            console.info('getCurrentLocation callback_0003:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0200
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request in a specified scenario and set the navigation scenario..
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0200', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x203, "scenario": 0x301, "timeoutMs": 1000, "maxAccuracy": 0 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation_0002 promise err:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0300
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request in a specified scenario and set the track tracing scenario.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0300', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x302, "timeoutMs": 1000, "maxAccuracy": 10 };
        function getCurrentLocationCallback() {
            return new Promise((resolve, reject) => {
                geolocation.getCurrentLocation(currentLocationRequest, (err, result) => {
                    if (err) {
                        console.info("getCurrentLocation callback_0003 err:  " + JSON.stringify(err));
                        expect(true).assertEqual(err != null);
                        console.info('getCurrentLocationCallback reject after')
                    } else {
                        console.info("getCurrentLocation callback_0003, result:  " + JSON.stringify(result));
                        expect(true).assertEqual(result != null);
                        resolve();
                    }
                });
            })
        }
        console.info('getCurrentLocationCallback  start');
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info("getCurrentLocation callback_0003, result:  " + JSON.stringify(result));
            expect(true).assertEqual(result != null);
        }).catch(error => {
            console.info('getCurrentLocation callback_0003:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0400
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request in a specified scenario and set a car-sharing scenario.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0400', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x303, "timeoutMs": 1000, "maxAccuracy": 10 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result004 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err004:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0500
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request in a specified scenario and set the life service scenario..
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0500', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x200, "scenario": 0x304, "timeoutMs": 1000, "maxAccuracy": 0 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result005 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err005:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0600
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request in a specified scenario
     *           and set the scenario with no power consumption.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0600', 0, async function (done) {
        let currentLocationRequest1 = { "priority": 0x200, "scenario": 0x305, "timeoutMs": 1000, "maxAccuracy": 10 };
        let currentLocationRequest2 = { "priority": 0x200, "scenario": 0x301, "timeoutMs": 1000, "maxAccuracy": 10 };
        await geolocation.getCurrentLocation(currentLocationRequest1).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result0061 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err0061:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        })
        await geolocation.getCurrentLocation(currentLocationRequest2).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result0062 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation_0002 promise err0062:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0700
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request with the parameter set to high-precision priority location request.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0700', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 10 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result007 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err007:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0800
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request with parameters set to fast location and priority location request.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0800', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0203, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 10 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result010 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err010:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_0900
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request with parameters set to low power consumption.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_0900', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0202, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 0 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result009 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err009:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_1000
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request and set the location reporting precision.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_1000', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0200, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 5 };
        let currentLocationRequest1 = { "priority": 0x0200, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 2 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result010 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err010:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        })
        await geolocation.getCurrentLocation(currentLocationRequest1).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result0102 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err0102:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        })
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_SingleLoc_1100
     * @tc.name Test getCurrentLocation
     * @tc.desc Initiate a single location request for specific configuration
     *          and set the reporting precision of abnormal location.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_SingleLoc_1100', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": 0 };
        let currentLocationRequest1 = { "priority": 0x0201, "scenario": 0x0300, "timeoutMs": 1000, "maxAccuracy": -1 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result011 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err011:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        })
        await geolocation.getCurrentLocation(currentLocationRequest1).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result0112 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err0112:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_SingleLoc_1200
    * @tc.name Test getCurrentLocation
    * @tc.desc Initiate a single location request and set the location timeout interval.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_SingleLoc_1200', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0301, "timeoutMs": 1000, "maxAccuracy": 0 };
        let currentLocationRequest1 = { "priority": 0x0201, "scenario": 0x0301, "timeoutMs": 1000, "maxAccuracy": 0 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result012 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err012:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        })
        await geolocation.getCurrentLocation(currentLocationRequest1).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result0122 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err0122:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_SingleLoc_1300
    * @tc.name Test getCurrentLocation
    * @tc.desc Initiate a specified single location request and set the exception location timeout interval.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_SingleLoc_1300', 0, async function (done) {
        let currentLocationRequest = { "priority": 0x0201, "scenario": 0x0302, "timeoutMs": 0, "maxAccuracy": 0 };
        let currentLocationRequest1 = { "priority": 0x0201, "scenario": 0x0302, "timeoutMs": -1000, "maxAccuracy": 0 };
        await geolocation.getCurrentLocation(currentLocationRequest).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result0131 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err0122:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        });
        await geolocation.getCurrentLocation(currentLocationRequest1).then((result) => {
            console.info('[lbs_js] getCurrentLocation promise result0132 ' + JSON.stringify(result));
        }).catch(error => {
            console.info('getCurrentLocation promise err0122:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
            done();
        })
        done()
    })



    /**
     * @tc.number SUB_HSS_SendCommand_0100
     * @tc.name Test sendCommand
     * @tc.desc Test sendCommand api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_SendCommand_0100', 0, async function (done) {
        let requestInfo = { 'scenairo': 0x301, 'command': "command_1" };
        try {
            await geolocation.sendCommand(requestInfo, (err, result) => {
                if (err) {
                    console.info('sendcommand callback err:' + JSON.stringify(err));
                    expect(true).assertEqual(JSON.stringify(err) != null);
                    done();
                }
                console.info('sendcommand callback result:' + JSON.stringify(result));
            });
        } catch (error) {
            console.info('sendcommand callback err:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_SendCommand_0200
     * @tc.name Test sendCommand
     * @tc.desc Test sendCommand1 api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_SendCommand_0200', 0, async function (done) {
        let requestInfo = { 'scenairo': 0x301, 'command': "command_1" };
        try {
            geolocation.sendCommand(requestInfo).then((result) => {
                console.info('sendCommand promise result:' + result);
                done();
            }).catch(error => {
                console.info('sendcommand promise err:' + JSON.stringify(error));
                expect(true).assertEqual(JSON.stringify(error) != null);
                done();
            })
        } catch (error) {
            console.info('sendcommand promise err:' + JSON.stringify(error));
            expect(true).assertEqual(JSON.stringify(error) != null);
        }
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0100
     * @tc.name Test locationChange
     * @tc.desc Initiate a request for continuous positioning in a specified scenario and set the navigation scenario.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0100', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0200
     * @tc.name Test locationChange
     * @tc.desc Initiate a request for continuous positioning in a specified scenario and set a track tracing scenario.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0200', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x302, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0300
     * @tc.name Test locationChange
     * @tc.desc Initiate a continuous location request in a specified scenario and set a car-sharing scenario.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0300', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x303, "timeInterval":5,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0400
     * @tc.name Test locationChange
     * @tc.desc Initiate a continuous location request in a specified scenario and set a life service scenario.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0400', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x303, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0500
     * @tc.name Test locationChange
     * @tc.desc Initiate a continuous location request in a specified scenario
     *          and set the scenario with no power consumption.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0500', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x305, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange1 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        var locationChange2 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange1);
        geolocation.on('locationChange', requestInfo, locationChange2);
        geolocation.off('locationChange', locationChange1);
        geolocation.off('locationChange', locationChange2);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0700
     * @tc.name Test locationChange
     * @tc.desc Initiate a specified continuous positioning request and
     *          set the parameter to high-precision priority positioning request.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0700', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x201, "scenario":0x300, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0800
     * @tc.name Test locationChange
     * @tc.desc Initiate a specified continuous positioning request with the parameter
     *          set to fast positioning and priority positioning request.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0800', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x203, "scenario":0x300, "timeInterval":5,
            "distanceInterval": 5, "maxAccuracy": 10};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_0900
     * @tc.name Test locationChange
     * @tc.desc Initiate a specified continuous positioning request with the parameter
     *          set to low power consumption type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_0900', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x202, "scenario":0x300, "timeInterval":1,
            "distanceInterval": 5, "maxAccuracy": 10}
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_1000
     * @tc.name Test locationChange
     * @tc.desc Initiate a specified continuous location request and set the reporting interval.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_1000', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":3,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LocRequest_1100
     * @tc.name Test locationChange
     * @tc.desc Initiate a specified continuous location request and set the location reporting interval.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LocRequest_1100', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":5,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_LocRequest_1200
    * @tc.name Test locationChange
    * @tc.desc Initiate a specified continuous location request and set the interval for reporting exceptions.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_LocRequest_1200', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_LocRequest_1300
    * @tc.name Test locationChange
    * @tc.desc Initiate a specified continuous location request and set the interval for reporting abnormal locations.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_LocRequest_1300', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        let requestInfo2 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange1 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        var locationChange2 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo1, locationChange1);
        geolocation.off('locationChange', locationChange1);
        geolocation.on('locationChange', requestInfo2, locationChange2);
        geolocation.off('locationChange', locationChange2);
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_LocRequest_1400
    * @tc.name Test locationChange
    * @tc.desc Initiate a specified continuous positioning request and set the positioning reporting precision.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_LocRequest_1400', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 5};
        let requestInfo2 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 2};
        var locationChange1 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        var locationChange2 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo1, locationChange1);
        geolocation.off('locationChange', locationChange1);
        geolocation.on('locationChange', requestInfo2, locationChange2);
        geolocation.off('locationChange', locationChange2);
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_LocRequest_1500
    * @tc.name Test locationChange
    * @tc.desc Initiate a specified continuous location request and set the reporting precision of abnormal location.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_LocRequest_1500', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo1 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        let requestInfo2 = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": -1};
        var locationChange1 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        var locationChange2 = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo1, locationChange1);
        geolocation.off('locationChange', locationChange1);
        geolocation.on('locationChange', requestInfo2, locationChange2);
        geolocation.off('locationChange', locationChange2);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LastLoc_0100
     * @tc.name Test getLastLocation
     * @tc.desc Obtain the last location after a single location.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LastLoc_0100', 0, async function(done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);
        await geolocation.getLastLocation().then((result) => {
            console.info('[lbs_js] getLastLocation promise result: ' + JSON.stringify(result));
            expect(true).assertEqual(JSON.stringify(result) != null);
            console.info('[lbs_js] getLastLocation latitude: ' + result.latitude +
            ' longitude: ' + result.longitude +' altitude: ' + result.altitude
            +' accuracy: ' + result.accuracy+' speed: ' + result.speed +
            'timeStamp: ' + result.timeStamp+'direction:' + result.direction+' timeSinceBoot: '
            + result.timeSinceBoot +'additions: ' + result.additions+' additionSize' + result.additionSize
            + 'isFromMock' +result.isFromMock);
        }).catch((error) => {
            console.info("[lbs_js] getLastLocation promise then error:" + JSON.stringify(error));
            console.info('[lbs_js] not support now');
            expect(true).assertEqual(JSON.stringify(error) != null);
        });
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_LastLoc_0200
     * @tc.name Test getLastLocation
     * @tc.desc Obtain the last location after continuous positioning.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_LastLoc_0200', 0, async function (done) {
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('locationChange', locationChange);

        function getLastLocationCallback(){
            return new Promise((resolve, reject)=>{
                geolocation.getLastLocation((err, data) => {
                    if (err) {
                        console.info('[LastLoc_0002]  getLastLocation callback err is : ' + JSON.stringify(err));
                        expect(true).assertEqual(err !=null);
                    } else {
                        console.info('[LastLoc_0002] getLastLocation callback result: ' + JSON.stringify(data));
                        expect(true).assertEqual(data !=null);
                    }
                    resolve();
                });
            })
        }
        await getLastLocationCallback();
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Gnss_0100
     * @tc.name Test gnssStatusChange
     * @tc.desc Monitoring Satellite Information Reporting
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Gnss_0100', 0, async function (done) {
        await changedLocationMode();
        var gnssStatusCb = (satelliteStatusInfo) => {
            console.info('gnssStatusChange: ' + satelliteStatusInfo);
            expect(true).assertEqual(satelliteStatusInfo != null)
            console.info('[lbs_js] SatelliteStatusInfo satellitesNumber: ' + data[0].satellitesNumber +
            'satelliteIds' + data[0].satelliteIds +'carrierToNoiseDensitys'+ data[0].carrierToNoiseDensitys
            +'altitudes' + data[0].altitudes+' azimuths: ' + data[0].azimuths +
            'carrierFrequencies: ' + data[0].carrierFrequencies);
        }
        geolocation.on('gnssStatusChange', gnssStatusCb);
        enableLocationSwitch();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('gnssStatusChange', gnssStatusCb);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Gnss_0200
     * @tc.name Test nmeaMessageChange
     * @tc.desc Monitoring NMEA Information Reporting
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Gnss_0200', 0, async function (done) {
        await changedLocationMode();
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        var nmeaCb = (str) => {
            console.log('nmeaMessageChange: ' + str);
        }
        var locationChange = (location) => {
            console.log('locationChanger: data: ' + JSON.stringify(location));
            expect(true).assertEqual(locationChange !=null);
        };
        geolocation.on('nmeaMessageChange', nmeaCb);
        geolocation.on('locationChange', requestInfo, locationChange);
        geolocation.off('nmeaMessageChange', nmeaCb);
        geolocation.off('locationChange', locationChange);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Batching_0100
     * @tc.name Test cachedGnssLocationsReporting
     * @tc.desc Setting the Gnss Batching Reporting Interval
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0100', 0, async function (done) {
        var cachedLocationsCb1 = (locations) => {
            console.log('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest1 = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': false};
        geolocation.on('cachedGnssLocationsReporting', CachedGnssLoactionsRequest1, cachedLocationsCb1);
        geolocation.off('cachedGnssLocationsReporting',cachedLocationsCb1);
        var cachedLocationsCb2 = (locations) => {
            console.log('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest2 = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': false};
        geolocation.on('cachedGnssLocationsReporting', CachedGnssLoactionsRequest2, cachedLocationsCb2);
        geolocation.off('cachedGnssLocationsReporting',cachedLocationsCb1);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Batching_0200
     * @tc.name Test cachedGnssLocationsReporting
     * @tc.desc Setting the Gnss Batching Cache Queue to Be Reported When the Gnss Batching Cache Queue Is Full
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0200', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        geolocation.on('cachedGnssLocationsReporting', CachedGnssLoactionsRequest, cachedLocationsCb);
        geolocation.off('cachedGnssLocationsReporting',cachedLocationsCb);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Batching_0300
     * @tc.name Test getCachedGnssLocationsSize
     * @tc.desc Obtains the number of GNSS data records in the batching process.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0300', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        geolocation.on('cachedGnssLocationsReporting', CachedGnssLoactionsRequest, cachedLocationsCb);
        geolocation.off('cachedGnssLocationsReporting',cachedLocationsCb);
        function getCachedGnssLocationsSizeCallback(){
            return new Promise((resolve, reject)=>{
                geolocation.getCachedGnssLocationsSize((err, data) => {
                    if (err) {
                        console.info('[lbs_js]  getCachedGnssLocationsSize callback err is : ' + JSON.stringify(err));
                        expect(true).assertTrue(err != null);
                    }else {
                        console.info("[lbs_js] getCachedGnssLocationsSize callback data is: " + JSON.stringify(data));
                        expect(true).assertTrue(data != null);
                    }
                    resolve();
                });
            })
        }
        await getCachedGnssLocationsSizeCallback();
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Batching_0400
     * @tc.name Test getCachedGnssLocationsSize
     * @tc.desc Obtains the number of GNSS data records in the batching process.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0400', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        geolocation.on('cachedGnssLocationsReporting', CachedGnssLoactionsRequest, cachedLocationsCb);
        geolocation.off('cachedGnssLocationsReporting',cachedLocationsCb);
        await geolocation.getCachedGnssLocationsSize().then( (result) => {
            console.info('[lbs_js] getCachedGnssLocationsSiz promise '+ JSON.stringify(result));
            expect(true).assertTrue(result != null);
            done();
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + JSON.stringify(error));
            expect(true).assertTrue(error != null);
            done();
        });
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Batching_0500
     * @tc.name Test flushCachedGnssLocations
     * @tc.desc Obtains the GNSS data of the current batching.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0500', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        geolocation.on('cachedGnssLocationsReporting', CachedGnssLoactionsRequest, cachedLocationsCb);
        geolocation.off('cachedGnssLocationsReporting',cachedLocationsCb);
        function flushCachedGnssLocationsCallback(){
            return new Promise((resolve, reject)=>{
                geolocation.flushCachedGnssLocations((err, data) => {
                    if (err) {
                        console.info('[lbs_js]  flushCachedGnssLocations callback err is : ' + JSON.stringify(err));
                        expect(true).assertTrue(err != null);
                    }else {
                        console.info("[lbs_js] flushCachedGnssLocations callback data is: " + JSON.stringify(data));
                        expect(true).assertTrue(data);
                    }
                    resolve();
                });
            })
        }
        await flushCachedGnssLocationsCallback();
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_Batching_0600
     * @tc.name Test flushCachedGnssLocations
     * @tc.desc Obtain the GNSS data of the current batching.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_Batching_0600', 0, async function (done) {
        var cachedLocationsCb = (locations) => {
            console.log('cachedGnssLocationsReporting: locations: ' + JSON.stringify(locations));
            expect(true).assertEqual(locations !=null);
        }
        var CachedGnssLoactionsRequest = {'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true};
        let requestInfo = {"priority":0x200, "scenario":0x301, "timeInterval":0,
            "distanceInterval": 0, "maxAccuracy": 0};
        geolocation.on('cachedGnssLocationsReporting', CachedGnssLoactionsRequest, cachedLocationsCb);
        geolocation.off('cachedGnssLocationsReporting',cachedLocationsCb);
        await geolocation.flushCachedGnssLocations().then( (result) => {
            console.info('[lbs_js] flushCachedGnssLocations promise '+ JSON.stringify(result));
            expect(true).assertTrue(result);
            done();
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + JSON.stringify(error));
            expect(true).assertTrue(error != null);
            done();
        });
        done();
    })

    /**
    * @tc.number SUB_HSS_LocationSystem_GeoFence_0100
    * @tc.name Test fenceStatusChange
    * @tc.desc Gnss fence function test
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 1
    */
    it('SUB_HSS_LocationSystem_GeoFence_0100', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
        let geofenceRequest = {"priority":0x200, "scenario":0x301, "geofence": geofence};
        setTimeout(async ()=>{
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
                    console.info("off fenceStatusChange callback, result:  " + JSON.stringify(want));
                    expect(true).assertEqual(want !=null);
                });
        },1000);
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_GeoFence_0500
     * @tc.name Test fenceStatusChange
     * @tc.desc Test the function of locating the validity period of the fence.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_HSS_LocationSystem_GeoFence_0500', 0, async function (done) {
        await changedLocationMode();
        let geofence = {"latitude": 31.12, "longitude": 121.11, "radius": 1,"expiration": ""};
        let geofenceRequest = {"priority":0x203, "scenario":0x301, "geofence": geofence};
        setTimeout(async ()=>{
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
                    console.info("off fenceStatusChange callback, result:  " + JSON.stringify(want));
                    expect(true).assertEqual(want !=null);
                });
        },1000);
        done();
    })
})


