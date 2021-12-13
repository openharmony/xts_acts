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
import featureAbility from '@ohos.ability.featureAbility'
var receive;
var uid;
const PERMISSIONCHANGE = 'permissionChange';
const ANYPERMISSIONCHANGE = 'anyPermissionChange';
export async function runFunc(caseName, obj) {
    console.debug("======Func name is ======:" + JSON.stringify(caseName))
    var dataInfo = await bundle.getBundleInfo('com.example.permissionchange', 1);
    uid = dataInfo.uid;
    receive = obj;
    allFunc[caseName].func();
    return getFuncInfo(caseName);
}

export function getFuncInfo(caseName) {
    console.debug("======GetCaseInfo======:" + JSON.stringify(caseName))
    return allFunc[caseName].info;
}

var allFunc = {
    registerPermissionChange: {
        func: () => { bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission) },
        info: "register permissionChange event."
    },
    registerAnyPermissionChange: {
        func: () => { bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission); },
        info: "register anypermissionChange event."
    },
    registerThreeAnyPermissionChange: {
        func: () => { bundle.on(ANYPERMISSIONCHANGE, onReciveThreeAnyPermission); },
        info: "register anypermissionChange event."
    },
    requestPermissions: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_A"]) },
        info: "request permissions."
    },
    requestPermissionsFirst: {
        func: () => {
            requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_B", "com.permission.BMS_PERMISSIONCHANGE_C",
                "com.permission.BMS_PERMISSIONCHANGE_D"])
        },
        info: "request permissions First."
    },
    requestPermissionsSecond: {
        func: () => {
            requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_E"])
        },
        info: "request permissions Second."
    },
    requestPermissionsThird: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_F"]) },
        info: "request permissions Third."
    },
    requestPermissionsFourth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_G"]) },
        info: "request permissions Fourth."
    },
    requestPermissionsFifth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_H"]) },
        info: "request permissions Fifth."
    },
    requestPermissionsSixth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_I"]) },
        info: "request permissions Sixth."
    },
    requestPermissionsSeventh: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_J"]) },
        info: "request permissions Seventh."
    },
    requestPermissionsEighth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_K"]) },
        info: "request permissions Eighth."
    },
    requestPermissionsNinth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_L"]) },
        info: "request permissions Ninth."
    },
    requestPermissionsTenth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_N"]) },
        info: "request permissions Tenth."
    },
    requestPermissionsEleventh: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_O"]) },
        info: "request permissions Eleventh."
    },
    requestPermissionsTwelfth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_P"]) },
        info: "request permissions Twelfth."
    },
    requestPermissionsThirteenth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_Q"]) },
        info: "request permissions Thirteenth."
    },
    requestPermissionsFourteenth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_R"]) },
        info: "request permissions Fourteenth."
    },
    requestPermissionsFifteenth: {
        func: () => { requestPermissions(["com.permission.BMS_PERMISSIONCHANGE_S"]) },
        info: "request permissions Fifteenth."
    },
    startFirstRequestPermissions: {
        func: () => {
            startAbilityToRequestPermissions("com.example.firstrequestpermissions",
                "com.example.firstrequestpermissions.MainAbility")
        },
        info: "start first app to request permissions."
    },
    startSecondRequestPermissions: {
        func: () => {
            startAbilityToRequestPermissions("com.example.secondrequestpermissions",
                "com.example.secondrequestpermissions.MainAbility")
        },
        info: "start second app to request permissions."
    },
    unregisterPermissionChange: {
        func: () => { bundle.off(PERMISSIONCHANGE, [uid], onRecivePermission) },
        info: "unregister permissionChange event."
    },
    unregisterAnyPermissionChange: {
        func: () => { bundle.off(ANYPERMISSIONCHANGE, onReciveAnyPermission); },
        info: "unregister anypermissionChange event."
    },
    unregisterThreeAnyPermissionChange: {
        func: () => { bundle.off(ANYPERMISSIONCHANGE, onReciveThreeAnyPermission); },
        info: "unregister anypermissionChange event."
    },
    unregisterErrPermissionChange: {
        func: () => { bundle.off('error', [uid], onRecivePermission) },
        info: "unregister permissionChange event."
    },
    unregisterErrAnyPermissionChange: {
        func: () => { bundle.off('error', onReciveAnyPermission); },
        info: "unregister anypermissionChange event."
    },
    registerErrPermissionChange: {
        func: () => { bundle.on('error', [uid], onRecivePermission) },
        info: "register error permissionChange."
    },
    registerErrAnyPermissionChange: {
        func: () => { bundle.on('error', onReciveAnyPermission) },
        info: "register error anyPermissionChange."
    },
    unregisterErrPermissionChange: {
        func: () => { bundle.off('eror', [uid], onRecivePermission) },
        info: "unregister error permissionChange."
    },
    unregisterErrAnyPermissionChange: {
        func: () => { bundle.off('eror', onReciveAnyPermission) },
        info: "unregister error anyPermissionChange."
    },
    unregisterPermissionChangeNotAll: {
        func: unregisterPermissionChangeNotAll,
        info: "unregister permission change does not include all uids."
    },
    requestNotExistPermissions: {
        func: () => { requestPermissions(["noPermission"]) },
        info: "request a permission that does not exist "
    },
    registerPermissionChangeRepeat: {
        func: registerPermissionChangeRepeat,
        info: "repeatedly register permissionChange event."
    },
    registerAnyPermissionChangeRepeat: {
        func: registerAnyPermissionChangeRepeat,
        info: "repeatedly register anyPermissionChange event."
    },
    unregisterThreePermissionChangeCallback: {
        func: () => {
            bundle.off(PERMISSIONCHANGE, [uid], onRecivePermission);
            bundle.off(PERMISSIONCHANGE, [uid], onRecivePermission2);
            bundle.off(PERMISSIONCHANGE, [uid], onRecivePermission3);
        },
        info: "unregister three different PermissionChange callback"
    },
    unregisterThreeAnyPermissionChangeCallback: {
        func: () => {
            bundle.off(ANYPERMISSIONCHANGE, onReciveAnyPermission);
            bundle.off(ANYPERMISSIONCHANGE, onReciveAnyPermission2);
            bundle.off(ANYPERMISSIONCHANGE, onReciveAnyPermission3);
        },
        info: "unregister three different anyPermissionChange callback"
    },
    registerThreeAppsPermissionChange: {
        func: registerThreeApp,
        info: "register three applications permissionChange event."
    },
    unregisterThreeAppsPermissionChange: {
        func: unregisterThreeApp,
        info: "unregister three applications permissionChange event."
    },
    unregisterPermissionChangeNoCallback: {
        func: () => { bundle.off(PERMISSIONCHANGE, [uid]); },
        info: "unregister permissionChange without callback."
    },
    unregisterAnyPermissionChangeNoCallback: {
        func: () => { bundle.off(ANYPERMISSIONCHANGE); },
        info: "unregister anyPermissionChange event without callback."
    },
    registerThreePermissionChangeCallback: {
        func: () => {
            bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission);
            bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission2);
            bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission3);
        },
        info: "register three different PermissionChange callback"
    },
    registerThreeAnyPermissionChangeCallback: {
        func: () => {
            bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission)
            bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission2);
            bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission3);
        },
        info: "register three different AnyPermissionChange callback"
    },
}

