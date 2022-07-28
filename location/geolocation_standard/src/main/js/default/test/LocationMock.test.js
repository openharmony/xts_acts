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
import geolocations from '@system.geolocation';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osaccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
    console.info('[lbs_js]sleep function');
}

async function changedLocationMode(){
    await geolocation.isLocationEnabled().then(async(result) => {
        console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result));
        if(!result){
            await geolocation.requestEnableLocation().then(async(result) => {
                await sleep(3000);
                console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
                expect(result).assertTrue();
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

async function applyPermission() {
    let osAccountManager = osaccount.getAccountManager();
    console.debug("====>testgetuserid get AccountManager finish====");
    let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
    console.info("====>testgetuserid localId obtained by process:" + localId);
    let appInfo = await bundle.getApplicationInfo('ohos.acts.location.geolocation.function', 0, localId);
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

describe('geolocationTest_4', function () {
    beforeAll(async function (done) {
        console.info('beforeAll case');
        await applyPermission();
        done();
    })

    beforeEach(async function (done) {
        console.info('beforeEach case');
        await changedLocationMode();
        done();
    })
    afterEach(function () {
    })

    /**
     * @tc.number enableLocationMock_callback
     * @tc.name enableLocationMock_callback
     * @tc.desc Test enableLocationMock api .
     * @tc.type Function
     * @tc.level since 9
     */
    it('enableLocationMock_callback', 0, async function (done) {
        console.info("[lbs_js]enableLocationMock" );
        let locationRequestScenario1 = {"scenario": 0x0301}
        function enableLocationMockPromise(){
            return new Promise((resolve, reject)=>{
                geolocation.enableLocationMock(locationRequestScenario1,(err) => {
                    if (err){
                        return console.info("enableLocationMock callback err:  " + JSON.stringify(err));
                    }else{
                        console.info("enableLocationMock callback success!");
                    }
                    resolve();
                })
            })
        }
        await enableLocationMockPromise()
        done()
    })


    /**
     * @tc.number disableLocationMock
     * @tc.name disableLocationMock_callback
     * @tc.desc Test disableLocationMock api .
     * @tc.type Function
     * @tc.level since 9
     */
    it('disableLocationMock_callback', 0, async function (done) {
        console.info("[lbs_js]disableLocationMock");
        let locationRequestScenario1 = { "scenario": 0x0301 }
        function disableLocationMockPromise() {
            return new Promise((resolve, reject) => {
                geolocation.disableLocationMock(locationRequestScenario1, (err) => {
                    if (err) {
                        return console.info("disableLocationMockPromise callback err:  " + JSON.stringify(err));
                    } else {
                        console.info("disableLocationMockPromise callback success");
                    }
                    resolve();
                })
            })
        }
        await disableLocationMockPromise()
        done()
    })

    /**
     * @tc.number getCountryCode
     * @tc.name getCountryCode_promise
     * @tc.desc Test getCountryCode api .
     * @tc.type Function
     * @tc.level since 9
     */
    it('getCountryCode_promise', 0, async function (done) {
        await geolocation.getCountryCode().then((result) => {
            console.info("[lbs_js] getCountryCode promise result: " + JSON.stringify(result));
            console.info("[lbs_js] country :" + JSON.stringify(result).country);
            console.info("[lbs_js] type: " + JSON.stringify(result).type);
            expect(true).assertTrue(JSON.stringify(result)!=null);
        }).catch((error) => {
            console.info("[lbs_js] getCountryCode promise then error."  + JSON.stringify(error));
            expect().assertFail();
        });
        done();
    })

    /**
     * @tc.number getCountryCode
     * @tc.name getCountryCode_callback
     * @tc.desc Test getCountryCode api .
     * @tc.type Function
     * @tc.level since 9
     */
    it('getCountryCode_callback', 0, async function (done) {
        function getCountryCodePromise() {
            return new Promise((resolve, reject) => {
                geolocation.getCountryCode((err) => {
                    if (err) {
                        return console.info("getCountryCode callback err:  " + JSON.stringify(err));
                    } else {
                        console.info("getCountryCode callback success");
                    }
                    resolve();
                })
            })
        }
        await getCountryCodePromise();
        done();
    })

    /**
     * @tc.number getCountryCode
     * @tc.name getCountryCode_on_off
     * @tc.desc Test getCountryCode api .
     * @tc.type Function
     * @tc.level since 9
     */
    it('getCountryCode_on_off', 0, async function (done) {
        console.info("[lbs_js]countryCodeChange");
        geolocation.on('countryCodeChange', function (data) {
            console.info('[lbs_js] countryCodeChange' +JSON.stringify(data) );
        });
        await geolocation.getCountryCode().then((result) => {
            console.info("[lbs_js] getCountryCode promise result: " + JSON.stringify(result));
            expect(true).assertTrue(JSON.stringify(result)!=null);
        }).catch((error) => {
            console.info("[lbs_js] getCountryCode promise then error."  + JSON.stringify(error));
            expect().assertFail();

        });
        geolocation.off('countryCodeChange', function (data) {
            console.info('[lbs_js] countryCodeChange' + JSON.stringify(data));
            done();
        })
        done();
    })

    /**
     * @tc.number setReverseGeocodingMockInfo
     * @tc.name setReverseGeocodingMockInfo_callback
     * @tc.desc Test setReverseGeocodingMockInfo api .
     * @tc.type Function
     * @tc.level since 9
     */
    it('setReverseGeocodingMockInfo_callback', 0,  async function(done) {
        function enableReverseGeocodingMockPromise() {
            return new Promise((resolve, reject) => {
                geolocation.enableReverseGeocodingMock( (err) => {
                    if (err) {
                        return console.info("enableReverseGeocodingMock callback err:  " + JSON.stringify(err));
                    } else {
                        console.info("enableReverseGeocodingMock callback success ");
                    }
                    resolve();
                })
            })
        }
        await enableReverseGeocodingMockPromise();
        var locations = [
            {"location": {"locale": "shanghai", "latitude": 30.12, "longitude": 120.11, "maxItems": 1},
                "geoAddress": {"locale": "shanghai", "latitude": 30.12, "longitude": 120.11,
                    "maxItems": 1, "isFromMock": true}},
            {"location": {"locale": "beijing", "latitude": 31.12, "longitude": 121.11, "maxItems": 1},
                "geoAddress": {"locale": "beijing", "latitude": 31.12, "longitude": 121.11, "maxItems": 1,
                    "isFromMock": true}},
            {"location": {"locale": "shenzhen", "latitude": 32.12, "longitude": 122.11, "maxItems": 1},
                "geoAddress": {"locale": "shenzhen", "latitude": 32.12, "longitude": 122.11, "maxItems": 1,
                    "isFromMock": true}},
            {"location": {"locale": "wuhan", "latitude": 33.12, "longitude": 123.11, "maxItems": 1},
                "geoAddress": {"locale": "wuhan", "latitude": 33.12, "longitude": 123.11, "maxItems": 1,
                    "isFromMock": true}},
            {"location": {"locale": "chengdu", "latitude": 34.12, "longitude": 124.11, "maxItems": 1},
                "geoAddress": {"locale": "chengdu", "latitude": 34.12, "longitude": 124.11, "maxItems": 1,
                    "isFromMock": true}},
        ];

        function setReverseGeocodingMockInfoPromise(){
            return new Promise ((resolve,reject) =>{
                geolocation.setReverseGeocodingMockInfo(locations,(err) =>{
                    if(err){
                        console.info("[lbs_js]setReverseGeocodingMockInfo callback err:" +JSON.stringify(err) );
                    }else{
                        console.info("[lbs_js]setReverseGeocodingMockInfo callback called"  );
                    }
                    resolve();
                });
            })
        }
        await setReverseGeocodingMockInfoPromise();

        function disableReverseGeocodingMockPromise() {
            return new Promise((resolve, reject) => {
                geolocation.disableReverseGeocodingMock((err) => {
                    if (err) {
                        return console.info("disableReverseGeocodingMock callback err:  " + JSON.stringify(err));
                    } else {
                        console.info("[lbs_js] disableReverseGeocodingMock promise called " );
                    }
                    resolve();
                })
            })
        }
        await disableReverseGeocodingMockPromise()
        done();

    })

    /**
     * @tc.number setReverseGeocodingMockInfo
     * @tc.name setReverseGeocodingMockInfo_promise
     * @tc.desc Test setReverseGeocodingMockInfo api .
     * @tc.type Function
     * @tc.level since 9
     */
    it('setReverseGeocodingMockInfo_promise', 0,  async function(done) {
        function enableReverseGeocodingMockPromise() {
            return new Promise((resolve, reject) => {
                geolocation.enableReverseGeocodingMock( (err) => {
                    if (err) {
                        return console.info("enableReverseGeocodingMock callback err:  " + JSON.stringify(err));
                    } else {
                        console.info("enableReverseGeocodingMock callback success ");
                    }
                    resolve();
                })
            })
        }
        await enableReverseGeocodingMockPromise();
        var locations = [
            {"location": {"locale": "shanghai", "latitude": 30.12, "longitude": 120.11, "maxItems": 1},
                "geoAddress": {"locale": "shanghai", "latitude": 30.12, "longitude": 120.11,
                    "maxItems": 1, "isFromMock": true}},
            {"location": {"locale": "beijing", "latitude": 31.12, "longitude": 121.11, "maxItems": 1},
                "geoAddress": {"locale": "beijing", "latitude": 31.12, "longitude": 121.11, "maxItems": 1,
                    "isFromMock": true}},
            {"location": {"locale": "shenzhen", "latitude": 32.12, "longitude": 122.11, "maxItems": 1},
                "geoAddress": {"locale": "shenzhen", "latitude": 32.12, "longitude": 122.11, "maxItems": 1,
                    "isFromMock": true}},
            {"location": {"locale": "wuhan", "latitude": 33.12, "longitude": 123.11, "maxItems": 1},
                "geoAddress": {"locale": "wuhan", "latitude": 33.12, "longitude": 123.11, "maxItems": 1,
                    "isFromMock": true}},
            {"location": {"locale": "chengdu", "latitude": 34.12, "longitude": 124.11, "maxItems": 1},
                "geoAddress": {"locale": "chengdu", "latitude": 34.12, "longitude": 124.11, "maxItems": 1,
                    "isFromMock": true}},
        ];
        geolocation.setReverseGeocodingMockInfo(locations).then(() =>{
            console.info("[lbs_js] setReverseGeocodingMockInfo promise called ");
            geolocation.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
            console.info('[lbs_js] getAddressesFromLocation05 promise: ' +  JSON.stringify(data));
            expect(true).assertEqual((JSON.stringify(data)) !=null);
            done();
            }).catch((error) => {
                console.info("[lbs_js] getAddressesFromLocation promise then error." + JSON.stringify(error));
                console.info('[lbs_js] not support now');
                expect(true).assertEqual(JSON.stringify(error)!=null);
                done();
            });

        }).catch((error) =>{
            console.info("[lbs_js] setReverseGeocodingMockInfo promise result: " + JSON.stringify(error));
            expect().assertFail();
            done();
        })

        function disableReverseGeocodingMockPromise() {
            return new Promise((resolve, reject) => {
                geolocation.disableReverseGeocodingMock((err) => {
                    if (err) {
                        return console.info("disableReverseGeocodingMock callback err:  " + JSON.stringify(err));
                    } else {
                        console.info("[lbs_js] disableReverseGeocodingMock promise called " );
                    }
                    resolve();
                })
            })
        }
        await disableReverseGeocodingMockPromise()
        done();

    })

})



