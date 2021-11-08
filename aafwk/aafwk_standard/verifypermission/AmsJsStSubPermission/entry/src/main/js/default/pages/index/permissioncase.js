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

export function runAllCase(caseName, obj) {
    console.debug("======runAllCase1======>:" + JSON.stringify(caseName))
    console.debug("======runAllCase2======>:" + JSON.stringify(allCase))
    allCase[caseName].func(obj)
}

export function GetCaseInfo(caseName) {
    console.debug("======GetCaseInfo======>:" + JSON.stringify(caseName))
    return allCase[caseName].info;
}

var allCase = {
    AppPermission_1300: {
        func: AppPermission_1300,
        info: "Verify that a system_grand system`s permission(ohos.permission.GET_NETWORK_INFO) is automatically requested during installation."
    },
    AppPermission_1400: {
        func: AppPermission_1400,
        info: ""
    },
    AppPermission_1500: {
        func: AppPermission_1500,
        info: ""
    },
    AppPermission_1600: {
        func: AppPermission_1600,
        info: ""
    },
    AppPermission_1700: {
        func: AppPermission_1700,
        info: ""
    },
    AppPermission_1800: {
        func: AppPermission_1800,
        info: ""
    },

}

async function AppPermission_1300(thisobj) {
    var thisFunctionName = AppPermission_1300.name
    thisobj.logmessage = ""
    thisobj.logmessage += "run test case " + thisFunctionName + "\n"

    var context = await featureAbility.getContext()
    await context.verifyPermission("ohos.permission.GET_NETWORK_INFO",
        (err, data) => {
            console.debug("======verifyCallingPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += JSON.stringify(data) + "\n"
            if (data == 0) {
                thisobj.logmessage += "case " + thisFunctionName + " successed\n"
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failed\n"
            }
        })
}

async function AppPermission_1400(thisobj) {
    var thisFunctionName = AppPermission_1400.name
    thisobj.logmessage = ""
    thisobj.logmessage += "run test case " + thisFunctionName + "\n"

    var context = await featureAbility.getContext()
    console.log("<======verfyPermissiom pass=====>")
    var result = await context.verifyPermission("ohos.permission.GET_NETWORK_INFO")
    console.debug("======verifyCallingPermission:result======>:" + JSON.stringify(result))
    thisobj.logmessage += JSON.stringify(result) + "\n"
    if (result == 0) {
        thisobj.logmessage += "case " + thisFunctionName + " successed\n"
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failed\n"
    }
}

async function AppPermission_1500(thisobj) {
    var thisFunctionName = AppPermission_1500.name
    thisobj.logmessage = ""
    thisobj.logmessage += "run test case " + thisFunctionName + "\n"

    var context = await featureAbility.getContext()
    await context.verifyPermission("ohos.permission.CAMERA",
        (err, data) => {
            console.debug("======verifyCallingPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += JSON.stringify(data) + "\n"
            if (data == -1) {
                thisobj.logmessage += "case " + thisFunctionName + " successed\n"
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failed\n"
            }
        })
}

async function AppPermission_1600(thisobj) {
    var thisFunctionName = AppPermission_1600.name
    thisobj.logmessage = ""
    thisobj.logmessage += "run test case " + thisFunctionName + "\n"

    var context = await featureAbility.getContext()
    var result = await context.verifyPermission("ohos.permission.CAMERA")
    console.debug("======verifyCallingPermission:result======>:" + JSON.stringify(result))
    thisobj.logmessage += JSON.stringify(result) + "\n"
    if (result == -1) {
        thisobj.logmessage += "case " + thisFunctionName + " successed\n"
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failed\n"
    }
}

async function AppPermission_1700(thisobj) {
    var thisFunctionName = AppPermission_1700.name
    thisobj.logmessage = ""
    thisobj.logmessage += "run test case " + thisFunctionName + "\n"

    var context = await featureAbility.getContext()
    await context.verifyPermission("com.amsst.permission.SYSPERMISSION",
        (err, data) => {
            console.debug("======verifyCallingPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += JSON.stringify(data) + "\n"
            if (data == 0) {
                thisobj.logmessage += "case " + thisFunctionName + " successed\n"
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failed\n"
            }
        })
}

async function AppPermission_1800(thisobj) {
    var thisFunctionName = AppPermission_1800.name
    thisobj.logmessage = ""
    thisobj.logmessage += "run test case " + thisFunctionName + "\n"

    var context = await featureAbility.getContext()
    var result = await context.verifyPermission("com.amsst.permission.SYSPERMISSION")
    console.debug("======verifyCallingPermission:result======>:" + JSON.stringify(result))
    thisobj.logmessage += JSON.stringify(result) + "\n"
    if (result == 0) {
        thisobj.logmessage += "case " + thisFunctionName + " successed\n"
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failed\n"
    }
}