async function onRecivePermission(err, data) {
    console.info('======permission changed=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "unregister permission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "unregister permission FAIL!\n"
    } else if (data == uid) {
        receive.logmessage += "permission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "permission change FAILED, change uid is " + data + '\n'
    }
}

async function onRecivePermission2(err, data) {
    console.info('======permission changed second=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "callback2 unregister permission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "callback2 unregister permission FAIL!\n"
    } else if (data == uid) {
        receive.logmessage += "callback2 permission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "callback2 permission change FAILED, change uid is " + data + '\n'
    }
}

async function onRecivePermission3(err, data) {
    console.info('======permission changed third=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "callback3 unregister permission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "callback3 unregister permission FAIL!\n"
    } else if (data == uid) {
        receive.logmessage += "callback3 permission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "callback3 permission change FAILED, change uid is " + data + '\n'
    }
}

async function onReciveAnyPermission(err, data) {
    console.info('======any permission changed=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "unregister anyPermission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "unregister anyPermission FAIL!\n"
    } else if (data == uid) {
        receive.logmessage += "anyPermission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "anyPermission change FAILED, change uid is " + data + '\n'
    }
}

async function onReciveAnyPermission2(err, data) {
    console.info('======any permission changed=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "callback2 unregister anyPermission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "callback2 unregister anyPermission FAIL!\n"
    } else if (data == uid) {
        receive.logmessage += "callback2 anyPermission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "callback2 anyPermission change FAILED, change uid is " + data + '\n'
    }
}

