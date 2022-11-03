/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index"
import MySequenceable from '../zidlTool/my_sequenceable'
import ZidlTestServiceProxy from '../zidlTool/zidl_tool_test_proxy'
import ZidlTestServiceProxyOneway from '../zidlToolOneWay/interface_attribute_declaratoin_oneway_proxy'
import InterfaceDeclareStub from '../interfaceDeclare/interface_declare_stub'
import InterfaceDeclareProxy from '../interfaceDeclare/interface_declare_proxy'
import { testInterfaceCallback } from '../interfaceDeclare/i_interface_declare'

var connectionId = -1;
var connectionOnewayId = -1;
var connectionIdSingle = -1;
var connectionOnewayIdSingle = -1;
var testProxyMulti;
var testProxyMultiOneway;
var testProxySingle;
var testProxySingleOneway;
const SUCCESS = 0;
const FAIL = 1;

export default function abilityTest(abilityContext) {
  describe('ActsAbilityTest', function () {

    beforeAll(async (done) => {
      var count = 0;

      function checkDone() {
        if (count >= 4) {
          done();
        }
      }

      var paMultiConnect = {
        onConnect: function (elementName, proxy) {
          console.log("ZidlTest Client Faconnection onConnect called.");
          console.log("ZidlTest Client Faconnection onConnect elementName = " + elementName);
          console.log("ZidlTest Client Faconnection onConnect proxy = " + proxy);
          testProxyMulti = new ZidlTestServiceProxy(proxy);
          count++;
          checkDone();
        },
        onDisconnect: function (elementName) {
          console.log("ZidlTest Client onDisconnectService onDisconnect");
        },
        onFailed: function (code) {
          console.log("ZidlTest Client onDisconnectService onFailed");
          count++;
          checkDone();
        }
      };

      var paMultiOnewayConnect = {
        onConnect: function (elementName, proxy) {
          console.log("ZidlTest Client Faconnection onConnect called.");
          console.log("ZidlTest Client Faconnection onConnect elementName = " + elementName);
          console.log("ZidlTest Client Faconnection onConnect proxy = " + proxy);
          testProxyMultiOneway = new ZidlTestServiceProxyOneway(proxy);
          count++;
          checkDone();
        },
        onDisconnect: function (elementName) {
          console.log("ZidlTest Client onDisconnectService onDisconnect");
        },
        onFailed: function (code) {
          console.log("ZidlTest Client onDisconnectService onFailed");
          count++;
          checkDone();
        }
      };

      var paSingleConnect = {
        onConnect: function (elementName, proxy) {
          console.log("ZidlTest Client Faconnection onConnect called.");
          console.log("ZidlTest Client Faconnection onConnect elementName = " + elementName);
          console.log("ZidlTest Client Faconnection onConnect proxy = " + proxy);
          testProxySingle = new ZidlTestServiceProxy(proxy);
          count++;
          checkDone();
        },
        onDisconnect: function (elementName) {
          console.log("ZidlTest Client onDisconnectService onDisconnect");
        },
        onFailed: function (code) {
          console.log("ZidlTest Client onDisconnectService onFailed");
          count++;
          checkDone();
        }
      };

      var paSingleOnewayConnect = {
        onConnect: function (elementName, proxy) {
          console.log("ZidlTest Client Faconnection onConnect called.");
          console.log("ZidlTest Client Faconnection onConnect elementName = " + elementName);
          console.log("ZidlTest Client Faconnection onConnect proxy = " + proxy);
          testProxySingleOneway = new ZidlTestServiceProxyOneway(proxy);
          count++;
          checkDone();
        },
        onDisconnect: function (elementName) {
          console.log("ZidlTest Client onDisconnectService onDisconnect");
        },
        onFailed: function (code) {
          console.log("ZidlTest Client onDisconnectService onFailed");
          count++;
          checkDone();
        }
      };

      let wantMulti = {
        "bundleName": "com.example.zidlservice",
        "abilityName": "com.example.zidlservice.ServiceAbility"
      };
      let wantMultiOneway = {
        "bundleName": "com.example.zidlservice",
        "abilityName": "com.example.zidlservice.ServiceAbility2"
      };
      let wantSingle = {
        "bundleName": "com.example.zidlclienttest",
        "abilityName": "com.example.zidlclienttest.ServiceAbility"
      };
      let wantSingleOneway = {
        "bundleName": "com.example.zidlclienttest",
        "abilityName": "com.example.zidlclienttest.ServiceAbility2"
      };

      console.info('ZidlTest Client connectAbility start');
      connectionId = globalThis.abilityContext.connectServiceExtensionAbility(wantMulti, paMultiConnect);
      console.info('ZidlTest Client connectAbility end connectionId = ' + connectionId);
      connectionOnewayId = globalThis.abilityContext.connectServiceExtensionAbility(wantMultiOneway, paMultiOnewayConnect);
      console.info('ZidlTest Client connectAbility end connectionOnewayId = ' + connectionOnewayId);

      connectionIdSingle = globalThis.abilityContext.connectServiceExtensionAbility(wantSingle, paSingleConnect);
      console.info('ZidlTest Client connectAbility end connectionIdSingle = ' + connectionIdSingle);
      connectionOnewayIdSingle = globalThis.abilityContext.connectServiceExtensionAbility(wantSingleOneway, paSingleOnewayConnect);
      console.info('ZidlTest Client connectAbility end connectionOnewayIdSingle = ' + connectionOnewayIdSingle);
    })

    afterEach(async (done) => {
      setTimeout(() => {
        done();
      }, 200)
    })

    afterAll(async (done) => {
      var count = 0;

      function checkDone() {
        if (count >= 4) {
          done();
        }
      }

      globalThis.abilityContext.disconnectServiceExtensionAbility(connectionId, (err) => {
        console.info('ZidlTest Client disconnectAbility result ' + JSON.stringify(err));
        connectionId = -1;
        testProxyMulti = null;
        count++;
        checkDone();
      })

      globalThis.abilityContext.disconnectServiceExtensionAbility(connectionOnewayId, (err) => {
        console.info('ZidlTest Client disconnectAbility2 result ' + JSON.stringify(err));
        connectionOnewayId = -1;
        testProxyMultiOneway = null;
        count++;
        checkDone();
      })

      globalThis.abilityContext.disconnectServiceExtensionAbility(connectionIdSingle, (err) => {
        console.info('ZidlTest Client disconnectAbility result ' + JSON.stringify(err));
        connectionIdSingle = -1;
        testProxyMulti = null;
        count++;
        checkDone();
      })

      globalThis.abilityContext.disconnectServiceExtensionAbility(connectionOnewayIdSingle, (err) => {
        console.info('ZidlTest Client disconnectAbility2 result ' + JSON.stringify(err));
        connectionOnewayIdSingle = -1;
        testProxyMultiOneway = null;
        count++;
        checkDone();
      })
    })

    /**
         * @tc.number: ACTS_Zidl_Js2JsMulti_0100
         * @tc.name: support method attributes declaration [oneway]
         * @tc.desc: [oneway] interface zidl.systemtest.IInterfaceAttributeDeclaratoinOneway {}
         */
    it('ACTS_Zidl_Js2JsMulti_0100', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_0100 begin');
      var flagFir = false;
      var flagSec = false;
      var flagThi = false;

      function checkFinish() {
        if (flagFir && flagSec && flagThi) {
          done();
        }
      }

      setTimeout(function () {
        testProxyMultiOneway.voidVoidFirst((errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          flagFir = true;
          checkFinish();
        });
        testProxyMultiOneway.voidVoidSecond((errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          flagSec = true;
          checkFinish();
        });
        testProxyMultiOneway.voidVoidThird((errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          flagThi = true;
          checkFinish();
        });
      }, 500);
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0200
     * @tc.name: support method attributes declaration [oneway]
     * @tc.desc: [oneway] void onewayVoidVoid()
     */
    it('ACTS_Zidl_Js2JsMulti_0200', 0, async function (done) {
      testProxyMulti.onewayVoidVoid((errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0300
     * @tc.name: support method result type void
     * @tc.desc: void voidVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_0300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_0300 begin');
      testProxyMulti.voidVoid((errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0400
     * @tc.name: support method result type boolean
     * @tc.desc: boolean booleanVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_0400', 0, async function (done) {
      testProxyMulti.booleanVoid((errCode, boolean) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_0400 call return:" + boolean);
        expect(errCode).assertEqual(SUCCESS);
        expect(boolean).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0500
     * @tc.name: support method result type byte
     * @tc.desc: number byteVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_0500', 0, async function (done) {
      testProxyMulti.byteVoid((errCode, mybyte) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_0500 call return:" + mybyte);
        expect(errCode).assertEqual(SUCCESS);
        expect(mybyte).assertEqual(1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0600
     * @tc.name: support method result type short
     * @tc.desc: number shortVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_0600', 0, async function (done) {
      testProxyMulti.shortVoid((errCode, myshort) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_0600 call return:" + myshort);
        expect(errCode).assertEqual(SUCCESS);
        expect(myshort).assertEqual(222);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0700
     * @tc.name: support method result type int
     * @tc.desc: number intVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_0700', 0, async function (done) {
      testProxyMulti.intVoid((errCode, myint) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_0700 call return:" + myint);
        expect(errCode).assertEqual(SUCCESS);
        expect(myint).assertEqual(333);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0800
     * @tc.name: support method result type long
     * @tc.desc: number longVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_0800', 0, async function (done) {
      testProxyMulti.longVoid((errCode, mylong) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_0800 call return:" + mylong);
        expect(errCode).assertEqual(SUCCESS);
        expect(mylong).assertEqual(4444);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_0900
     * @tc.name: support method result type float
     * @tc.desc: number floatVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_0900', 0, async function (done) {
      testProxyMulti.floatVoid((errCode, myfloat) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_0900 call return:" + myfloat);
        expect(errCode).assertEqual(SUCCESS);
        expect(myfloat).assertEqual(10.1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1000
     * @tc.name: support method result type double
     * @tc.desc: number doubleVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_1000', 0, async function (done) {
      testProxyMulti.doubleVoid((errCode, mydouble) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1000 call return:" + mydouble);
        expect(errCode).assertEqual(SUCCESS);
        expect(mydouble).assertEqual(22.1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1100
     * @tc.name: support method result type String
     * @tc.desc: String stringVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_1100', 0, async function (done) {
      testProxyMulti.stringVoid((errCode, mystring) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1100 call return:" + mystring);
        expect(errCode).assertEqual(SUCCESS);
        expect(mystring).assertEqual("stringVoid");
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1200
     * @tc.name: support method result type sequenceable
     * @tc.desc: TestInfo sequenceableVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_1200', 0, async function (done) {
      testProxyMulti.sequenceableVoid((errCode, mysequenceable) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1200 call return:" + JSON.stringify(mysequenceable));
        expect(errCode).assertEqual(SUCCESS);
        expect(mysequenceable.getNum()).assertEqual(14);
        expect(mysequenceable.getString()).assertEqual("hello");
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1300
     * @tc.name: support method result type interface
     * @tc.desc: ITest interfaceVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_1300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_1300 begin');

      testProxyMulti.interfaceVoid((errCode, data) => {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsMulti_1300 called");
        expect(errCode).assertEqual(SUCCESS);
        let proxy = new InterfaceDeclareProxy(data);
        proxy.testInterface(1500, (errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          done();
        });
      });
    })
    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1400
     * @tc.name: support method result type Map container type
     * @tc.desc: Map<String, String> mapStringStringVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_1400', 0, async function (done) {
      testProxyMulti.mapStringStringVoid((errCode, mymapStringString) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1400 call return:" + mymapStringString.get("string1"));
        expect(errCode).assertEqual(SUCCESS);
        expect(mymapStringString.get("string1")).assertEqual("string2");
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1500
     * @tc.name: support method result type array type
     * @tc.desc: double[] doubleArrayVoid();
     */
    it('ACTS_Zidl_Js2JsMulti_1500', 0, async function (done) {
      testProxyMulti.doubleArrayVoid((errCode, mydoubleArray) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1500 call return:" + mydoubleArray);
        expect(errCode).assertEqual(SUCCESS);
        expect(mydoubleArray.length).assertEqual(3);
        expect(mydoubleArray[0]).assertEqual(1.1);
        expect(mydoubleArray[1]).assertEqual(2.1);
        expect(mydoubleArray[2]).assertEqual(3.1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1600
     * @tc.name: support object type formal parameter attribute in
     * @tc.desc: sequenceable zidl.systemtest.TestInfo; void voidInObject([in] TestInfo param);
     */
    it('ACTS_Zidl_Js2JsMulti_1600', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_1600 begin');
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      let myMap = new Map<string, number>();
      myMap.set("string1", 1);
      var strarray = ["aaa", "bbb", "ccc"];
      testProxyMulti.voidInMapStringInt(myMap, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        flagFir = true;
        checkFinish();
      });
      testProxyMulti.voidInStringArray(strarray, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1700
     * @tc.name: support object type formal parameter attribute out
     * @tc.desc: sequenceable zidl.systemtest.TestInfo;void voidOutObject([out] String param);
     */
    it('ACTS_Zidl_Js2JsMulti_1700', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      testProxyMulti.voidOutMapStringInt((errCode, map) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1700 call return:" + map.get("voidOutMapStringInt"));
        expect(errCode).assertEqual(SUCCESS);
        expect(map.get("voidOutMapStringInt")).assertEqual(1);
        flagFir = true;
        checkFinish();
      });
      testProxyMulti.voidOutStringArray((errCode, strArray) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1700 call return:" + JSON.stringify(strArray));
        expect(errCode).assertEqual(SUCCESS);
        expect(strArray[0]).assertEqual("aa");
        expect(strArray[1]).assertEqual("dd");
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1800
     * @tc.name: support object type formal parameter attribute in, out
     * @tc.desc: sequenceable zidl.systemtest.TestInfo;void voidInOutObject([in, out] TestInfo param);
     */
    it('ACTS_Zidl_Js2JsMulti_1800', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      var mapIn = new Map<string, number>();
      mapIn.set("voidInOutMapStringInt1", 1801);
      mapIn.set("voidInOutMapStringInt2", 1802);
      testProxyMulti.voidInOutMapStringInt(mapIn, (errCode, map) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1800 call return:" + map.get("voidInOutMapStringInt"));
        expect(errCode).assertEqual(SUCCESS);
        expect(map.get("voidInOutMapStringInt1")).assertEqual(1802);
        expect(map.get("voidInOutMapStringInt2")).assertEqual(1801);
        flagFir = true;
        checkFinish();
      });

      var strArrayIn = ["ddd", "ccc"];
      testProxyMulti.voidInOutStringArray(strArrayIn, (errCode, strArray) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_1800 call return:" + JSON.stringify(strArray));
        expect(errCode).assertEqual(SUCCESS);
        expect(strArray[0]).assertEqual("aaa");
        expect(strArray[1]).assertEqual("bbb");
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_1900
     * @tc.name: support basic type formal parameter attribute in
     * @tc.desc:  void voidInInt([in] number param);void voidInString([in] String param);
     */
    it('ACTS_Zidl_Js2JsMulti_1900', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_1900 begin');
      var number8 = 8888;
      var str3 = "voidInString";
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      testProxyMulti.voidInInt(number8, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        flagFir = true;
        checkFinish();
      });
      testProxyMulti.voidInString(str3, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2000
     * @tc.name: support basic type formal parameter attribute out
     * @tc.desc: void voidOutInt([out] number param);void voidOutString([out] String param);
     */
    it('ACTS_Zidl_Js2JsMulti_2000', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      testProxyMulti.voidOutInt((errCode, number) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_2000 call return:" + JSON.stringify(number));
        expect(errCode).assertEqual(SUCCESS);
        expect(number).assertEqual(123);
        flagFir = true;
        checkFinish();
      });
      testProxyMulti.voidOutString((errCode, str) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_2000 call return:" + JSON.stringify(str));
        expect(str).assertEqual("voidOutString");
        expect(errCode).assertEqual(SUCCESS);
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2100
     * @tc.name: support basic type formal parameter attribute in, out
     * @tc.desc: void voidInOutInt([in, out] number param);void voidInOutString([in, out] String param);
     */
    it('ACTS_Zidl_Js2JsMulti_2100', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      console.log('ACTS_Zidl_Js2JsMulti_2100 begin');
      var number23 = 123456;
      var str1 = "voidInOutString";
      testProxyMulti.voidInOutInt(number23, (errCode, number) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_2100 call return:" + JSON.stringify(number));
        expect(errCode).assertEqual(SUCCESS);
        expect(number).assertEqual(456789);
        flagFir = true;
        checkFinish();
      });
      testProxyMulti.voidInOutString(str1, (errCode, str) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_2100 call return:" + JSON.stringify(str));
        expect(errCode).assertEqual(SUCCESS);
        expect(str).assertEqual("456789");
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2200
     * @tc.name: support formal parameter type boolean
     * @tc.desc: void voidBoolean([in] boolean param);
     */
    it('ACTS_Zidl_Js2JsMulti_2200', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2200 begin');
      var oBooleanTrue = true;

      testProxyMulti.voidParameterTypeBoolean(oBooleanTrue, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2300
     * @tc.name: support formal parameter type byte
     * @tc.desc: void voidByte([in] byte param);
     */
    it('ACTS_Zidl_Js2JsMulti_2300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2300 begin');
      var number1 = 1111;

      testProxyMulti.voidParameterTypeByte(number1, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2400
     * @tc.name: support formal parameter type short
     * @tc.desc: void voidShort([in] short param);
     */
    it('ACTS_Zidl_Js2JsMulti_2400', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2400 begin');
      var number2 = 2222;

      testProxyMulti.voidParameterTypeShort(number2, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2500
     * @tc.name: support formal parameter type int
     * @tc.desc: void voidInt([in] int param);
     */
    it('ACTS_Zidl_Js2JsMulti_2500', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2500 begin');
      var number3 = 3333;

      testProxyMulti.voidParameterTypeInt(number3, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2600
     * @tc.name: support formal parameter type long
     * @tc.desc: void voidLong([in] long param);
     */
    it('ACTS_Zidl_Js2JsMulti_2600', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2600 begin');
      var number4 = 4444;

      testProxyMulti.voidParameterTypeLong(number4, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2700
     * @tc.name: support formal parameter type float
     * @tc.desc: void voidFloat([in] float param);
     */
    it('ACTS_Zidl_Js2JsMulti_2700', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2700 begin');
      var number5 = 5555.1;

      testProxyMulti.voidParameterTypeFloat(number5, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2800
     * @tc.name: support formal parameter type double
     * @tc.desc: void voidDouble([in] double param);
     */
    it('ACTS_Zidl_Js2JsMulti_2800', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2800 begin');
      var number6 = 6666.1;

      setTimeout(function () {
        testProxyMulti.voidParameterTypeDouble(number6, (errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          done();
        });
      }, 500);
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_2900
     * @tc.name: support formal parameter type String
     * @tc.desc: void voidString([in] String param);
     */
    it('ACTS_Zidl_Js2JsMulti_2900', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_2900 begin');
      var str2 = "voidParameterTypeString";

      testProxyMulti.voidParameterTypeString(str2, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3000
     * @tc.name: support formal parameter type sequenceable
     * @tc.desc: void voidSequenceable([in] TestInfo param);
     */
    it('ACTS_Zidl_Js2JsMulti_3000', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_3000 begin');
      let mySequence = new MySequenceable();

      testProxyMulti.voidParameterTypeSequenceable(mySequence, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3100
     * @tc.name: support formal parameter type interface
     * @tc.desc: void voidInterface([in] ITest param);
     */
    it('ACTS_Zidl_Js2JsMulti_3100', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_3100 begin');

      class InterfaceDeclare extends InterfaceDeclareStub {
        testInterface(data: number, callback: testInterfaceCallback): void {
          console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_3100 called");
          let result = FAIL;

          if (data == 3300) {
            result = SUCCESS;
          }
          callback(result);
        }
      }

      let clientInterface = new InterfaceDeclare('clientInterface');

      testProxyMulti.voidParameterTypeInterface(clientInterface, (errCode) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_3100 clientInterface callback");
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3200
     * @tc.name: support formal parameter type Map
     * @tc.desc: void voidMapStringString([in] Map<String, String> param);
     */
    it('ACTS_Zidl_Js2JsMulti_3200', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_3200 begin');
      var map = new Map<string, string>();
      map.set("voidParameterTypeMapStringString", "fdhatdh");

      testProxyMulti.voidParameterTypeMapStringString(map, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3300
     * @tc.name: support formal parameter type array
     * @tc.desc: void voidDoubleArray([in] double[] param);
     */
    it('ACTS_Zidl_Js2JsMulti_3300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsMulti_3300 begin');
      var array = [1.1, 2.1];

      testProxyMulti.voidParameterTypeDoubleArray(array, (errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3400
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [out], [in]
     */
    it('ACTS_Zidl_Js2JsMulti_3400', 0, async function (done) {
      var num = 61;
      testProxyMulti.voidOrderOutIn(num, (errCode, string) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_3400 call return:" + string);
        expect(errCode).assertEqual(SUCCESS);
        expect(string).assertEqual("hello world");
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3500
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [in, out], [in]
     */
    it('ACTS_Zidl_Js2JsMulti_3500', 0, async function (done) {
      var num = 62;
      var str = "inputparam";
      testProxyMulti.voidOrderInOutIn(num, str, (errCode, numparam) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_3500 call return:" + numparam);
        expect(errCode).assertEqual(SUCCESS);
        expect(numparam).assertEqual(6);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3600
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [out], [in, out]
     */
    it('ACTS_Zidl_Js2JsMulti_3600', 0, async function (done) {
      var str = "param";
      testProxyMulti.voidOrderOutInOut(str, (errCode, paramI, paramS) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_3600 call return:" + paramI + " " + paramS);
        expect(errCode).assertEqual(SUCCESS);
        expect(paramI).assertEqual(3);
        expect(paramS).assertEqual("paramcallback");
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsMulti_3700
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [in], [in, out], [out]
     */
    it('ACTS_Zidl_Js2JsMulti_3700', 0, async function (done) {
      var str = "paramInput";
      var num = 64;
      testProxyMulti.voidOrderInInOutOut(str, num, (errCode, paramI, paramS) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsMulti_3700 call return:" + paramS + " " + paramI);
        expect(errCode).assertEqual(SUCCESS);
        expect(paramS).assertEqual("callback");
        expect(paramI).assertEqual(4);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0100
     * @tc.name: support method attributes declaration [oneway]
     * @tc.desc: [oneway] interface zidl.systemtest.IInterfaceAttributeDeclaratoinOneway {}
     */
     it('ACTS_Zidl_Js2JsSingle_0100', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_0100 begin');
      var flagFir = false;
      var flagSec = false;
      var flagThi = false;

      function checkFinish() {
        if (flagFir && flagSec && flagThi) {
          done();
        }
      }

      setTimeout(function () {
        testProxySingleOneway.voidVoidFirst((errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          flagFir = true;
          checkFinish();
        });
        testProxySingleOneway.voidVoidSecond((errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          flagSec = true;
          checkFinish();
        });
        testProxySingleOneway.voidVoidThird((errCode) => {
          expect(errCode).assertEqual(SUCCESS);
          flagThi = true;
          checkFinish();
        });
      }, 500);
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0200
     * @tc.name: support method attributes declaration [oneway]
     * @tc.desc: [oneway] void onewayVoidVoid()
     */
    it('ACTS_Zidl_Js2JsSingle_0200', 0, async function (done) {
      testProxySingle.onewayVoidVoid((errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0300
     * @tc.name: support method result type void
     * @tc.desc: void voidVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_0300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_0300 begin');
      testProxySingle.voidVoid((errCode) => {
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0400
     * @tc.name: support method result type boolean
     * @tc.desc: boolean booleanVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_0400', 0, async function (done) {
      testProxySingle.booleanVoid((errCode, boolean) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_0400 call return:" + boolean);
        expect(errCode).assertEqual(SUCCESS);
        expect(boolean).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0500
     * @tc.name: support method result type byte
     * @tc.desc: number byteVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_0500', 0, async function (done) {
      testProxySingle.byteVoid((errCode, mybyte) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_0500 call return:" + mybyte);
        expect(errCode).assertEqual(SUCCESS);
        expect(mybyte).assertEqual(1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0600
     * @tc.name: support method result type short
     * @tc.desc: number shortVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_0600', 0, async function (done) {
      testProxySingle.shortVoid((errCode, myshort) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_0600 call return:" + myshort);
        expect(errCode).assertEqual(SUCCESS);
        expect(myshort).assertEqual(222);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0700
     * @tc.name: support method result type int
     * @tc.desc: number intVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_0700', 0, async function (done) {
      testProxySingle.intVoid((errCode, myint) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_0700 call return:" + myint);
        expect(errCode).assertEqual(SUCCESS);
        expect(myint).assertEqual(333);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0800
     * @tc.name: support method result type long
     * @tc.desc: number longVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_0800', 0, async function (done) {
      testProxySingle.longVoid((errCode, mylong) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_0800 call return:" + mylong);
        expect(errCode).assertEqual(SUCCESS);
        expect(mylong).assertEqual(4444);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_0900
     * @tc.name: support method result type float
     * @tc.desc: number floatVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_0900', 0, async function (done) {
      testProxySingle.floatVoid((errCode, myfloat) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_0900 call return:" + myfloat);
        expect(errCode).assertEqual(SUCCESS);
        expect(myfloat).assertEqual(10.1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1000
     * @tc.name: support method result type double
     * @tc.desc: number doubleVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_1000', 0, async function (done) {
      testProxySingle.doubleVoid((errCode, mydouble) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1000 call return:" + mydouble);
        expect(errCode).assertEqual(SUCCESS);
        expect(mydouble).assertEqual(22.1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1100
     * @tc.name: support method result type String
     * @tc.desc: String stringVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_1100', 0, async function (done) {
      testProxySingle.stringVoid((errCode, mystring) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1100 call return:" + mystring);
        expect(errCode).assertEqual(SUCCESS);
        expect(mystring).assertEqual("stringVoid");
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1200
     * @tc.name: support method result type sequenceable
     * @tc.desc: TestInfo sequenceableVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_1200', 0, async function (done) {
      testProxySingle.sequenceableVoid((errCode, mysequenceable) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1200 call return:" + JSON.stringify(mysequenceable));
        expect(errCode).assertEqual(SUCCESS);
        expect(mysequenceable.getNum()).assertEqual(14);
        expect(mysequenceable.getString()).assertEqual("hello");
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1300
     * @tc.name: support method result type interface
     * @tc.desc: ITest interfaceVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_1300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_1300 begin');

      testProxySingle.interfaceVoid((errCode, data) => {
        console.log("ZidlTest Server ACTS_Zidl_Js2JsSingle_1300 called");
        expect(errCode).assertEqual(SUCCESS);
        let proxy = new InterfaceDeclareProxy(data);
        proxy.testInterface(1500, (errCode)=>{
          expect(errCode).assertEqual(SUCCESS);
          done();
        });
      });
    })
    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1400
     * @tc.name: support method result type Map container type
     * @tc.desc: Map<String, String> mapStringStringVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_1400', 0, async function (done) {
      testProxySingle.mapStringStringVoid((errCode, mymapStringString) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1400 call return:" + mymapStringString.get("string1"));
        expect(errCode).assertEqual(SUCCESS);
        expect(mymapStringString.get("string1")).assertEqual("string2");
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1500
     * @tc.name: support method result type array type
     * @tc.desc: double[] doubleArrayVoid();
     */
    it('ACTS_Zidl_Js2JsSingle_1500', 0, async function (done) {
      testProxySingle.doubleArrayVoid((errCode, mydoubleArray) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1500 call return:" + mydoubleArray);
        expect(errCode).assertEqual(SUCCESS);
        expect(mydoubleArray.length).assertEqual(3);
        expect(mydoubleArray[0]).assertEqual(1.1);
        expect(mydoubleArray[1]).assertEqual(2.1);
        expect(mydoubleArray[2]).assertEqual(3.1);
        done();
      })
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1600
     * @tc.name: support object type formal parameter attribute in
     * @tc.desc: sequenceable zidl.systemtest.TestInfo; void voidInObject([in] TestInfo param);
     */
    it('ACTS_Zidl_Js2JsSingle_1600', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_1600 begin');
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      let myMap = new Map<string, number>();
      myMap.set("string1", 1);
      var strarray = ["aaa", "bbb", "ccc"];
      testProxySingle.voidInMapStringInt(myMap, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        flagFir = true;
        checkFinish();
      });
      testProxySingle.voidInStringArray(strarray, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1700
     * @tc.name: support object type formal parameter attribute out
     * @tc.desc: sequenceable zidl.systemtest.TestInfo;void voidOutObject([out] String param);
     */
    it('ACTS_Zidl_Js2JsSingle_1700', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      testProxySingle.voidOutMapStringInt((errCode, map) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1700 call return:" + map.get("voidOutMapStringInt"));
        expect(errCode).assertEqual(SUCCESS);
        expect(map.get("voidOutMapStringInt")).assertEqual(1);
        flagFir = true;
        checkFinish();
      });
      testProxySingle.voidOutStringArray((errCode, strArray) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1700 call return:" + JSON.stringify(strArray));
        expect(errCode).assertEqual(SUCCESS);
        expect(strArray[0]).assertEqual("aa");
        expect(strArray[1]).assertEqual("dd");
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1800
     * @tc.name: support object type formal parameter attribute in, out
     * @tc.desc: sequenceable zidl.systemtest.TestInfo;void voidInOutObject([in, out] TestInfo param);
     */
    it('ACTS_Zidl_Js2JsSingle_1800', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      var mapIn = new Map<string, number>();
      mapIn.set("voidInOutMapStringInt1", 1801);
      mapIn.set("voidInOutMapStringInt2", 1802);
      testProxySingle.voidInOutMapStringInt(mapIn, (errCode, map) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1800 call return:" + map.get("voidInOutMapStringInt"));
        expect(errCode).assertEqual(SUCCESS);
        expect(map.get("voidInOutMapStringInt1")).assertEqual(1802);
        expect(map.get("voidInOutMapStringInt2")).assertEqual(1801);
        flagFir = true;
        checkFinish();
      });
      var strArrayIn = ["ddd", "ccc"];
      testProxySingle.voidInOutStringArray(strArrayIn, (errCode, strArray) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_1800 call return:" + JSON.stringify(strArray));
        expect(errCode).assertEqual(SUCCESS);
        expect(strArray[0]).assertEqual("aaa");
        expect(strArray[1]).assertEqual("bbb");
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_1900
     * @tc.name: support basic type formal parameter attribute in
     * @tc.desc:  void voidInInt([in] number param);void voidInString([in] String param);
     */
    it('ACTS_Zidl_Js2JsSingle_1900', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_1900 begin');
      var number8 = 8888;
      var str3 = "voidInString";
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      testProxySingle.voidInInt(number8, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        flagFir = true;
        checkFinish();
      });
      testProxySingle.voidInString(str3, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2000
     * @tc.name: support basic type formal parameter attribute out
     * @tc.desc: void voidOutInt([out] number param);void voidOutString([out] String param);
     */
    it('ACTS_Zidl_Js2JsSingle_2000', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      testProxySingle.voidOutInt((errCode, number) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_2000 call return:" + JSON.stringify(number));
        expect(errCode).assertEqual(SUCCESS);
        expect(number).assertEqual(123);
        flagFir = true;
        checkFinish();
      });
      testProxySingle.voidOutString((errCode, str) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_2000 call return:" + JSON.stringify(str));
        expect(str).assertEqual("voidOutString");
        expect(errCode).assertEqual(SUCCESS);
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2100
     * @tc.name: support basic type formal parameter attribute in, out
     * @tc.desc: void voidInOutInt([in, out] number param);void voidInOutString([in, out] String param);
     */
    it('ACTS_Zidl_Js2JsSingle_2100', 0, async function (done) {
      var flagFir = false;
      var flagSec = false;

      function checkFinish() {
        if (flagFir && flagSec) {
          done();
        }
      }

      console.log('ACTS_Zidl_Js2JsSingle_2100 begin');
      var number23 = 123456;
      var str1 = "voidInOutString";
      testProxySingle.voidInOutInt(number23, (errCode, number) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_2100 call return:" + JSON.stringify(number));
        expect(errCode).assertEqual(SUCCESS);
        expect(number).assertEqual(456789);
        flagFir = true;
        checkFinish();
      });
      testProxySingle.voidInOutString(str1, (errCode, str) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_2100 call return:" + JSON.stringify(str));
        expect(errCode).assertEqual(SUCCESS);
        expect(str).assertEqual("456789");
        flagSec = true;
        checkFinish();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2200
     * @tc.name: support formal parameter type boolean
     * @tc.desc: void voidBoolean([in] boolean param);
     */
    it('ACTS_Zidl_Js2JsSingle_2200', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2200 begin');
      var oBooleanTrue = true;

      testProxySingle.voidParameterTypeBoolean(oBooleanTrue, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2300
     * @tc.name: support formal parameter type byte
     * @tc.desc: void voidByte([in] byte param);
     */
    it('ACTS_Zidl_Js2JsSingle_2300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2300 begin');
      var number1 = 1111;

      testProxySingle.voidParameterTypeByte(number1, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2400
     * @tc.name: support formal parameter type short
     * @tc.desc: void voidShort([in] short param);
     */
    it('ACTS_Zidl_Js2JsSingle_2400', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2400 begin');
      var number2 = 2222;

      testProxySingle.voidParameterTypeShort(number2, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2500
     * @tc.name: support formal parameter type int
     * @tc.desc: void voidInt([in] int param);
     */
    it('ACTS_Zidl_Js2JsSingle_2500', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2500 begin');
      var number3 = 3333;

      testProxySingle.voidParameterTypeInt(number3, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2600
     * @tc.name: support formal parameter type long
     * @tc.desc: void voidLong([in] long param);
     */
    it('ACTS_Zidl_Js2JsSingle_2600', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2600 begin');
      var number4 = 4444;

      testProxySingle.voidParameterTypeLong(number4, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2700
     * @tc.name: support formal parameter type float
     * @tc.desc: void voidFloat([in] float param);
     */
    it('ACTS_Zidl_Js2JsSingle_2700', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2700 begin');
      var number5 = 5555.1;

      testProxySingle.voidParameterTypeFloat(number5, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2800
     * @tc.name: support formal parameter type double
     * @tc.desc: void voidDouble([in] double param);
     */
    it('ACTS_Zidl_Js2JsSingle_2800', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2800 begin');
      var number6 = 6666.1;

      setTimeout(function () {
        testProxySingle.voidParameterTypeDouble(number6, (errCode)=>{
          expect(errCode).assertEqual(SUCCESS);
          done();
        });
      }, 500);
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_2900
     * @tc.name: support formal parameter type String
     * @tc.desc: void voidString([in] String param);
     */
    it('ACTS_Zidl_Js2JsSingle_2900', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_2900 begin');
      var str2 = "voidParameterTypeString";

      testProxySingle.voidParameterTypeString(str2, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3000
     * @tc.name: support formal parameter type sequenceable
     * @tc.desc: void voidSequenceable([in] TestInfo param);
     */
    it('ACTS_Zidl_Js2JsSingle_3000', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_3000 begin');
      let mySequence = new MySequenceable();

      testProxySingle.voidParameterTypeSequenceable(mySequence, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3100
     * @tc.name: support formal parameter type interface
     * @tc.desc: void voidInterface([in] ITest param);
     */
    it('ACTS_Zidl_Js2JsSingle_3100', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_3100 begin');

      class InterfaceDeclare extends InterfaceDeclareStub {
        testInterface(data: number, callback: testInterfaceCallback): void{
          console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_3100 called");
          let result = FAIL;

          if (data == 3300) {
            result = SUCCESS;
          }
          callback(result);
        }
      }

      let clientInterface = new InterfaceDeclare('clientInterface');

      testProxySingle.voidParameterTypeInterface(clientInterface, (errCode)=>{
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_3100 clientInterface callback");
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3200
     * @tc.name: support formal parameter type Map
     * @tc.desc: void voidMapStringString([in] Map<String, String> param);
     */
    it('ACTS_Zidl_Js2JsSingle_3200', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_3200 begin');
      var map = new Map<string, string>();
      map.set("voidParameterTypeMapStringString", "fdhatdh");

      testProxySingle.voidParameterTypeMapStringString(map, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3300
     * @tc.name: support formal parameter type array
     * @tc.desc: void voidDoubleArray([in] double[] param);
     */
    it('ACTS_Zidl_Js2JsSingle_3300', 0, async function (done) {
      console.log('ACTS_Zidl_Js2JsSingle_3300 begin');
      var array = [1.1, 2.1];

      testProxySingle.voidParameterTypeDoubleArray(array, (errCode)=>{
        expect(errCode).assertEqual(SUCCESS);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3400
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [out], [in]
     */
    it('ACTS_Zidl_Js2JsSingle_3400', 0, async function (done) {
      var num = 61;
      testProxySingle.voidOrderOutIn(num, (errCode, string) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_3400 call return:" + string);
        expect(errCode).assertEqual(SUCCESS);
        expect(string).assertEqual("hello world");
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3500
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [in, out], [in]
     */
    it('ACTS_Zidl_Js2JsSingle_3500', 0, async function (done) {
      var num = 62;
      var str = "inputparam";
      testProxySingle.voidOrderInOutIn(num, str, (errCode, numparam) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_3500 call return:" + numparam);
        expect(errCode).assertEqual(SUCCESS);
        expect(numparam).assertEqual(6);
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3600
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [out], [in, out]
     */
    it('ACTS_Zidl_Js2JsSingle_3600', 0, async function (done) {
      var str = "param";
      testProxySingle.voidOrderOutInOut(str, (errCode, paramI, paramS) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_3600 call return:" + paramI + " " + paramS);
        expect(errCode).assertEqual(SUCCESS);
        expect(paramI).assertEqual(3);
        expect(paramS).assertEqual("paramcallback");
        done();
      });
    })

    /**
     * @tc.number: ACTS_Zidl_Js2JsSingle_3700
     * @tc.name: parameter order
     * @tc.desc: order of parameter properties [in], [in, out], [out]
     */
    it('ACTS_Zidl_Js2JsSingle_3700', 0, async function (done) {
      var str = "paramInput";
      var num = 64;
      testProxySingle.voidOrderInInOutOut(str, num, (errCode, paramI, paramS) => {
        console.log("ZidlTest Client ACTS_Zidl_Js2JsSingle_3700 call return:" + paramS + " " + paramI);
        expect(errCode).assertEqual(SUCCESS);
        expect(paramS).assertEqual("callback");
        expect(paramI).assertEqual(4);
        done();
      });
    })
  })
}