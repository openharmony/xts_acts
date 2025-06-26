/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.bluetooth.connection';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtConnectionTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let g_context: common.UIAbilityContext;

export default function bluetoothConnectionTest() {

    describe("bluetoothConnectionTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            try {
                await Utils.loadAndSetupUiTest();
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                g_context = Hypium.get('Context') as common.UIAbilityContext;
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.ACCESS_BLUETOOTH')
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                        hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                        hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                        hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
                    });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /*
         * @tc.number: getRemoteDeviceNameTest
         * @tc.name: getRemoteDeviceNameTest
         * @tc.desc: Test getRemoteDeviceNameTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getRemoteDeviceNameTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let name: string = connection.getRemoteDeviceName("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceName:" + name);
                expect(true).assertEqual(name == "");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getRemoteDeviceNameAliasTest
         * @tc.name: getRemoteDeviceNameAliasTest
         * @tc.desc: Test getRemoteDeviceNameAliasTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getRemoteDeviceNameAliasTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let aliasName: string = connection.getRemoteDeviceName("00:11:22:33:44:55", true);
                hilog.info(domain, tag, "getRemoteDeviceName alias is true:" + aliasName);
                expect(true).assertEqual(aliasName == "");
                let aliasNames: string = connection.getRemoteDeviceName("00:11:22:33:44:55", false);
                hilog.info(domain, tag, "getRemoteDeviceName alias is false:" + aliasNames);
                expect(true).assertEqual(aliasNames == "");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName alias get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getRemoteDeviceClassTest
         * @tc.name: getRemoteDeviceClassTest
         * @tc.desc: Test getRemoteDeviceClassTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getRemoteDeviceClassTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let deviceClass: connection.DeviceClass = connection.getRemoteDeviceClass("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceClass result:" + JSON.stringify(deviceClass));
                hilog.info(domain, tag, "getRemoteDeviceClass result majorClass:" + JSON.stringify(deviceClass.majorClass));
                hilog.info(domain, tag, "getRemoteDeviceClass result majorMinorClass:" + JSON.stringify(deviceClass.majorMinorClass));
                expect(true).assertEqual(deviceClass != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceClass get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: setBluetoothScanModeTest
         * @tc.name: setBluetoothScanModeTest
         * @tc.desc: Test setBluetoothScanModeTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("setBluetoothScanModeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getPairedDevicesTest
         * @tc.name: getPairedDevicesTest
         * @tc.desc: Test getPairedDevicesTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getPairedDevicesTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let devices: Array<string> = connection.getPairedDevices();
                hilog.info(domain, tag, "getPairedDevices result:" + JSON.stringify(devices));
                expect(true).assertEqual(devices != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: connectionConstantTest
         * @tc.name: connectionConstantTest
         * @tc.desc: Test connectionConstantTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("connectionConstantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let BOND_STATE_BONDED: connection.BondState = connection.BondState.BOND_STATE_BONDED;
                hilog.info(domain, tag, "BOND_STATE_BONDED:" + BOND_STATE_BONDED);
                expect(true).assertEqual(BOND_STATE_BONDED == 2);
                let SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE: connection.ScanMode = connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE;
                hilog.info(domain, tag, "SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE:" + SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
                expect(true).assertEqual(SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE == 4);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "ConnectionConstant get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })
    })
}