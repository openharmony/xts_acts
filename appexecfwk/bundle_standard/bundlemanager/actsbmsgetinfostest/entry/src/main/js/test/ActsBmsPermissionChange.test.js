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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit'

const TIMEOUT = 1000;
const DEFAULT_ERRCODE = 100;
let uid;
let systemUid;
describe('ActsBmsGetRegisterPermissionTest', function () {
    beforeAll(async (done) => {
        console.info('=========before all start======')
        var bundleInfo = await bundle.getBundleInfo('com.example.actsbmsgetinfostest', 1);
        uid = bundleInfo.uid;
        var systemBundleInfo = await bundle.getBundleInfo('com.example.system1', 1);
        systemUid = systemBundleInfo.uid;
        done();
    })

    /*
    * @tc.number: bms_unregisterPermissionChange_0100
    * @tc.name: unregister permissionChange callback by other callback
    * @tc.desc: 1.register permissionChange callback
    *           2.unregister permissionChange callback by other different callback
    */
    it('bms_unregisterPermissionChange_0100', 0, async function (done) {
        console.info('=====================start bms_unregisterPermissionChange_0100==================');
        function callbackOne(err, data) {
            console.info('=====================bms_getRegisterPermission_0100==================');
            expect(err.code).assertEqual(0);
            console.info('===========bundleInfo.data========' + JSON.stringify(data));
            expect(data).assertEqual(undefined);
            done();
        }

        function callbackTwo(err, data) {
            expect(err.code).assertEqual(-1);
            expect(data).assertEqual(undefined);
        }
        bundle.on('permissionChange', [uid], callbackOne)
        setTimeout(() => {
            bundle.off('permissionChange', [uid], callbackTwo)
            setTimeout(() => {
                bundle.off('permissionChange', [uid], callbackOne)
            }, TIMEOUT);
        }, TIMEOUT);
    })

    /*
    * @tc.number: bms_unregisterPermissionChange_0100
    * @tc.name: unregister permissionChange callback by other uid list
    * @tc.desc: 1.register permissionChange callback
    *           2.unregister permissionChange callback by other uid list
    */
    it('bms_unregisterPermissionChange_0200', 0, async function (done) {
        console.info('=====================start bms_unregisterPermissionChange_0200==================');
        var errCode = DEFAULT_ERRCODE;
        function callback(err, data) {
            errCode = err.code;
        }
        bundle.on('permissionChange', [uid, systemUid], callback)
        setTimeout(() => {
            bundle.off('permissionChange', [uid], callback)
            setTimeout(() => {
                expect(errCode).assertEqual(-1);
                bundle.off('permissionChange', [uid, systemUid], callback)
                setTimeout(() => {
                    expect(errCode).assertEqual(0);
                    done();
                }, TIMEOUT);
            }, TIMEOUT);
        }, TIMEOUT);
    })

    /*
    * @tc.number: bms_unregisterPermissionChange_0300
    * @tc.name: repeatly unregister permissionChange callback
    * @tc.desc: 1.register permissionChange callback
    *           2.repeatly unregister permissionChange callback
    */
    it('bms_unregisterPermissionChange_0300', 0, async function (done) {
        console.info('=====================start bms_unregisterPermissionChange_0300==================');
        var errCode = DEFAULT_ERRCODE;
        function callback(err, data) {
            console.info('=======call back errCode=======' + err.code)
            errCode = err.code;
        }
        bundle.on('permissionChange', [uid], callback)
        setTimeout(() => {
            bundle.off('permissionChange', [uid], callback)
            setTimeout(() => {
                expect(errCode).assertEqual(0);
                bundle.off('permissionChange', [uid], callback)
                setTimeout(() => {
                    expect(errCode).assertEqual(-1);
                    bundle.off('permissionChange', [uid], callback)
                    setTimeout(() => {
                        expect(errCode).assertEqual(-1);
                        done();
                    }, TIMEOUT);
                }, TIMEOUT);
            }, TIMEOUT);
        }, TIMEOUT);
    })

    /*
    * @tc.number: bms_unregisterPermissionChange_0400
    * @tc.name: unregister permissionChange callback by anonymous callback
    * @tc.desc: 1.register permissionChange callback by anonymous callback
    *           2.unregister permissionChange callback by anonymous callback
    */
    it('bms_unregisterPermissionChange_0400', 0, async function (done) {
        console.info('=====================start bms_unregisterPermissionChange_0400==================');
        bundle.on('permissionChange', [uid], (err, data) => {
            console.info('========register permission change========')
            expect(err.code).assertEqual(-1);
            done();
        })
        setTimeout(() => {
            bundle.off('permissionChange', [uid], (err, data) => {
                console.info('========register permission change========')
                expect(err.code).assertEqual(-1);
                done();
            })
        })
    })

    /*
    * @tc.number: bms_unregisterAnyPermissionChange_0100
    * @tc.name: unregister anyPermissionChange callback by other callback
    * @tc.desc: 1.register anyPermissionChange callback
    *           2.unregister anyPermissionChange callback by other different callback
    */
    it('bms_unregisterAnyPermissionChange_0100', 0, async function (done) {
        console.info('=====================start bms_unregisterAnyPermissionChange_0100==================');
        function callbackOne(err, data) {
            console.info('=====================bms_bms_unregisterAnyPermissionChange_0100==================');
            expect(err.code).assertEqual(0);
            console.info('===========bundleInfo.data========' + JSON.stringify(data));
            expect(data).assertEqual(undefined);
            done();
        }

        function callbackTwo(err, data) {
            expect(err.code).assertEqual(-1);
            expect(data).assertEqual(undefined);
        }
        bundle.on('anyPermissionChange', callbackOne)
        setTimeout(() => {
            bundle.off('anyPermissionChange', callbackTwo)
            setTimeout(() => {
                bundle.off('anyPermissionChange', callbackOne)
            }, TIMEOUT);
        }, TIMEOUT);
    })

    /*
    * @tc.number: bms_unregisterAnyPermissionChange_0200
    * @tc.name: repeatly unregister anyPermissionChange callback
    * @tc.desc: 1.register anyPermissionChange callback
    *           2.repeatly unregister anyPermissionChange callback
    */
    it('bms_unregisterAnyPermissionChange_0200', 0, async function (done) {
        console.info('=====================start bms_unregisterAnyPermissionChange_0200==================');
        var errCode = DEFAULT_ERRCODE;
        function callback(err, data) {
            console.info('=======call back errCode=======' + err.code)
            errCode = err.code;
        }
        bundle.on('anyPermissionChange', callback)
        setTimeout(() => {
            bundle.off('anyPermissionChange', callback)
            setTimeout(() => {
                expect(errCode).assertEqual(0);
                bundle.off('anyPermissionChange', callback)
                setTimeout(() => {
                    expect(errCode).assertEqual(-1);
                    bundle.off('anyPermissionChange', callback)
                    setTimeout(() => {
                        expect(errCode).assertEqual(-1);
                        done();
                    }, TIMEOUT);
                }, TIMEOUT);
            }, TIMEOUT);
        }, TIMEOUT);
    })

    /*
    * @tc.number: bms_unregisterAnyPermissionChange_0300
    * @tc.name: unregister anyPermissionChange callback by anonymous callback
    * @tc.desc: 1.register anyPermissionChange callback by anonymous callback
    *           2.unregister anyPermissionChange callback by anonymous callback
    */
    it('bms_unregisterAnyPermissionChange_0300', 0, async function (done) {
        console.info('=====================start bms_unregisterAnyPermissionChange_0300==================');
        bundle.on('anyPermissionChange', (err, data) => {
            console.info('========register permission change========')
            expect(err.code).assertEqual(-1);
            done();
        })
        setTimeout(() => {
            bundle.off('anyPermissionChange', (err, data) => {
                console.info('========register permission change========')
                expect(err.code).assertEqual(-1);
                done();
            })
        })
    })
})