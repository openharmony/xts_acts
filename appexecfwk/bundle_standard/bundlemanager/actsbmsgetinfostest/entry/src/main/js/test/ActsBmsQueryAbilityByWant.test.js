/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit'

const BUNDLE_PATH1 = '/data/test/bmsThirdBundleTest1.hap';
const BUNDLE_PATH2 = '/data/test/bmsThirdBundleTest2.hap';
const BUNDLE_PATH3 = '/data/test/bmsThirdBundleTest3.hap';
const BUNDLE_PATH4 = '/data/test/bmsThirdBundleTest4.hap';
const BUNDLE_PATH5 = '/data/test/bmsThirdBundleTest5.hap';
const BUNDLE_PATH6 = '/data/test/bmsThirdBundleTest6.hap';
const BUNDLE_PATHUPDATE = '/data/test/bmsThirdBundleTestA1.hap';
const SYSTEM_PATH = '/data/test/bmsSystemBundleTest2.hap';
const SYSTEM_FEATURE_PATH = '/data/test/bmsSystemBundleTest2Feature.hap';
const SYSTEM_UPDATE_PATH = '/data/test/bmsSystemBundleTest2Update.hap';
const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME4 = 'com.example.third4';
const BUNDLE_NAME5 = 'com.example.third5';
const BUNDLE_NAME6 = 'com.example.third6';
const SYSTEM_NAME = 'com.example.system2';
const NUM_ZERO = 0;
const NUM_ONE = 1;
const NUM_TWO = 2;
const NUM_THREE = 3;
const NUM_FOUR = 4;
const NUM_NINE = 9;
let dataTransfer = 1;
let audioPlayback = 2;
let audioRecording = 4;
let location = 8;
let bluetoothInteraction = 16;
let multiDeviceConnection = 32;
let wifiInteraction = 64;
let voip = 128;
let taskKeeping = 256;

describe('ActsBmsQueryAbilityByWant', function () {
    /*
    * @tc.number: bms_queryAbilityByWant_0100
    * @tc.name:  queryAbilityByWant callback by other callback
    * @tc.desc: 1.queryAbilityByWant callback
    *           2.queryAbilityByWant for third app
    */
    it('bms_queryAbilityByWant_0100', 0, async function (done){
        console.info('=====================bms_queryAbilityByWant_0100==================');
        var bundlePath = [BUNDLE_PATH1]
        bundle.getBundleInstaller().then(installer => {
            function onReceiveinstallEvent(err, data) {
                console.log('bms_queryAbilityByWant_0100 install called: ' + data)
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
    
                bundle.queryAbilityByWant({
                    action: ['action.system.home'],
                    entities: ['entity.system.home'],
                    bundleName: BUNDLE_NAME1
                }, 132, 0, (err, data) => {
                    if (err) {
                        console.log('bms_queryAbilityByWant_0100 test query system app err is ' + err)
                        expect(err).assertEqual(1);
                    }
                    installer.uninstall(BUNDLE_NAME1,
                         {
                            userId: 0,
                            installFlag: 1,
                            isKeepData: false
                        }
                    , (err, data) => {
                        done();
                    });
                }
                )
            }

            installer.install(['/data/test/bmsThirdBundleTest1.hap'], 
            {
                    userId: 0,
                    installFlag: 1,
                    isKeepData: false,
            }, onReceiveinstallEvent);
        })
    })

    /*
    * @tc.number: bms_queryAbilityByWant_0200
    * @tc.name:  queryAbilityByWant callback by other callback
    * @tc.desc: 1.queryAbilityByWant callback
    *           2.queryAbilityByWant for systemapp
    */
    it('bms_queryAbilityByWant_0200', 0, async function (done){
        console.info('=====================bms_queryAbilityByWant_0200==================');
        bundle.queryAbilityByWant(
            {
                action: ['action.system.home'],
                entities: ['entity.system.home']
            }
        , 132, 0).then(data => {
                for(let i = 0; i < data.length; ++i) {
                    var jsondata = JSON.stringify(data[i]);
                    console.log('bms_queryAbilityByWant_0200 test query system app ' + jsondata)
                    expect(data[i].applicationInfo.systemApp).assertEqual(true)
                }
            }
        ).catch(err => {
            console.log('bms_queryAbilityByWant_0200 test query system app err is ' + err)
        })
    })

})