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
import geolocationm from '@ohos.geoLocationManager';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osaccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

let request_scenario_UNSET = geolocationm.LocationRequestScenario.UNSET
let request_scenario_NAVIGATION = geolocationm.LocationRequestScenario.NAVIGATION
let request_scenario_TRAJECTORY_TRACKING = geolocationm.LocationRequestScenario.TRAJECTORY_TRACKING
let request_scenario_CAR_HAILING = geolocationm.LocationRequestScenario.CAR_HAILING
let request_scenario_DAILY_LIFE_SERVICE = geolocationm.LocationRequestScenario.DAILY_LIFE_SERVICE
let request_scenario_NO_POWER = geolocationm.LocationRequestScenario.NO_POWER

let request_priority_UNSET = geolocationm.LocationRequestPriority.UNSET
let request_priority_ACCURACY = geolocationm.LocationRequestPriority.ACCURACY
let request_priority_LOW_POWER = geolocationm.LocationRequestPriority.LOW_POWER
let request_priority_FIRST_FIX = geolocationm.LocationRequestPriority.FIRST_FIX

let user_scenario_NAVIGATION = geolocationm.UserActivityScenario.NAVIGATION
let user_scenario_SPORT = geolocationm.UserActivityScenario.SPORT
let user_scenario_TRANSPORT = geolocationm.UserActivityScenario.TRANSPORT
let user_scenario_DAILY_LIFE_SERVICE = geolocationm.UserActivityScenario.DAILY_LIFE_SERVICE

let locating_priority_ACCURACY = geolocationm.LocatingPriority.PRIORITY_ACCURACY
let locating_priority_SPEED = geolocationm.LocatingPriority.PRIORITY_LOCATING_SPEED

let priority_HIGH_POWER = geolocationm.PowerConsumptionScenario.HIGH_POWER_CONSUMPTION
let priority_LOW_POWER = geolocationm.PowerConsumptionScenario.LOW_POWER_CONSUMPTION
let priority_NO_POWER = geolocationm.PowerConsumptionScenario.NO_POWER_CONSUMPTION

let country_source_LOCALE = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_LOCALE
let country_source_SIM = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_SIM
let country_source_LOCATION = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_LOCATION
let country_source_NETWORK = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_NETWORK

let SATELLITES_ADD_INFO_NULL = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_NULL
let SATELLITES_ADD_INFO_EPHEMERIS_DATA_EXIST = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_EPHEMERIS_DATA_EXIST
let SATELLITES_ADD_INFO_ALMANAC_DATA_EXIST = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_ALMANAC_DATA_EXIST
let SATELLITES_ADD_INFO_USED_IN_FIX = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_USED_IN_FIX
let SATELLITES_ADD_INFO_CARRIER_FREQ_EXIST = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_CARRIER_FREQUENCY_EXIST

let CONSTELLATION_CATEGORY_UNKNOWN = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_UNKNOWN
let CONSTELLATION_CATEGORY_GPS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_GPS
let CONSTELLATION_CATEGORY_SBAS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_SBAS
let CONSTELLATION_CATEGORY_GLONASS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_GLONASS
let CONSTELLATION_CATEGORY_QZSS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_QZSS
let CONSTELLATION_CATEGORY_BEIDOU = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_BEIDOU
let CONSTELLATION_CATEGORY_GALILEO = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_GALILEO
let CONSTELLATION_CATEGORY_IRNSS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_IRNSS

let GEOFENCE_TRANSITION_EVENT_ENTER = geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER
let GEOFENCE_TRANSITION_EVENT_EXIT = geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT
let GEOFENCE_TRANSITION_EVENT_DWELL = geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_DWELL

let LOCATING_FAILED_DEFAULT = geolocationm.LocationError.LOCATING_FAILED_DEFAULT
let LOCATING_FAILED_LOCATION_PERMISSION_DENIED = geolocationm.LocationError.LOCATING_FAILED_LOCATION_PERMISSION_DENIED
let LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED = geolocationm.LocationError.LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED
let LOCATING_FAILED_LOCATION_SWITCH_OFF = geolocationm.LocationError.LOCATING_FAILED_LOCATION_SWITCH_OFF
let LOCATING_FAILED_INTERNET_ACCESS_FAILURE = geolocationm.LocationError.LOCATING_FAILED_INTERNET_ACCESS_FAILURE

let source_type_GNSS = geolocationm.LocationSourceType.GNSS
let source_type_NETWORK = geolocationm.LocationSourceType.NETWORK
let source_type_INDOOR = geolocationm.LocationSourceType.INDOOR
let source_type_RTK = geolocationm.LocationSourceType.RTK

