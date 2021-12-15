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
import featureAbility from '@ohos.ability.featureability'
import bundle from "@ohos.bundle"
import commonEvent from '@ohos.commonevent'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')
let code;
const MIN_CLONEUID = 20000000;

function publishCallBack() {
    console.debug("====>Publish CallBack ====>");
}

async function onStartTest() {
    var abilityWant = await featureAbility.getWant();
    var result = "";
    var bundleInfo;
    console.log('PageExecutor bundleName' + abilityWant.bundleName);
    console.log('PageExecutor abilityName' + abilityWant.abilityName);
    if ((abilityWant.bundleName == "com.example.amsmultiapppageexecutor") &&
        (abilityWant.abilityName == "com.example.amsmultiapppageexecutor.MainAbility")) {
        code = 1;
    } else {
        code = 2;
    }
    console.log('PageExecutor onStart code =' + code );
    var info = await featureAbility.getAbilityInfo();
    console.log('PageExecutor onStart info =' +  JSON.stringify(info));
    bundleInfo = await bundle.getBundleInfo("com.example.amsmultiapppageexecutor", 1);
    console.info('PageExecutor getBundleInfo =' + JSON.stringify(bundleInfo));
    if (bundleInfo.uid >= MIN_CLONEUID) {
        if (info.applicationInfo.isCloned == true) {
            result = "isCloned";
        }
    } else {
        if (info.applicationInfo.isCloned == false) {
            result = "notCloned";
        }
    }
    var CommonEventPublishData = {
        code: code,
        data: result,
        isOrdered: false
    }
    console.log('PageExecutor onStart  publish');
    commonEvent.publish("subscriberInfoMultiAppPageByServiceStart", CommonEventPublishData, publishCallBack);
}

export default {
    data: {
        title: "PageExecutor"
    },
    onInit() {
        this.title = "PageExecutor";
    },
    onShow() {
        console.log('PageExecutor onShow start');
        try {
            onStartTest();
        } catch (err) {
            console.log('PageExecutor err = ' + err);
        }
    },
    onStart() {
        console.log('PageExecutor onStart');
    },
    onStop() {
        console.log('PageExecutor onStop');
    },
}
