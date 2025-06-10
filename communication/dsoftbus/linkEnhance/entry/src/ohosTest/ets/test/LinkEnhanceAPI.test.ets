/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
// import linkEnhance from '@kit.DistributedServiceKit';
import linkEnhance from '@ohos.distributedsched.linkEnhance';
import { Driver, ON } from '@ohos.UiTest';
import abilityAccessCtrl ,{ Permissions } from '@ohos.abilityAccessCtrl';
import {common} from '@kit.AbilityKit';
import btAccess from '@ohos.bluetooth.access';

let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";

let logTag = "[linkEnhance_log]";
async function sleep(ms:number): Promise<void>{
  return new Promise(resolve => setTimeout(resolve, ms));
}
async function driveFn(){
  try {
    let driver: Driver = await Driver.create();
    console.info(logTag + "come in driveFn")
    console.info(logTag + `driver is ${JSON.stringify(driver)}`);
    await sleep(1000);
    console.info(logTag + "come in findComponent");
    let button = await driver.findComponent(ON.text('允许'));
    console.info(logTag + `button is ${JSON.stringify(button)}`);
    await sleep(1000);
    await button.click();
    await sleep(1000);
    let button2 = await driver.findComponent(ON.text('允许'));
    console.info(logTag + `button2 is ${JSON.stringify(button2)}`);
    await sleep(1000);
    await button2.click();
    await sleep(1000);
  }catch (err){
    console.error(logTag + "driveFn err is "+ err);
    return;
  }
}
async function requestPermission(){
  let permissions: Array<Permissions> = ["ohos.permission.DISTRIBUTED_DATASYNC","ohos.permission.ACCESS_BLUETOOTH"];
  let context:common.UIAbilityContext | undefined = AppStorage.get("context") as common.UIAbilityContext;
  console.info(logTag + "context is " + context);
  let atManager:abilityAccessCtrl.AtManager =
    abilityAccessCtrl.createAtManager();
  atManager.requestPermissionsFromUser(context, permissions).then((data) => {
    console.info("request success" + JSON.stringify(data));
  })
}
async function clickRequestPermission(text:string) {
  console.info(logTag +'[bluetooth_js] clickRequestPermission start');
  let driver = await Driver.create();
  try {
    let button = await driver.findComponent(ON.text(text));
    await sleep(1000);
    await button.click();
    await sleep(1000);
    console.info(logTag +'[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    console.info(logTag +'[bluetooth_js] clickRequestPermission failed. ' + err);
  }
}
async function tryToEnableBt() {
  let sta = btAccess.getState();
  console.info(logTag +'[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
  switch(sta){
    case 0:
      btAccess.enableBluetooth();
      await sleep(5000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      console.info(logTag +'[bluetooth_js] bt turn off1:'+ JSON.stringify(sta1));
      break;
    case 1:
      console.info(logTag +'[bluetooth_js] bt turning on2:'+ JSON.stringify(sta));
      await sleep(3000);
      break;
    case 2:
      console.info(logTag +'[bluetooth_js] bt turn on3:'+ JSON.stringify(sta));
      break;
    case 3:
      btAccess.enableBluetooth();
      await sleep(3000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      console.info(logTag +'[bluetooth_js] bt turning off4:'+ JSON.stringify(sta2));
      break;
    default:
      console.info(logTag +'[bluetooth_js] enable success');
  }
}

export default function LinkEnhanceAPI() {
  describe('LinkEnhanceAPI', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      console.info('getPermission beforeAll');
      await requestPermission();
      await sleep(1000);
      await driveFn();
      await sleep(1000);
      await tryToEnableBt()
      await sleep(1000);
      done();
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async (done: Function) => {
      console.info(logTag +'[bluetooth_js] bt close');
      btAccess.disableBluetooth();
      await sleep(5000);
      await clickRequestPermission(CLOSE_BT_TEXT);
      done();
    })
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100
     * @tc.desc       : linkEnhance.createConnection接口入参deviceid长度为空
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("","demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200
     * @tc.desc       : linkEnhance.createConnection接口入参deviceid长度为null
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection(null, "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300
     * @tc.desc       : linkEnhance.createConnection接口入参deviceid为undefined
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection(undefined, "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400
     * @tc.desc       : linkEnhance.createConnection接口入参name长度为空
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500
     * @tc.desc       : linkEnhance.createConnection接口入参name为null
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", null);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500----------------");
    });

    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600
     * @tc.desc       : linkEnhance.createConnection接口入参name为undefined
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", undefined);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600----------------");
    });

    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_connect_0100
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_connect_0100
     * @tc.desc       : linkEnhance.connection.connect()接口,createConnection入参deviceid格式错误
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66:77", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 is" + connection);
        try {
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 error.message is " + error.message);
          expect(error.code == 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0100----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_connect_0200
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_connect_0200
     * @tc.desc       : linkEnhance.connection.connect()接口超过10个限制
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0200----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 conn start");
          for (let i = 0; i < 11; i++) {
            console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 connect i is " + i);
            connection.connect();
          }
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 error.message is " + error.message);
          expect(error.code == 32390204).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0200----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_connect_0300
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_connect_0300
     * @tc.desc       : linkEnhance.connection.connect()接口deviceid为空格
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0300----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection(" ", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 conn start");
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 error.message is " + error.message);
          expect(error.code == 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0300----------------");
    });

    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_connect_0400
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_connect_0400
     * @tc.desc       : linkEnhance.connection.connect()接口name为max(255)
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0400----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstu"
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", name);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 conn start");
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 error.message is " + error.message);
          expect(error.code == 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == false).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0400----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_connect_0500
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_connect_0500
     * @tc.desc       : linkEnhance.connection.connect()接口name为max+1(256)
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0500----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstuv"
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", name);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 conn start");
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0500----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100
     * @tc.desc       : linkEnhance.connection.sendData()接口连接无效发送数据
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 sendData start");
          connection.sendData(arraybuffer);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200
     * @tc.desc       : linkEnhance.connection.sendData()接口连接处于不可用状态
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 connection is" + connection);
        connection.connect();
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 sendData start");
          connection.sendData(arraybuffer);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 error.message is " + error.message);
          expect(error.code == 32390205).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100
     * @tc.desc       : linkEnhance.connection.on(type:'connectResult')接口入参callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 connect_on  start");
          connection.on('connectResult',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200
     * @tc.desc       : linkEnhance.connection.on(type:'disconnected')接口入参callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 connect_on  start");
          connection.on('disconnected',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300
     * @tc.desc       : linkEnhance.connection.on(type:'dataReceived')接口入参callback为null
     * @tc.size       : MediumTestto_
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 connect_on  start");
          connection.on('dataReceived',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100
     * @tc.desc       : linkEnhance.connection.off(type:'connectResult')接口入参callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 connect_on  start");
          connection.off('connectResult',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200
     * @tc.desc       : linkEnhance.connection.off(type:'disconnected')接口入参callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 connect_on  start");
          connection.off('disconnected',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300
     * @tc.desc       : linkEnhance.connection.off(type:'dataReceived')接口入参callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 connect_on  start");
          connection.off('dataReceived',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300----------------");
    });
    /**
     * @tc.number     : SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100
     * @tc.name       : SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100
     * @tc.desc       : linkEnhance.connection.disconnet接口入调用成功
     * @tc.size       : MediumTest
     * @tc.type       : Compatibility
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 connect_on  start");
          connection.off('dataReceived',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100----------------");
    });
  })
}