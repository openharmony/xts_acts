/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import ServiceExtensionAbility from '@ohos.application.ServiceExtensionAbility';
import rpc from '@ohos.rpc'
import bundle from "@ohos.bundle";
import freeInstall from '@ohos.bundle.freeInstall';

var result = {
    transactId: "-1",
    resultMsg: "",
    retCode: 0 // 0表示FA服务端执行成功
}

var progress = {
    downloadSize: 0,
    totalSize: 0
}

// FA服务中心需要传递给BMS的json字符串的原始对象
var installResult = {
    version: "1",
    result: result,
    progress: progress
}

var targetbundleName = "";
var targetabilityName = "";
var targetmoduleName = "";
var path = ["/data/storage/el2/base/haps/entry/files/"];
var exterrcode = 0;
var sendcode;

class StubTest extends rpc.RemoteObject {
    constructor(des) {
        super(des);
    }

    onRemoteRequest(code: any, data: any, reply: any, option: any) {
        console.info('ServiceAbility  serviceCenter onRemoteRequest START');
        //获取BMS传递的Token
        let interfaceToken = data.readInterfaceToken();
        console.info("ServiceAbility serviceCenter sendRequest interfaceToken = " + interfaceToken);
        // 获取BMS传递的参数　－－　json字符串
        let op1 = data.readString();
        console.info("ServiceAbility serviceCenter sendRequest op1 = " + op1);
        let targetAbilityInfo = JSON.parse(op1);
        // 解析出BMS传递的transactId
        let transactId = targetAbilityInfo.targetInfo.transactId;
        console.info("ServiceAbility serviceCenter sendRequest targetAbilityInfo->targetInfo->transactId = "
        + transactId);
        // 解析出BMS传递的bundleName
        targetbundleName = targetAbilityInfo.targetInfo.bundleName;
        console.info("ServiceAbility serviceCenter sendRequest targetAbilityInfo->targetInfo->bundleName = "
        + targetbundleName);
        // 解析出BMS传递的abilityName
        targetabilityName = targetAbilityInfo.targetInfo.abilityName;
        console.info("ServiceAbility serviceCenter sendRequest targetAbilityInfo->targetInfo->abilityName = "
        + targetabilityName);
        // 解析出BMS传递的moduleName
        targetmoduleName = targetAbilityInfo.targetInfo.moduleName;
        console.info("ServiceAbility serviceCenter sendRequest targetAbilityInfo->targetInfo->moduleName = "
        + targetmoduleName);

        // 解析出BMS传递的扩展信息的错误码
        let targeterrcode = targetAbilityInfo.targetExtSetting.extInfo.Servicecenter_error_code;
        console.info("ServiceAbility serviceCenter targetAbilityInfo->targetExtSetting->extInfo->" +
        "Servicecenter_error_code = " + targeterrcode);
        if (targeterrcode === undefined) {
            exterrcode = 0;
            console.info("ServiceAbility serviceCenter exterrcode = " + exterrcode);
        } else {
            exterrcode = parseInt(targeterrcode);
            console.info("ServiceAbility serviceCenter exterrcode = " + exterrcode);
        }

        // 获取BSM传递的callback对象
        let op2 = data.readRemoteObject();
        console.info("ServiceAbility serviceCenter sendRequest op2 = " + op2);

        console.info("ServiceAbility serviceCenter sendRequest code = " + code);

        if (code == 2 || code == 4 ) { // 2为免安装  3为检查更新 4为安装
//            targetInfoCheck(transactId, op2)
        } else if (code == 3) {
//            serviceCheckUpdate(transactId, op2);
        }
//        else if (code == 4) {
//            updateInfoCheck(transactId, op2);
//        }
        return true;
    }
}