let coordinate_WGS84 = geolocationm.CoordinateSystemType.WGS84
let coordinate_GCJ02 = geolocationm.CoordinateSystemType.GCJ02

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode(){
    let result1 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result1));
    if(!result1){
        await geolocation.requestEnableLocation().then(async(result) => {
            await sleep(3000);
            console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + JSON.stringify(error));
            expect().assertFail();
        });
    }
    let result2 = geolocationm.isLocationEnabled();
    console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result2));
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
export default function geolocationTest_LocErr(){
    describe('geolocationTest_LocErr', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            await changedLocationMode();
            done();
        })
    
        beforeEach(function () {
            console.info('beforeEach case');
        })
        afterEach(function () {
        })
    
    
    
        /**
         * @tc.number SUB_HSS_LocationSystem_SingleLocErr_0100
         * @tc.name Test getCurrentLocation
         * @tc.desc Initiate a single location request in a specified scenario and set the navigation scenario.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_HSS_LocationSystem_SingleLocErr_0100', 0, async function (done) {
            try {
                let currentLocationRequest = 1;
                geolocationm.getCurrentLocation(currentLocationRequest, (err, result) => {
                    if (err) {
                        console.info("[lbs_js] getCurrentLocation1 callback err:  " + JSON.stringify(err));
                        expect(err.code).assertEqual(401);
                        return;
                    } else {
                        console.info("[lbs_js] getCurrentLocation1 callback result:" + JSON.stringify(result));
                        expect(true).assertFalse();
                    }
                });
            } catch (error) {
                console.error('[lbs_js] getCurrentLocation1 callback try err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_SingleLocErr_0200
         * @tc.name Test getCurrentLocation
         * @tc.desc Initiate a single location request in a specified scenario and set the navigation scenario.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_SingleLocErr_0200', 0, async function (done) {
            (async () => {
                try {
                    let currentLocationRequest = 1;
                    let result = await geolocationm.getCurrentLocation(currentLocationRequest); 
                    console.info("[wifi_test] getCurrentLocation2 promise:" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] getCurrentLocation2 promise try err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual(3301200);
                }
            })();
            await sleep(4000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_SendCommandErr_0100
         * @tc.name Test sendCommand
         * @tc.desc An incorrect extended command is sent to each component of the location service subsystem.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_SendCommandErr_0100', 0, async function (done) {
            let requestInfo = "lbstest";
            try {
                geolocationm.sendCommand(requestInfo,(err, result) => {
                    if (err) {
                        console.info('sendcommand callback err:' + JSON.stringify(err));
                        expect(err.code).assertEqual("401");
                        return;
                    }
                    console.info('sendcommand callback result:' + JSON.stringify(result));
                });
            } catch (error) {
                console.info('sendcommand callback try err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_SendCommandErr_0200
         * @tc.name Test sendCommand
         * @tc.desc An incorrect extended command is sent to each component of the location service subsystem.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_SendCommandErr_0200', 0, async function (done) {
            let requestInfo = "test";
            (async () => {
                try {
                    let result = await geolocationm.sendCommand(requestInfo); 
                    console.info("[lbs_js] sendCommand promise:" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] sendCommand promise err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
            })();
            await sleep(1500);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0100
         * @tc.name Test getCachedGnssLocationsSize
         * @tc.desc An incorrect parameter is used to obtain the number of GNSS cache locations reported at a time.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0100', 0, async function (done) {
            try {
                geolocationm.getCachedGnssLocationsSize("test",(err, data) => {
                    if (err) {
                        console.info('[lbs_js] getCachedSiz1 callback err is:' + JSON.stringify(err));
                        expect(err.code).assertEqual("401");
                        return;
                    }
                    console.info("[lbs_js] getCachedSiz1 callback data is:" + JSON.stringify(data));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] getCachedSiz1 callback try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(2000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0400
         * @tc.name Test flushCachedGnssLocations
         * @tc.desc All prepared GNSS locations are returned to the application and the underlying buffers are cleared.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0400', 0, async function (done) {
            try {
                geolocationm.flushCachedGnssLocations("test",(err, data) => {
                    if (err) {
                        console.info('[lbs_js] flushCachedGnssLocations4 callback err is : ' + JSON.stringify(err));
                        expect(err.code).assertEqual("401");
                        return;
                    }
                    console.info("[lbs_js] flushCachedGnssLocations4 callback data is: " + JSON.stringify(data));
                    expect(true).assertFalse();
                });
            } catch (error) {
                console.info("[lbs_js] flushCachedGnssLocations4 callback try error:"+ JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                expect(error.code).assertEqual("401");
            }
            await sleep(2000);
            done();
        })
    
        /**
         * @tc.number SUB_HSS_LocationSystem_BatchingErr_0500
         * @tc.name Test flushCachedGnssLocations
         * @tc.desc All prepared GNSS locations are returned to the application and the underlying buffers are cleared.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_HSS_LocationSystem_BatchingErr_0500', 0, async function (done) {
            (async () => {
                try {
                    let result = await geolocationm.flushCachedGnssLocations(1); 
                    console.info("[lbs_js] flushCachedGnssLocations5 promise successful :" + JSON.stringify(result));
                } catch(error) {
                    console.info('[lbs_js] flushCachedGnssLocations5 promise err:' + JSON.stringify(error) +"code"+ error.code +"mes"+ error.message);
                    expect(error.code).assertEqual("401");
                }
              })();
            await sleep(2000);
            done();
        })
        
       /**
        * @tc.number    : SUB_HSS_LOCATIONSYSTEM_Config_0001
        * @tc.name      : testGeolocationManagerConfig001
        * @tc.desc      : Test Config value.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testGeolocationManagerConfig001', 0, async function (done) {
            expect(true).assertEqual(request_scenario_UNSET == 0x300)
            expect(true).assertEqual(request_scenario_NAVIGATION == 0x301)
            expect(true).assertEqual(request_scenario_TRAJECTORY_TRACKING == 0x302)
            expect(true).assertEqual(request_scenario_CAR_HAILING == 0x303)
            expect(true).assertEqual(request_scenario_DAILY_LIFE_SERVICE == 0x304)
            expect(true).assertEqual(request_scenario_NO_POWER == 0x305)

            expect(true).assertEqual(request_priority_UNSET == 0x200)
            expect(true).assertEqual(request_priority_ACCURACY == 0x201)
            expect(true).assertEqual(request_priority_LOW_POWER == 0x202)
            expect(true).assertEqual(request_priority_FIRST_FIX == 0x203)

            expect(true).assertEqual(user_scenario_NAVIGATION == 0x401)
            expect(true).assertEqual(user_scenario_SPORT == 0x402)
            expect(true).assertEqual(user_scenario_TRANSPORT == 0x403)
            expect(true).assertEqual(user_scenario_DAILY_LIFE_SERVICE == 0x404)

            expect(true).assertEqual(locating_priority_ACCURACY == 0x501)
            expect(true).assertEqual(locating_priority_SPEED == 0x502)

            expect(true).assertEqual(priority_HIGH_POWER == 0x601)
            expect(true).assertEqual(priority_LOW_POWER == 0x602)
            expect(true).assertEqual(priority_NO_POWER == 0x603)

            expect(true).assertEqual(country_source_LOCALE == 1)
            expect(true).assertEqual(country_source_SIM == 2)
            expect(true).assertEqual(country_source_LOCATION == 3)
            expect(true).assertEqual(country_source_NETWORK == 4)

            expect(true).assertEqual(SATELLITES_ADD_INFO_NULL == 0)
            expect(true).assertEqual(SATELLITES_ADD_INFO_EPHEMERIS_DATA_EXIST == 1)
            expect(true).assertEqual(SATELLITES_ADD_INFO_ALMANAC_DATA_EXIST == 2)
            expect(true).assertEqual(SATELLITES_ADD_INFO_USED_IN_FIX == 4)
            expect(true).assertEqual(SATELLITES_ADD_INFO_CARRIER_FREQ_EXIST == 8)

            expect(true).assertEqual(CONSTELLATION_CATEGORY_UNKNOWN == 0)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_GPS == 1)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_SBAS == 2)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_GLONASS == 3)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_QZSS == 4)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_BEIDOU == 5)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_GALILEO == 6)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_IRNSS == 7)

            expect(true).assertEqual(GEOFENCE_TRANSITION_EVENT_ENTER == 1)
            expect(true).assertEqual(GEOFENCE_TRANSITION_EVENT_EXIT == 2)
            expect(true).assertEqual(GEOFENCE_TRANSITION_EVENT_DWELL == 4)

            expect(true).assertEqual(LOCATING_FAILED_DEFAULT == -1)
            expect(true).assertEqual(LOCATING_FAILED_LOCATION_PERMISSION_DENIED == -2)
            expect(true).assertEqual(LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED == -3)
            expect(true).assertEqual(LOCATING_FAILED_LOCATION_SWITCH_OFF == -4)
            expect(true).assertEqual(LOCATING_FAILED_INTERNET_ACCESS_FAILURE == -5)

            expect(true).assertEqual(source_type_GNSS == 1)
            expect(true).assertEqual(source_type_NETWORK == 2)
            expect(true).assertEqual(source_type_INDOOR == 3)
            expect(true).assertEqual(source_type_RTK == 4)

            expect(true).assertEqual(coordinate_WGS84 == 1)
            expect(true).assertEqual(coordinate_GCJ02 == 2)
            done();
        })
    })
}

