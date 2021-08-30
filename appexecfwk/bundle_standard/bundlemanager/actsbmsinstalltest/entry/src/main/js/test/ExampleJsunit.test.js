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
import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import demo from '@ohos.bundle'

describe('ActsBmsInstallTest', function () {
    
    it('getPermissionDef_0500', 0, async function(done){

        await demo.getPermissionDef('error').then((infos) => {

            expect(typeof infos).assertEqual("object");
            expect(infos.name).assertEqual("");
            expect(infos.grantMode).assertEqual("");
            expect(infos.availableScope).assertEqual(0);
            expect(infos.label).assertEqual("");
            expect(infos.description).assertEqual("");
        });

        done();
    })

  
    it('getPermissionDef_1000', 0, async function(done){
        await demo.getPermissionDef('error', OnReceiveEvent);

        function OnReceiveEvent(err, data) {
            expect(typeof data).assertEqual("object");
            expect(data.name).assertEqual("");
            expect(data.availableScope).assertEqual(0);
            expect(data.grantMode).assertEqual("");
            expect(data.label).assertEqual("");
            3.
            expect(data.description).assertEqual("");
        }

        done();
    })
    it('install_0100', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.uninstall('com.example.myapplication1', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication2', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication4', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication5', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication6', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.install(['/data/bmsJstest1.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.uninstall('com.example.myapplication1', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("SUCCESS");
            }

        });
        done();
    })
    it('install_0200', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.install(['/data/bmsJstest2.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.install(['/data/bmsJstest3.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.uninstall('com.example.myapplication2', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("SUCCESS");
            }

        });
        done();
    })
    it('install_0300', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.install(['/data/bmsJstest4.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.install(['/data/bmsJstest5.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.install(['/data/bmsJstest6.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.uninstall('com.example.myapplication4', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication5', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication6', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("SUCCESS");
            }

        });
        done();
    })
    it('install_0400', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.install(['error'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("STATUS_INSTALL_FAILURE_INVALID");
            }

        });
        done();
    })
    it('install_0500', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.install([''], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("STATUS_INSTALL_FAILURE_INVALID");
            }

        });
        done();
    })
    it('uninstall_0100', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.install(['/data/bmsJstest1.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication1', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("SUCCESS");
            }
        });
        done();
    })
    it('uninstall_0200', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.install(['/data/bmsJstest1.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.install(['/data/bmsJstest2.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication1', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.uninstall('com.example.myapplication2', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("SUCCESS");
            }
        });
        done();
    })
    it('uninstall_0300', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.install(['/data/bmsJstest4.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.install(['/data/bmsJstest5.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.install(['/data/bmsJstest6.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            });
            data.uninstall('com.example.myapplication4', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.uninstall('com.example.myapplication5', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.uninstall('com.example.myapplication6', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("SUCCESS");
            }
        });
        done();
    })

    it('uninstall_0400', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.uninstall('', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("STATUS_UNINSTALL_FAILURE_ABORTED");
            }
        });
        done();
    })
    it('uninstall_0500', 0, async function (done) {
        await demo.getBundleInstaller().then((data) => {
            data.uninstall('', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err, data) {
                expect(typeof data).assertEqual("object");
                expect(data.statusMessage).assertEqual("STATUS_UNINSTALL_FAILURE_ABORTED");
            }
        });
        done();
    })
})