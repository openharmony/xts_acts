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
import commonEvent from '@ohos.commonevent'
import featureAbility from '@ohos.ability.featureability'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
        title: "预置"
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
         function publishCallback(err) {
            console.debug("====>publish call back ACTS_GetWant_0100_CommonEvent err====>" + JSON.stringify(err));
        }

        function timeout() {
            console.debug("====>time out set hap====>");
        }

        console.log("==========getWant===========");

        featureAbility.getWant().then(
            data => {
                console.debug("==========data1 is===========" + JSON.stringify(data));
                var str = "succeed";
                if (data.deviceId != "") {
                    str = "fail"
                    console.debug("====>deviceId fail====");
                }
                if (data.bundleName != "com.example.actsgetwant") {
                    str = "fail"
                    console.debug("====>bundleName fail====");
                }
                if (data.abilityName != "com.example.actsgetwant.MainAbility") {
                    str = "fail"
                    console.debug("====>abilityName fail====");
                }
                if (data.action != "action1") {
                    str = "fail"
                    console.debug("====>action fail====");
                }
                if (data.parameters.mykey0 != 1) {
                    str = "fail"
                    console.debug("====>mykey0 fail====");
                }
                if (data.parameters.mykey1[0] != 1) {
                    str = "fail"
                    console.debug("====>mykey1[0] fail====");
                }
                if (data.parameters.mykey1[1] != 2) {
                    str = "fail"
                    console.debug("====>mykey1[2] fail====");
                }
                if (data.parameters.mykey1[2] != 3) {
                    str = "fail"
                    console.debug("====>mykey1[3] fail====");
                }
                if (data.parameters.mykey2 != "[1, 2, 3]") {
                    str = "fail"
                    console.debug("====>mykey2 fail====");
                }
                if (data.parameters.mykey3 != "str") {
                    str = "fail"
                    console.debug("====>mykey3 fail====");
                }
                if (data.parameters.mykey4[0] != false) {
                    str = "fail"
                    console.debug("====>mykey4[0] fail====");
                }
                if (data.parameters.mykey4[1] != true) {
                    str = "fail"
                    console.debug("====>mykey4[1] fail====");
                }
                if (data.parameters.mykey4[2] != false) {
                    str = "fail"
                    console.debug("====>mykey4[2] fail====");
                }
                if (data.parameters.mykey5[0] != "str") {
                    str = "fail"
                    console.debug("====>mykey5[0] fail====");
                }
                if (data.parameters.mykey5[1] != "STR") {
                    str = "fail"
                        console.debug("====>mykey5[1] fail====");
                }
                if (data.parameters.mykey5[2] != "helloopenharmony") {
                    str = "fail"
                    console.debug("====>mykey5[2] fail====");
                }

                var publishDataOne = {
                    code: 1,
                    data: str
                }
                console.log("==========================send commonevent  start.");
                commonEvent.publish("ACTS_GetWant_0100_CommonEvent",publishDataOne, publishCallback);
                console.log("==========================send commonevent  end.");
                console.log("commonEvent.publish finish01")
            }
        ).catch(error =>
        console.log("featureAbility getWant_0100::catch : " + error)
        )
    },
    onReady() {
    },
}

