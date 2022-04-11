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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import demo from '@ohos.bundle'

const PATH = "/data/test/resource/bms/install_bundle/";
const FIRST_RIGHT = "first_right.hap";
const SECOND_RIGHT = "second_right.hap";
const THIRD_RIGHT = "third_right.hap";
const FOURTH_RIGHT = "fourth_right.hap";
const EIGHTH_RIGHT = "eighth_right.hap";
const NINTH_RIGHT = "ninth_right.hap";
const TENTH_RIGHT = "tenth_right.hap";
const ELEVEBTH_RIGHT = "eleventh_right.hap";
const FIFTH_RIGHT = "fifth_right.hap";
const SECOND_BACKUP_RIGHT = "second_backup_right.hap";
const TWELFTH_RIGHT = "twelfth_right.hap";
const SIXTH_RIGHT = "sixth_right.hap";
const THIRTEENTH_RIGHT = "thirteenth_right.hap";
const FOURTEENTH_RIGHT = "fourteenth_right.hap";
const SIXTEENTH_RIGHT = "sixteenth_right.hap";
const NAME = "com.example.l3jsdemo";
const ERR_CODE = -1;
const installParam1 = {
    userId: 100,
    installFlag: 0,
    isKeepData: false
};
const installParam2 = {
    userId: 100,
    installFlag: 1,
    isKeepData: false
};

