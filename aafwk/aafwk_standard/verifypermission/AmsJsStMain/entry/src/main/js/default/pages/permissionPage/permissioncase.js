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
    console.debug("====runAllCase1====>:" + JSON.stringify(caseName))
    console.debug("====runAllCase2====>:" + JSON.stringify(allCase))
    allCase[caseName].func(obj)
}
export function getCaseInfo(caseName) {
    console.debug("====getCaseInfo====>:" + JSON.stringify(caseName))
    return allCase[caseName].info;
}

var MY_PERMISSIONS_REQUEST_PERMISSION = 1;
var allCase = {
    "ACTS_AppPermission_0100": {
        func: ACTS_AppPermission_0100,
        info: "Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_0200": {
        func: ACTS_AppPermission_0200,
        info: "Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_0300": {
        func: ACTS_AppPermission_0300,
        info: "Verify that a user_grant system`s permission(ohos.permission.CAMERA) "
            + "is not automatically requested during installation."
    },
    "ACTS_AppPermission_0400": {
        func: ACTS_AppPermission_0400,
        info: "Verify that a user_grant system`s permission(ohos.permission.CAMERA) "
            + "is not automatically requested during installation."
    },
    "ACTS_AppPermission_0500": {
        func: ACTS_AppPermission_0500,
        info: "Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_0600": {
        func: ACTS_AppPermission_0600,
        info: "Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_0700": {
        func: ACTS_AppPermission_0700,
        info: "Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_0800": {
        func: ACTS_AppPermission_0800,
        info: "Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_0900": {
        func: ACTS_AppPermission_0900,
        info: "Verify that a user_grant system`s permission(ohos.permission.CAMERA) "
            + "is not automatically requested during installation."
    },
    "ACTS_AppPermission_1000": {
        func: ACTS_AppPermission_1000,
        info: "Verify that a user_grant system`s permission(ohos.permission.CAMERA) "
            + "is not automatically requested during installation."
    },
    "ACTS_AppPermission_1100": {
        func: ACTS_AppPermission_1100,
        info: "Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_1200": {
        func: ACTS_AppPermission_1200,
        info: "Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION) "
            + "is automatically requested during installation."
    },
    "ACTS_AppPermission_1300": {
        func: ACTS_AppPermission_1300,
        info: "Verify that calling application(different application in the same device) "
            + "is requested the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)"
    },
    "ACTS_AppPermission_1400": {
        func: ACTS_AppPermission_1400,
        info: "Verify that calling application(different application in the same device) "
            + "is requested the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)"
    },
    "ACTS_AppPermission_1500": {
        func: ACTS_AppPermission_1500,
        info: "Verify that calling application(different application in the same device) "
            + "is not requested the user_grant system`s permission(ohos.permission.CAMERA)"
    },
    "ACTS_AppPermission_1600": {
        func: ACTS_AppPermission_1600,
        info: "Verify that calling application(different application in the same device) "
            + "is not requested the user_grant system`s permission(ohos.permission.CAMERA)"
    },
    "ACTS_AppPermission_1700": {
        func: ACTS_AppPermission_1700,
        info: "Verify that calling application(different application in the same device) "
            + "is requested the system_grant user`s permission(com.amsst.permission.SYSPERMISSION)"
    },
    "ACTS_AppPermission_1800": {
        func: ACTS_AppPermission_1800,
        info: "Verify that calling application(different application in the same device) "
            + "is requested the system_grant user`s permission(com.amsst.permission.SYSPERMISSION)"
    },
    "ACTS_AppPermission_1900": {
        func: ACTS_AppPermission_1900,
        info: "Verify that application without calling application(other device) "
            + "is requested the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)"
    },
    "ACTS_AppPermission_2000": {
        func: ACTS_AppPermission_2000,
        info: "Verify that application without calling application(other device) "
            + "is requested the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)"
    },
    "ACTS_AppPermission_2100": {
        func: ACTS_AppPermission_2100,
        info: "Verify that application without calling application(other device) "
            + "is not requested the system_grant system`s permission(ohos.permission.GET_WIFI_INFO)"
    },
    "ACTS_AppPermission_2200": {
        func: ACTS_AppPermission_2200,
        info: "Verify that application without calling application(other device) "
            + "is not requested the system_grant system`s permission(ohos.permission.GET_WIFI_INFO)"
    },
    "ACTS_AppPermission_2300": {
        func: ACTS_AppPermission_2300,
        info: "Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO) "
            + "can not requested during runtime."
    },
    "ACTS_AppPermission_2400": {
        func: ACTS_AppPermission_2400,
        info: "Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO) "
            + "can not requested during runtime."
    },
    "ACTS_AppPermission_2500": {
        func: ACTS_AppPermission_2500,
        info: "Verify that a user_grant system`s permission(ohos.permission.CAMERA) "
            + "can requested during runtime."
    },
    "ACTS_AppPermission_2600": {
        func: ACTS_AppPermission_2600,
        info: "Verify that a user_grant system`s permission(ohos.permission.CAMERA) can requested during runtime."
    },
    "ACTS_AppPermission_2700": {
        func: ACTS_AppPermission_2700,
        info: "Verify that a user_grant system`s permission(ohos.permission.PERMISSIOND) can requested during runtime."
    },
    "ACTS_AppPermission_2800": {
        func: ACTS_AppPermission_2800,
        info: "Verify that a user_grant system`s permission(2 permissions) can requested during runtime."
    },
}

async function getThisProcessInfo() {
    console.debug("====getThisProcessInfo:begin====<");
    var processInfoArray = await abilityManager.getAllRunningProcesses();
    var thisProcessInfo = processInfoArray[0];
    for (let i = 0; i < processInfoArray.length; i++) {
        if (processInfoArray[i].processName == "com.amsst.amsjsstmain") {
            thisProcessInfo = processInfoArray[i]
            break
        }
    }
    console.debug("======getThisProcessInfo:end======<");
    return thisProcessInfo;
}


/*
 * @tc.number    : ACTS_AppPermission_0100
 * @tc.name      : Verify that ohos.permission.GET_NETWORK_INFO is requested
 * @tc.desc      : Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_0100(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0100.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    await context.verifyPermission("ohos.permission.GET_NETWORK_INFO",
        {
            options: {
                pid: thisProcessInfo.pid,
                uid: thisProcessInfo.uid,
            }
        },
        (err, data) => {
            console.debug("====verifyPermission:data====>:" + JSON.stringify(data))
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == 0) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            } else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        }
    );
}

/*
 * @tc.number    : ACTS_AppPermission_0200
 * @tc.name      : Verify that ohos.permission.GET_NETWORK_INFO is requested
 * @tc.desc      : Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_0200(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0200.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    var result = await context.verifyPermission("ohos.permission.GET_NETWORK_INFO", {
        options: {
            pid: thisProcessInfo.pid,
            uid: thisProcessInfo.uid,
        }
    });
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == 0) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    } else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}


/*
 * @tc.number    : ACTS_AppPermission_0300
 * @tc.name      : Verify that ohos.permission.CAMERA is not requested
 * @tc.desc      : Verify that a user_grant system`s permission(ohos.permission.CAMERA)
 *                 is not automatically requested during installation.
 */
async function ACTS_AppPermission_0300(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0300.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    await context.verifyPermission("ohos.permission.CAMERA",
        {
            options: {
                pid: thisProcessInfo.pid,
                uid: thisProcessInfo.uid,
            }
        },
        (err, data) => {
            console.debug("======verifyPermission:data======>:" + JSON.stringify(data))
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == -1) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        }
    );
}

/*
 * @tc.number    : ACTS_AppPermission_0400
 * @tc.name      : Verify that ohos.permission.CAMERA is requested
 * @tc.desc      : Verify that a user_grant system`s permission(ohos.permission.CAMERA)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_0400(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0400.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    var result = await context.verifyPermission("ohos.permission.CAMERA", {
        options: {
            pid: thisProcessInfo.pid,
            uid: thisProcessInfo.uid,
        }
    });
    console.debug("======verifyPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == -1) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_0500
 * @tc.name      : Verify that com.amsst.permission.SYSPERMISSION is requested
 * @tc.desc      : Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_0500(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0500.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    await context.verifyPermission("com.amsst.permission.SYSPERMISSION",
        {
            options: {
                pid: thisProcessInfo.pid,
                uid: thisProcessInfo.uid,
            }
        },
        (err, data) => {
            console.debug("======verifyPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == 0) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_0600
 * @tc.name      : Verify that com.amsst.permission.SYSPERMISSION is requested
 * @tc.desc      : Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_0600(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0600.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    var result = await context.verifyPermission("com.amsst.permission.SYSPERMISSION", {
        options: {
            pid: thisProcessInfo.pid,
            uid: thisProcessInfo.uid,
        }
    });
    console.debug("======verifyPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == 0) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}


/*
 * @tc.number    : ACTS_AppPermission_0700
 * @tc.name      : Verify that ohos.permission.GET_NETWORK_INFO is requested
 * @tc.desc      : Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_0700(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0700.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    await context.verifySelfPermission("ohos.permission.GET_NETWORK_INFO",
        (err, data) => {
            console.debug("======verifySelfPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == 0) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_0800
 * @tc.name      : Verify that ohos.permission.GET_NETWORK_INFO is requested by self
 * @tc.desc      : Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_0800(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0800.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    var result = await context.verifySelfPermission("ohos.permission.GET_NETWORK_INFO");
    console.debug("======verifySelfPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == 0) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_0900
 * @tc.name      : Verify that ohos.permission.CAMERA is not requested by self
 * @tc.desc      : Verify that a user_grant system`s permission(ohos.permission.CAMERA)
 *                 is not automatically requested during installation.
 */
async function ACTS_AppPermission_0900(thisobj) {
    var thisFunctionName = ACTS_AppPermission_0900.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    await context.verifySelfPermission("ohos.permission.CAMERA",
        (err, data) => {
            console.debug("======verifySelfPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == -1) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_1000
 * @tc.name      : Verify that ohos.permission.CAMERA is requested by self
 * @tc.desc      : Verify that a user_grant system`s permission(ohos.permission.CAMERA)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_1000(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1000.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    var result = await context.verifySelfPermission("ohos.permission.CAMERA")
    console.debug("======verifySelfPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == -1) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_1100
 * @tc.name      : Verify that com.amsst.permission.SYSPERMISSION is requested by self
 * @tc.desc      : Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_1100(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1100.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    await context.verifySelfPermission("com.amsst.permission.SYSPERMISSION",
        (err, data) => {
            console.debug("======verifySelfPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == 0) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_1200
 * @tc.name      : Verify that com.amsst.permission.SYSPERMISSION is requested by self
 * @tc.desc      : Verify that a system_grant user`s permission(com.amsst.permission.SYSPERMISSION)
 *                 is automatically requested during installation.
 */
async function ACTS_AppPermission_1200(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1200.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    var result = await context.verifySelfPermission("com.amsst.permission.SYSPERMISSION");
    console.debug("======verifySelfPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == 0) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n"
        return -1;;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_1300
 * @tc.name      : Verify that calling application(different application in the same device) 
 *                 have requested ohos.permission.GET_NETWORK_INFO
 * @tc.desc      : Verify that calling application(different application in the same device) is requested
 *                 the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 */
async function ACTS_AppPermission_1300(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1300.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    featureAbility.startAbility(
        {
            want:
            {
                bundleName: "com.amsst.amsjsstsubpermission",
                abilityName: "com.amsst.amsjsstsubpermission.MainAbility"
            }
        }
    );
    return 0;
}

/*
 * @tc.number    : ACTS_AppPermission_1400
 * @tc.name      : Verify that calling application(different application in the same device)
 *                 have requested ohos.permission.GET_NETWORK_INFO
 * @tc.desc      : Verify that calling application(different application in the same device) is requested
 *                 the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 */
async function ACTS_AppPermission_1400(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1400.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    featureAbility.startAbility(
        {
            want:
            {
                bundleName: "com.amsst.amsjsstsubpermission",
                abilityName: "com.amsst.amsjsstsubpermission.MainAbility"
            }
        }
    )
    return 0;
}

/*
 * @tc.number    : ACTS_AppPermission_1500
 * @tc.name      : Verify that calling application(different application in the same device)
 *                 have not requested ohos.permission.CAMERA
 * @tc.desc      : Verify that calling application(different application in the same device)
 *                 is not requested the user_grant system`s permission(ohos.permission.CAMERA)
 */
async function ACTS_AppPermission_1500(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1500.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    featureAbility.startAbility(
        {
            want:
            {
                bundleName: "com.amsst.amsjsstsubpermission",
                abilityName: "com.amsst.amsjsstsubpermission.MainAbility"
            }
        }
    )
    return 0;
}

/*
 * @tc.number    : ACTS_AppPermission_1600
 * @tc.name      : Verify that calling application(different application in the same device)
 *                 have not requested ohos.permission.CAMERA
 * @tc.desc      : Verify that calling application(different application in the same device)
 *                 is not requested the user_grant system`s permission(ohos.permission.CAMERA)
 */
async function ACTS_AppPermission_1600(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1600.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    featureAbility.startAbility(
        {
            want:
            {
                bundleName: "com.amsst.amsjsstsubpermission",
                abilityName: "com.amsst.amsjsstsubpermission.MainAbility"
            }
        }
    );
    return 0;
}

/*
 * @tc.number    : ACTS_AppPermission_1700
 * @tc.name      : Verify that calling application(different application in the same device)
 *                 have requested com.amsst.permission.SYSPERMISSION
 * @tc.desc      : Verify that calling application(different application in the same device)
 *                 is requested the system_grant user`s permission(com.amsst.permission.SYSPERMISSION)
 */
async function ACTS_AppPermission_1700(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1700.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    await featureAbility.startAbility(
        {
            want:
            {
                bundleName: "com.amsst.amsjsstsubpermission",
                abilityName: "com.amsst.amsjsstsubpermission.MainAbility"
            }
        }
    );
    return 0;
}

/*
 * @tc.number    : ACTS_AppPermission_1800
 * @tc.name      : Verify that calling application(different application in the same device)
 *                 have requested com.amsst.permission.SYSPERMISSION
 * @tc.desc      : Verify that calling application(different application in the same device)
 *                 is requested the system_grant user`s permission(com.amsst.permission.SYSPERMISSION)
 */
async function ACTS_AppPermission_1800(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1800.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    await featureAbility.startAbility(
        {
            want:
            {
                bundleName: "com.amsst.amsjsstsubpermission",
                abilityName: "com.amsst.amsjsstsubpermission.MainAbility"
            }
        }
    )
    return 0;
}

/*
 * @tc.number    : ACTS_AppPermission_1900
 * @tc.name      : Verify that application without calling application(other device)
 *                 have requested ohos.permission.GET_NETWORK_INFO
 * @tc.desc      : Verify that application without calling application(other device)
 *                 is requested the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 */

async function ACTS_AppPermission_1900(thisobj) {
    var thisFunctionName = ACTS_AppPermission_1900.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    await context.verifyCallingOrSelfPermission("ohos.permission.GET_NETWORK_INFO",
        (err, data) => {
            console.debug("======verifyCallingOrSelfPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == 0) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_2000
 * @tc.name      : Verify that application without calling application(other device)
 *                 have requested ohos.permission.GET_NETWORK_INFO
 * @tc.desc      : Verify that application without calling application(other device)
 *                 is requested the system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 */
async function ACTS_AppPermission_2000(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2000.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    var result = await context.verifyCallingOrSelfPermission("ohos.permission.GET_NETWORK_INFO");
    console.debug("======verifyCallingOrSelfPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == 0) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_2100
 * @tc.name      : Verify that application without calling application(other device)
 *                 have not requested .GET_WIFI_INFO
 * @tc.desc      : Verify that application without calling application(other device)
 *                 is requested the system_grant system`s permission(ohos.permission..GET_WIFI_INFO)
 */
async function ACTS_AppPermission_2100(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2100.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    await context.verifyCallingOrSelfPermission("ohos.permission.GET_WIFI_INFO",
        (err, data) => {
            console.debug("======verifyCallingOrSelfPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == -1) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_2200
 * @tc.name      : Verify that application without calling application(other device) have not requested .GET_WIFI_INFO
 * @tc.desc      : Verify that application without calling application(other device)
 *                 is requested the system_grant system`s permission(ohos.permission..GET_WIFI_INFO)
 */
async function ACTS_AppPermission_2200(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2200.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var thisProcessInfo = await getThisProcessInfo();
    var context = await featureAbility.getContext();
    var result = await context.verifyCallingOrSelfPermission("ohos.permission.GET_WIFI_INFO")
    console.debug("======verifyCallingOrSelfPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == -1) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_2300
 * @tc.name      : Verify that ohos.permission.GET_NETWORK_INFO can not requested by user
 * @tc.desc      : Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 *                 can not requested during runtime.
 */
async function ACTS_AppPermission_2300(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2300.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    await context.canRequestPermission("ohos.permission.GET_NETWORK_INFO",
        (err, data) => {
            console.debug("======canRequestPermission:data======>:" + JSON.stringify(data));
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n"
            if (data == false) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_2400
 * @tc.name      : Verify that ohos.permission.GET_NETWORK_INFO can not requested by user
 * @tc.desc      : Verify that a system_grant system`s permission(ohos.permission.GET_NETWORK_INFO)
 *                 can not requested during runtime.
 */
async function ACTS_AppPermission_2400(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2400.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    var result = await context.canRequestPermission("ohos.permission.GET_NETWORK_INFO");
    console.debug("======canRequestPermission:result======>:" + JSON.stringify(result));
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n"
    if (result == false) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_2500
 * @tc.name      : Verify that ohos.permission.CAMERA can requested by user
 * @tc.desc      : Verify that a user_grant system`s permission(ohos.permission.CAMERA)
 *                 can requested during runtime.
 */
async function ACTS_AppPermission_2500(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2500.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    await context.canRequestPermission("ohos.permission.CAMERA",
        (err, data) => {
            console.debug("======canRequestPermission:data======>:" + JSON.stringify(data));;
            thisobj.logmessage += "result: " + JSON.stringify(data) + "\n";
            if (data == true) {
                thisobj.logmessage += "case " + thisFunctionName + " success\n";
                return 0;
            }
            else {
                thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                return -1;
            }
        })
}

/*
 * @tc.number    : ACTS_AppPermission_2600
 * @tc.name      : Verify that ohos.permission.CAMERA can requested by user
 * @tc.desc      : Verify that a user_grant system`s permission(ohos.permission.CAMERA)
 *                 can requested during runtime.
 */
async function ACTS_AppPermission_2600(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2600.name;
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    var result = await context.canRequestPermission("ohos.permission.CAMERA");
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n"
    if (result == true) {
        thisobj.logmessage += "case " + thisFunctionName + " success\n";
        return 0;
    }
    else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_2700
 * @tc.name      : Verify that ohos.permission.PERMISSIOND can requested by user
 * @tc.desc      : Verify that a user_grant system`s permission(ohos.permission.PERMISSIOND)
 *                 can requested during runtime.
 */
async function ACTS_AppPermission_2700(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2700.name
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext()
    var result = await context.canRequestPermission("ohos.permission.PERMISSIOND")
    thisobj.logmessage += "result: " + JSON.stringify(result) + "\n";
    if (result == true) {
        await context.requestPermissionsFromUser(["ohos.permission.PERMISSIOND"],
            MY_PERMISSIONS_REQUEST_PERMISSION,
            (err, data) => {
                thisobj.logmessage += "data = " + JSON.stringify(data) + "\n";
                thisobj.logmessage += "err = " + JSON.stringify(err) + "\n";
                if (data.requestCode == MY_PERMISSIONS_REQUEST_PERMISSION
                    && data.authResults.length > 0
                    && data.permissions.length > 0
                    && data.permissions[0] == "ohos.permission.PERMISSIOND"
                    && data.authResults[0] == 0) {
                    thisobj.logmessage += "case " + thisFunctionName + " success\n";
                } else {
                    thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                }
            });
        return 0;
    } else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}

/*
 * @tc.number    : ACTS_AppPermission_2800
 * @tc.name      : Verify that ohos.permission.PERMISSIONB, ohos.permission.PERMISSIONC, can requested by user
 * @tc.desc      : Verify that a user_grant system`s permission
 *                 (ohos.permission.PERMISSIONB, ohos.permission.PERMISSIONC) can requested during runtime.
 */
async function ACTS_AppPermission_2800(thisobj) {
    var thisFunctionName = ACTS_AppPermission_2800.name
    thisobj.logmessage = "";
    thisobj.logmessage += thisFunctionName + "\n";
    thisobj.logmessage += getCaseInfo(thisFunctionName) + "\n";

    var context = await featureAbility.getContext();
    var result1 = await context.canRequestPermission("ohos.permission.PERMISSIONB");
    var result2 = await context.canRequestPermission("ohos.permission.PERMISSIONC");
    thisobj.logmessage += JSON.stringify(result1) + "\n";
    thisobj.logmessage += JSON.stringify(result2) + "\n";
    if (result1 && result2) {
        await context.requestPermissionsFromUser(["ohos.permission.PERMISSIONB", "ohos.permission.PERMISSIONC"],
            MY_PERMISSIONS_REQUEST_PERMISSION,
            (err, data) => {
                thisobj.logmessage += "data = " + JSON.stringify(data) + "\n";
                thisobj.logmessage += "err = " + JSON.stringify(err) + "\n";
                if (data.requestCode == MY_PERMISSIONS_REQUEST_PERMISSION
                    && data.authResults.length == 2
                    && data.permissions.length == 2
                    && data.permissions[0] == "ohos.permission.PERMISSIONB"
                    && data.authResults[0] == 0
                    && data.permissions[1] == "ohos.permission.PERMISSIONC"
                    && data.authResults[1] == 0) {
                        thisobj.logmessage += "case " + thisFunctionName + " success\n";
                } else {
                    thisobj.logmessage += "case " + thisFunctionName + " failure\n";
                }
            });
        return 0;
    } else {
        thisobj.logmessage += "case " + thisFunctionName + " failure\n";
        return -1;
    }
}