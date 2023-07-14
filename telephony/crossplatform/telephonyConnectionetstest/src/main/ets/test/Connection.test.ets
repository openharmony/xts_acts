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
import connection from '@ohos.net.connection'

export default function connectionTest() {
  describe('connectionTest', function () {
    const TIMEOUT = 100;
    const DELAY = 1000;
    const NETID_IVVALID = 99;
    const NETID_IVVALID2 = 0;
    let envReady = false;

    /*
     * @tc.number: TEST_CREATE_NET_CONNECTION_001
     * @tc.name  : testCreateNetConnection001
     * @tc.desc  : Create a network connection with optional netSpecifier and timeout.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testCreateNetConnection001', 0, function (done) {
      try {
        connection.createNetConnection();
        console.log("create success11:" + connection.createNetConnection);
        expect(true).assertTrue();
        done();
      } catch (error) {
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: TEST_HAS_DEFAULT_NET_001
     * @tc.name  : testHasDefaultNet001
     * @tc.desc  : Checks whether the default data network is activated.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testHasDefaultNet001', 0, function (done) {
      console.log('testHasDefaultNet001 1')
      connection.hasDefaultNet((error, value) => {
        console.log('testHasDefaultNet001 2')
        if (!error) {
          console.log('testHasDefaultNet001 3')
          console.log(`testHasDefaultNet001 case success,data:` + value);
          console.log('testHasDefaultNet001 4')
          expect(value).assertTrue();
          done();
        } else {
          console.log('testHasDefaultNet001 6')
          console.log(`testHasDefaultNet001 error, case failed,errCode:` + error.code);
          console.log('testHasDefaultNet001 7')
          expect().assertFail();
          done();
        }
      });
      console.log('testHasDefaultNet001 9')
    });

    /*
     * @tc.number: TEST_HAS_DEFAULT_NET_002
     * @tc.name  : testHasDefaultNet002
     * @tc.desc  : Checks whether the default data network is activated.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testHasDefaultNet002', 0, function (done) {
      connection.hasDefaultNet().then(value => {
        console.log(`case success,data:` + value);
        expect(value).assertTrue();
        done();
      }).catch((error) => {
        console.log(`error, case failed,errCode:` + error.code);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number: TEST_REGISTER_001
     * @tc.name  : testRegister001
     * @tc.desc  : Receives status change notifications of a specified network.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testRegister001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          console.log(`register success11`);
          netConn.unregister((error) => {
            expect(true).assertTrue();
            done();
          });
        } else {
          console.log(`register failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_UNREGISTER_001
     * @tc.name  : testUnregister001
     * @tc.desc  : Cancels listening for network status changes. test
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testUnregister001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          console.log(`register success11`);
          netConn.unregister((error) => {
            if (!error) {
              console.log(`unregister success11`);
              expect(true).assertTrue();
              done();
            } else {
              console.log(`register failed,errCode:` + error.code);
              expect().assertFail();
              done();
            }
          });
        }
      });
    });

    /**
     * @tc.number: TEST_ON_NET_AVAILABLE_001
     * @tc.name  : testOn_NetAvailable001
     * @tc.desc  : Subscribe to network available events.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_NetAvailable001', 0, function (done) {
      try {
        let netConn = connection.createNetConnection();
        netConn.register((error) => {
          if (!error) {
            console.log("register success11:" + error);
            netConn.on("netAvailable",(data) => {
              console.log("netAvailable success11:" + data);
            });
            netConn.unregister((error) => {
              console.log("unregister success11:" + error);
            });
            expect(true).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.log(`register failed,errCode:` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number: TEST_ON_NET_BLOCK_STATUS_CHANGE_001
     * @tc.name  : testOn_NetBlockStatusChange001
     * @tc.desc  : Subscribe to network blocking status events, using the callback method as an asynchronous method.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_NetBlockStatusChange001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          netConn.on('netBlockStatusChange',(data) => {
            console.log("success11:" + data);
          });
          netConn.unregister((error) => {
            console.log("result11:" + error);
          });
          expect(true).assertTrue();
          done();
        } else {
          console.log(`register failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_ON_NET_CAPABILITIES_CHANGE_001
     * @tc.name  : testOn_NetCapabilitiesChange001
     * @tc.desc  : Subscribe to network capability change events.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_NetCapabilitiesChange001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          netConn.on('netCapabilitiesChange',(data) => {
            console.log("success11:" + data);
          });
          netConn.unregister((error) => {
            console.log("result11:" + error);
          });
          expect(true).assertTrue();
          done();
        } else {
          console.log(`register failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_ON_NET_CONNECTION_PROPERTIES_CHANGE_001
     * @tc.name  : testOn_NetConnectionPropertiesChange001
     * @tc.desc  : Subscribe to network connection information change events.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_NetConnectionPropertiesChange001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          netConn.on('netConnectionPropertiesChange',(data) => {
            console.log("success11:" + data);
          });
          netConn.unregister((error) => {
            console.log("result11:" + error);
          });
          expect(true).assertTrue();
          done();
        } else {
          console.log(`register failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_ON_NET_LOST_001
     * @tc.name  : testOn_NetLost001
     * @tc.desc  : Subscribe to network loss events.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_NetLost001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          netConn.on('netLost',(data) => {
            console.log("testOn_NetLost001 success11:" + data.netId);
          });
          netConn.unregister((error) => {
            console.log("testOn_NetLost001 result11:" + error);
          });
          expect(true).assertTrue();
          done();
        } else {
          console.log(`testOn_NetLost001 register failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_ON_NET_UNAVAILABLE_001
     * @tc.name  : testOn_NetUnavailable001
     * @tc.desc  : Subscribe to network loss events.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it('testOn_NetUnavailable001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          netConn.on('netUnavailable',(data) => {
            console.log("on success11:" + data);
          });
          netConn.unregister((error) => {
            console.log("result11:" + error);
          });
          expect(true).assertTrue();
          done();
        } else {
          console.log(`register failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /*
     * @tc.number: TEST_NET_ID_001
     * @tc.name  : testNetId001
     * @tc.desc  : netId test.
     * @tc.size  : MediumTest
     * @tc.type  : Field
     * @tc.level : Level 1
     */
    it('testNetId001', 0, function (done) {
      let netConn = connection.createNetConnection();
      netConn.register((error) => {
        if (!error) {
          console.log(`register success11`);
          netConn.on("netAvailable",(data) => {
            console.log(`netId success11 data:` +data.netId);
            expect(data.netId >= 100).assertTrue();
          });
          done();
        } else {
          console.log(`register failed,errCode:` + error.code);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number: TEST_NET_BEAR_TYPE_001
     * @tc.name  : testNetBearType001
     * @tc.desc  : NetBearType test
     * @tc.size  : MediumTest
     * @tc.type  : Enum
     * @tc.level : Level 0
     */
    it('testNetBearType001', 0, function (done) {
      let nbt_0 = connection.NetBearType.BEARER_CELLULAR;
      let nbt_1 = connection.NetBearType.BEARER_WIFI;
      expect(nbt_0).assertEqual(0);
      expect(nbt_1).assertEqual(1);
      done();
    });


  })
}
