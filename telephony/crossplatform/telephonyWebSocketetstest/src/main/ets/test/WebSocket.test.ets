/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import webSocket from '@ohos.net.webSocket'

export default function webSocketTest() {
  describe('webSocketTest', function () {
    console.log("************* webSocket Test start*************");

    let serverIpAddress: string = "ws://192.168.1.100:8081/string";

    /*
     * @tc.number: TEST_CREATE_WEB_SOCKET_001
     * @tc.name  : testCreateWebSocket001
     * @tc.desc  : Creates a web socket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testCreateWebSocket001', 0, async function (done) {
      var mWebSocket = webSocket.createWebSocket();
      expect(mWebSocket != null).assertTrue();
      done();
    });

    /*
     * @tc.number: TEST_WEB_SOCKET_REQUEST_OPTIONS_HEADER_001
     * @tc.name  : testWebSocketRequestOptions_header001
     * @tc.desc  : webSocketRequestOptions.header
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testWebSocketRequestOptions_header001', 0, async function (done) {
      let webSocketRequestOptions: webSocket.WebSocketRequestOptions = {
        header: "test header"
      }
      expect(webSocketRequestOptions.header === "test header").assertTrue();
      done();
    });

    /*
     * @tc.number: TEST_WEB_SOCKET_CLOSE_OPTIONS_CODE_001
     * @tc.name  : testWebSocketCloseOptions_code001
     * @tc.desc  : webSocketCloseOptions.code
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testWebSocketCloseOptions_code001', 0, async function (done) {
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      }
      expect(webSocketCloseOptions.code === 1).assertTrue();
      done();
    });

    /*
     * @tc.number: TEST_WEB_SOCKET_CLOSE_OPTIONS_001
     * @tc.name  : testWebSocketCloseOptions_Reason001
     * @tc.desc  : webSocketCloseOptions.reason
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testWebSocketCloseOptions_Reason001', 0, async function (done) {
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      }
      expect(webSocketCloseOptions.reason).assertEqual("test reason");
      done();
    });

    /*
     * @tc.number: TEST_CONNECT_001
     * @tc.name  : testConnect001
     * @tc.desc  : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testConnect001', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      mWebSocket.connect(serverIpAddress, (error, value) => {
        if (!error) {
          console.log(`case success11:` + value);  //自动化脚本调用所有的跨平台的接口！！！
          expect(value).assertTrue();
          done();
        } else {
          console.log(`error, case failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /*
     * @tc.number: TEST_CONNECT_002
     * @tc.name  : testConnect002
     * @tc.desc  : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testConnect002', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      let webSocketRequestOptions: webSocket.WebSocketRequestOptions = {
        header: {
          key: "value",
          key2: "value2"
        }
      }
      console.info('webSocket: start11');
      mWebSocket.connect(serverIpAddress, webSocketRequestOptions, (error, value) => {
        if (!error) {
          console.log(`case success11:` + value);
          expect(value).assertTrue();
          done();
        } else {
          console.log(`error, case failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /*
     * @tc.number: TEST_CONNECT_003
     * @tc.name  : testConnect003
     * @tc.desc  : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testConnect003', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      let webSocketRequestOptions: webSocket.WebSocketRequestOptions = {
        header: "test header"
      }
      console.info('webSocket: start11');
      mWebSocket.connect(serverIpAddress, webSocketRequestOptions).then(value => {
        console.log(`case success,data:` + value);
        expect(value).assertTrue();
        done();
      }).catch((error) => {
        console.log(`error, case failed,errCode:` + error.code);
        expect().assertFail();
        done();
      });
    });

    /*
     * @tc.number: TEST_CONNECT_004
     * @tc.name  : testConnect004
     * @tc.desc  : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testConnect004', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      mWebSocket.connect(serverIpAddress).then(value => {
        console.log(`case success,data:` + value);
        expect(value).assertTrue();
        done();
      }).catch((error) => {
        console.log(`error, case failed,errCode:` + error.code);
        expect().assertFail();
        done();
      });
    });

    /*
     * @tc.number: TEST_SEND_001
     * @tc.name  : testSend001
     * @tc.desc  : Sends data through a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testSend001', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      mWebSocket.connect(serverIpAddress, (error, data) => {
        mWebSocket.send("test data", (error, value) => {
          if (!error) {
            console.log(`case success,data:` + value);
            expect(value).assertTrue();
            done();
          } else {
            console.log(`error, case failed,errCode:` + error.code);
            expect().assertFail();
            done();
          }
        });
      });
    });

    /*
     * @tc.number: TEST_SEND_002
     * @tc.name  : testSend002
     * @tc.desc  : Sends data through a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testSend002', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      mWebSocket.connect(serverIpAddress, (error, data) => {
        let promise = mWebSocket.send("test data");
        promise.then(value => {
          console.log(`case success,data:` + value);
          expect(value).assertTrue();
          done();
        }).catch((error) => {
          console.log(`error, case failed,errCode:` + error.code);
          expect().assertFail();
          done();
        });
      });
    });

    /*
     * @tc.number: TEST_SEND_003
     * @tc.name  : testSend003
     * @tc.desc  : Sends data through a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testSend003', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      var str = "Hello";
      for (var i = 0; i < 200; i++) {
        str += "Hello";
      }
      mWebSocket.connect(serverIpAddress, (error, data) => {
        let promise = mWebSocket.send(str);
        promise.then(value => {
          console.log(`case success,data:` + value);
          expect(value).assertTrue();
          done();
        }).catch((error) => {
          console.log(`error, case failed,errCode:` + error.code);
          expect().assertFail();
          done();
        });
      });
    });

    /*
     * @tc.number: TEST_SEND_004
     * @tc.name  : testSend004
     * @tc.desc  : Sends data through a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testSend004', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      var str = "Hello, server!(arrayBuffer promise mode)";
      var buf = new ArrayBuffer(str.length);
      var message = new Uint8Array(buf);
      for (var i = 0, strLen = str.length; i < strLen; i++) {
        message[i] = str.charCodeAt(i);
      }
      mWebSocket.connect(serverIpAddress, (error, data) => {
        let promise = mWebSocket.send(message.buffer);
        promise.then(value => {
          console.log(`case success,data:` + value);
          expect(value).assertTrue();
          done();
        }).catch((error) => {
          console.log(`error, case failed,errCode:` + error.code);
          expect().assertFail();
          done();
        });
      });
    });

    /*
     * @tc.number: TEST_CLOSE_001
     * @tc.name  : testClose001
     * @tc.desc  : Closes a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testClose001', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      mWebSocket.connect(serverIpAddress, (error, data) => {
        mWebSocket.close((error, value) => {
          if (!error) {
            console.log(`case success:` + value);
            expect(value).assertTrue();
            done();
          } else {
            console.log(`error, case failed,errCode:` + error.code);
            expect(error.code).assertEqual(2302999);
            done();                                    //补上on、off的接口，触发10次，每次都能监听到!!!
          }
        });
      });
    });

    /*
     * @tc.number: TEST_CLOSE_002
     * @tc.name  : testClose002
     * @tc.desc  : Closes a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testClose002', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      }
      mWebSocket.connect(serverIpAddress, (error, data) => {
        mWebSocket.close(webSocketCloseOptions, (error, value) => {
          if (!error) {
            console.log(`case success,data:` + value);
            expect(value).assertTrue();
            done();
          } else {
            console.log(`error, case failed,errCode:` + error.code);
            expect().assertFail();
            done();
          }
        });
      });
    });

    /*
     * @tc.number: TEST_CLOSE_003
     * @tc.name  : testClose003
     * @tc.desc  : Closes a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testClose003', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      }
      mWebSocket.connect(serverIpAddress, (error, data) => {
        mWebSocket.close(webSocketCloseOptions).then(value => {
          console.log(`case success,data:` + value);
          expect(value).assertTrue();
          done();
        }).catch((error) => {
          console.log(`error, case failed,errCode:` + error.code);
          expect().assertFail();
          done();
        });
      });
    });

    /*
     * @tc.number: TEST_CLOSE_004
     * @tc.name  : testClose004
     * @tc.desc  : Closes a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testClose004', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      mWebSocket.close((error, value) => {
        if (!error) {
          console.log(`case success:` + value);
          expect(value).assertTrue();
          done();
        } else {
          console.log(`error, case failed,errCode:` + error.code);
          expect(error.code).assertEqual(2302999);
          done();
        }
      });
    });

    /*
     * @tc.number: TEST_CLOSE_005
     * @tc.name  : testClose005
     * @tc.desc  : Closes a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testClose005', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      }
      mWebSocket.close(webSocketCloseOptions, (error, value) => {
        if (!error) {
          console.log(`case success,data:` + value);
          expect(value).assertTrue();
          done();
        } else {
          console.log(`error, case failed,errCode:` + error.code);
          expect(error.code).assertEqual(2302999);
          done();
        }
      });
    });

    /*
     * @tc.number: TEST_CLOSE_006
     * @tc.name  : testClose006
     * @tc.desc  : Closes a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testClose006', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      }
      mWebSocket.close(webSocketCloseOptions).then(value => {
        console.log(`success11`);
        expect(true).assertTrue();
        done();
      }).catch((error) => {
        console.log(`error, case failed,errCode:` + error.code);
        expect(error.code).assertEqual(2302999);
        done();
      });
    });


  })
}