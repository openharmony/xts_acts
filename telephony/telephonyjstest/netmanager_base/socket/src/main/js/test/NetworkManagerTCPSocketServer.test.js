/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import socket from "@ohos.net.socket";

let address = {
    address: "192.168.0.1",
    port: 5555,
    family: 1
}

let sendOptions1 = {
    data: "hello!",
    encoding: "UTF-8"
}
let sendOptions2 = {
    data: { [Symbol.toStringTag]: "hello" }.toString(),
    encoding: "UTF-8"
}

let TCPExtraOptions = {
    keepAlive: true,
    OOBInline: true,
    TCPNoDelay: true,
    socketLinger: { on: true, linger: 10 },
    receiveBufferSize: 1000,
    sendBufferSize: 1000,
    reuseAddress: true,
    socketTimeout: 3000,
}

function expectFalse() {
    try {
        expect().assertFail();
    } catch (err) {
        console.info('assertion failure');
    }
}

export default function NetTCPSocketServerTest() {
    describe('NetTCPSocketServerTest', function () {

        /**
         * @tc.number NetworkManager_constructTCPSocketServerInstance_0100
         * @tc.name Test create constructTCPSocketServerInstance object
         * @tc.desc Function test
         */
        it('NetworkManager_constructTCPSocketServerInstance_0100', 0, async function (done) {
            let server = socket.constructTCPSocketServerInstance();
            if (server != undefined) {
                expect(server).assertInstanceOf('Object');
                done();
            } else {
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_listen_Async_0100
         * @tc.name Test listen() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_listen_Async_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_listen_Async_0100';
            let server = socket.constructTCPSocketServerInstance();
            server.listen(address, (err, data) => {
                if (err) {
                    console.log(`${caseName} listen failed: ${JSON.stringify(err)}`);
                    done();
                } else {
                    expect(data).assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_listen_Async_0200
         * @tc.name Test listen() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_listen_Async_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_listen_Async_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.listen(null, (err, data) => {
                    if (err) {
                        console.log(`${caseName} listen failed, err: ${JSON.stringify(err)}`);
                        done();
                    } else {
                        expect(data).assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_listen_Async_0300
         * @tc.name Test listen() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_listen_Async_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_listen_Async_0300';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.listen(address, (err, data) => {
                    if (err) {
                        console.log(`${caseName} listen failed, err: ${JSON.stringify(err)}`);
                        done();
                    } else {
                        expect(data).assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_listen_Promise_0100
         * @tc.name Test listen() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_listen_Promise_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_listen_Promise_0100';
            let server = socket.constructTCPSocketServerInstance();
            server.listen(address).then((data) => {
                expect(data).assertFail();
                done();
            }).catch((err) => {
                console.log(`${caseName} listen failed: ${JSON.stringify(err)}`);
                done();
            });
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_connect_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_connect_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_connect_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", data => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    expect(typeof (data)).assertEqual('object');
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_connect_0200
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_connect_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_connect_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on(null, data => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    expectFalse();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(401);
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_connect_0100
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_connect_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_connect_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", data => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                });
                server.off("connect", data => {
                    console.log(`${caseName} off connect success ${JSON.stringify(data)}`);
                    expect(typeof (data)).assertEqual('object');
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_connect_0200
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_connect_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_connect_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", data => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                });
                server.off(null, data => {
                    console.log(`${caseName} off connect success ${JSON.stringify(data)}`);
                    expectFalse();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(401);
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_connect_0300
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_connect_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_connect_0300';
            let server = socket.constructTCPSocketServerInstance();
            server.on("connect", data => {
                console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
            });
            server.off("connect");
            expect(true).assertTrue();
            done();
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_send_Async_0100
         * @tc.name Test send() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_send_Async_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_send_Async_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.send(sendOptions1, (data, err) => {
                        if (err) {
                            expectFalse();
                            done();
                            return;
                        } else {
                            console.log(`${caseName} send success ${JSON.stringify(data)}`);
                            done();
                            return;
                        }
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_send_Async_0200
         * @tc.name Test send() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_send_Async_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_send_Async_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.send(sendOptions2, (data, err) => {
                        if (err) {
                            expectFalse();
                            done();
                            return;
                        } else {
                            console.log(`${caseName} send success ${JSON.stringify(data)}`);
                            done();
                            return;
                        }
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_send_Async_0300
         * @tc.name Test send() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_send_Async_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_send_Async_0300';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.send(null, (err, data) => {
                            if (err) {
                                console.log(`${caseName} send failed ${JSON.stringify(err)}`);
                                done();
                                return;
                            } else {
                                expectFalse();
                                done();
                                return;
                            }
                        });
                    } catch (error) {
                        console.log(`${caseName} catch error, expect send error: [${error.code}, ${error.message}]`);
                        expect(error.code).assertEqual(401);
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect connect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_send_Promise_0100
         * @tc.name Test send() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_send_Promise_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_send_Promise_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.send(sendOptions1).then((data) => {
                        console.log(`${caseName} send success ${JSON.stringify(data)}`);
                        done();
                        return;
                    }).catch((err) => {
                        expectFalse();
                        done();
                        return;
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_send_Promise_0200
         * @tc.name Test send() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_send_Promise_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_send_Promise_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.send(sendOptions2).then((data) => {
                        console.log(`${caseName} send success ${JSON.stringify(data)}`);
                        done();
                        return;
                    }).catch((err) => {
                        expectFalse();
                        done();
                        return;
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_close_Async_0100
         * @tc.name Test close() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_close_Async_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_close_Async_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.close((data, err) => {
                        if (err) {
                            expectFalse();
                            done();
                            return;
                        } else {
                            console.log(`${caseName} close success ${JSON.stringify(data)}`);
                            done();
                            return;
                        }
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_close_Promise_0100
         * @tc.name Test close() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_close_Promise_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_close_Promise_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.close().then((data) => {
                        console.log(`${caseName} close success ${JSON.stringify(data)}`);
                        done();
                        return;
                    }).catch((err) => {
                        expectFalse();
                        done();
                        return;
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_getRemoteAddress_Async_0100
         * @tc.name Test getRemoteAddress() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_getRemoteAddress_Async_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_getRemoteAddress_Async_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.getRemoteAddress((data, err) => {
                        if (err) {
                            expectFalse();
                            done();
                            return;
                        } else {
                            console.log(`${caseName} getRemoteAddress success ${JSON.stringify(data)}`);
                            done();
                            return;
                        }
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_getRemoteAddress_Promise_0100
         * @tc.name Test getRemoteAddress() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_getRemoteAddress_Promise_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_getRemoteAddress_Promise_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.getRemoteAddress().then((data) => {
                        console.log(`${caseName} getRemoteAddress success ${JSON.stringify(data)}`);
                        done();
                        return;
                    }).catch((err) => {
                        expectFalse();
                        done();
                        return;
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_getState_Async_0100
         * @tc.name Test getState() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_getState_Async_0100', 0, async function (done) {
            let server = socket.constructTCPSocketServerInstance();
            server.getState((err, data) => {
                if (err) {
                    expect().assertFail();
                    done();
                } else {
                    expect(data.isBound).assertEqual(false)
                    expect(data.isClose).assertEqual(true)
                    expect(data.isConnected).assertEqual(false)
                    done();
                }
            });
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_getState_Promise_0100
         * @tc.name Test getState() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_getState_Promise_0100', 0, async function (done) {
            let server = socket.constructTCPSocketServerInstance();
            server.getState().then((data) => {
                expect(data.isBound).assertEqual(false)
                expect(data.isClose).assertEqual(true)
                expect(data.isConnected).assertEqual(false)
                done();
            }).catch((err) => {
                expect(err).assertFail();
                done();
            });
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Async_0100
         * @tc.name Test setExtraOptions() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_setExtraOptions_Async_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Async_0100';
            let server = socket.constructTCPSocketServerInstance();
            server.setExtraOptions(TCPExtraOptions, (data, err) => {
                if (err) {
                    console.log(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
                    expect(err).assertFail();
                    done();
                } else {
                    console.log(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
                    expect(data != undefined).assertEqual(true);
                    done();
                }
            });
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Async_0200
         * @tc.name Test setExtraOptions() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_setExtraOptions_Async_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Async_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.setExtraOptions(null, (err, data) => {
                    if (err) {
                        console.log(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.log(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
                        expect(data).assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Async_0300
         * @tc.name Test setExtraOptions() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_setExtraOptions_Async_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Async_0300';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.setExtraOptions(TCPExtraOptions.keepAlive, (err, data) => {
                    if (err) {
                        console.log(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.log(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
                        expect(data).assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_setExtraOptions_Promise_0100
         * @tc.name Test setExtraOptions() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_setExtraOptions_Promise_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_setExtraOptions_Promise_0100';
            let server = socket.constructTCPSocketServerInstance();
            server.setExtraOptions(TCPExtraOptions).then((data) => {
                console.log(`${caseName} setExtraOptions success, data: ${JSON.stringify(data)}`);
                expect(data).assertFail();
                done();
            }).catch((err) => {
                console.log(`${caseName} setExtraOptions failed, err: ${JSON.stringify(err)}`);
                expect(err != undefined).assertEqual(true);
                done();
            });
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_message_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_message_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_message_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on("message", data => {
                            console.log(`${caseName} on message success ${JSON.stringify(data)}`);
                            expect(typeof (data)).assertEqual('object');
                            done();
                        });
                    } catch (err) {
                        console.log(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
                        expectFalse();
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_message_0200
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_message_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_message_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on(null, data => {
                            console.log(`${caseName} on message success ${JSON.stringify(data)}`);
                            expectFalse();
                            done();
                        });
                    } catch (err) {
                        console.log(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
                        expect(err.code).assertEqual(401);
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_message_0100
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_message_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_message_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on("message", data => {
                            console.log(`${caseName} on message success ${JSON.stringify(data)}`);
                        });
                        data.off("message", data => {
                            console.log(`${caseName} off message success ${JSON.stringify(data)}`);
                            expect(typeof (data)).assertEqual('object');
                            done();
                        });
                    } catch (err) {
                        console.log(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
                        expectFalse();
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_message_0200
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_message_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_message_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on("message", data => {
                            console.log(`${caseName} on message success ${JSON.stringify(data)}`);
                        });
                        data.off(null, data => {
                            console.log(`${caseName} off message success ${JSON.stringify(data)}`);
                            expectFalse();
                            done();
                        });
                    } catch (error) {
                        console.log(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
                        expect(error.code).assertEqual(401);
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_message_0300
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_message_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_message_0300';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.on("message", data => {
                        console.log(`${caseName} on message success ${JSON.stringify(data)}`);
                    });
                    data.off("message");
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_close_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_close_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_close_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on("close", data => {
                            console.log(`${caseName} on close success ${JSON.stringify(data)}`);
                            expect(data != undefined).assertEqual(true);
                            done();
                        });
                    } catch (err) {
                        console.log(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
                        expectFalse();
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_close_0200
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_close_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_close_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on(null, data => {
                            console.log(`${caseName} on close success ${JSON.stringify(data)}`);
                            expectFalse();
                            done();
                        });
                    } catch (err) {
                        console.log(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
                        expect(err.code).assertEqual(401);
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_close_0100
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_close_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_close_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on("close", data => {
                            console.log(`${caseName} on close success ${JSON.stringify(data)}`);
                        });
                        data.off("close", data => {
                            console.log(`${caseName} off close success ${JSON.stringify(data)}`);
                            expect(data != undefined).assertEqual(true);
                            done();
                        });
                    } catch (err) {
                        console.log(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
                        expectFalse();
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_close_0200
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_close_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_close_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on("close", data => {
                            console.log(`${caseName} on close success ${JSON.stringify(data)}`);
                        });
                        data.off(null, data => {
                            console.log(`${caseName} off close success ${JSON.stringify(data)}`);
                            expectFalse();
                            done();
                        });
                    } catch (err) {
                        console.log(`${caseName} catch err, expect err: [${err.code}, ${err.message}]`);
                        expect(err.code).assertEqual(401);
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_close_0300
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_close_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_close_0300';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.on("close", data => {
                        console.log(`${caseName} on close success ${JSON.stringify(data)}`);
                    });
                    data.off("close");
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_error_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_error_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_error_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.on("error", err => {
                        console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_error_0200
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_error_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_error_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on(null, err => {
                            console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                            expect().assertFail();
                            done();
                        });
                    } catch (error) {
                        console.log(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
                        expect(error.code).assertEqual(401);
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_error_0100
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_error_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_error_0100';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.on("error", err => {
                        console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                    });
                    data.off("error", err => {
                        console.log(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
                        expect().assertFail();
                        done();
                    });
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_error_0200
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_error_0200', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_error_0200';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    try {
                        data.on("error", err => {
                            console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                        });
                        data.off(null, err => {
                            console.log(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
                            expect().assertFail();
                            done();
                        });
                    } catch (error) {
                        console.log(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
                        expect(error.code).assertEqual(401);
                        done();
                        return;
                    }
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_error_0300
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_error_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_error_0300';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("connect", (data) => {
                    console.log(`${caseName} on connect success ${JSON.stringify(data)}`);
                    data.on("error", err => {
                        console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                    });
                    data.off("error")
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_on_error_0300
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_on_error_0300', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_on_error_0300';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("error", err => {
                    console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_error_0400
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_error_0400', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_error_0400';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("error", err => {
                    console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                });
                server.off("error", err => {
                    console.log(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_error_0500
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_error_0500', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_error_0500';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("error", err => {
                    console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                });
                server.off(null, err => {
                    console.log(`${caseName} off err failed, err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(`${caseName} catch err, expect err: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(401);
                done();
                return;
            }
        });

        /**
         * @tc.number NetworkManager_TCPSocketServer_off_error_0600
         * @tc.name Test off() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TCPSocketServer_off_error_0600', 0, async function (done) {
            let caseName = 'NetworkManager_TCPSocketServer_off_error_0600';
            let server = socket.constructTCPSocketServerInstance();
            try {
                server.on("error", err => {
                    console.log(`${caseName} on err failed, err: ${JSON.stringify(err)}`);
                });
                server.off("error")
                expect().assertFail();
                done();
            } catch (error) {
                console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                return;
            }
        });
    });
}