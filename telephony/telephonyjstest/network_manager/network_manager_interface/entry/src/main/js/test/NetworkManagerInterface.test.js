/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import dnsresolver from '@ohos.netmanager.dnsresolver';
import ethernet from '@ohos.netmanager.ethernet';
import { describe, it, expect } from 'deccjsunit/index';

describe('NetworkManagerInterfaceTest', function () {
    const IFACE_0 = 'eth0';
    const IFACE_1 = 'the1';
    const mockHostName = 'www.harmonyos.com';

    let mockData = {
        ipAddr: "192.168.1.123",
        routeAddr: "192.168.1.1",
        gateAddr: "192.168.1.1",
        maskAddr: "255.255.255.0",
        dnsAddr0: "1.1.1.1",
        dnsAddr1: "2.2.2.2"
    }

    /**
     * @tc.number  Telephony_NetworkManager_setIfaceConfig_Async_0100
     * @tc.name    Test setIfaceConfig() to view the callback result when iface is "the0"
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setIfaceConfig_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setIfaceConfig_Async_0100';
        ethernet.setIfaceConfig(IFACE_1, ethernet.STATIC, mockData, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                done();
                return;
            }
            expect(data).assertEqual(-1);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setIfaceConfig_Async_0400
     * @tc.name    Test setIfaceConfig() to view the callback result when IPSetMode is DHCP
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setIfaceConfig_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setIfaceConfig_Async_0400';
        ethernet.setIfaceConfig(IFACE_0, ethernet.DHCP, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} set data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(0);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setIfaceConfig_Promise_0100
     * @tc.name    Test setIfaceConfig() to view the callback result when iface is "eth0"
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setIfaceConfig_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setIfaceConfig_Promise_0100';
        ethernet.setIfaceConfig(IFACE_1, ethernet.STATIC, mockData).then(data => {
            console.log(`${caseName} set data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(-1);
            done();
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_setIfaceConfig_Promise_0400
     * @tc.name    Test setIfaceConfig() to view the callback result when IPSetMode is DHCP
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setIfaceConfig_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setIfaceConfig_Promise_0400';
        ethernet.setIfaceConfig(IFACE_0, ethernet.DHCP).then(data => {
            console.log(`${caseName} set data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(0);
            done();
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        })
    });


    /**
     * @tc.number  Telephony_NetworkManager_getIfaceConfig_Async_0100
     * @tc.name    Test getIfaceConfig() to view the callback result when iface is "eth0"
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getIfaceConfig_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getIfaceConfig_Async_0100';
        ethernet.getIfaceConfig(IFACE_0, (err, data) => {
            if (err) {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data.mode === ethernet.STATIC || data.mode === ethernet.DHCP).assertTrue();
            expect(data.ipAddr === '').assertTrue();
            expect(data.routeAddr === '').assertTrue();
            expect(data.gateAddr === '').assertTrue();
            expect(data.maskAddr === '').assertTrue();
            expect(data.dns0Addr === '').assertTrue();
            expect(data.dns1Addr === '').assertTrue();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getIfaceConfig_Async_0200
     * @tc.name    Test getIfaceConfig() to view the callback result when iface is "the0"
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getIfaceConfig_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getIfaceConfig_Async_0200';
        ethernet.getIfaceConfig(IFACE_1, (err, data) => {
            if (err) {
                console.log(`${caseName} get fail: ${err}`);
                expect(err === -1).assertTrue();
                done();
                return;
            }
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getIfaceConfig_Promise_0100
     * @tc.name    Test getIfaceConfig() to view the callback result when iface is "eth0"
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getIfaceConfig_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getIfaceConfig_Promise_0100';
        ethernet.getIfaceConfig(IFACE_0).then(data => {
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data.mode === ethernet.STATIC || data.mode === ethernet.DHCP).assertTrue();
            expect(data.ipAddr === '').assertTrue();
            expect(data.routeAddr === '').assertTrue();
            expect(data.gateAddr === '').assertTrue();
            expect(data.maskAddr === '').assertTrue();
            expect(data.dns0Addr === '').assertTrue();
            expect(data.dns1Addr === '').assertTrue();
            done();
        }).catch(err => {
            console.log(`${caseName} get fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_getIfaceConfig_Promise_0200
     * @tc.name    Test getIfaceConfig() to view the callback result when iface is "the0"
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getIfaceConfig_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getIfaceConfig_Promise_0200';
        ethernet.getIfaceConfig(IFACE_1).then(data => {
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} get fail: ${err}`);
            expect(err === -1).assertTrue();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_isActivate_Async_0100
     * @tc.name    Test isActivate() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isActivate_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isActivate_Async_0100';
        ethernet.isActivate(IFACE_0, (err, data) => {
            if (err) {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(1);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isActivate_Async_0200
     * @tc.name    Test isActivate() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isActivate_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isActivate_Async_0200';
        ethernet.isActivate(IFACE_1, (err, data) => {
            if (err) {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(-1);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isActivate_Promise_0100
     * @tc.name    Test isActivate('eth0') to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isActivate_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isActivate_Promise_0100';
        ethernet.isActivate(IFACE_0).then(data => {
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(1);
            done();
        }).catch(err => {
            console.log(`${caseName} get fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_isActivate_Promise_0200
     * @tc.name    Test isActivate() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isActivate_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isActivate_Promise_0200';
        ethernet.isActivate(IFACE_1).then(data => {
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(-1);
            done();
        }).catch(err => {
            console.log(`${caseName} get fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_getActivateInterfaces_Async_0100
     * @tc.name    Test getActivateInterfaces() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getActivateInterfaces_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getActivateInterfaces_Async_0100';
        ethernet.getActivateInterfaces((err, data) => {
            if (err) {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data[0]).assertEqual(IFACE_0);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getActivateInterfaces_Promise_0100
     * @tc.name    Test getActivateInterfaces() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getActivateInterfaces_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getActivateInterfaces_Promise_0100';
        ethernet.getActivateInterfaces().then(data => {
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data[0]).assertEqual(IFACE_0);
            done();
        }).catch(err => {
            console.log(`${caseName} get fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_getAddressesByName_Async_0100
     * @tc.name    Test getAddressesByName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getAddressesByName_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getAddressesByName_Async_0100';
        dnsresolver.getAddressesByName(mockHostName, (err, data) => {
            if (err) {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getAddressesByName_Async_0200
     * @tc.name    Test getAddressesByName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getAddressesByName_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getAddressesByName_Async_0200';
        dnsresolver.getAddressesByName('456', (err, data) => {
            if (err) {
                console.log(`${caseName} get fail: ${err}`);
                expect(err).assertEqual(-1);
                done();
                return;
            }
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getAddressesByName_Promise_0100
     * @tc.name    Test getAddressesByName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getAddressesByName_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getAddressesByName_Promise_0100';
        dnsresolver.getAddressesByName(mockHostName).then(data => {
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect(data.length).assertLarger(0);
            done();
        }).catch(err => {
            console.log(`${caseName} get fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_getAddressesByName_Promise_0200
     * @tc.name    Test getAddressesByName() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getAddressesByName_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getAddressesByName_Promise_0200';
        dnsresolver.getAddressesByName('456').then(data => {
            console.log(`${caseName} get data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} get fail: ${err}`);
            expect(err).assertEqual(-1);
            done();
        })
    });
});