describe('ActsBundleMgrMultipleInstallTest', function () {

    /**
     * @tc.number BMS_Multiple_Hap_Install_0200
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces path err.
     */
    it('BMS_Multiple_Hap_Install_0200', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT,""], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INVALID,
                "STATUS_INSTALL_FAILURE_INVALID");
            await queryInfo(NAME, 1);
            done();
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_0400
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces two different hap.
     */
    it('BMS_Multiple_Hap_Install_0400', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT, PATH + THIRD_RIGHT], installParam1,
            async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT,
                    "STATUS_INSTALL_FAILURE_CONFLICT");
                await queryInfo(NAME, 1);
                done();
            });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_0500
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces version code different.
     */
    it('BMS_Multiple_Hap_Install_0500', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + FOURTH_RIGHT], installParam1,
            async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT,
                    "STATUS_INSTALL_FAILURE_CONFLICT");
                await queryInfo(NAME, 1);
                done();
            });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_0600
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces version name different.
     */
    it('BMS_Multiple_Hap_Install_0600', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + EIGHTH_RIGHT], installParam1,
            async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT,
                    "STATUS_INSTALL_FAILURE_CONFLICT");
                await queryInfo(NAME, 1);
                done();
            });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_0700
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces target different.
     */
    it('BMS_Multiple_Hap_Install_0700', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + NINTH_RIGHT], installParam1,
            async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT,
                    "STATUS_INSTALL_FAILURE_CONFLICT");
                await queryInfo(NAME, 1);
                done();
            });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_0800
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces compatible different.
     */
    it('BMS_Multiple_Hap_Install_0800', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + TENTH_RIGHT], installParam1,
            async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT,
                "STATUS_INSTALL_FAILURE_CONFLICT");
            await queryInfo(NAME, 1);
            done();
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_0900
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces vendor different.
     */
    it('BMS_Multiple_Hap_Install_0900', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + ELEVEBTH_RIGHT], installParam1,
            async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT,
                "STATUS_INSTALL_FAILURE_CONFLICT");
            await queryInfo(NAME, 1);
            done();
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_1000
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces two entry.
     */
    it('BMS_Multiple_Hap_Install_1000', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + FIFTH_RIGHT], installParam1,
            async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INVALID,
                "STATUS_INSTALL_FAILURE_INVALID");
            await queryInfo(NAME, 1);
            done();
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_1100
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces same feature.
     */
    it('BMS_Multiple_Hap_Install_1100', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT, PATH + SECOND_BACKUP_RIGHT], installParam1,
            async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await queryInfo(NAME, 0);
                installData.uninstall(NAME, installParam1, async (err, data1) => {
                    checkResult(err, data1, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_1200
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces entry and feature.
     */
    it('BMS_Multiple_Hap_Install_1200', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + SECOND_RIGHT], installParam1,
            async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                console.info("getBundleInfo result" + JSON.stringify(datainfo))
                expect(datainfo.hapModuleInfos.length).assertEqual(2);
                expect(datainfo.hapModuleInfos[0].moduleName).assertEqual("l2jsdemo");
                expect(datainfo.hapModuleInfos[1].moduleName).assertEqual("entry");
            }).catch(err => {
                console.info("getBundleInfo err" + JSON.stringify(err));
                expect(err).assertFail();
            });
            installData.uninstall(NAME, installParam1, async (err, data1) => {
                checkResult(err, data1, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await queryInfo(NAME, 1);
                done();
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_1300
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces two feature.
     */
    it('BMS_Multiple_Hap_Install_1300', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT, PATH + TWELFTH_RIGHT], installParam1,
            async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                console.info("getBundleInfo result" + JSON.stringify(datainfo))
                expect(datainfo.hapModuleInfos.length).assertEqual(2);
                expect(datainfo.hapModuleInfos[0].moduleName).assertEqual("l1jsdemo");
                expect(datainfo.hapModuleInfos[1].moduleName).assertEqual("l2jsdemo");
            }).catch(err => {
                console.info("getBundleInfo err" + JSON.stringify(err));
                expect(err).assertFail();
            });
            installData.uninstall(NAME, installParam1, async (err, data1) => {
                checkResult(err, data1, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await queryInfo(NAME, 1);
                done();
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Install_1400
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces path err.
     */
    it('BMS_Multiple_Hap_Install_1400', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + "test_right.hap"], installParam1,
        async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INVALID,
                "STATUS_INSTALL_FAILURE_INVALID");
            await queryInfo(NAME, 1);
            done();
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0100
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces entry and feature.
     */
    it('BMS_Multiple_Hap_Update_0100', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                    console.info("getBundleInfo result" + JSON.stringify(datainfo));
                    expect(datainfo.hapModuleInfos.length).assertEqual(2);
                    expect(datainfo.hapModuleInfos[0].moduleName).assertEqual("l2jsdemo");
                    expect(datainfo.hapModuleInfos[1].moduleName).assertEqual("entry");
                }).catch(err => {
                    console.info("getBundleInfo err" + JSON.stringify(err));
                    expect(err).assertFail();
                });
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0200
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces high version feature.
     */
    it('BMS_Multiple_Hap_Update_0200', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + SIXTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT, "STATUS_INSTALL_FAILURE_CONFLICT");
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0300
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces low version feature.
     */
    it('BMS_Multiple_Hap_Update_0300', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + THIRTEENTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INCOMPATIBLE, "STATUS_INSTALL_FAILURE_INCOMPATIBLE");
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0400
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces same entry.
     */
    it('BMS_Multiple_Hap_Update_0400', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + FIRST_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await queryInfo(NAME, 0);
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0500
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces entry upgrade.
     */
    it('BMS_Multiple_Hap_Update_0500', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + FOURTEENTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                    console.info("getBundleInfo result" + JSON.stringify(datainfo));
                    expect(datainfo.versionName).assertEqual("3.0.0");
                }).catch(err => {
                    console.info("getBundleInfo err" + JSON.stringify(err));
                    expect(err).assertFail();
                });
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0600
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces entry of the same version.
     */
    it('BMS_Multiple_Hap_Update_0600', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + FIRST_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                    console.info("getBundleInfo result" + JSON.stringify(datainfo));
                    expect(datainfo.hapModuleInfos.length).assertEqual(2);
                    expect(datainfo.hapModuleInfos[0].moduleName).assertEqual("l2jsdemo");
                    expect(datainfo.hapModuleInfos[1].moduleName).assertEqual("entry");
                }).catch(err => {
                    console.info("getBundleInfo err" + JSON.stringify(err));
                    expect(err).assertFail();
                });
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0700
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces entry of the high version.
     */
    it('BMS_Multiple_Hap_Update_0700', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + FOURTEENTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                    console.info("getBundleInfo result" + JSON.stringify(datainfo));
                    expect(datainfo.versionName).assertEqual("3.0.0");
                    expect(datainfo.hapModuleInfos[0].moduleName).assertEqual("entry");
                }).catch(err => {
                    console.info("getBundleInfo err" + JSON.stringify(err));
                    expect(err).assertFail();
                });
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0800
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces same feature.
     */
    it('BMS_Multiple_Hap_Update_0800', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_0900
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces feature of the high version.
     */
    it('BMS_Multiple_Hap_Update_0900', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + SIXTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                    console.info("getBundleInfo result" + JSON.stringify(datainfo));
                    expect(datainfo.versionName).assertEqual("3.0.0");
                }).catch(err => {
                    console.info("getBundleInfo err" + JSON.stringify(err));
                    expect(err).assertFail();
                });
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_1000
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces feature of the lower version.
     */
    it('BMS_Multiple_Hap_Update_1000', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + THIRTEENTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INCOMPATIBLE, "STATUS_INSTALL_FAILURE_INCOMPATIBLE");
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_1100
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces install other feature.
     */
    it('BMS_Multiple_Hap_Update_1100', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + TWELFTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                    console.info("getBundleInfo result" + JSON.stringify(datainfo));
                    expect(datainfo.hapModuleInfos.length).assertEqual(2);
                    expect(datainfo.hapModuleInfos[0].moduleName).assertEqual("l1jsdemo");
                    expect(datainfo.hapModuleInfos[1].moduleName).assertEqual("l2jsdemo");
                }).catch(err => {
                    console.info("getBundleInfo err" + JSON.stringify(err));
                    expect(err).assertFail();
                });
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_1200
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces install other high version feature.
     */
    it('BMS_Multiple_Hap_Update_1200', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + SIXTEENTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await demo.getBundleInfo(NAME, demo.BundleFlag.GET_BUNDLE_DEFAULT).then(datainfo => {
                    console.info("getBundleInfo result" + JSON.stringify(datainfo));
                    expect(datainfo.versionName).assertEqual("3.0.0");
                    expect(datainfo.hapModuleInfos[0].moduleName).assertEqual("l1jsdemo");
                }).catch(err => {
                    console.info("getBundleInfo err" + JSON.stringify(err));
                    expect(err).assertFail();
                });
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_1300
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces install other low version feature.
     */
    it('BMS_Multiple_Hap_Update_1300', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + THIRTEENTH_RIGHT], installParam1, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INCOMPATIBLE, "STATUS_INSTALL_FAILURE_INCOMPATIBLE");
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number BMS_Multiple_Hap_Update_1500
     * @tc.name BUNDLE::install
     * @tc.desc Test install interfaces.
     */
    it('BMS_Multiple_Hap_Update_1500', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + FIRST_RIGHT, PATH + SECOND_RIGHT], installParam1, async (err, data) => {
            checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
            await queryInfo(NAME, 0);
            installData.install([PATH + FIRST_RIGHT, PATH + SECOND_RIGHT],installParam2, async (err, data) => {
                checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                await queryInfo(NAME, 0);
                installData.uninstall(NAME, installParam1, async (err, data) => {
                    checkResult(err, data, demo.InstallErrorCode.SUCCESS, "SUCCESS");
                    await queryInfo(NAME, 1);
                    done();
                });
            });
        });
    });

    function checkResult(error, data, status, statusMessage) {
        if(!status) {
            expect(error.code).assertEqual(status);
            expect(data.status).assertEqual(status);
            expect(data.statusMessage).assertEqual(statusMessage);
            console.info('===install uninstall result===' + JSON.stringify(data.statusMessage));
        } else {
            expect(error.code).assertEqual(ERR_CODE);
            expect(data.status).assertEqual(status);
            expect(data.statusMessage).assertEqual(statusMessage);
            console.info('===install uninstall result===' + JSON.stringify(data.statusMessage));
        };
    }

    async function queryInfo(bundleName, assertFlag){
        if (!assertFlag) {
            await demo.getBundleInfo(bundleName, demo.BundleFlag.GET_BUNDLE_DEFAULT
                ).then(datainfo => {
                console.info("getBundleInfo result0" + JSON.stringify(datainfo));
                expect(datainfo.name).assertEqual(bundleName);
            }).catch(err => {
                console.info("getBundleInfo result0" + JSON.stringify(datainfo));
                expect(err).assertFail();
            });
        } else {
            await demo.getBundleInfo(bundleName, demo.BundleFlag.GET_BUNDLE_DEFAULT)
            .then(datainfo => {
                console.info("getBundleInfo result1" + JSON.stringify(datainfo));
                expect(datainfo).assertFail();
            }).catch(err => {
                console.info("getBundleInfo result1" + JSON.stringify(err));
                expect(err).assertEqual(1);
            });
        };
    }
})
