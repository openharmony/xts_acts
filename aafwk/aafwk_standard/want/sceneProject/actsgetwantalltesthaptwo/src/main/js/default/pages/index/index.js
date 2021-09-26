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

        featureAbility.getWant(
            (err, data) => {
                console.debug("==========data2 is===========" + JSON.stringify(data));
                var str = "succeed";
                if (data.bundleName != "com.example.actsgetwanttwo") {
                    str = "fail"
                    console.debug("====>bundleName fail====");
                }
                if (data.abilityName != "com.example.actsgetwanttwo.MainAbility") {
                    str = "fail"
                    console.debug("====>abilityName fail====");
                }

                var publishDataTwo = {
                    code: 2,
                    data: str
                }
                console.log("==========================send commonevent2  start.");
                commonEvent.publish("ACTS_GetWant_0200_CommonEvent", publishDataTwo, publishCallback);
                console.log("==========================send commonevent2  end.");

                console.log("commonEvent.publish finish02")

            }
        ).catch(error =>
        console.log("featureAbility getWant_0200::catch : " + error)
        )
    },
    onReady() {
    },
}

