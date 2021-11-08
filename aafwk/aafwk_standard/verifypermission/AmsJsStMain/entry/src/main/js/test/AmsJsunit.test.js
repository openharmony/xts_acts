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
import featureAbility from '@ohos.ability.featureability'
import abilityManager from '@ohos.app.abilitymanager'

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe ('AmsSystemTest_AppPermission', function () {
        it('AppPermission_0100', 0, async function (done) {
            console.info('=====================AppPermission_0100==================<');
            var dataInfo = await bundle.getBundleInfo('com.amsst.amsjsstmain',1);
            console.debug("======dataInfo======>:" + JSON.stringify(dataInfo));
            var processInfoArray = await abilityManager.getAllRunningProcesses();
            console.debug("======processInfoArray======>:" + JSON.stringify(processInfoArray));
            var thisProcessInfo = processInfoArray[0];
            for(let i=0; i<processInfoArray.length;i++) {
                if(processInfoArray[i].processName == "com.amsst.amsjsstmain") {
                    thisProcessInfo = processInfoArray[i]
                    break
                }
            }
            console.debug("======thisProcessInfo======>:" + JSON.stringify(thisProcessInfo));
            var context = await featureAbility.getContext();
            await context.verifyPermission("ohos.permission.GET_NETWORK_INFO", thisProcessInfo.pid, thisProcessInfo.uid,
                (err, data) => {
                    console.debug("======verifyPermission:data======>:" + JSON.stringify(data));
                    expect(err.code).assertEqual(0)
                    expect(data).assertEqual(0)
                    done()
                })
            done()
        })
        it('AppPermission_0200', 0, async function (done) {
            console.info('=====================AppPermission_0200==================<');
            var processInfoArray = await abilityManager.getAllRunningProcesses();
            console.debug("======processInfoArray======>:" + JSON.stringify(processInfoArray));
            var thisProcessInfo = processInfoArray[0];
            for(let i=0; i<processInfoArray.length;i++) {
                if(processInfoArray[i].processName == "com.amsst.amsjsstmain") {
                    thisProcessInfo = processInfoArray[i]
                    break
                }
            }
            console.debug("======thisProcessInfo======>:" + JSON.stringify(thisProcessInfo));
            var context = await featureAbility.getContext();
            var result = await context.verifyPermission("ohos.permission.GET_NETWORK_INFO", thisProcessInfo.pid, thisProcessInfo.uid)
            console.debug("======result======>:" + JSON.stringify(result));
            expect(result).assertEqual(0);
            done()
        })
        it('AppPermission_0300', 0, async function (done) {
            console.info('=====================AppPermission_0300==================<');
            var processInfoArray = await abilityManager.getAllRunningProcesses();
            console.debug("======processInfoArray======>:" + JSON.stringify(processInfoArray));
            var thisProcessInfo = processInfoArray[0];
            for(let i=0; i<processInfoArray.length;i++) {
                if(processInfoArray[i].processName == "com.amsst.amsjsstmain") {
                    thisProcessInfo = processInfoArray[i]
                    break
                }
            }
            console.debug("======thisProcessInfo======>:" + JSON.stringify(thisProcessInfo));
            var context = await featureAbility.getContext();
            await context.verifyPermission("ohos.permission.GET_NETWORK_INFO", thisProcessInfo.pid, thisProcessInfo.uid,
                (err, data) => {
                    expect(err.code).assertEqual(0)
                    expect(data).assertEqual(0)
                    done()
                })
            done()
        })
        it('AppPermission_0400', 0, async function (done) {
            console.info('=====================AppPermission_0400==================<');
            var processInfoArray = await abilityManager.getAllRunningProcesses();
            console.debug("======processInfoArray======>:" + JSON.stringify(processInfoArray));
            var thisProcessInfo = processInfoArray[0];
            for(let i=0; i<processInfoArray.length;i++) {
                if(processInfoArray[i].processName == "com.amsst.amsjsstmain") {
                    thisProcessInfo = processInfoArray[i]
                    break
                }
            }
            console.debug("======thisProcessInfo======>:" + JSON.stringify(thisProcessInfo));
            var context = await featureAbility.getContext();
            var result = await context.verifyPermission("com.amsst.permission.SYSPERMISSION", thisProcessInfo.pid, thisProcessInfo.uid)
            console.debug("======result======>:" + JSON.stringify(result));
            expect(result).assertEqual(0);
            done()
        })
        it('AppPermission_0500', 0, async function (done) {
            console.info('=====================AppPermission_0500==================<');
            var processInfoArray = await abilityManager.getAllRunningProcesses();
            console.debug("======processInfoArray======>:" + JSON.stringify(processInfoArray));
            var thisProcessInfo = processInfoArray[0];
            for(let i=0; i<processInfoArray.length;i++) {
                if(processInfoArray[i].processName == "com.amsst.amsjsstmain") {
                    thisProcessInfo = processInfoArray[i]
                    break
                }
            }
            console.debug("======thisProcessInfo======>:" + JSON.stringify(thisProcessInfo));
            var context = await featureAbility.getContext();
            var result = await context.verifySelfPermission("com.amsst.permission.SYSPERMISSION")
            console.debug("======com.amsst.permission.SYSPERMISSION:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.GET_NETWORK_INFO")
            console.debug("======ohos.permission.GET_NETWORK_INFO======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.GET_WIFI_INFO")
            console.debug("======ohos.permission.GET_WIFI_INFO:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.USE_BLUETOOTH")
            console.debug("======ohos.permission.USE_BLUETOOTH:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.DISCOVER_BLUETOOTH")
            console.debug("======ohos.permission.DISCOVER_BLUETOOTH:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.SET_NETWORK_INFO")
            console.debug("======ohos.permission.SET_NETWORK_INFO:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.SET_WIFI_INFO")
            console.debug("======ohos.permission.SET_WIFI_INFO:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.SPREAD_STATUS_BAR")
            console.debug("======ohos.permission.SPREAD_STATUS_BAR:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.INTERNET")
            console.debug("======ohos.permission.INTERNET:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.MODIFY_AUDIO_SETTINGS")
            console.debug("======ohos.permission.MODIFY_AUDIO_SETTINGS:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.RECEIVER_STARTUP_COMPLETED")
            console.debug("======ohos.permission.RECEIVER_STARTUP_COMPLETED:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.RUNNING_LOCK")
            console.debug("======ohos.permission.RUNNING_LOCK:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.ACCESS_BIOMETRIC")
            console.debug("======ohos.permission.ACCESS_BIOMETRIC:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.RCV_NFC_TRANSACTION_EVENT")
            console.debug("======ohos.permission.RCV_NFC_TRANSACTION_EVENT:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.COMMONEVENT_STICKY")
            console.debug("======ohos.permission.COMMONEVENT_STICKY:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.SYSTEM_FLOAT_WINDOW")
            console.debug("======ohos.permission.SYSTEM_FLOAT_WINDOW:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.VIBRATE")
            console.debug("======ohos.permission.VIBRATE:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.USE_TRUSTCIRCLE_MANAGER")
            console.debug("======ohos.permission.USE_TRUSTCIRCLE_MANAGER:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.USE_WHOLE_SCREEN")
            console.debug("======ohos.permission.USE_WHOLE_SCREEN:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.SET_WALLPAPER")
            console.debug("======ohos.permission.SET_WALLPAPER:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.SET_WALLPAPER_DIMENSION")
            console.debug("======ohos.permission.SET_WALLPAPER_DIMENSION:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.REARRANGE_MISSIONS")
            console.debug("======ohos.permission.REARRANGE_MISSIONS:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.CLEAN_BACKGROUND_PROCESSES")
            console.debug("======ohos.permission.CLEAN_BACKGROUND_PROCESSES:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.KEEP_BACKGROUND_RUNNING")
            console.debug("======ohos.permission.KEEP_BACKGROUND_RUNNING:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.GET_BUNDLE_INFO")
            console.debug("======ohos.permission.GET_BUNDLE_INFO:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.ACCELEROMETER")
            console.debug("======ohos.permission.ACCELEROMETER:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.GYROSCOPE")
            console.debug("======ohos.permission.GYROSCOPE:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.MULTIMODAL_INTERACTIVE")
            console.debug("======ohos.permission.MULTIMODAL_INTERACTIVE:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.radio.ACCESS_FM_AM")
            console.debug("======ohos.permission.radio.ACCESS_FM_AM:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.NFC_TAG")
            console.debug("======ohos.permission.NFC_TAG:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.NFC_CARD_EMULATION")
            console.debug("======ohos.permission.NFC_CARD_EMULATION:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.DISTRIBUTED_DEVICE_STATE_CHANGE")
            console.debug("======ohos.permission.DISTRIBUTED_DEVICE_STATE_CHANGE:result======>:" + JSON.stringify(result));
            result = await context.verifySelfPermission("ohos.permission.GET_DISTRIBUTED_DEVICE_INFO")
            console.debug("======ohos.permission.GET_DISTRIBUTED_DEVICE_INFO:result======>:" + JSON.stringify(result));
            expect(result).assertEqual(0);
            done()
        })
        it('AppPermission_5000', 0, async function (done) {
            console.info('=====================AppPermission_5000==================<');
            var dataInfo = await bundle.getBundleInfo('com.amsst.amsjsstmain',1);
            var context = await featureAbility.getContext();
            await context.requestPermissionsFromUser(["ohos.permission.CAMERA"], 580).then(
                data => console.log("then : " + data))
                .catch(error => console.log("catch : " + error));
            await context.verifyPermission("ohos.permission.CAMERA",0,dataInfo.uid,
                (err, data) => {
                    expect(err.code).assertEqual(0);
                    expect(data).assertEqual(0);
                    done();
                });
            done();
        })
})