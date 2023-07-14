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
      mWebSocket.connect(null, (error, value) => {
        if (!error) {
          console.log(`case success11:` + value);
          expect(value).assertTrue();
          done();
        } else {
          console.log(`error, case failed,errCode:` + error.code);
          expect(error.code).assertEqual(401);
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
      mWebSocket.connect("ws://19211.16811.1.100:8081/string", webSocketRequestOptions, (error, value) => {
        if (!error) {
          console.log(`case success11:` + value);
          expect(value).assertTrue();
          done();
        } else {
          console.log(`error, case failed,errCode:` + error.code);
          expect(error.code).assertEqual(-1);
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
      mWebSocket.connect("", (error, value) => {
        if (!error) {
          console.log(`case success11:` + value);
          expect(value).assertTrue();
          done();
        } else {
          console.log(`error, case failed,errCode:` + error.code);
          expect(error.code).assertEqual(-1);
          done();
        }
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
      mWebSocket.send("test data", (error, value) => {
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
     * @tc.number: TEST_SEND_002
     * @tc.name  : testSend002
     * @tc.desc  : Sends data through a WebSocket connection.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testSend002', 0, async function (done) {
      let mWebSocket = webSocket.createWebSocket();
      let promise = mWebSocket.send("test data");
      promise.then(value => {
        console.log(`case success,data:` + value);
        expect(value).assertTrue();
        done();
      }).catch((error) => {
        console.log(`error, case failed,errCode:` + error.code);
        expect(error.code).assertEqual(2302999);
        done();
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
      var str = "Hello, server!(arrayBuffer promise mode)";
      var buf = new ArrayBuffer(str.length);
      var message = new Uint8Array(buf);
      for (var i = 0, strLen = str.length; i < strLen; i++) {
        message[i] = str.charCodeAt(i);
      }
      let promise = mWebSocket.send(message.buffer);
      promise.then(value => {
        console.log(`case success,data:` + value);
        expect(value).assertTrue();
        done();
      }).catch((error) => {
        console.log(`error, case failed,errCode:` + error.code);
        expect(error.code).assertEqual(2302999);
        done();
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

    /*
     * @tc.number: TEST_ON_OPEN_001
     * @tc.name  : testOn_Open001
     * @tc.desc  : Subscribe to WebSocket open events, using callback as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_Open001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      console.log("testOn_Open001: 0");
      ws.on('open', (err, value) => {
        console.log("testOn_Open001: 1");
        console.log("on open, status:" + value['status'] + ", message:" + value['message']);
        console.log("testOn_Open001: 2");
        expect(true).assertTrue();
        done();
      });
      ws.off('open');
      console.log("testOn_Open001: 3");
    });

    /*
     * @tc.number: TEST_OFF_OPEN_001
     * @tc.name  : testOff_Open001
     * @tc.desc  : Unsubscribe from WebSocket open events, using callback as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOff_Open001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      let callback1 = (err, value) => {
        console.log("on open, status:" + value['status'] + ", message:" + value['message']);
      }
      ws.on('open', callback1);
      ws.off('open', callback1);
      expect(true).assertTrue();
    });

    /*
     * @tc.number: TEST_ON_MESSAGE_001
     * @tc.name  : testOn_Message001
     * @tc.desc  : Subscribe to WebSocket received server message events, using callback as an asynchronous method. The maximum length of each message is 4K, and more than 4K automatic fragmentation.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_Message001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      ws.on('message', (err, value) => {
        console.log("on message, message:" + value);
        expect(true).assertTrue();
      });
      ws.off('message');
    });

    /*
     * @tc.number: TEST_OFF_MESSAGE_001
     * @tc.name  : testOff_Message001
     * @tc.desc  : Unsubscribe to WebSocket received server message events, using callback as an asynchronous method. The maximum length of each message is 4K, and more than 4K automatic fragmentation.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOff_Message001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      ws.on('message');
      ws.off('message');
      expect(true).assertTrue();
    });

    /*
     * @tc.number: TEST_On_CLOSE_001
     * @tc.name  : testOn_Close001
     * @tc.desc  : Subscribe to WebSocket shutdown events, using the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_Close001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      ws.on('close', (err, value) => {
        console.log("on close, code is " + value.code + ", reason is " + value.reason);
      });
      ws.off('close');
      expect(true).assertTrue();
    });

    /*
     * @tc.number: TEST_OFF_CLOSE_001
     * @tc.name  : testOff_Close001
     * @tc.desc  : Unsubscribe to WebSocket shutdown events, using the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOff_Close001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      ws.on('close');
      ws.off('close');
      expect(true).assertTrue();
    });

    /*
     * @tc.number: TEST_ON_ERROR_001
     * @tc.name  : testOn_Error001
     * @tc.desc  : Unsubscribe to WebSocket shutdown events, using the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_Error001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      ws.on('error', (err) => {
        console.log("on error, error:" + JSON.stringify(err))
      });
      ws.off('error');
      expect(true).assertTrue();
    });

    /*
     * @tc.number: TEST_OFF_Error_001
     * @tc.name  : testOff_Error001
     * @tc.desc  : Unsubscribe to WebSocket shutdown events, using the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOff_Error001', 0, async function (done) {
      let ws = webSocket.createWebSocket();
      done();
      ws.on('error');
      ws.off('error');
      expect(true).assertTrue();
    });


  })
}