async function targetInfoCheck(transactId: string, remoteObj: any) {
    if (exterrcode != 0) {
        console.info("ServiceAbility serviceCenter targetInfoCheck exterrcode = " + exterrcode);
        let retcode = exterrcode;
        console.info("ServiceAbility serviceCenter targetInfoCheck retcode = " + retcode);
        sendCallBack(transactId, remoteObj, retcode);
    }
    else if ((targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication.ServiceAbility" && targetmoduleName === "myapplication"
    ) || (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication6.ServiceAbility" && targetmoduleName === "myapplication6"
    )) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp0.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if ((targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication1.ServiceAbility_feature" && targetmoduleName === "myapplication1"
    )
    || (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication1.MainAbility" && targetmoduleName === "myapplication1"
    )) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp1.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication1.ServiceAbility_feature" && targetmoduleName === "myapplication3"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp3.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication5.ServiceAbility5" && targetmoduleName === "myapplication5"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp5.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication6.ServiceAbility6" && targetmoduleName === "myapplication6"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp6.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication7.ServiceAbility" && targetmoduleName === "myapplication7"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp7.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    } else if ((targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication6.ServiceAbility6" && targetmoduleName === "myapplication8"
    ) || (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication8.ServiceAbility" && targetmoduleName === "myapplication8"
    )) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp8.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    } else if (targetbundleName === "com.example.myapplication.hmservice" &&
    targetabilityName === "com.example.myapplication7.ServiceAbility" && targetmoduleName === "myapplication9"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp9.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.ohos.atomic1.hmservice" &&
    targetabilityName === "MainAbility"
    //    && targetmoduleName === "entry"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/Atomic1_stage.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.ohos.atomic1.hmservice" &&
    targetabilityName === "com.ohos.atomic1.MainAbility"
    //    && targetmoduleName === "entry"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/Atomic1_FA.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.example.startAbilityForResult.hmservice" &&
    targetabilityName === "MainAbility1" && targetmoduleName === "myapplication1"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/yuanzihua-myapplication1.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.open.harmony.startAbilityForResult" &&
    targetabilityName === "com.example.myapplication1.MainAbility1" && targetmoduleName === "myapplication1"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapplication1-FA-2900.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    } else if (targetbundleName === "com.open.harmony.startAbility" &&
    targetabilityName === "com.example.myapplication1.MainAbility1" && targetmoduleName === "myapplication1"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapplication1-FA-s2800.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if ((targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "com.example.qianyiyingyong.MainAbility" && targetmoduleName === "entry"
    )
    || (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "com.example.qianyiyingyong.ServiceAbility" && targetmoduleName === "entry"
    )
    || (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "com.example.qianyiyingyong.MainAbility" && targetmoduleName === "hm1"
    )
    || (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "com.example.hm3.MainAbility" && targetmoduleName === "hm3"
    )
    || (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "com.example.hm2.MainAbility" && targetmoduleName === "hnm2"
    )
    || (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "MainAbility" && targetmoduleName === "entry"
    )
    || (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "hm3MainAbility" && targetmoduleName === "hm3"
    )
    || (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "hnm2MainAbility" && targetmoduleName === "hnm2"
    )
    || (targetbundleName === "com.example.myapplication.hmservice0" &&
    targetabilityName === "com.example.myapplication.MainAbility" && targetmoduleName === "entry"
    )
    || (targetbundleName === "com.example.myapplication.hmservice0" &&
    targetabilityName === "com.example.myapplication1.MainAbility" && targetmoduleName === "myapplication1"
    )
    || (targetbundleName === "com.example.myapplication.hmservice0" &&
    targetabilityName === "com.example.myapplication2.MainAbility" && targetmoduleName === "myapplication2"
    )
    || (targetbundleName === "com.open.harmony.myapplication0.hmservice" &&
    targetabilityName === "MainAbility" && targetmoduleName === "entry"
    )
    || (targetbundleName === "com.open.harmony.myapplication0.hmservice" &&
    targetabilityName === "MainAbility1" && targetmoduleName === "myapplication1"
    )
    || (targetbundleName === "com.open.harmony.myapplication0.hmservice" &&
    targetabilityName === "MainAbility2" && targetmoduleName === "myapplication2"
    )
    || (targetbundleName === "com.open.harmony.packagemag.hmservice" &&
    targetabilityName === "MainAbility" && targetmoduleName === "myapplication1"
    )
    ) {
        path = ["/data/storage/el2/base/haps/entry/files"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "com.example.hm2.MainAbility" && targetmoduleName === "hm4"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/sign-core-hm4-all.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if ((targetbundleName === "com.example.myapplicationA.hmserviceA" &&
    targetabilityName === "com.example.myapplicationA.MainAbility" && targetmoduleName === "entry"
    ) || (targetbundleName === "com.open.harmony.myapplicationA.hmservice" &&
    targetabilityName === "MainAbility" && targetmoduleName === "entry")) {
        path = ["/data/storage/el2/base/haps/entry/files/A.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if ((targetbundleName === "com.example.myapplicationB.hmserviceB" &&
    targetabilityName === "com.example.myapplicationB.MainAbility" && targetmoduleName === "entry"
    ) || (targetbundleName === "com.open.harmony.myapplicationB.hmservice" &&
    targetabilityName === "MainAbility" && targetmoduleName === "entry")) {
        path = ["/data/storage/el2/base/haps/entry/files/B.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else if ((targetbundleName === "com.example.myapplicationC.hmserviceC" &&
    targetabilityName === "com.example.myapplicationC.MainAbility" && targetmoduleName === "entry"
    ) || (targetbundleName === "com.open.harmony.myapplicationC.hmservice" &&
    targetabilityName === "MainAbility" && targetmoduleName === "entry")) {
        path = ["/data/storage/el2/base/haps/entry/files/C.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    else {
        sendCallBack(transactId, remoteObj, -1);
    }
}

async function updateInfoCheck(transactId: string, remoteObj: any) {
    //startAbility 高低版本
    if (targetbundleName === "com.example.qianyiyingyong.hmservice" &&
    targetabilityName === "com.example.qianyiyingyong.MainAbility" && targetmoduleName === "entry"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/sign-core-qianyi-allv2.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    //免安装更新 stage模型
    else if (targetbundleName === "com.ohos.atomic1.hmservice" &&
    targetabilityName === "MainAbility"
    //    && targetmoduleName === "entry"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/Atomic1_stage_V2.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    //免安装更新 FA模型
    else if (targetbundleName === "com.ohos.atomic1.hmservice" &&
    targetabilityName === "com.ohos.atomic1.MainAbility"
    //    && targetmoduleName === "entry"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/Atomic1_FA_V2.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }
    //免安装更新 同应用 Stage模型
    else if (targetbundleName === "com.ohos.myapplication.hmservice" &&
    targetabilityName === "MainAbility" && targetmoduleName === "myapplication"
    ) {
        path = ["/data/storage/el2/base/haps/entry/files/myapp_stage_V2.hap"];
        console.info("ServiceAbility serviceCenter targetInfoCheck path: " + JSON.stringify(path));
        serviceInstall(transactId, remoteObj);
    }

    else {
        sendCallBack(transactId, remoteObj, -1);
    }
}

async function serviceInstall(transactId: string, remoteObj: any) {
    console.info('ServiceAbility serviceCenter install start');
    //     let bundleFilePaths = ["/data/storage/el2/base/haps/entry/files/"];
    let bundleFilePaths = path;
    let param = {
        userId: 100,
        installFlag: 16,
        isKeepData: false
    }
    let installer = await bundle.getBundleInstaller();
    installer.install(bundleFilePaths, param, (err: any, data: any) => {
        console.info('ServiceAbility serviceCenter install. Data status: ' + JSON.stringify(data.status));
        console.info('ServiceAbility serviceCenter install. Data statusMessage: ' + JSON.stringify(data.statusMessage));
        console.info('ServiceAbility serviceCenter install. bundleFilePaths:' + JSON.stringify(bundleFilePaths));
        console.info('ServiceAbility serviceCenter install. param:' + JSON.stringify(param));
        console.info('ServiceAbility serviceCenter install. Cause:' + JSON.stringify(err));
        sendcode = parseInt(err.code);
        if (sendcode === -1) {
            sendcode = -5;
        }
        console.info('ServiceAbility serviceCenter install. code:' + sendcode);
        freeInstall.setHapModuleUpgradeFlag(targetbundleName, targetmoduleName, 0)
         .then((data) => {
            console.info('ServiceAbility serviceCenter install flag bundleName : ' + JSON.stringify(targetbundleName)
            + ', moduleName : ' + JSON.stringify(targetmoduleName));
            console.info('ServiceAbility serviceCenter UpgradeFlag method, data: ' + JSON.stringify(data));
        }).catch((error) => {
            console.info('ServiceAbility serviceCenter install flag bundleName : ' + JSON.stringify(targetbundleName)
            + ', moduleName : ' + JSON.stringify(targetmoduleName));
        console.error('ServiceAbility serviceCenter UpgradeFlag method, error: ' + JSON.stringify(error));
        });
        console.info("ServiceAbility serviceCenter serviceInstall callBack obj = " + remoteObj);
        console.info("ServiceAbility serviceCenter serviceInstall code = " + sendcode);
        sendCallBack(transactId, remoteObj, sendcode);
    });

}

async function serviceCheckUpdate(transactId: string, remoteObj: any) {
    console.info('ServiceAbility serviceCenter serviceCheckUpdate start');
    freeInstall.setHapModuleUpgradeFlag(targetbundleName, targetmoduleName, 1)
        .then((data) => {
            console.info('ServiceAbility serviceCenter UpgradeFlag bundleName value: ' + JSON.stringify(targetbundleName));
            console.info('ServiceAbility serviceCenter UpgradeFlag moduleName value: ' + JSON.stringify(targetmoduleName));
            console.info('ServiceAbility serviceCenter UpgradeFlag method, data: ' + JSON.stringify(data));
        }).catch((error) => {
        console.info('ServiceAbility serviceCenter UpgradeFlag bundleName value: ' + JSON.stringify(targetbundleName));
        console.info('ServiceAbility serviceCenter UpgradeFlag moduleName value: ' + JSON.stringify(targetmoduleName));
        console.error('ServiceAbility serviceCenter UpgradeFlag method, error: ' + JSON.stringify(error));
    });
    setTimeout(function () {
        console.info("ServiceAbility serviceCenter serviceCheckUpdate sendCallBack  sleep 35000 !!!")
    sendCallBack(transactId, remoteObj, 0);
    },35000)
}

function sendCallBack(transactId: string, remoteObj: any, code: number) {
    console.info("ServiceAbility serviceCenter sendCallBack remoteObj = " + remoteObj);
    let option1 = new rpc.MessageOption();
    let data1 = rpc.MessageParcel.create();
    let reply1 = rpc.MessageParcel.create();
    // 写入token
    //    data1.writeInterfaceToken("ohos.aafwk.IAtomicServiceStatusCallback");
    data1.writeInterfaceToken("abilitydispatcherhm.openapi.hapinstall.IHapInstallCallback");
    // 将BMS传递的transactId返回给BMS
    installResult.result.transactId = transactId;
    installResult.result.retCode = code;
    console.info('ServiceAbility serviceCenter code:' + code);
    let returnString = JSON.stringify(installResult);
    console.info("ServiceAbility serviceCenter sendRequest returnString = " + returnString);
    // 返回给BMS的参数 -- json字符串
    data1.writeString(returnString);
    remoteObj.sendRequest(1, data1, reply1, option1, (err, result) => {
        console.info("ServiceAbility serviceCenter sendRequest result:" + result + ",err:" + err);
        if (err === 0) {
            console.info("ServiceAbility serviceCenter sendRequest got result");
        }
    });
}



export default class ServiceExtAbility extends ServiceExtensionAbility {
    onCreate(want) {
        console.info('onCreate, want:' + want.abilityName);
        console.info('ServiceAbility serviceCenter onCreate');
    }

    onRequest(want, startId) {
        console.info('onRequest, want: ' + want.abilityName);
        console.info('onRequest, startId: ' + startId);
        console.info('ServiceAbility serviceCenter onRequest');
    }

    onConnect(want) {
        //        console.info('onConnect, want:' + want.abilityName);
        console.info('ServiceAbility serviceCenter onConnect');
        return new StubTest("test");
    }

    onDisconnect(want) {
        console.info('onDisconnect, want:' + want.abilityName);
        console.info('ServiceAbility serviceCenter onDisconnect');
    }

    onReconnect(want) {
        console.info('onReconnect, want:' + want.abilityName);
        console.info('ServiceAbility serviceCenter onReconnect');
    }

    onDestroy() {
        console.info('ServiceAbility serviceCenter onDestroy');
    }
}
