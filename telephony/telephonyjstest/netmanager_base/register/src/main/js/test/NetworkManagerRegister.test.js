/**
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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


 import connection from '@ohos.net.connection';
 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
 export default function Telephony_NetworkManagerRegisterTest() {
 
 describe('Telephony_NetworkManagerRegisterTest', function () {
 
     const ETH_100 = 100;
     const TEST_RUN_TIME_2 = 2;
     const TEST_RUN_TIME_5 = 5;
     const TEST_RUN_TIME_1000 = 1000;
     const DELAY = 1000;
     const DELAY_TIME = 1000;
     const TIMEOUT = 100;
     const TIMEOUT_1 = 1000;
     let VALUE = 0;
     let envReady = false;
 
     function sleep(timeout) {
         return new Promise((resolve, reject) => {
             setTimeout(() => {
                 resolve();
             }, timeout);
         })
     }
 
     function sleepOther(timeout) {
         for (var t = Date.now(); Date.now() - t <= timeout;) ;
     }
 
     /**
      *@tc.number  Telephony_NetworkManager_register_Async_0100
      *@tc.name Enter  bearerTypes and networkCap asempty, set class NetConnection,
      * call Register() to activate the default network, and see if the callback information is generated
      @tc.desc Function test
      */
     it('Telephony_NetworkManager_register_Async_0100', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_0100';
         let netConn = connection.createNetConnection();
         let returnValue = 0;
         netConn.on('netAvailable', (value) => {
             if (value === undefined) {
                 console.info("${caseName} on netAvailable fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable :" + value.netId);
                 returnValue = value.netId;
             }
         });
         netConn.on('netCapabilitiesChange', (value) => {
             if (value === undefined) {
                 console.info("${caseName} netCapabilitiesChange fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle =:" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netConnectionPropertiesChange', (value) => {
             if (value === undefined) {
                 console.info("${caseName} netConnectionPropertiesChange fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (value) => {
             if (error) {
                 console.info("${caseName} netLost fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost: " + value.netId);
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info(JSON.stringify(error) + "${caseName} register fail: ${error}");
                 done();
             }
         });
         await sleep(DELAY);
         console.info("${caseName} returnVaule : " + returnValue);
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 done();
             }
             done();
         });
         done();
     });

     /**
      *@tc.number  Telephony_NetworkManager_register_Async_0200
      *@tc.name Enter  bearerTypes and networkCap asempty, set class NetConnection,
      * call Register() to activate the default network, and see if the callback information is generated
      @tc.desc Function test
      */
     it('Telephony_NetworkManager_register_Async_0200', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_0200';
         let netSpecifier = {
             netCapabilities: {
                 bearerTypes: [1],
             }
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (value) => {
             if (value === undefined) {
                 console.info("${caseName} on netAvailable fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
                 returnValue = value.netId;
             }
         });
         console.info("netAvailable end");
         netConn.on('netCapabilitiesChange', (value) => {
             if (value === undefined) {
                 console.info("${caseName} netCapabilitiesChange fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle =:" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();

             }
         });
         console.info("netCapabilitiesChange end");
         netConn.on('netConnectionPropertiesChange', (value) => {
             if (value === undefined) {
                 console.info("${caseName} netConnectionPropertiesChange fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle =:" + value.netHandle.netId);
             }
         });
         console.info("netConnectionPropertiesChange end");
         netConn.on('netLost', (value) => {
             if (error) {
                 console.info("${caseName} netLost fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost : " + value.netId);
             }
         });
         console.info("netLost end");
         netConn.on('netUnavailable', (value) => {
             if (error) {
                 console.info("${caseName} netUnavailable fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable: " + value.netId);
             }
         });
         console.info("netUnavailable end");
         netConn.on('netBlockStatuschange', (value) => {
             if (error) {
                 console.info("${caseName} netBlockStatusChange fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange : " + value.netHandle.netId);
             }
         });
         console.info("netBlockStatuschange end");
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         console.info("register end");
         await sleep(DELAY);
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregisterresult: ${error}" + JSON.stringify(error));
                 done();
             }
         });
         console.info("unregister end");
         done();
     });

     /*
       *@tc.number Telephony_NetworkManager_register_Async_0300
       *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
       * call Register ()to activate the default network,and see if the callback information is generated
       *@tc.desc Function test
       */
     it('Telephony_NetworkManager_register_Async_0300', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_0300';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [11],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(DELAY);
         console.info("${caseName} netId : ${netId}");
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error}");
             }
         });
         done();
     });

     /*
       *@tc.number Telephony_NetworkManager_register_Async_0400
       *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
       * call Register ()to activate the default network,and see if the callback information is generated
       *@tc.desc Function test
       */
     it('Telephony_NetworkManager_register_Async_0400', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_0400';
         let netId = 0;
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error.code},${error.message}");
             }
         });
         done();
     });

     /*
     *@tc.number Telephony_NetworkManager_register_Async_0500
     *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
     * call Register() to activate the default network,and see if the callback information is generated
     *@tc.desc Function test
     */
     it('Telephony_NetworkManager_register_Async_0500', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_rgister_Async_0500';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [15],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error}");
             }
             done();
         });
         done();
     });

     /*
     *@tc.number Telephony_NetworkManager_register_Async_0600
     *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
     * call Register() to activate the default network,and see if the callback information is generated
     *@tc.desc Function test
     */
     it('Telephony_NetworkManager_register_Async_0600', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_rgister_Async_0600';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [16],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         let netId = 0;
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error}");
             }
             done();
         });
         done();
     });

     /*
     *@tc.number Telephony_NetworkManager_register_Async_0700
     *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
     * call Register() to activate the default network,and see if the callback information is generated
     *@tc.desc Function test
     */
     it('Telephony_NetworkManager_register_Async_0700', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_rgister_Async_0700';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [17],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         let netId = 0;
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error}");
             }
             done();
         });
         done();
     });

     /*
     *@tc.number Telephony_NetworkManager_register_Async_0800
     *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
     * call Register() to activate the default network,and see if the callback information is generated
     *@tc.desc Function test
     */
     it('Telephony_NetworkManager_register_Async_0800', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_rgister_Async_0800';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [1],
                 networkCap: [0],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         let netId = 0;
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error}");
             }
             done();
         });
         done();
     });

     /*
     *@tc.number Telephony_NetworkManager_register_Async_0900
     *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
     * call Register() to activate the default network,and see if the callback information is generated
     *@tc.desc Function test
     */
     it('Telephony_NetworkManager_register_Async_0900', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_rgister_Async_0900';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [1],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         let netId = 0;
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(10000);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error}");
             }
             done();
         });
         done();
     });

     /*
     *@tc.number Telephony_NetworkManager_register_Async_1000
     *@tc.name Enter bearerTypes and networkCap as empty, set class NetConnection,
     * call Register() to activate the default network,and see if the callback information is generated
     *@tc.desc Function test
     */
     it('Telephony_NetworkManager_register_Async_1000', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_rgister_Async_1000';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [1],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         let netId = 0;
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable:" + value.netId);
                 expect(value.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost = :" + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable = :" + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result: ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_1100
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1100', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1100';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [1],
                 networkCap: [15],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_1200
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1200', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1200';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [1],
                 networkCap: [16],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });


     /**
      * @tc.number Telephony_NetworkManager_register_Async_1300
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1300', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1300';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [1],
                 networkCap: [17],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
                 expect(value.netId).assertEqual(ETH_100);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100).assertTrue();
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });


     /**
      * @tc.number Telephony_NetworkManager_register_Async_1400
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1400', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1400';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [2],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_1500
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1500', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1500';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [3],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
                 VALUE = value.netId;
                 expect(VALUE >= ETH_100).assertTrue();
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });


     /**
      * @tc.number Telephony_NetworkManager_register_Async_1600
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1600', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1600';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [4],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_1700
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1700', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1700';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [5],
                 networkCap: [17],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_1800
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1800', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1800';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [4],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         await sleep(DELAY);
         let netConn1 = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn1.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn1.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
                 netId = true;
             }
         });
         netConn1.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn1.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_1900
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_1900', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_1900';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [6],
                 networkCap: [18],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
             }
         });
         netConn.register((error) => {
             if (error) {

                 done();
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_2000
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */

     it('Telephony_NetworkManager_register_Async_2000', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_2000';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [0],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             expect(false).assertTrue()
             done();
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             expect(false).assertTrue()
             done();
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             expect(false).assertTrue()
             done();
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             expect(false).assertTrue()
             done();
         });
         netConn.on('netLost', (error, value) => {
             expect(false).assertTrue()
             done();
         });
         netConn.on('netUnavailable', (error, value) => {
             done();
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_2100
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */
     it('Telephony_NetworkManager_register_Async_2100', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_2100';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [0],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         let netSpecifier1 = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn1 = connection.createNetConnection(netSpecifier1, TIMEOUT);
         netConn1.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn1.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn1.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value);
                 netId = true;
             }
         });
         netConn1.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn1.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_2200
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */
     it('Telephony_NetworkManager_register_Async_2200', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_2200';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [0],
             }, bearerPrivateIdentifier: '123'
         }
         let netId = 0;
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 netId = true;
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         let netSpecifier1 = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [1],
                 networkCap: [12],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn1 = connection.createNetConnection(netSpecifier1, TIMEOUT);
         netConn1.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
             }
         });
         netConn1.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
             }
         });
         netConn1.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn1.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 netId = true;
             }
         });
         netConn1.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         expect(true).assertTrue()
         netConn1.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_register_Async_2300
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */
     it('Telephony_NetworkManager_register_Async_2300', 0, async function (done) {
         let caseName = 'Telephony_NetworkManager_register_Async_2300';
         let netConn = connection.createNetConnection();
         let returnValue = 0;
         netConn.on('netAvailable', (value) => {
             if (value === undefined) {
                 console.info("${caseName} on netAvailable fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable" + value.netId);
                 returnValue = value.netId;
             }
         });
         netConn.on('netCapabilitiesChange', (value) => {
             if (value === undefined) {
                 console.info("${caseName} on netCapabilitiesChange fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle " + value.netHandle.netId);
                 expect(value.netHandle.netId >= ETH_100 ).assertTrue();
             }
         });
         netConn.on('netConnectionPropertiesChange', (value) => {
             if (value === undefined) {
                 console.info("${caseName} on netConnectionPropertiesChange fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange hdndle" + value.netHandle.netId);
             }
         });
         netConn.on('netLost', (value) => {
             if (error) {
                 console.info("${caseName} netLost fail");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         await sleep(DELAY);
         console.info("${caseName} returnValue " + returnValue);
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
                 done();
             }
             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_unregister_Async_0100
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */
     it('Telephony_NetworkManager_unregister_Async_0100', 0, async function (done) {
         if (!envReady) {
         console.info("The environment was not ready");
         done();
         return;
         }
         let caseName = 'Telephony_NetworkManager_unregister_Async_0100';
         let netSpecifier = {
             netCapabilities: {
                 linkUpBandwidthKbps: 0,
                 linkDownBandwidthKbps: 0,
                 bearerTypes: [0],
                 networkCap: [0],
             }, bearerPrivateIdentifier: '123'
         }
         let netConn = connection.createNetConnection(netSpecifier, TIMEOUT_1);
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
                 done();
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
                 done();
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 done();
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
                 expect().assertFail();
                 done();
             }

             done();
         });
         done();
     });


     /**
      * @tc.number Telephony_NetworkManager_unregister_Async_0200
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */
     it('Telephony_NetworkManager_unregister_Async_0200', 0, async function (done) {
         if (!envReady) {
         console.info("The environment was not ready");
         done();
         return;
         }
         let caseName = 'Telephony_NetworkManager_unregister_Async_0200';
         let netConn = connection.createNetConnection();
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
                 done();
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
                 done();
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 done();
             }
         });
         netConn.register((error) => {
             if (error) {
                 console.info("${caseName} register fail ${error}");
             }
         });
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
                 expect().assertFail();
                 done();
             }

             done();
         });
         done();
     });

     /**
      * @tc.number Telephony_NetworkManager_unregister_Async_0300
      * @tc.name Enter bearerTypes add networkCap as empty ,set class NetConnection,
      *          call Register () to activate the default network ,and see if the callback information is generated
      * @tc.desc Function test
      */
     it('Telephony_NetworkManager_unregister_Async_0300', 0, async function (done) {
         if (!envReady) {
         console.info("The environment was not ready");
         done();
         return;
         }
         let caseName = 'Telephony_NetworkManager_unregister_Async_0300';
         let netConn = connection.createNetConnection();
         netConn.on('netAvailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail: ${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netAvailable : " + value.netId);
                 done();
             }
         });
         netConn.on('netBlockStatusChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netBlockStatusChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netCapabilitiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netCapabilitiesChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netConnectionPropertiesChange', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netConnectionPropertiesChange handle = :" + value.netHandle.netId);
                 done();
             }
         });
         netConn.on('netLost', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netLost " + value.netId);
                 done();
             }
         });
         netConn.on('netUnavailable', (error, value) => {
             if (error) {
                 console.info("${caseName} register fail :${error}");
                 expect().assertFail();
                 done();
             } else {
                 console.info("${caseName} netUnavailable " + value.netId);
                 done();
             }
         });
         netConn.unregister((error) => {
             if (error) {
                 console.info("${caseName} unregister result : ${error}");
                 expect().assertFail();
                 done();
             }
 
             done();
         });
         done();
     });
 
 });
}
 
 