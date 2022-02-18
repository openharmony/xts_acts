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

import geolocation from '@ohos.geolocation';
import { LocationEventListener } from '@ohos.geolocation'; 
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('geolocationTest', function () {
    beforeAll(function () {
        console.info('beforeAll called')
    })
    beforeEach(function () {
        console.info('beforeEach called')

    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })	

    /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_ENABLE_LOCATION_PROMISE_0001
     * @tc.name testenableLocation promise
     * @tc.desc Test enableLocation api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
	
    it('geolocation_enableLocation_promise_test_001', 0, async function (done) {
        console.info('LBS enableLocation promise test start ...');
        await geolocation.enableLocation().then((result) => {
        console.info('[lbs_js] testenableLocation result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] enableLocation promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        })
		done()
    })
	
    /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_IS_LOCATION_ENABLED_PROMISE_0001
     * @tc.name testisLocationEnabled promise
     * @tc.desc Test isLocationEnabled api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('geolocation_isLocationEnabled_promise_test_001', 0, async function (done) {
        console.info('LBS enableLocation promise test start ...');
        await geolocation.enableLocation().then((result) => {
            console.info('[lbs_js] testenableLocation result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] enableLocation promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
		
        console.info('[lbs_js] LBS getLocationSwitchState promise test start ...');
        await geolocation.isLocationEnabled().then((result) => {
            console.info('[lbs_js] getLocationSwitchState result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] getLocationSwitchState promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error.");
            expect().assertFail();
        });
        done();
    })
 	
    /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_GET_ADDR_FROM_LOCATION_NAME_CALLBACK_0001
     * @tc.name testgetAddressesFromLocationName callback
     * @tc.desc Test getAddressesFromLocationName api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('geolocation_getAddressesFromLocationName_callback_test_001', 0, async function (done) {
         console.info('LBS enableLocation promise test start ...');
        await geolocation.enableLocation().then((result) => {
            console.info('[lbs_js] testenableLocation result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] enableLocation promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
				
        console.info('LBS getAddressesFromLocationName callback test start ...');
        var geocodeRequest = {"description": "上海市浦东新区金穗路1800号",
                            "maxItems": 1,"locale":"zh"};
        geolocation.getAddressesFromLocationName(geocodeRequest,
           (err, data) => {
            if (err) {
                switch(err){
                    case 101:
                        console.info("INPUT_PARAMS_ERROR:" + err);
                        break;
                    case 102:
                        console.info("REVERSE_GEOCODE_ERROR:" + err);
                        break;
                    case 103:
                        console.info("GEOCODE_ERROR:" + err);
                        break;
                    case 104:
                        console.info("LOCATOR_ERROR:" + err);
			break;
                    case 105:
                        console.info("LOCATIOR_SWITCH_ERROR:" + err);
                        break;
                    case 106:
                        console.info("LAST_KNOWN_LOCATION_ERROR:" + err);
                        break;
                   case 107:
                        console.info("LOCATION_REUEST_TIMEOUT_ERROR:" + err);
			break;
                  default:
                       console.info('[lbs_js]LocationName callback err:' + err);
                   }
                
            }else {
                console.info("[lbs_js]LocationName callback data" + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) != null);
                console.info("[lbs_js] getAddressesFromLocationName callback exit.");
            }
            done();
        });
        
    })

  /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_GET_ADDR_FROM_LOCATION_CALLBACK_0001
     * @tc.name testgetAddressesFromLocation callback
     * @tc.desc Test getAddressesFromLocation api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */ 
   it('geolocation_getAddressesFromLocation_callback_test_001', 0, async function (done) {
        console.info('LBS enableLocation promise test start ...');
        await geolocation.enableLocation().then((result) => {
            console.info('[lbs_js] testenableLocation result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] enableLocation promise.");
        }).catch((error) => {

            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
        
        console.info('LBS getAddressesFromLocation callback test start ...');
        var reverseGeocodeRequest = {"latitude": 31.12, "longitude": 121.11,
              "maxItems": 1,"locale": "zh"};
        geolocation.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
            if (err) {
                console.info('[lbs_js]  getAddressesFromLocation callback err is : ' + err);
            }else {
                console.info("[lbs_js] Location callback data is: " + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) !=null);
                console.info('[lbs_js] Location addressUrl: ' + data[0].addressUrl);
                console.info('[lbs_js] Location administrativeArea: ' + data[0].administrativeArea);
                console.info('[lbs_js] Location countryCode: ' + data[0].countryCode);
                console.info('[lbs_js] Location countryName: ' + data[0].countryName);
                console.info('[lbs_js] Location descriptions: ' + data[0].descriptions);
                console.info('[lbs_js] Location descriptionsSize: ' + data[0].descriptionsSize);
                console.info('[lbs_js] Location latitude: ' + data[0].latitude);
                console.info('[lbs_js] Location locale: ' + data[0].locale);
                console.info('[lbs_js] Location locality: ' + data[0].locality);
                console.info('[lbs_js] Location longitude: ' + data[0].longitude);
                console.info('[lbs_js] Location phoneNumber: ' + data[0].phoneNumber);
                console.info('[lbs_js] Location placeName: ' + data[0].placeName);
                console.info('[lbs_js] FromLocation postalCode: ' + data[0].postalCode);
                console.info('[lbs_js] Location premises: ' + data[0].premises);
                console.info('[lbs_js] Location roadName: ' + data[0].roadName);
                console.info('[lbs_js] getAddressesFromLocation subAdministrativeArea:'
                                 + data[0].subAdministrativeArea);
                console.info('[lbs_js] Location subLocality: ' + data[0].subLocality);
                console.info('[lbs_js] Location subRoadName: ' + data[0].subRoadName);
                console.info("[lbs_js] Location callback exit .");
            }
            done();
        });
    })
 
  /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_IS_GEOSERVICE_AVAIL_PROMISE_0001
     * @tc.name testisGeoServiceAvailable promise
     * @tc.desc Test isGeoServiceAvailable api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */ 
    it('geolocation_isGeoServiceAvailable_promise_test_001', 0, async function (done) {
        console.info('LBS enableLocation promise test start ...');
        await geolocation.enableLocation().then((result) => {
            console.info('[lbs_js] testenableLocation result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] enableLocation promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
		
        console.info('LBS getGeoServiceState promise test start ...');
        await geolocation.isGeoServiceAvailable().then( (result) => {
            console.info('[lbs_js] isGeoServiceAvailable result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] getGeoServiceState promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
        done();
    })

  /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_IS_LOCATION_ENABLED_CALLBACK_0001
     * @tc.name testisLocationEnabled callback
     * @tc.desc Test isLocationEnabled api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
   */  
    it('geolocation_isLocationEnabled_callback_test_001', 0, async function (done) {
        console.info('LBS enableLocation callback test start ...');
        let promiseOne = new Promise((resolve, reject) => {
            geolocation.enableLocation((err, data) => {
                if (err) {
                    console.info('[lbs_js]  enableLocation callback err is : ' + err );
                }else {
                    console.info("[lbs_js] enableLocation callback data: " + data);
                    expect(data).assertTrue();
                    console.info("[lbs_js] enableLocation callback exit .");
                }
                resolve()
            });
        })
  
        let promiseTwo = new Promise((resolve, reject) => {
            console.info('LBS getLocationSwitchState callback test start ...');
            geolocation.isLocationEnabled((err, data) => {
                if (err) {
                    console.info('[lbs_js]  getLocationSwitchState : ' + err);
                }else {
                    console.info("[lbs_js] getLocationSwitchState data: " + data);
                    expect(data).assertTrue();
                    console.info("[lbs_js] getLocationSwitchState callback exit .");
                }
                resolve()
            });
        })

        await promiseOne.then(()=>{
            return promiseTwo
        }).then(done)
    })

  /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_GET_ADDR_FROM_LOCATION_NAME_PROMISE_0001
     * @tc.name testgetAddressesFromLocationName promise
     * @tc.desc Test getAddressesFromLocationName api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */ 
    it('geolocation_getAddressesFromLocationName_promise_test_001', 0, async function (done) {
        console.info('LBS enableLocation promise test start ...');
        await geolocation.enableLocation().then((result) => {
        console.info('[lbs_js] testenableLocation result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] enableLocation promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
		
        console.info('LBS getAddressesFromLocationName promise test start ...');
        var geocodeRequest = {"description": "上海市浦东新区金穗路1800号", "maxItems": 1};
        await geolocation.getAddressesFromLocationName(geocodeRequest).then((result) => {
        console.info("[lbs_js]  getAddressesFromLocation callback data is:"
                     + JSON.stringify(result));
            expect(true).assertEqual((JSON.stringify(result)) !=null);
            console.info("[lbs_js] getAddressesFromLocationName promise.");
        }).catch((error) => {
            console.info("[lbs_js] getAddressesFromLocationName promise then error." + error);
            expect().assertFail();
        });
        done();
    })

    /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_REQUEST_ENABLE_LOCATION_CALLBACK_0001
     * @tc.name testrequestEnableLocation callback
     * @tc.desc Test requestEnableLocation api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
   */  
    it('geolocation_requestEnableLocation_callback_test_001', 0, async function (done) {
        console.info('LBS requestEnableLocation callback test start ...');
        geolocation.requestEnableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  requestEnableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] requestEnableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] requestEnableLocation callback exit .");
            }
            done();
        });
    })

 
  /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_REQUEST_ENABLE_LOCATION_PROMISE_0001
     * @tc.name testrequestEnableLocation promise
     * @tc.desc Test requestEnableLocation api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */ 
    it('geolocation_requestEnableLocation_promise_test_001', 0, async function (done) {
        console.info('LBS requestEnableLocation promise test start ...');
        await geolocation.requestEnableLocation().then((result) => {
	    console.info('[lbs_js] requestEnableLocation result: ' + result);
            expect(result).assertTrue();
            console.info("[lbs_js] requestEnableLocation promise.");
        }).catch((error) => {
            console.info("[lbs_js] promise then error." + error.message);
            expect().assertFail();
        });
        done()
    })	

  /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_ENABLE_LOCATION_CALLBACK_0001
     * @tc.name testEnableLocation callback
     * @tc.desc Test enableLocation api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('geolocation_enableLocation_callback_test_001', 0, async function (done) {
        console.info('LBS enableLocation callback test start ...');
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] enableLocation callback exit .");
            }
            done()
        });
    })

    /**
    * @tc.number SUB_LOCATION_geocode_DEVICE_JS_DISABLE_LOCATION_CALLBACK_0001
    * @tc.name testdisableLocation callback
    * @tc.desc Test disableLocation api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('geolocation_disableLocation_callback_test_001', 0, async function (done) {
        console.info('LBS disableLocation callback test start ...');
        geolocation.disableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  disableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] disableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] disableLocation callback exit .");
            }
            done()
        });
    })

    /** @tc.number SUB_LOCATION_geocode_DEVICE_JS_DISABLE_LOCATION_PROMISE_0001
    * @tc.name testdisableLocation promise
    * @tc.desc Test disableLocation api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('geolocation_disableLocation_promise_test_001', 0, async function (done) {
        console.info('[lbs_js]LBS disableLocation promise test start ...');
        geolocation.disableLocation().then((data) => {
            console.info('[lbs_js] disableLocation data: ' + data);
            expect(data).assertTrue();
            console.info("[lbs_js] disableLocation promise exit");
            done();
        });
    })   
    
    /**
    * @tc.number SUB_LOCATION_geocode_DEVICE_JS_GET_ADDR_FROM_LOCATION_PROMISE_0001
    * @tc.name testgetAddressesFromLocation promise
    * @tc.desc Test getAddressesFromLocation api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('geolocation_getAddressesFromLocation_promise_test_001', 0, async function (done) {
        console.info('LBS getAddressesFromLocation promise test start ...');
        var reverseGeocodeRequest = {"latitude": 31.12, "longitude": 121.11, "maxItems": 1};
        await geolocation.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
            console.info('[lbs_js] getAddressesFromLocation promise: ' +  JSON.stringify(data));
            expect(true).assertEqual((JSON.stringify(data)) !=null);
            console.info("[lbs_js] getAddressesFromLocation promise exit.");
            done();
        }).catch(error => {
            console.info("[lbs_js] getAddressesFromLocation promise then error." + error.message);
            expect().assertFail();
            done();
        });
    })

    /**
    * @tc.number SUB_LOCATION_geocode_DEVICE_JS_GET_CURRENT_LOCATION_CALLBACK_0001
    * @tc.name testGetCurrentlocation callback
    * @tc.desc Test GetCurrentlocation api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('geolocation_GetCurrentlocation_callback_test_001', 0, async function(done) {
        var locationEventListener = new LocationEventListener(); 
        var requestInfo = { "priority": 0x0203, "scenario": 0x0300, "timeInterval": 5
		, "distanceInterval": 0, "maxAccuracy": 0 };
        locationEventListener.getCurrentLocation(requestInfo, result => {
            console.info("getCurrentLocation callback, result:  " + JSON.stringify(result));
            expect(true).assertEqual(result != null);
            done()
        });
    })

    /**
    * @tc.number SUB_LOCATION_geocode_DEVICE_JS_IS_GEOSERVICE_AVAIL_CALLBACK_0001
    * @tc.name testisGeoServiceAvailable callback
    * @tc.desc Test isGeoServiceAvailable api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('geolocation_isGeoServiceAvailable_callback_test_001', 0, async function (done) {
        console.info('LBS enableLocation callback test start ...');
        let promiseOne = new Promise((resolve, reject) => {
            geolocation.enableLocation((err, data) => {
                if (err) {
                    console.info('[lbs_js]  enableLocation callback err is : ' + err );
                }else {
                    console.info("[lbs_js] enableLocation callback data: " + data);
                    expect(data).assertTrue();
                    console.info("[lbs_js] enableLocation callback exit .");
                }
                resolve()
            }); 
        })
        console.info('LBS getGeoServiceState callback test start ...')
        let promiseTwo =   new Promise((resolve, reject) => {
            geolocation.isGeoServiceAvailable((err, data) => {
                if (err) {
                    console.info('[lbs_js]  getGeoServiceState err is : ' + err );
                }else {
                    console.info('[lbs_js] isGeoServiceAvailable result: ' + data);
                    expect(data).assertTrue();
                    console.info("[lbs_js] getGeoServiceState callback exit .");
                }
                resolve()
            });
        })
        await promiseOne.then(()=>{
            return promiseTwo
        }).then(done)
    })
 
    /**
    * @tc.number SUB_LOCATION_geocode_DEVICE_JS_LOCATION_CHANGE_ON_0002
    * @tc.name testlocationChangeOn promise
    * @tc.desc Test locationChangeOn api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2   
    */
    it('geolocation_locationChange_On_test_002', 0, async function (done) {
        var locationEventListener = new LocationEventListener(); 
        console.info('LBS locationChange_On callback test start ...');
        var requestInfo = {"priority":0x0203, "scenario":0x0300, "timeInterval":5,
		"distanceInterval": 0, "maxAccuracy": 0};
        await locationEventListener.on('locationChange',requestInfo, result => {
            console.info("onLocationChange callback, result:  " + JSON.stringify(result)); 
            expect(true).assertEqual(result !=null);
            done();
        }); 
        console.info('LBS enableLocation callback test start ...');
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] enableLocation callback exit .");
            }
            done()
        });
            
     })
 
     /**
     * @tc.number SUB_LOCATION_geocode_DEVICE_JS_ON_LOCATION_SERVICE_STATE_0001
     * @tc.name testOnLocationServiceState
     * @tc.desc Test OnLocationServiceState api .
     * @tc.author wangsilu wwx1075324
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('geolocation_OnLocationServiceState_test_001', 0, async function (done) { 
        var locationEventListener = new LocationEventListener(); 
        console.info('LBS OnLocationServiceState test start ...');
        await locationEventListener.on('locationServiceState', result => {
	console.info("onlocationServiceState callback, result:  " + JSON.stringify(result)); 
	expect(true).assertEqual(result !=null);
	done();
        }); 
        console.info('LBS enableLocation callback test start ...');
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] enableLocation callback exit .");
            }
            done()
        });    
    })

    /**
    * @tc.number SUB_LOCATION_geocode_DEVICE_JS_ON_LOCATION_SERVICE_STATE_0001
    * @tc.name testOnLocationServiceState
    * @tc.desc Test offLocationServiceState api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('geolocation_offLocationServiceState_test_001', 0, async function (done) {
        var locationEventListener = new LocationEventListener(); 
        console.info('LBS OnLocationServiceState test start ...');
        await locationEventListener.on('locationServiceState', result => {
        console.info("onlocationServiceState callback, result:" + JSON.stringify(result)); 
        expect(true).assertEqual(result !=null);
        done();
        });    
        console.info('LBS enableLocation callback test start ...');
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] enableLocation callback exit .");
            }
            done()
        });

        console.info('LBS disableLocation callback test start ...');
        geolocation.disableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  disableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] disableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] disableLocation callback exit .");
            }
            done()
        });

        console.info('LBS offLocationServiceState test start ...');
        locationEventListener.off('locationServiceState', result => {
        console.info("offlocationServiceState callback, result:  " + JSON.stringify(result)); 
	expect(true).assertEqual(result !=null);
	done();
        }); 
    })

    /**
    * @tc.number SUB_LOCATION_geocode_DEVICE_JS_LOCATION_SERVICE_OFF_0002
    * @tc.name testlocationChangeOff promise
    * @tc.desc Test locationChangeoff api .
    * @tc.author wangsilu wwx1075324
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 2
    */
    it('geolocation_locationChange_Off_test_002', 0, async function(done) {
        var locationEventListener = new LocationEventListener(); 
	console.info('LBS locationChange_On callback test start ...');
	var requestInfo = {"priority":0x0203, "scenario":0x0300, "timeInterval":5
		, "distanceInterval": 0, "maxAccuracy": 0};
	locationEventListener.on('locationChange',requestInfo, result => {
	console.info("onLocationChange callback, result:  " + JSON.stringify(result)); 
	expect(true).assertEqual(result !=null);
	done();
        }); 

        console.info('LBS enableLocation callback test start ...');
        geolocation.enableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  enableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] enableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] enableLocation callback exit .");
            }
            done()
        });

        console.info('LBS disableLocation callback test start ...');
        geolocation.disableLocation((err, data) => {
            if (err) {
                console.info('[lbs_js]  disableLocation callback err is : ' + err );
            }else {
                console.info("[lbs_js] disableLocation callback data: " + data);
                expect(data).assertTrue();
                console.info("[lbs_js] disableLocation callback exit .");
            }
            done()
        });

        console.info('LBS locationChange_Off test2 start ...');
        locationEventListener.off('locationChange', result => {
            console.info("[lbs_js] offlocationChange callback result " + JSON.stringify(result));
            expect(true).assertEqual(result != null);
            done();
        });
    })
})

