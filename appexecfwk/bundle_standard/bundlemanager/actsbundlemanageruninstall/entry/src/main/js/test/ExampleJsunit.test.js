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

const PATH = "/data/"
const ERROR = "error.hap"
const BMSJSTEST1 = "bmsJstest1.hap"
const BMSJSTEST3 = "bmsJstest3.hap"
const BMSJSTEST4 = "bmsJstest4.hap"
const BMSJSTEST5 = "bmsJstest5.hap"
const BMSJSTEST6 = "bmsJstest6.hap"
const BMSJSTEST8 = "bmsJstest8.hap"
const NAME1 = "com.example.myapplication1"
const NAME2 = "com.example.myapplication2"
const NAME3 = "com.example.myapplication4"
const NAME4 = "com.example.myapplication5"
const NAME5 = "com.example.myapplication6"
const THIRD1 = "com.example.third1"
const LAUNCHER = "com.ohos.launcher"
const OBJECT = "object"
const SUCCESS = "SUCCESS"
const START_ABILITY_TIMEOUT = 3000;
const ERR_CODE = -1;
const STATUS_INSTALL_FAILURE_INVALID = 3;
const STATUS_INSTALL_FAILURE_CONFLICT = 4;

describe('ActsBundleManagerUninstall', function () {

    /**
     * @tc.number uninstall_0100
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0100', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + BMSJSTEST1], {
            userId: 100,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            var datainfo1 = await demo.getBundleInfo(NAME1, 1);
            expect(datainfo1.name).assertEqual(NAME1);
            installData.uninstall(NAME1, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, async (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.statusMessage).assertEqual('SUCCESS');
                await demo.getBundleInfo(NAME1, 1).then(datainfo => {
                    expect(datainfo).assertFail()
                    done();
                }).catch(err => {
                    expect(err).assertEqual(1)
                    done()
                });

            })
        });
    })

    /**
     * @tc.number uninstall_0200
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0200', 0, async function (done) {
        let installData = await demo.getBundleInstaller()
        installData.install([PATH + BMSJSTEST1, PATH + BMSJSTEST3], {
            userId: 100,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(ERR_CODE);
            expect(data.status).assertEqual(STATUS_INSTALL_FAILURE_CONFLICT);
            expect(data.statusMessage).assertEqual('STATUS_INSTALL_FAILURE_CONFLICT');
            var datainfo1 = demo.getBundleInfo(NAME1, 1);
            datainfo1.then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
            var datainfo2 = demo.getBundleInfo(NAME2, 1);
            datainfo2.then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
            installData.uninstall(NAME1, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, async(err, data) => {
                var datainfo3 = demo.getBundleInfo(NAME1, 1);
                datainfo3.then(data => {
                    expect().assertFail();
                }).catch(err => {
                    expect(err).assertEqual(1);
                });
                installData.uninstall(NAME2, {
                    userId: 100,
                    installFlag: 1,
                    isKeepData: false
                }, async(err, data) => {
                    var datainfo4 = demo.getBundleInfo(NAME2, 1);
                    datainfo4.then(data => {
                        expect().assertFail();
                    }).catch(err => {
                        expect(err).assertEqual(1);
                    });
                    done();
                })
            })
        });
    })

    /**
     * @tc.number uninstall_0300
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0300', 0, async function (done) {
        let installData = await demo.getBundleInstaller()
        installData.install([PATH + BMSJSTEST4, PATH + BMSJSTEST5, PATH + BMSJSTEST6], {
            userId: 100,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(ERR_CODE);
            expect(data.status).assertEqual(STATUS_INSTALL_FAILURE_INVALID);
            expect(data.statusMessage).assertEqual('STATUS_INSTALL_FAILURE_INVALID');
            var datainfo1 = demo.getBundleInfo(NAME3, 1);
            datainfo1.then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
            var datainfo2 = demo.getBundleInfo(NAME4, 1);
            datainfo2.then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
            var datainfo3 = demo.getBundleInfo(NAME5, 1);
            datainfo3.then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
            installData.uninstall(NAME3, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, async(err, data) => {
                var datainfo4 = demo.getBundleInfo(NAME3, 1);
                datainfo4.then(data => {
                    expect().assertFail();
                }).catch(err => {
                    expect(err).assertEqual(1);
                });
                installData.uninstall(NAME4, {
                    userId: 100,
                    installFlag: 1,
                    isKeepData: false
                }, async(err, data) => {
                    var datainfo5 = demo.getBundleInfo(NAME4, 1);
                    datainfo5.then(data => {
                        expect().assertFail();
                    }).catch(err => {
                        expect(err).assertEqual(1);
                    });
                    installData.uninstall(NAME5, {
                        userId: 100,
                        installFlag: 1,
                        isKeepData: false
                    }, async(err, data) => {
                        var datainfo6 = demo.getBundleInfo(NAME5, 1);
                        datainfo6.then(data => {
                            expect().assertFail();
                        }).catch(err => {
                            expect(err).assertEqual(1);
                        });
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number uninstall_0400
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0400', 0, async function (done) {
        demo.getBundleInstaller().then((data) => {
            data.uninstall(ERROR, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual(OBJECT);
                expect(data.statusMessage).assertEqual("STATUS_UNINSTALL_FAILURE");
                done();
            }
        });
    })

    /**
     * @tc.number uninstall_0500
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0500', 0, async function (done) {
        demo.getBundleInstaller().then((data) => {
            data.uninstall('', {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual(OBJECT);
                console.info('======data.statusMessage=====' + JSON.stringify(data.statusMessage));
                expect(data.statusMessage).assertEqual("STATUS_UNINSTALL_FAILURE_ABORTED");
                done();
            }
        });
    })

    /**
     * @tc.number uninstall_0600
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0600', 0, async function (done) {
        demo.getBundleInstaller().then((data) => {
            data.uninstall(LAUNCHER, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual(OBJECT);
                console.info('======data.statusMessage=====' + JSON.stringify(data.statusMessage));
                expect(data.statusMessage).assertEqual("STATUS_UNINSTALL_FAILURE_CONFLICT");
                done();
            }
        });
    })

    /**
     * @tc.number uninstall_0700
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0700', 0, async function (done) {
        let result = await demo.getBundleInstaller();
        result.install([PATH + BMSJSTEST1], {
            userId: 100,
            installFlag: 1,
            isKeepData: true
        }, OnReceiveinstallEvent);
        async function OnReceiveinstallEvent(err, data) {
            expect(typeof data).assertEqual(OBJECT);
            expect(data.statusMessage).assertEqual(SUCCESS);
            await demo.getBundleInfo(NAME1, 1).then(datainfo1 => {
                expect(datainfo1.name).assertEqual(NAME1);
            }).catch(err => {
                expect(err).assertFail();
            });
            result.uninstall(NAME1, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, async(err, data) => {
                expect(data.statusMessage).assertEqual(SUCCESS);
                await demo.getBundleInfo(NAME1, 1).then(datainfo2 => {
                    expect(datainfo2).assertFail();
                    done();
                }).catch(err => {
                    expect(err).assertEqual(1);
                    done();
                });
            });
        }
    })

    /**
     * @tc.number uninstall_0800
     * @tc.name BUNDLE::uninstall
     * @tc.desc Test uninstall interfaces.
     */
    it('uninstall_0800', 0, async function (done) {
        let installData = await demo.getBundleInstaller();
        installData.install([PATH + BMSJSTEST8], {
            userId: 100,
            installFlag: 1,
            isKeepData: false
        }, async (err, data) => {
            expect(err.code).assertEqual(0);
            expect(data.status).assertEqual(0);
            expect(data.statusMessage).assertEqual('SUCCESS');
            let bundleInfo = await demo.getBundleInfo('com.example.third1', 1);
            expect(bundleInfo.uid).assertLarger(10000);
            installData.uninstall(THIRD1, {
                userId: 100,
                installFlag: 1,
                isKeepData: false
            }, async(err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.statusMessage == "SUCCESS").assertTrue();
                done();
            });
        });
    })
})


