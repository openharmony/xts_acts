/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium';
import socket from "@ohos.net.socket";
import { BusinessError, Callback } from '@ohos.base';
import { ArrayBufferToString } from './utils/index';

function expectSuccess(): void {
  expect(true).assertTrue();
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
};


function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
};

function expectFalse(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertFalse();
  } catch (err) {
    console.info(`${info} test failed`);
  }
};

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    console.info('JSON.stringify(exp),JSON.stringify(assert)' + JSON.stringify(exp), JSON.stringify(assert))
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
};

export default function TCPSocketTest() {
  describe('ActsTCPSocketTest', () => {

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_ConstructTCPSocketInstance_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConstructTCPSocketInstance0100
     * @tc.desc  : Create a TCP Socket object
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConstructTCPSocketInstance0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConstructTCPSocketInstance0100';
      console.info(`${caseName} test start `);
      try {
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        console.info(`${caseName} success`);
        expect(tcp).assertInstanceOf('Object');
        done();
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0100
     * @tc.desc  : Bind IP address and port,Only fill in IPV4 address;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 1
     */
    it('testNetworkMgrSocketTCPSocketBind0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0100';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1'
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0300
     * @tc.desc  : Bind IP address and port,the address and protocol are both IPV6;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 1
     */
    it('testNetworkMgrSocketTCPSocketBind0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0300';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          family:2
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectTrue(err.code===2301022);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0500
     * @tc.desc  : Bind IP address and port,bad address;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0500';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '100.0.0.0',
          port: 4444,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectEqual(err.code, 2301099);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0600
     * @tc.desc  : Bind IP address and port,Port is boundary -1;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0600';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0700
     * @tc.desc  : Bind IP address and port,port is boundary 0;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0700';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0800
     * @tc.desc  : Bind IP address and port,Port is boundary 65535;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0800';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_0900
     * @tc.name  : testNetworkMgrSocketTCPSocketBind0900
     * @tc.desc  : Bind IP address and port,Port is boundary 65536;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind0900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind0900';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1000
     * @tc.desc  : Bind IP address and port, bad family;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1000';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4554,
          family: 3
        };
        tcp.bind(bindAddress, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1100
     * @tc.desc  : Bind IP address and port,Input parameter is null;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1100';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(null, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1200
     * @tc.desc  : Bind IP address and port,Input parameter is undefined;  callback
     * @tc.size  :  MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1200';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(undefined, (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail err:${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1300
     * @tc.desc  : Bind IP address and port,Only fill in IPV4 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1300';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1'
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1400
     * @tc.desc  : Bind IP address and port,Only fill in IPV6 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1400';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12'
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectSuccess();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1500
     * @tc.desc  : Bind IP address and port,The address and protocol are both IPV6; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1500';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          family:2
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301022);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1600
     * @tc.desc  : Bind IP address and port,Address and protocol inversion; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1600';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 7458,
          family: 2
        };
        tcp.bind(bindAddress).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1700
     * @tc.desc  : Bind IP address and port, bad address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1700';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '100.0.0.1',
          port: 7586,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectEqual(err.code, 2301099);
          done();
        }).finally(() => {
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1800
     * @tc.desc  : Bind IP address and port,Port number is -1; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1800';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketBind1900
     * @tc.desc  : Bind IP address and port,Port number is 0; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind1900';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2000
     * @tc.desc  : Bind IP address and port,Port number is 65535; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2000';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2100
     * @tc.desc  : Bind IP address and port,Port number is 65536; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2100';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2200
     * @tc.desc  : Bind IP address and port, bad family; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2200';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 6335,
          family: 3
        };
        tcp.bind(bindAddress).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end `);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2300
     * @tc.desc  : Bind IP address and port with null; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2300';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(null).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Bind_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketBind2400
     * @tc.desc  : Bind IP address and port with undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketBind2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketBind2400';
      try {
        console.info(`${caseName} test start `);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        tcp.bind(undefined).then(() => {
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
          done();
        }).finally(() => {
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0100
     * @tc.desc  : Connect to the specified server IP address and port; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4001,
          family: 1
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:listenAddress
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0200
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is null; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4002,
          family: 1
        };
        await tcp.bind(bindAddress);
        tcp.connect(null, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0300
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0300';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4003,
          family: 1
        };
        await tcp.bind(bindAddress);
        tcp.connect(undefined, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===401);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0400
     * @tc.desc  : Connect to the specified IP address and port,Set timeout and address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0400';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4004,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4004,
            family: 1
          },
          timeout:5000
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0500
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0500
     * @tc.desc  : Connect to the specified IP address and port,hour is undefined; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0500';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4005,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress,
          timeout:undefined
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0600
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0600
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV4 address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0600';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4006,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1'
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===2301115);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0700
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0700
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV6 address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0700';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4007,
          family: 2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: 'fe80::b3b:ecb5:77f:88dc%12'
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch  fail ${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_0800
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect0800
     * @tc.desc  : Connect to the specified IP address and port,The address and protocol  are both IPV6; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect0800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect0800';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4008,
          family: 2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1000
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1000
     * @tc.desc  : Connect to the specified IP address and port,bad address; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1000';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4010,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '100.0.0.0',
            port: 4010,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===2301022);
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1100
     * @tc.desc  : Connect to the specified IP address and port,Port is -1; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: -1,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: -1,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1200
     * @tc.desc  : Connect to the specified IP address and port,Port is -0; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 0,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 0,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err.code === 2301115) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectSuccess();
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1300
     * @tc.desc  : Connect to the specified IP address and port,Port is 65535; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1300';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65535,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 65535,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err.code === 2301115) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectSuccess();
          } else {
            console.info(`${caseName} success`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1400
     * @tc.desc  : Connect to the specified IP address and port,Port is 65536; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1400';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 65536,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 65536,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} success`);
            expectSuccess();
          } else {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectSuccess();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1500
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1500
     * @tc.desc  : Connect to the specified IP address and port,bad family; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1500';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4015,
          family: 1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4015,
            family: 3
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectFail();
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1600
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1600
     * @tc.desc  : Connect to the specified IP address and port,Connect without binding or listening; callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1600';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4016,
            family: 1
          }
        };
        tcp.connect(tcpConnectOptions, async (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} fail ${JSON.stringify(err)}`);
            expectTrue(err.code===2301115);
          } else {
            console.info(`${caseName} success`);
            expectSuccess();
          }
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail ${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1700
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1700
     * @tc.desc  : Connect to the specified server IP address and port; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1700', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1700';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        expect(tcpServer).assertInstanceOf('Object');
        let listenAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4017
        };
        await tcpServer.listen(listenAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 4017
          },
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1800
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1800
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is null; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1800', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1800';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4018
        };
        await tcp.bind(bindAddress);
        tcp.connect(null).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_1900
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect1900
     * @tc.desc  : Connect to the specified IP address and port,Input parameter is undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect1900', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect1900';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4019
        };
        await tcp.bind(bindAddress);
        tcp.connect(undefined).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===401);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2000
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2000
     * @tc.desc  : Connect to the specified IP address and port,Set timeout and address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2000', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2000';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4020,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:  {
            address: '127.0.0.1',
            port: 4020,
            family:1
          },
          timeout:5000
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2100
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2100
     * @tc.desc  : Connect to the specified IP address and port,hour is undefined; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2100';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4021,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address:  {
            address: '127.0.0.1',
            port: 4021
          },
          timeout:undefined
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2200
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2200
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV4 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2200';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: '127.0.0.1',
          port: 4022,
          family:1
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1'
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail err:${JSON.stringify(err)}`);
          expectTrue(err.code===2301115);
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2300
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2300
     * @tc.desc  : Connect to the specified IP address and port, only has an IPV6 address; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2300';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4023,
          family:2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: {
            address:'fe80::b3b:ecb5:77f:88dc%12'
          }
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocket_Connect_2400
     * @tc.name  : testNetworkMgrSocketTCPSocketConnect2400
     * @tc.desc  : Connect to the specified IP address and port,The address and protocol  are both IPV6; promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTCPSocketConnect2400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketConnect2400';
      try {
        console.info(`${caseName} test start`);
        let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
        expect(tcp).assertInstanceOf('Object');
        let bindAddress: socket.NetAddress = {
          address: 'fe80::b3b:ecb5:77f:88dc%12',
          port: 4024,
          family:2
        };
        await tcp.bind(bindAddress);
        let tcpConnectOptions: socket.TCPConnectOptions = {
          address: bindAddress
        };
        tcp.connect(tcpConnectOptions).then(() => {
          console.info(`${caseName} success`);
          expectSuccess();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName}  fail err:${JSON.stringify(err)}`);
          expectFail();
          done();
        }).finally(async () => {
          await tcp.close();
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        expectTrue(err.code===2301022);
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}