async function onReciveAnyPermission3(err, data) {
    console.info('======any permission changed=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "callback3 unregister anyPermission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "callback3 unregister anyPermission FAIL!\n"
    } else if (data == uid) {
        receive.logmessage += "callback3 anyPermission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "callback3 anyPermission change FAILED, change uid is " + data + '\n'
    }
}

async function requestPermissions(permissions) {
    console.debug("==========begin request permissions==========")
    var context = await featureAbility.getContext();
    await context.requestPermissionsFromUser(permissions, 1,
        (err, data) => {
            console.log("RequestPermissionForUser：requestCode=" + data.requestCode);
            for (var j = 0; j < data.permissions.length; j++) {
                console.log("RequestPermissionForUser permissions : " + data.permissions[j]);
            }

            for (var j = 0; j < data.grantResults.length; j++) {
                console.log("RequestPermissionForUser grantResults : " + data.grantResults[j]);
            }
        });
}

async function startAbilityToRequestPermissions(newBundleName, newAbilityName) {
    console.info('=======start Ability========');
    await featureAbility.startAbility(
        {
            want:
            {
                bundleName: newBundleName,
                abilityName: newAbilityName
            }
        }
    );
}

async function unregisterPermissionChangeNotAll() {
    console.debug("==========begin unregister permissionChange without all uids==========");
    var dataInfo1 = await bundle.getBundleInfo('com.example.permissionchange', 1);
    var dataInfo2 = await bundle.getBundleInfo('com.example.firstrequestpermissions', 1);
    await bundle.off(PERMISSIONCHANGE, [dataInfo1.uid, dataInfo2.uid], onRecivePermission);
}

async function onReciveThreePermission(err, data) {
    var dataInfo1 = await bundle.getBundleInfo('com.example.firstrequestpermissions', 1);
    var dataInfo2 = await bundle.getBundleInfo('com.example.secondrequestpermissions', 1);
    console.info('======permission changed=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "unregister permission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "unregister permission FAIL!\n"
    } else if (data == uid || data == dataInfo1.uid || data == dataInfo2.uid) {
        receive.logmessage += "permission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "permission change FAILED, change uid is " + data + '\n'
    }
}

async function registerThreeApp() {
    var dataInfo1 = await bundle.getBundleInfo('com.example.firstrequestpermissions', 1);
    var dataInfo2 = await bundle.getBundleInfo('com.example.secondrequestpermissions', 1);
    await bundle.on(PERMISSIONCHANGE, [uid, dataInfo1.uid, dataInfo2.uid], onReciveThreePermission);
}

async function unregisterThreeApp() {
    var dataInfo1 = await bundle.getBundleInfo('com.example.firstrequestpermissions', 1);
    var dataInfo2 = await bundle.getBundleInfo('com.example.secondrequestpermissions', 1);
    await bundle.off(PERMISSIONCHANGE, [uid, dataInfo1.uid, dataInfo2.uid], onReciveThreePermission);
}

async function registerPermissionChangeRepeat() {
    console.debug("==========begin repeat register permissionChange==========")
    await bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission);
    await bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission);
    await bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission);
    await bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission);
    await bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission);
    await bundle.on(PERMISSIONCHANGE, [uid], onRecivePermission);
}
async function registerAnyPermissionChangeRepeat() {
    console.debug("==========begin repeat register anyPermissionChange==========")
    await bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission);
    await bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission);
    await bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission);
    await bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission);
    await bundle.on(ANYPERMISSIONCHANGE, onReciveAnyPermission);
}

async function onReciveThreeAnyPermission(err, data) {
    console.info('======any permission changed=======');
    console.info("permission changed err code" + err.code);
    console.info("permission changed uid" + data);
    var dataInfo1 = await bundle.getBundleInfo('com.example.firstrequestpermissions', 1);
    var dataInfo2 = await bundle.getBundleInfo('com.example.secondrequestpermissions', 1);
    if (data == undefined && err.code == 0) {
        receive.logmessage += "unregister anyPermission SUCCESS!\n"
    } else if (err.code != 0) {
        receive.logmessage += "unregister anyPermission FAIL!\n"
    } else if (data == uid || data == dataInfo1.uid || data == dataInfo2.uid) {
        receive.logmessage += "anyPermission change SUCCESS, change uid is " + data + '\n'
    } else {
        receive.logmessage += "anyPermission change FAILED, change uid is " + data + '\n'
    }
}