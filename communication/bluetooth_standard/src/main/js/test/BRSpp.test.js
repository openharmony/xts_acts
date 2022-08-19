
/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import bluetooth from '@ohos.bluetooth';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'


export default function bluetoothhostTest4() {
describe('bluetoothhostTest4', function() {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await sleep(3000);
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                break;
            case 3:
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await sleep(3000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(function () {
        console.info('beforeAll called')
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0100
     * @tc.name testSppListen
     * @tc.desc Test secure SppListen 
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0100', 0, async function (done) {
        let SppType = {
            SPP_RFCOMM : 0
        }
        let SppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: SppType.SPP_RFCOMM};
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('bluetooth error code: ' + code.code);
            if (code.code == 0) {
                console.log('bluetooth serverSocket Number: ' + number);
                serverNumber = number;
                expect(true).assertEqual(number!=null);
            }
        }
        bluetooth.sppListen('server1', SppOption, serverSocket);
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0200
     * @tc.name testSppListen
     * @tc.desc Test SppListen api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0200', 0, async function (done) {
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: 0};
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
              console.log('[bluetooth_js] serverSocket Number: ' + number);
              serverNumber = number;
              expect(true).assertEqual(number!=null);
             }
        }
        bluetooth.sppListen('server1', sppOption, serverSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0300
     * @tc.name testSppListen
     * @tc.desc Test SppListen api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0300', 0, async function (done) {
        let sppOption = {uuid: '00000000',
            secure: true, type: 0};
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
              console.log('[bluetooth_js] serverSocket Number: ' + number);
              serverNumber = number;
              expect(true).assertEqual(number!=null);
             }
        }
        bluetooth.sppListen('server1', sppOption, serverSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0400
     * @tc.name testSppListen
     * @tc.desc Test SppListen api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0400', 0, async function (done) {
        let sppOption = {uuid: '00000000-0000-1000-8000-00805F9B34FB',
            secure: false, type: 0};
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
              console.log('[bluetooth_js] serverSocket Number: ' + number);
              serverNumber = number;
              expect(true).assertEqual(number!=null);
             }
        }
        bluetooth.sppListen('server1', sppOption, serverSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0500
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api 8 by callbck.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0500', 0, async function (done) {
        function acceptClientSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
             console.log('[bluetooth_js] clientSocket Number: ' + number);
             expect(true).assertEqual(number!=null);
         }
        }
        bluetooth.sppAccept(0, acceptClientSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0600
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api 8 by callbck.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0600', 0, async function (done) {
        bluetooth.sppAccept(-1, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                console.log('[bluetooth_js]sppAccept Number:' + clientSocketNumber);
                expect(true).assertEqual(clientSocketNumber!=null);
            } else {
                expect(true).assertEqual(false);
            }
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0700
     * @tc.name testSppConnect
     * @tc.desc Test SppConnect api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0700', 0, async function (done) {
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};
        bluetooth.sppConnect('00:11:22:33:44:55', sppOption, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                console.log('[bluetooth_js]sppConnect Number:' + clientSocketNumber);
                expect(true).assertEqual(clientSocketNumber!=null);
            } else {
                expect(true).assertEqual(false);
            }
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0800
     * @tc.name testSppConnect
     * @tc.desc Test SppConnect api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0800', 0, async function (done) {
        let sppOption = {uuid: '0000',
            secure: false, type: 0};
        bluetooth.sppConnect('ABC', sppOption, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                console.log('[bluetooth_js]sppConnect Number' + clientSocketNumber);
                expect(true).assertEqual(clientSocketNumber!=null);
            } else {
                expect(true).assertEqual(false);
            }
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0900
     * @tc.name testSppConnect
     * @tc.desc Test SppConnect api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0900', 0, async function (done) {
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};
        bluetooth.sppConnect('BT', sppOption, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                console.log('[bluetooth_js]sppConnect Number' + clientSocketNumber);
                expect(true).assertEqual(clientSocketNumber!=null);
            } else {
                expect(true).assertEqual(false);
            }
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_1000
     * @tc.name testsppCloseServerSocket
     * @tc.desc Test sppCloseServerSocket api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_1000', 0, async function (done) {
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('bluetooth error code: ' + code.code);
            if (code.code == 0) {
                console.log('bluetooth serverSocket Number: ' + number);
                serverNumber = number;
            }
        }
        let SppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};
        bluetooth.sppListen('server1', SppOption, serverSocket);
        bluetooth.sppCloseServerSocket(serverNumber);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_1000
     * @tc.name testsppCloseClientSocket
     * @tc.desc Test sppCloseClientSocket api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_1100', 0, async function (done) {
        let clientNumber = -1;
        bluetooth.sppAccept(-1, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                console.log('[bluetooth_js]sppAccept Number:' + clientSocketNumber);
                clientNumber =clientSocketNumber;
                expect(true).assertEqual(clientSocketNumber!=null);
            } else {
                expect(true).assertEqual(false);
            }
        });
        bluetooth.sppCloseClientSocket(clientNumber);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_1200
     * @tc.name testSppWrite
     * @tc.desc Test sppWrite 
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_1200', 0, async function (done) {
        let clientNumber = -1;
        bluetooth.sppAccept(-1, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                console.log('[bluetooth_js]sppAccept Number:' + clientSocketNumber);
                clientNumber =clientSocketNumber;
                expect(true).assertEqual(clientSocketNumber!=null);
            } else {
                expect(true).assertEqual(false);
            }
        });
        let arrayBuffer = new ArrayBuffer(8);
        let data = new Uint8Array(arrayBuffer);
        data[0] = 123;
        let ret = bluetooth.sppWrite(clientNumber, arrayBuffer);
        console.info('[bluetooth_js] bluetooth sppWrite ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })
   
   
  })
}

