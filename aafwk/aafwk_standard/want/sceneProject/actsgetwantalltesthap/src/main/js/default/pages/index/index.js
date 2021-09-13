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

export default {
    data: {
        title: "预置"
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
        function publishCallback() {
            console.debug("====>publish call back====>");
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
                    console.debug("====deviceId fail====");
                }
                if (data.bundleName != "com.example.actsgetwantalltest") {
                    str = "fail"
                    console.debug("====bundleName fail====");
                }
                if (data.abilityName != "com.example.actsgetwantalltest.MainAbility") {
                    str = "fail"
                    console.debug("====abilityName fail====");
                }
                if (data.action != "action1") {
                    str = "fail"
                    console.debug("====action fail====");
                }
                if (data.entities[0] != "entity1") {
                    str = "fail"
                    console.debug("====entities fail====");
                }
                if (data.type != "MIMETYPE") {
                    str = "fail"
                    console.debug("====type fail====");
                }
                if (data.uri != "key={true,true,false}") {
                    str = "fail"
                    console.debug("====uri fail====");
                }
                if (data.options.authReadUriPermission != true) {
                    str = "fail"
                    console.debug("====authReadUriPermission fail====");
                }
                if (data.options.authWriteUriPermission != true) {
                    str = "fail"
                    console.debug("====authWriteUriPermission fail====");
                }
                if (data.options.abilityForwardResult != false) {
                    str = "fail"
                    console.debug("====abilityForwardResult fail====");
                }
                if (data.options.abilityContinuation != false) {
                    str = "fail"
                    console.debug("====abilityContinuation fail====");
                }
                if (data.options.notOhosComponent != true) {
                    str = "fail"
                    console.debug("====notOhosComponent fail====");
                }
                if (data.options.abilityFormEnabled != true) {
                    str = "fail"
                    console.debug("====abilityFormEnabled fail====");
                }
                if (data.options.authPersistableUriPermission != true) {
                    str = "fail"
                    console.debug("====authPersistableUriPermission fail====");
                }
                if (data.options.authPrefixUriPermission != false) {
                    str = "fail"
                    console.debug("====authPrefixUriPermission fail====");
                }
                if (data.options.abilitySliceMultiDevice != false) {
                    str = "fail"
                    console.debug("====abilitySliceMultiDevice fail====");
                }
                if (data.options.startForegroundAbility != true) {
                    str = "fail"
                    console.debug("====startForegroundAbility fail====");
                }
                if (data.options.installOnDemand != false) {
                    str = "fail"
                    console.debug("====installOnDemand fail====");
                }
                if (data.options.abilitySliceForwardResult != true) {
                    str = "fail"
                    console.debug("====abilitySliceForwardResult fail====");
                }
                if (data.options.installWithBackgroundMode != true) {
                    str = "fail"
                    console.debug("====installWithBackgroundMode fail====");
                }
                if (data.parameters.mykey0 != 2222) {
                    str = "fail"
                    console.debug("====mykey0 fail====");
                }
                if (data.parameters.mykey1[0] != 1) {
                    str = "fail"
                    console.debug("====mykey1[0] fail====");
                }
                if (data.parameters.mykey1[1] != 2) {
                    str = "fail"
                    console.debug("====mykey1[2] fail====");
                }
                if (data.parameters.mykey1[2] != 3) {
                    str = "fail"
                    console.debug("====mykey1[3] fail====");
                }
                if (data.parameters.mykey2 != "[1, 2, 3]") {
                    str = "fail"
                    console.debug("====mykey2 fail====");
                }
                if (data.parameters.mykey3 != "ssssssssssssssssssssssssss") {
                    str = "fail"
                    console.debug("====mykey3 fail====");
                }
                if (data.parameters.mykey4[0] != false) {
                    str = "fail"
                    console.debug("====mykey4[0] fail====");
                }
                if (data.parameters.mykey4[1] != true) {
                    str = "fail"
                    console.debug("====mykey4[1] fail====");
                }
                if (data.parameters.mykey4[2] != false) {
                    str = "fail"
                    console.debug("====mykey4[2] fail====");
                }
                if (data.parameters.mykey5[0] != "qqqqq") {
                    str = "fail"
                    console.debug("====mykey5[0] fail====");
                }
                if (data.parameters.mykey5[1] != "wwwwww") {
                    str = "fail"
                    console.debug("====mykey5[1] fail====");
                }
                if (data.parameters.mykey5[2] != "aaaaaaaaaaaaaaaaa") {
                    str = "fail"
                    console.debug("====mykey5[2] fail====");
                }

                var publishDataOne = {
                    code: 1,
                    data: str
                }
                featureAbility.terminateAbility();
                console.log("featureAbility terminateAbility finish")
                setTimeout(timeout, 5000);
                commonEvent.publish("ACTS_GetWant_0100_CommonEvent", publishDataOne, publishCallback);
                console.log("commonEvent.publish finish")
            }
        ).catch(error =>
        console.log("featureAbility getWant_0100::catch : " + error)
        )

        featureAbility.getWant(
            (err, data) => {
                console.debug("==========data2 is===========" + JSON.stringify(data));
                var str = "succeed";
                if (data.deviceId != "") {
                    str = "fail"
                    console.debug("====deviceId fail====");
                }
                if (data.bundleName != "com.example.actsgetwantalltest") {
                    str = "fail"
                    console.debug("====bundleName fail====");
                }
                if (data.abilityName != "com.example.actsgetwantalltest.MainAbility") {
                    str = "fail"
                    console.debug("====abilityName fail====");
                }
                if (data.action != "action1") {
                    str = "fail"
                    console.debug("====action fail====");
                }
                if (data.entities[0] != "entity1") {
                    str = "fail"
                    console.debug("====entities fail====");
                }
                if (data.type != "MIMETYPE") {
                    str = "fail"
                    console.debug("====type fail====");
                }
                if (data.uri != "key={true,true,false}") {
                    str = "fail"
                    console.debug("====uri fail====");
                }
                if (data.options.authReadUriPermission != true) {
                    str = "fail"
                    console.debug("====authReadUriPermission fail====");
                }
                if (data.options.authWriteUriPermission != true) {
                    str = "fail"
                    console.debug("====authWriteUriPermission fail====");
                }
                if (data.options.abilityForwardResult != false) {
                    str = "fail"
                    console.debug("====abilityForwardResult fail====");
                }
                if (data.options.abilityContinuation != false) {
                    str = "fail"
                    console.debug("====abilityContinuation fail====");
                }
                if (data.options.notOhosComponent != true) {
                    str = "fail"
                    console.debug("====notOhosComponent fail====");
                }
                if (data.options.abilityFormEnabled != true) {
                    str = "fail"
                    console.debug("====abilityFormEnabled fail====");
                }
                if (data.options.authPersistableUriPermission != true) {
                    str = "fail"
                    console.debug("====authPersistableUriPermission fail====");
                }
                if (data.options.authPrefixUriPermission != false) {
                    str = "fail"
                    console.debug("====authPrefixUriPermission fail====");
                }
                if (data.options.abilitySliceMultiDevice != false) {
                    str = "fail"
                    console.debug("====abilitySliceMultiDevice fail====");
                }
                if (data.options.startForegroundAbility != true) {
                    str = "fail"
                    console.debug("====startForegroundAbility fail====");
                }
                if (data.options.installOnDemand != false) {
                    str = "fail"
                    console.debug("====installOnDemand fail====");
                }
                if (data.options.abilitySliceForwardResult != true) {
                    str = "fail"
                    console.debug("====abilitySliceForwardResult fail====");
                }
                if (data.options.installWithBackgroundMode != true) {
                    str = "fail"
                    console.debug("====installWithBackgroundMode fail====");
                }
                if (data.parameters.mykey0 != 2222) {
                    str = "fail"
                    console.debug("====mykey0 fail====");
                }
                if (data.parameters.mykey1[0] != 1) {
                    str = "fail"
                    console.debug("====mykey1[0] fail====");
                }
                if (data.parameters.mykey1[1] != 2) {
                    str = "fail"
                    console.debug("====mykey1[2] fail====");
                }
                if (data.parameters.mykey1[2] != 3) {
                    str = "fail"
                    console.debug("====mykey1[3] fail====");
                }
                if (data.parameters.mykey2 != "[1, 2, 3]") {
                    str = "fail"
                    console.debug("====mykey2 fail====");
                }
                if (data.parameters.mykey3 != "ssssssssssssssssssssssssss") {
                    str = "fail"
                    console.debug("====mykey3 fail====");
                }
                if (data.parameters.mykey4[0] != false) {
                    str = "fail"
                    console.debug("====mykey4[0] fail====");
                }
                if (data.parameters.mykey4[1] != true) {
                    str = "fail"
                    console.debug("====mykey4[1] fail====");
                }
                if (data.parameters.mykey4[2] != false) {
                    str = "fail"
                    console.debug("====mykey4[2] fail====");
                }
                if (data.parameters.mykey5[0] != "qqqqq") {
                    str = "fail"
                    console.debug("====mykey5[0] fail====");
                }
                if (data.parameters.mykey5[1] != "wwwwww") {
                    str = "fail"
                    console.debug("====mykey5[1] fail====");
                }
                if (data.parameters.mykey5[2] != "aaaaaaaaaaaaaaaaa") {
                    str = "fail"
                    console.debug("====mykey5[2] fail====");
                }

                var publishDataTwo = {
                    code: 2,
                    data: str
                }
                featureAbility.terminateAbility();
                console.log("featureAbility terminateAbility finish")
                setTimeout(timeout, 5000);
                commonEvent.publish("ACTS_GetWant_0200_CommonEvent", publishDataTwo, publishCallback);
                console.log("commonEvent.publish finish")
            }
        ).catch(error =>
        console.log("featureAbility getWant_0200::catch : " + error)
        )
    },
    onReady() {
    },
}

