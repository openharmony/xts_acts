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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import socket from '@ohos.net.socket'

function toString(obj) {
  return JSON.stringify(obj);
}
const localIpAdress = '192.168.1.101';
const localIpAdressError = '192.168.1.501'
let serverIpAddress: string = "192.168.1.100";
let serverIpAddressError: string = "192.168.1.600";

function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function socketTest() {

  describe('socketTest', function () {

    beforeAll(function (){
      console.log("************* socket Test start*************");
    })
    let envReady = false;

    /**
     * @tc.number: TEST_SOCKET_SETEXTRAOPTIONS_TCP_ERROR_002
     * @tc.name  : test_Socket_setExtraOptions_Tcp_Error_002
     * @tc.desc  : Set other properties of the TCP Socket connection. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_setExtraOptions_Tcp_Error_002', 0,async function (done) {
      let tcp = socket.constructTCPSocketInstance();
        let promise = tcp.setExtraOptions({
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000,
        });
        promise.then(()=>{
          console.log('test_Socket_setExtraOptions_Tcp_Error_002 success' );
          expect(false).assertTrue();
          tcp.close();
          done();
        }).catch(err=>{
          console.log('test_Socket_setExtraOptions_Tcp_Error_002 err :' + JSON.stringify(err));
          // expect(err.code == 2301088).assertTrue();
          tcp.close(()=>{
            setTimeout(function (){
              done();
              console.log('test_Socket_getState_Error_Tcp_002 close success' + JSON.stringify(err));
            },3000)
          })
        })
    });

    /**
     * @tc.number: TEST_SOCKET_SETEXTRAOPTIONS_UDP_ERROR_001
     * @tc.name  : test_Socket_setExtraOptions_Udp_Error_001
     * @tc.desc  : Set other properties of the  UDP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_setExtraOptions_Udp_Error_001', 0,async function (done) {
      let udp = socket.constructUDPSocketInstance();
      try {
        udp.setExtraOptions({
          // @ts-ignore
          keepAlive: true,
          OOBInline: true,
          UDPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000,
        }, async err => {
          console.log('test_Socket_setExtraOptions_Udp_Error_001' + JSON.stringify(err));
          expect(err.code==2301088).assertTrue();
          udp.close();
          done();
        });
      } catch (err){
        console.log('test_Socket_setExtraOptions_Udp_Error_001 catch'+JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number: TEST_SOCKET_TCP_CONNECT_001
     * @tc.name  : test_Socket_Tcp_Connect_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tcp_Init_001', 0,async function (done) {
      let tcp = socket.constructTCPSocketInstance();
      expect(tcp != null).assertTrue();
      done();
    })

    /**
     * @tc.number: TEST_SOCKET_UDP_CONNECT_001
     * @tc.name  : test_Socket_UDP_Connect_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Udp_Init_001', 0,async function (done) {
      let udp = socket.constructUDPSocketInstance();
      expect(udp != null).assertTrue();
      done();
    })

    /**
     * @tc.number: TEST_SOCKET_TLS_CONNECT_001
     * @tc.name  : test_Socket_TLS_Connect_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tls_Init_001', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      expect(tls != null).assertTrue();
      done();
    })

    /**
     * @tc.number: TEST_SOCKET_TCP_BIND_001
     * @tc.name  : test_Socket_Tcp_Bind_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tcp_Bind_001', 0,async function (done) {
      let tcp = socket.constructTCPSocketInstance();
      try {
        await tcp.bind({ address: localIpAdressError, port: 0, family: 1 });
        console.log('test_Socket_Tcp_Bind_001 success')
        tcp.close();
        done();
      } catch (err) {
        console.log('test_Socket_Tcp_Bind_001 error' + JSON.stringify(err));
        tcp.close();
        done();
      }
    })

    /**
     * @tc.number: TEST_SOCKET_TCP_BIND_002
     * @tc.name  : test_Socket_Tcp_Bind_002
     * @tc.desc  : Connect to the specified IP address and port. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tcp_Bind_002', 0,async function (done) {
      let tcp = socket.constructTCPSocketInstance();
      try{
      let promise = tcp.bind({ address: localIpAdressError, port: 0, family: 1 });
      promise.then(async  () => {
        console.log('test_Socket_Tcp_Bind_002 bind success');
        tcp.close();
        done();
      })} catch(err) {
        console.log('test_Socket_Tcp_Bind_002 bind fail');
        tcp.close();
        done();
      };
    })

    /**
     * @tc.number: TEST_SOCKET_TCP_CONNECT_001
     * @tc.name  : test_Socket_Tcp_Connect_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tcp_Connect_Error_001', 0,async function (done) {
      let tcp = socket.constructTCPSocketInstance();
      try {
        await tcp.bind({ address: localIpAdressError, port: 0, family: 1 });
        console.log('test_Socket_Tcp_Connect_001 bind success')
        tcp.connect({ address: { address: serverIpAddressError, port: 8888, family: 1 }, timeout: 6000 }, async err => {
          console.info('test_Socket_Tcp_Connect_001 err' + JSON.stringify((err)));
          expect(err.code == 2301101);
          expect(err.message == 'Network unreachable');
          tcp.close();
          done();
        })
      } catch (err) {
        console.log('test_Socket_Tcp_Connect_001 error' + JSON.stringify(err));
        tcp.close();
        done();
      }
    })


    /**
     * @tc.number: TEST_SOCKET_TCP_CONNECT_ERROR_002
     * @tc.name  : test_Socket_Tcp_Connect_Error_002
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tcp_Connect_Error_002', 0,async function (done) {

      let tcp = socket.constructTCPSocketInstance();
      try {
        console.log('test_Socket_Tcp_Connect_002 bind success')
        tcp.connect({ address: { address: serverIpAddressError, port: 65656, family: 1 }, timeout: 6000 }, async err => {
          console.info('test_Socket_Tcp_Connect_002 err' + JSON.stringify((err)));
          expect(err.code == 2301088);
          expect(err.message == 'Not a socket');
          tcp.close();
          done();
        })
      } catch (err) {
        console.log('test_Socket_Tcp_Connect_002 error' + JSON.stringify(err));
        tcp.close();
        done();
      }
    })

    /**
     * @tc.number: TEST_SOCKET_TCP_CONNECT_PROMISE_ERROR_001
     * @tc.name  : test_Socket_Tcp_Connect_Promise_Error_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tcp_Connect_Promise_Error_001', 0,async function (done) {

      let tcp = socket.constructTCPSocketInstance();
      try {
        await tcp.bind({ address: localIpAdressError, port: 0, family: 1 });
        console.log('test_Socket_Tcp_Connect_Promise_Error_001 bind success')
        let promise = tcp.connect({ address: { address: serverIpAddressError, port: 8888, family: 1 }, timeout: 6000 });
        promise.catch(async err => {
          console.log('test_Socket_Tcp_Connect_Promise_Error_001 error' + JSON.stringify(err));
          expect(err.code==2301101);
          tcp.close();
          done();
        })
      } catch (err) {
        console.log('test_Socket_Tcp_Connect_Promise_Error_001 error' + JSON.stringify(err));
        tcp.close();
        done();
      }
    })

    /**
     * @tc.number: TEST_SOCKET_TCP_CONNECT_PROMISE_ERROR_002
     * @tc.name  : test_Socket_Tcp_Connect_Promise_Error_002
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tcp_Connect_Promise_Error_002', 0,async function (done) {
      let tcp = socket.constructTCPSocketInstance();
      try {
        console.log('test_Socket_Tcp_Connect_Promise_Error_002 bind success')
        let promise = tcp.connect({ address: { address: serverIpAddressError, port: 8888, family: 1 }, timeout: 6000 });
        promise.catch(async err => {
          console.log('test_Socket_Tcp_Connect_Promise_Error_002 error' + JSON.stringify(err));
          expect(err.code==2301088);
          tcp.close();
          done();
        })
      } catch (err) {
        console.log('test_Socket_Tcp_Connect_Promise_Error_001 error' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number: test_Socket_Send_Tcp_Error_001
     * @tc.name  : test_Socket_Send_Tcp_Error_001
     * @tc.desc  : Send data through the TCP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Send_Tcp_Error_001', 0, function (done) {
      let tcp = socket.constructTCPSocketInstance();
      tcp.send({
        data: '你好!123,string'
      }, err => {
        if(err){
          console.log('test_Socket_Send_Tcp_Error_001 err' + JSON.stringify(err))

          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      })
    });

    /**
     * @tc.number: test_Socket_Send_Tcp_Error_002
     * @tc.name  : test_Socket_Send_Tcp_Error_002
     * @tc.desc  : Send data through the TCP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Send_Tcp_Error_002', 0, async function (done) {

      let tcp = socket.constructTCPSocketInstance();
      let promise = tcp.send({
        data: '你好!123,string'
      });
      promise.catch(err => {
        if(err){
          console.log('test_Socket_Send_Tcp_Error_002 err' + JSON.stringify(err))

          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      })
    });

    /**
     * @tc.number: test_Socket_Close_Tcp_Error_001
     * @tc.name  : test_Socket_Close_Tcp_Error_001
     * @tc.desc  : Send data through the TCP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Close_Tcp_Error_001', 0, function (done) {

      let tcp = socket.constructTCPSocketInstance();
      tcp.close(err => {
        console.log('test_Socket_Close_Tcp_Error_001'+JSON.stringify(err));
        expect(err==undefined ).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_Close_Tcp_Error_002
     * @tc.name  : test_Socket_Close_Tcp_Error_002
     * @tc.desc  : Send data through the TCP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Close_Tcp_Error_002', 0, function (done) {

      let tcp = socket.constructTCPSocketInstance();
      let promise = tcp.close();
      promise.then(async (err) => {
        console.log('test_Socket_Close_Tcp_Error_002' + JSON.stringify(err));
        expect(err == undefined).assertTrue();
        tcp.close();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_getRemoteAddress_Error_Tcp_001
     * @tc.name  : test_Socket_getRemoteAddress_Error_Tcp_001
     * @tc.desc  : Obtain the peer socket address. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getRemoteAddress_Error_Tcp_001', 0,async function (done) {

      let tcp = socket.constructTCPSocketInstance();
      tcp.getRemoteAddress(async (err, data) => {
        console.log('test_Socket_getRemoteAddress_Error_Tcp_001' + JSON.stringify(err));
        expect(err.code==2301088);
         tcp.close();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_getRemoteAddress_Error_Tcp_002
     * @tc.name  : test_Socket_getRemoteAddress_Error_Tcp_002
     * @tc.desc  : Obtain the peer socket address. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getRemoteAddress_Error_Tcp_002', 0,async function (done) {

      let tcp = socket.constructTCPSocketInstance();
      let promise = tcp.getRemoteAddress();
      promise.catch(async err => {
        console.log('test_Socket_getRemoteAddress_Error_Tcp_002' + JSON.stringify(err));
        expect(err.code==2301088);
         tcp.close();
        done();
      })
    });


    /**
     * @tc.number: TEST_SOCKET_SETEXTRAOPTIONS_TCP_ERROR_001
     * @tc.name  : test_Socket_setExtraOptions_Tcp_Error_001
     * @tc.desc  : Set other properties of the TCP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_setExtraOptions_Tcp_Error_001', 0,async function (done) {

      let tcp = socket.constructTCPSocketInstance();
      // @ts-ignore
      tcp.setExtraOptions({
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000,
      },(err)=>{
       if(err){
         console.log('test_Socket_setExtraOptions_Tcp_Error_001 error err :' + JSON.stringify(err));
         expect(err.code == 2301009).assertTrue();
         tcp.close();
         done();
         // return;
       } else {
         console.log('test_Socket_setExtraOptions_Tcp_Error_001 success');
         tcp.close();
         done();
       }
      });
    });



    /**
     * @tc.number: TEST_SOCKET_GETSTATE_ERROR_TCP_001
     * @tc.name  : test_Socket_getState_Error_Tcp_001
     * @tc.desc  : Obtain the TCPSocket status. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getState_Error_Tcp_001', 0,async function (done) {
      let tcp = socket.constructTCPSocketInstance();
      tcp.getState(async (err, data) => {
        console.log("test_Socket_getState_Error_Tcp_001"+JSON.stringify(data));
        expect(err == undefined).assertTrue();
        tcp.close((err)=>{
          if(err){
            console.log('test_Socket_getState_Error_Tcp_002 close err' + JSON.stringify(err));
            done();
          }else {
            console.log('test_Socket_getState_Error_Tcp_002 close success' + JSON.stringify(err));
            setTimeout(function (){
              done();
              console.log('test_Socket_getState_Error_Tcp_002 close success' + JSON.stringify(err));
            },3000)
          }
        });
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETSTATE_ERROR_TCP_001
     * @tc.name  : test_Socket_getState_Error_Tcp_001
     * @tc.desc  : Obtain the TCPSocket status. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getState_Error_Tcp_002', 0,async function (done) {

      let tcp = socket.constructTCPSocketInstance();
      let promise = tcp.getState();
      promise.then(async data => {
        console.log('test_Socket_getState_Error_Tcp_002' + JSON.stringify(data));
        expect(data != null).assertTrue();
        tcp.close((err)=>{
          if(err){
            console.log('test_Socket_getState_Error_Tcp_002 close err' + JSON.stringify(err));
            tcp.close();
            done();
          }else {
            console.log('test_Socket_getState_Error_Tcp_002 close success' + JSON.stringify(err));
            setTimeout(function (){
              tcp.close();
              done();
              console.log('test_Socket_getState_Error_Tcp_002 close success' + JSON.stringify(err));
            },3000)
          }
        });
      })
    });


    /**
     * @tc.number: TEST_SOCKET_UDP_BIND_001
     * @tc.name  : test_Socket_Udp_Bind_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Udp_Bind_001', 0,async function (done) {
      let udp = socket.constructUDPSocketInstance();
      try {
        await udp.bind({ address: '127.0.0.1', port: 0, family: 1 });
        console.log('test_Socket_Udp_Bind_001 success')
        udp.close();
        done();
      } catch (err) {
        console.log('test_Socket_Udp_Bind_001 error' + JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: test_Socket_Udp_Bind_002
     * @tc.name  : test_Socket_Udp_Bind_002
     * @tc.desc  : Connect to the specified IP address and port. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Udp_Bind_002', 0,async function (done) {

      let udp = socket.constructUDPSocketInstance();
      try{
        let promise = udp.bind({ address: '127.0.0.1', port: 0, family: 1 });
        promise.then(async () => {
          console.log('bind success');

          udp.close();
          done();
        })} catch(err) {
        console.log('bind fail');
        done();
      };
    })

    /**
     * @tc.number: test_Socket_Send_Udp_001
     * @tc.name  : test_Socket_Send_Udp_001
     * @tc.desc  : Send data through the  UDP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Send_Udp_001', 0, async function (done) {
      let udp = socket.constructUDPSocketInstance();
      await udp.bind({ address: '127.0.0.1', port: 0, family: 1 });
      udp.send({
        data: '你好!123,string',
        address: {
          address: '127.0.0.1',
          port: 8888,
          family: 1
        }
      }, async err => {
        console.log('test_Socket_Send_Udp_001 err' + JSON.stringify(err))
        expect(err == undefined).assertTrue();
        udp.close();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_Send_Udp_Error_002
     * @tc.name  : test_Socket_Send_Udp_Error_002
     * @tc.desc  : Send data through the  UDP Socket connection. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Send_Udp_002', 0, async function (done) {

      let udp = socket.constructUDPSocketInstance();
      await udp.bind({ address: '127.0.0.1', port: 0, family: 1 });
      let promise = udp.send({
        data: '你好!123,string',
        address: {
          address: '127.0.0.1',
          port: 8888,
          family: 1
        }
      });
      promise.then(async err => {
        console.log('test_Socket_Send_Udp_002' + JSON.stringify(err));
        expect(err == undefined).assertTrue();
        udp.close();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_Close_Udp_Error_001
     * @tc.name  : test_Socket_Close_Udp_Error_001
     * @tc.desc  : Send data through the  UDP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Close_Udp_Error_001', 0, function (done) {

      let udp = socket.constructUDPSocketInstance();
      udp.close(err => {
        expect(err == undefined).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_Close_Udp_Error_002
     * @tc.name  : test_Socket_Close_Udp_Error_002
     * @tc.desc  : Send data through the  UDP Socket connection. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Close_Udp_Error_002', 0, function (done) {

      let udp = socket.constructUDPSocketInstance();
      let promise = udp.close();
      promise.then((err) => {
        console.log('test_Socket_Close_ UDP_Error_002' + JSON.stringify(err));
        expect(err == undefined).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: TEST_SOCKET_GETSTATE_ERROR_UDP_001
     * @tc.name  : test_Socket_getState_Error_Udp_001
     * @tc.desc  : Obtain the  UDPSocket status. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getState_Error_Udp_001', 0,async function (done) {
      let udp = socket.constructUDPSocketInstance();
      udp.getState(async (err, data) => {
        expect(err == undefined).assertTrue();
        udp.close();
        done();
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETSTATE_ERROR_UDP_001
     * @tc.name  : test_Socket_getState_Error_Udp_001
     * @tc.desc  : Obtain the  UDPSocket status. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getState_Error_Udp_002', 0,async function (done) {
      let udp = socket.constructUDPSocketInstance();
      let promise=udp.getState();
      promise.then(async data => {
        console.log('test_Socket_getState_Error_ UDP_002' + JSON.stringify(data));
        expect(data.isBound == false).assertTrue();
        expect(data.isClose == false).assertTrue();
        expect(data.isConnected == false).assertTrue();
        udp.close((err)=>{
          if(err){
            console.log('test_Socket_getState_Error_Tcp_002 close err' + JSON.stringify(err));
            udp.close();
            done();
          }else {
            console.log('test_Socket_getState_Error_Tcp_002 close success' + JSON.stringify(err));
            setTimeout(function (){
              udp.close();
              done();
              console.log('test_Socket_getState_Error_Tcp_002 close success' + JSON.stringify(err));
            },3000)
          }
        });
      })
    });

    /**
     * @tc.number: TEST_SOCKET_SETEXTRAOPTIONS_UDP_ERROR_002
     * @tc.name  : test_Socket_setExtraOptions_Udp_Error_002
     * @tc.desc  : Set other properties of the  UDP Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_setExtraOptions_Udp_Error_002', 0,async function (done) {

      let udp = socket.constructUDPSocketInstance();
      try {
        let promise = udp.setExtraOptions({
          // @ts-ignore
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: { on: true, linger: 10 },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000,
        });
        promise.then(()=>{
          console.log('test_Socket_setExtraOptions_Udp_Error_002' );
          done();
        }).catch(err=>{
          console.log('test_Socket_setExtraOptions_Udp_Error_002 err :' + JSON.stringify(err));
          expect(err.code == 2301088).assertTrue();
          done();
        })
      }catch (err){
        done();
      }
    });

    /**
     * @tc.number: TEST_SOCKET_TLS_BIND_001
     * @tc.name  : test_Socket_Tls_Bind_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tls_Bind_001', 0,async function (done) {

      let udp = socket.constructUDPSocketInstance();
      try {
        await udp.bind({ address: localIpAdressError, port: 0, family: 1 });
        console.log('test_Socket_Udp_Bind_001 success')
        done();
      } catch (err) {
        console.log('test_Socket_Udp_Bind_001 error' + JSON.stringify(err))
        done();
      }
    })

    /**
     * @tc.number: test_Socket_TLS_Bind_002
     * @tc.name  : test_Socket_Tls_Bind_002
     * @tc.desc  : Connect to the specified IP address and port. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Tls_Bind_002', 0,async function (done) {

      let tls = socket.constructUDPSocketInstance();
      try{
        let promise = tls.bind({ address: localIpAdressError, port: 0, family: 1 });
        promise.then(() => {
          console.log('bind success');
          done();
        })} catch(err) {
        console.log('bind fail');
        done();
      };
    })

    /**
     * @tc.number: test_Socket_Close_TLS_Error_001
     * @tc.name  : test_Socket_Close_Tls_Error_001
     * @tc.desc  : Send data through the Tls Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Close_Tls_Error_001', 0, function (done) {
      let tls = socket.constructUDPSocketInstance();
      tls.close(err => {
        expect(err == undefined).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_Close_TLS_Error_002
     * @tc.name  : test_Socket_Close_Tls_Error_002
     * @tc.desc  : Send data through the TLS Socket connection. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Close_Tls_Error_002', 0, function (done) {

      let tls = socket.constructUDPSocketInstance();
      let promise = tls.close();
      promise.then((err) => {
        console.log('test_Socket_Close_tls_Error_002' + JSON.stringify(err));
        expect(err == undefined).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_Send_TLS_Error_001
     * @tc.name  : test_Socket_Send_Tls_Error_001
     * @tc.desc  : Send data through the Tls Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Send_Tls_Error_001', 0, function (done) {

      let tls = socket.constructUDPSocketInstance();
      tls.send({
        data: '你好!123,string',
        address: {
          address: serverIpAddressError,
          port: 8888,
          family: 1
        }
      }, err => {
        console.log('test_Socket_Send_Tls_Error_001 err' + JSON.stringify(err))
        expect(err.code == 2301032).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: test_Socket_Send_TLS_Error_002
     * @tc.name  : test_Socket_Send_Tls_Error_002
     * @tc.desc  : Send data through the Tls Socket connection. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_Send_Tls_Error_002', 0, async function (done) {

      let tls = socket.constructUDPSocketInstance();
      let promise = tls.send({
        data: '你好!123,string',
        address: {
          address: serverIpAddressError,
          port: 8888,
          family: 1
        }
      });

      promise.catch(err => {
        console.log('test_Socket_Send_Udp_Error_002' + JSON.stringify(err));
        expect(err.code == 2301032).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: TEST_SOCKET_TLS_CONNECT_001
     * @tc.name  : test_Socket_tls_Connect_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_tls_Connect_Error_001', 0,async function (done) {

      let tls = socket.constructTLSSocketInstance();
      try {
        await tls.bind({ address: localIpAdressError, port: 0, family: 1 });
        console.log('test_Socket_tls_Connect_001 bind success')
        // @ts-ignore
        tls.connect({ address: { address: serverIpAddressError, port: 8888, family: 1 }, timeout: 6000 }, err => {
          console.info('test_Socket_tls_Connect_001 err' + JSON.stringify((err)));
          expect(err.code == 2301101);
          expect(err.message == 'Network unreachable');
          done();
        })
      } catch (err) {
        console.log('test_Socket_tls_Connect_001 error' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number: TEST_SOCKET_TLS_CONNECT_ERROR_002
     * @tc.name  : test_Socket_tls_Connect_Error_002
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_tls_Connect_Error_002', 0,async function (done) {

      let tls = socket.constructTLSSocketInstance();
      try {
        console.log('test_Socket_tls_Connect_002 bind success')
        // @ts-ignore
        tls.connect({ address: { address: serverIpAddressError, port: 8888, family: 1 }, timeout: 6000 }, err => {
          console.info('test_Socket_tls_Connect_002 err' + JSON.stringify((err)));
          expect(err.code == 2301088);
          expect(err.message == 'Not a socket');
          done();
        })
      } catch (err) {
        console.log('test_Socket_tls_Connect_002 error' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number: TEST_SOCKET_TLS_CONNECT_PROMISE_ERROR_001
     * @tc.name  : test_Socket_tls_Connect_Promise_Error_001
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_tls_Connect_Promise_Error_001', 0,async function (done) {

      let tls = socket.constructTLSSocketInstance();
      try {
        await tls.bind({ address: localIpAdressError, port: 0, family: 1 });
        console.log('test_Socket_tls_Connect_Promise_Error_001 bind success')
        // @ts-ignore
        let promise = tls.connect({ address: { address: serverIpAddressError, port: 8888, family: 1 }, timeout: 6000 });
        promise.catch(err => {
          console.log('test_Socket_tls_Connect_Promise_Error_001 error' + JSON.stringify(err));
          expect(err.code==2301101);
          done();
        })
      } catch (err) {
        console.log('test_Socket_tls_Connect_Promise_Error_001 error' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number: TEST_SOCKET_TLS_CONNECT_PROMISE_ERROR_002
     * @tc.name  : test_Socket_tls_Connect_Promise_Error_002
     * @tc.desc  : Connect to the specified IP address and port. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_tls_Connect_Promise_Error_002', 0,async function (done) {

      let tls = socket.constructTLSSocketInstance();
      try {
        console.log('test_Socket_tls_Connect_Promise_Error_002 bind success')
        // @ts-ignore
        let promise = tls.connect({ address: { address: serverIpAddressError, port: 8888, family: 1 }, timeout: 6000 });
        promise.catch(err => {
          console.log('test_Socket_tls_Connect_Promise_Error_002 error' + JSON.stringify(err));
          expect(err.code==2301088);
          done();
        })
      } catch (err) {
        console.log('test_Socket_tls_Connect_Promise_Error_001 error' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number: test_Socket_getRemoteAddress_Error_TLS_001
     * @tc.name  : test_Socket_getRemoteAddress_Error_TLS_001
     * @tc.desc  : Obtain the peer socket address. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getRemoteAddress_Error_TLS_001', 0,async function (done) {
      let TLS = socket.constructTLSSocketInstance();
      TLS.getRemoteAddress((err, data) => {
        console.log('test_Socket_getRemoteAddress_Error_TLS_001' + JSON.stringify(err));
        expect(err.code==2301088);
        done();
      })
    });

    /**
     * @tc.number: test_Socket_getRemoteAddress_Error_TLS_002
     * @tc.name  : test_Socket_getRemoteAddress_Error_TLS_002
     * @tc.desc  : Obtain the peer socket address. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getRemoteAddress_Error_TLS_002', 0,async function (done) {
      let TLS = socket.constructTLSSocketInstance();
      let promise = TLS.getRemoteAddress();
      promise.catch(err => {
        console.log('test_Socket_getRemoteAddress_Error_TLS_002' + JSON.stringify(err));
        expect(err.code==2301088);
        done();
      })
    });

    /**
     * @tc.number: TEST_SOCKET_GETSTATE_ERROR_TLS_001
     * @tc.name  : test_Socket_getState_Error_TLS_001
     * @tc.desc  : Obtain the TLSSocket status. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getState_Error_TLS_001', 0,async function (done) {
      let TLS = socket.constructTLSSocketInstance();
      TLS.getState((err, data) => {
        expect(err == undefined).assertTrue();
        done();
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETSTATE_ERROR_TLS_001
     * @tc.name  : test_Socket_getState_Error_TLS_001
     * @tc.desc  : Obtain the TLSSocket status. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getState_Error_TLS_002', 0,async function (done) {
      let TLS = socket.constructTLSSocketInstance();
      let promise=TLS.getState();
      promise.then(data => {
        console.log('test_Socket_getState_Error_TLS_002' + JSON.stringify(data));
        expect(data.isBound == false).assertTrue();
        expect(data.isClose == true).assertTrue();
        expect(data.isConnected == false).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: TEST_SOCKET_SETEXTRAOPTIONS_TLS_ERROR_001
     * @tc.name  : test_Socket_setExtraOptions_TLS_Error_001
     * @tc.desc  : Set other properties of the TLS Socket connection. Use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_setExtraOptions_TLS_Error_001', 0,async function (done) {
      let TLS = socket.constructTLSSocketInstance();
      TLS.setExtraOptions({
        keepAlive: true,
        OOBInline: true,
        // @ts-ignore
        TLSNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000,
      }, err => {
        console.log('test_Socket_setExtraOptions_TLS_Error_001' + JSON.stringify(err));
        expect(err.code == 2303600).assertTrue();
        done();
      });
    });

    /**
     * @tc.number: TEST_SOCKET_SETEXTRAOPTIONS_TLS_ERROR_002
     * @tc.name  : test_Socket_setExtraOptions_TLS_Error_002
     * @tc.desc  : Set other properties of the TLS Socket connection. Use the promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_setExtraOptions_TLS_Error_002', 0,async function (done) {

      let TLS = socket.constructTLSSocketInstance();
      let promise = TLS.setExtraOptions({
        keepAlive: true,
        OOBInline: true,
        // @ts-ignore
        TLSNoDelay: true,
        socketLinger: { on: true, linger: 10 },
        receiveBufferSize: 1000,
        sendBufferSize: 1000,
        reuseAddress: true,
        socketTimeout: 3000,
      });
      promise.catch(err => {
        console.log('test_Socket_setExtraOptions_Tls_Error_001' + JSON.stringify(err));
        expect(err.code == 2303600).assertTrue();
        done();
      })
    });

    /**
     * @tc.number: TEST_SOCKET_GETCERTIFICATE_TLS_ERROR_001
     * @tc.name  : test_Socket_getCertificate_TLS_Error_001
     * @tc.desc  : After the TLSSocket communication connection is successful, obtain the local digital certificate. This interface is only applicable for bidirectional authentication, and use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getCertificate_TLS_Error_001', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      tls.getCertificate((err, data) => {
        if (err) {
          console.log("getCertificate callback error = " + JSON.stringify(err));
          expect(err.code==2303600).assertTrue();
          done();
        } else {
          console.log("getCertificate callback = " + data);
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETCERTIFICATE_TLS_ERROR_002
     * @tc.name  : test_Socket_getCertificate_TLS_Error_002
     * @tc.desc  : After the TLSSocket communication connection, obtain the local digital certificate. This interface is only applicable for bidirectional authentication, using the Promise method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getCertificate_TLS_Error_002', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      tls.getCertificate((err, data) => {
        if (err) {
          console.log("getCertificate callback error = " + JSON.stringify(err));
          expect(err.code==2303600).assertTrue();
          done();
        } else {
          console.log("getCertificate callback = " + data);
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETREMOTECERTIFICATE_TLS_ERROR_001
     * @tc.name  : test_Socket_getRemoteCertificate_TLS_Error_001
     * @tc.desc  : After the TLSSocket communication connection is successful, obtain the digital certificate of the server and use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getRemoteCertificate_TLS_Error_001', 0,async function (done) {

      let tls = socket.constructTLSSocketInstance();
      tls.getRemoteCertificate((err, data) => {
        if (err) {
          console.log("getRemoteCertificate callback error = " + JSON.stringify(err));
          expect(err.code==2303600).assertTrue();
          done();
        } else {
          console.log("getRemoteCertificate callback = " + data);
          done();
        }
      });
    });

    /**
     * @tc.number: test_Socket_getRemoteCertificate_TLS_Error_002
     * @tc.name  : test_Socket_getRemoteCertificate_TLS_Error_002
     * @tc.desc  : After the TLSSocket communication connection is successful, obtain the digital certificate of the server and use the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getRemoteCertificate_TLS_Error_002', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      tls.getRemoteCertificate().then(data => {
        // @ts-ignore
        console.log('test_Socket_getRemoteCertificate_TLS_Error_002'+data);
        done();
      }).catch(err => {
        console.error('test_Socket_getRemoteCertificate_TLS_Error_002 catch'+JSON.stringify(err));
        expect(err.code==2303600).assertTrue();
        done();
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETPROTOCOL_TLS_ERROR_001
     * @tc.name  : test_Socket_getProtocol_TLS_Error_001
     * @tc.desc  :
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getProtocol_TLS_Error_001', 0,async function (done) {

      let tls = socket.constructTLSSocketInstance();
      tls.getProtocol((err, data) => {
        if (err) {
          console.log("getProtocol callback error = " + JSON.stringify(err));
          expect(err.code==2303600).assertTrue();
          done();
        } else {
          console.log("getProtocol callback = " + data);
          done();
        }
      });
    });

    /**
     * @tc.number: test_Socket_GETPROTOCOL_TLS_Error_002
     * @tc.name  : test_Socket_getProtocol_TLS_Error_002
     * @tc.desc  :
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getProtocol_TLS_Error_002', 0,async function (done) {

      let tls = socket.constructTLSSocketInstance();
      tls.getProtocol().then(data => {
        console.log(data);
        done();
      }).catch(err => {
        console.error('test_Socket_getProtocol_TLS_Error_002'+ JSON.stringify(err));
        expect(err.code==2303600).assertTrue();
        done();
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETCIPHERSUITE_TLS_ERROR_001
     * @tc.name  : test_Socket_getCipherSuite_TLS_Error_001
     * @tc.desc  :
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getCipherSuite_TLS_Error_001', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      tls.getCipherSuite((err, data) => {
        if (err) {
          console.log("getCipherSuite callback error = " + JSON.stringify(err));
          expect(err.code==2303600).assertTrue();
          done();
        } else {
          console.log("getCipherSuite callback = " + data);
          done();
        }
      });
    });

    /**
     * @tc.number: test_Socket_GETCIPHERSUITE_TLS_Error_002
     * @tc.name  : test_Socket_getCipherSuite_TLS_Error_002
     * @tc.desc  :
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getCipherSuite_TLS_Error_002', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      tls.getCipherSuite().then(data => {
        console.log('getCipherSuite success:' + JSON.stringify(data));
        done();
      }).catch(err => {
        console.error(err);
        expect(err.code==2303600).assertTrue();
        done();
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETSIGNATUREALGORITHMS_TLS_ERROR_001
     * @tc.name  : test_Socket_getSignatureAlgorithms_TLS_Error_001
     * @tc.desc  :
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getSignatureAlgorithms_TLS_Error_001', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      tls.getSignatureAlgorithms((err, data) => {
        if (err) {
          console.log("getSignatureAlgorithms callback error = " + err);
          expect(err.code==2303600).assertTrue();
          done();
        } else {
          console.log("getSignatureAlgorithms callback = " + data);
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_SOCKET_GETSIGNATUREALGORITHMS_TLS_ERROR_002
     * @tc.name  : test_Socket_getSignatureAlgorithms_TLS_Error_002
     * @tc.desc  :
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('test_Socket_getSignatureAlgorithms_TLS_Error_002', 0,async function (done) {
      let tls = socket.constructTLSSocketInstance();
      tls.getSignatureAlgorithms().then(data => {
        console.log("getSignatureAlgorithms success" + data);
        done();
      }).catch(err => {
        console.error(err);
        expect(err.code==2303600).assertTrue();
        done();
      });
    });

    console.log("************* socket Test end*************");

  })
}