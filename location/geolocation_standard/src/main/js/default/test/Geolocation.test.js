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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async function changedLocationMode(){
    await geolocation.isLocationEnabled().then(async(result) => {
       console.info('[lbs_js] getLocationSwitchState result: ' + result);
       if(!result){
           await geolocation.requestEnableLocation().then(async(result) => {
               await sleep(3000);
               console.info('[lbs_js] test requestEnableLocation promise result: ' + result);
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
    beforeAll(async function (done) {
        console.info('beforeAll case');
        await applyPermission();
        done();
    })
    beforeEach(async function (done) {
        console.info('beforeEach case');
        await changedLocationMode();
        done()
    })
    afterEach(function () {
    })

   /**
     * @tc.number LocationSystem_0001
     * @tc.name SUB_HSS_LocationSystem_0001
     * @tc.desc Test getSupportedCoordTypes api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_0001', 0,  function () {
        let types = geolocations.getSupportedCoordTypes();
        console.info('[lbs_js] getSupportedCoordTypes result: ' + JSON.stringify(types));
        expect(true).assertEqual(types.length !=0);   
       
    })

   /**
     * @tc.number LocationSystem_0002
     * @tc.name SUB_HSS_LocationSystem_0002
     * @tc.desc Test getLocationType api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_HSS_LocationSystem_0002', 0,  async function (done) {		
        geolocations.getLocationType({            
            success: function(data) {                
              console.log('success get location type:' + JSON.stringify(data)); 
              expect(true).assertEqual(data.types.length !=0);
              done()             
            },            
            fail: function(data, code) {                
              console.log('fail to get location. code:' + code + ', data:' + JSON.stringify(data));            
              expect().assertFail();
              done()
             }, 
            complete: function(result) {                
              console.log('get location end' + JSON.stringify(result));            
             },        
           });    
    })

    /**
     * @tc.number LocationSystem_0003
     * @tc.name SUB_HSS_LocationSystem_0003
     * @tc.desc Test getLocation api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_0003', 0, async function (done) {	
        geolocations.getLocation({
            timeout:30000,
            coordType:'wgs84',
            success: function(geolocationResponse) {
                console.log('lbs_js [GetLocation-success], result' + JSON.stringify(geolocationResponse));
                expect(true).assertEqual(geolocationResponse.length !=0);
                console.info('[lbs_js] getLocation latitude: ' + geolocationResponse.latitude +
                ' longitude: ' + geolocationResponse.longitude +' altitude: ' + geolocationResponse.altitude
                +' accuracy: ' + geolocationResponse.accuracy +'time: ' + geolocationResponse.time);
            },
            fail: function(data, code) {
                switch(code){
                    case 601:
                        console.info("获取定位权限失败/失败原因/用户拒绝: "+ err);
                        break;
                    case 602:
                        console.info("权限未声明: "+ err);
                        break;
                    case 800:
                        console.info("超时失败原因/网络状况不佳或GPS不可用: "+ err);
                        break;
                    case 801:
                        console.info("系统位置开关未打开: "+ err);
                        break;
                    case 802:
                        console.info("该次调用结果未返回前接口又被重新调用/该次调用失败返回错误码: "+ err);
                        break;
                    default:
                        console.log('lbs_js [GetLocation-fail] data:' + data + ', code:' + code);  
                }
            },
        });
        done();
    })
   		
    /**
     * @tc.number LocationSystem_0004
     * @tc.name SUB_HSS_LocationSystem_0004
     * @tc.desc Test subscribe api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */
     it('SUB_HSS_LocationSystem_0004', 0,  async function (done) {	
        geolocations.subscribe({
            coordType:'wgs84',
            success: function(data) {
                console.log('lbs_js [GetLocation-success], result' + JSON.stringify(data));
                expect(true).assertEqual(data !=null);
            },
            fail: function(data, code) {
                console.log('lbs_js [Subscribe-fail] code:' + code + ', data:' + data);
                expect().assertFail();
            },
        });
        done();
    })

    /**
     * @tc.number LocationSystem_0005
     * @tc.name SUB_HSS_LocationSystem_0005
     * @tc.desc Test unsubscribe api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */
     it('SUB_HSS_LocationSystem_0005', 0,  async function (done) {	
        geolocation.unsubscribe(
            (result) => {
                if(err){
                    return console.info("unsubscribe err:  " + err);
                }
                console.info("unsubscribe result:  " + JSON.stringify(result));
                expect(true).assertEqual(result !=null);
        });
        done();
    })
    
})


