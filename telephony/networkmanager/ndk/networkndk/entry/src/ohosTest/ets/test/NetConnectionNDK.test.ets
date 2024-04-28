/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import netConnection from 'libnet_connection_ndk.so'

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
// 成功
const NETCONNECTION_OK = 0;
// 参数错误
const ERROR_CODE_401 = 401;
// 无法连接到服务
const ERROR_CODE_2100002 = 2100002;

export default function NetConnectionNDKTest() {

  describe('NetConnectionNDKTest', () => {

    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0100
     * @tc.name   ：TestOHNetConnGetAddrInfo_0100
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAddrInfo_0100', 0, async (done: Function) => {
      let host = 'www.baidu.com';
      let serv = 'https';
      let netid = 0;
      let re: number = netConnection.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0200
     * @tc.name   ：TestOHNetConnGetAddrInfo_0200
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAddrInfo_0200', 0, async (done: Function) => {
      let host = 'www.baidu.com';
      let serv = '';
      let netid = 0;
      let re: number = netConnection.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_2100002);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0300
     * @tc.name   ：TestOHNetConnGetAddrInfo_0300
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAddrInfo_0300', 0, async (done: Function) => {
      let host = '';
      let serv = 'https';
      let netid = 0;
      let re: number = netConnection.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0400
     * @tc.name   ：TestOHNetConnGetAddrInfo_0400
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAddrInfo_0400', 0, async (done: Function) => {
      let host = 'www.baidu.com';
      let serv = 'https';
      let netid = 1;
      let re: number = netConnection.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0500
     * @tc.name   ：TestOHNetConnGetAddrInfo_0500
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAddrInfo_0500', 0, async (done: Function) => {
      let host = '';
      let serv = '';
      let netid = 0;
      let re: number = netConnection.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0100
     * @tc.name   ：TestOHNetConnFreeDnsResult_0100
     * @tc.desc   ：Release DNS results.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnFreeDnsResult_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnFreeDnsResult(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0200
     * @tc.name   ：TestOHNetConnFreeDnsResult_0200
     * @tc.desc   ：Release DNS results.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnFreeDnsResult_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnFreeDnsResult(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0300
     * @tc.name   ：TestOHNetConnFreeDnsResult_0300
     * @tc.desc   ：Release DNS results.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnFreeDnsResult_0300', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnFreeDnsResult(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETALLNETS_0100
     * @tc.name   ：TestOHNetConnGetAllNets_0100
     * @tc.desc   ：Query all activated data networks.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAllNets_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetAllNets(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETALLNETS_0200
     * @tc.name   ：TestOHNetConnGetAllNets_0200
     * @tc.desc   ：Query all activated data networks.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAllNets_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetAllNets(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNHASDEFAULTNET_0100
     * @tc.name   ：TestOHNetConnHasDefaultNet_0100
     * @tc.desc   ：Check if there is a default activated data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnHasDefaultNet_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnHasDefaultNet(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNHASDEFAULTNET_0200
     * @tc.name   ：TestOHNetConnHasDefaultNet_0200
     * @tc.desc   ：Check if there is a default activated data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnHasDefaultNet_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnHasDefaultNet(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNISDEFAULTNETMETERED_0100
     * @tc.name   ：TestOHNetConnIsDefaultNetMetered_0100
     * @tc.desc   ：Check if the default data network records traffic.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnIsDefaultNetMetered_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnIsDefaultNetMetered(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNISDEFAULTNETMETERED_0200
     * @tc.name   ：TestOHNetConnIsDefaultNetMetered_0200
     * @tc.desc   ：Check if the default data network records traffic.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnIsDefaultNetMetered_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnIsDefaultNetMetered(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTNET_0100
     * @tc.name   ：TestOHNetConnGetDefaultNet_0100
     * @tc.desc   ：Get the activated default data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultNet_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetDefaultNet(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTNET_0200
     * @tc.name   ：TestOHNetConnGetDefaultNet_0200
     * @tc.desc   ：Get the activated default data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultNet_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetDefaultNet(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0100
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0100
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetConnectionProperties_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetConnectionProperties(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0200
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0200
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetConnectionProperties_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetConnectionProperties(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0300
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0300
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetConnectionProperties_0300', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetConnectionProperties(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0400
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0400
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetConnectionProperties_0400', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetConnectionProperties(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0100
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0100
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetNetCapabilities(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0200
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0200
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetNetCapabilities(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0300
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0300
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0300', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetNetCapabilities(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0400
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0400
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0400', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetNetCapabilities(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTHTTPPROXY_0100
     * @tc.name   ：TestOHNetConnGetDefaultHttpProxy_0100
     * @tc.desc   ：Query the default network proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultHttpProxy_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetDefaultHttpProxy(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTHTTPPROXY_0200
     * @tc.name   ：TestOHNetConnGetDefaultHttpProxy_0200
     * @tc.desc   ：Query the default network proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultHttpProxy_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHNetConnGetDefaultHttpProxy(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNREGISTERDNSRESOLVER_0100
     * @tc.name   ：TestOHOSNetConnRegisterDnsResolver_0100
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnRegisterDnsResolver_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHOSNetConnRegisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNREGISTERDNSRESOLVER_0200
     * @tc.name   ：TestOHOSNetConnRegisterDnsResolver_0200
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnRegisterDnsResolver_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHOSNetConnRegisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0100
     * @tc.name   ：TestOHOSNetConnUnregisterDnsResolver_0100
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0100', 0, async (done: Function) => {
      let re: number = netConnection.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0200
     * @tc.name   ：TestOHOSNetConnUnregisterDnsResolver_0200
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0200', 0, async (done: Function) => {
      let re: number = netConnection.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0300
     * @tc.name   ：TestOHOSNetConnUnregisterDnsResolver_0300
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0300', 0, async (done: Function) => {
      let re: number = netConnection.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

  });
}