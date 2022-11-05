/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import inputMethod from '@ohos.inputmethod';
import subtype from '@ohos.inputMethodSubtype';

export default function inputMethodStageJSUnit() {
  describe('inputMethodTest', function () {
    console.info("====>************* settings Test start*************");
    /*
     * @tc.number  inputMethod_test_getController_001
     * @tc.name   get inputMethod controller
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_getController_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_getController_001 start---------------------");
      try{
        let inputMethodControl = inputMethod.getController();
        console.info("====>inputMethod_test_getController_001 result:" + typeof inputMethodControl);
        if(typeof inputMethodControl == "object" ){
          console.info("====>inputMethod_test_getController_001 getController success");
          expect(true).assertTrue();
        }else{
          console.info("====>inputMethod_test_getController_001 getController failed");
          expect().assertFail();
        };
      }catch(error){
        console.info("====>inputMethod_test_getController_001 getController error" + JSON.stringify(error));
        expect().assertFail();
      };

      console.info("====>-----------------inputMethod_test_getController_001 end---------------------");
      done();
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_001
     * @tc.name   List subtype of the specified input method
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_listInputMethodSubtype_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_001 start---------------------");
      let inputMethodProperty = {
        packageName:"com.example.kikakeyboard",
        methodId:"ServiceExtAbility",
        name:"com.example.kikakeyboard",
        id:"ServiceExtAbility",
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
          if(err){
            console.info("====>inputMethod_test_listInputMethodSubtype_001  failed" + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info("====>inputMethod_test_listInputMethodSubtype_001 listInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        });
      }catch(error){
        console.info("====>inputMethod_test_listInputMethodSubtype_001 listInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_001 end---------------------");
    });

    /*
    * @tc.number  inputMethod_test_listInputMethodSubtype_002
    * @tc.name   List subtype of the specified input method
    * @tc.desc    Function test
    * @tc.level   2
    */
    it('inputMethod_test_listInputMethodSubtype_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_002 start---------------------");
      let inputMethodProperty = {
        packageName:"com.example.kikakeyboard",
        methodId:"ServiceExtAbility",
        name:"com.example.kikakeyboard",
        id:"ServiceExtAbility",
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      };

      try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
          if(err){
            console.info("====>inputMethod_test_listInputMethodSubtype_002  failed" + JSON.stringify(err));
            expect().assertFail();
            done()
          };
          console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype:" + JSON.stringify(data));
          if(data.length >= 1){
            let inputMethodSubtype = data[0]
            console.info("====>inputMethod_test_listInputMethodSubtype_002 inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
            expect(inputMethodSubtype.id != null).assertTrue();
            expect(inputMethodSubtype.label != null).assertTrue();
            done();
          }else{
            console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype length less 1");
            expect().assertFail();
            done();
          };
        });
      }catch(error){
        console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_003
     * @tc.name   List subtype of the specified input method
     * @tc.desc    Function test
     * @tc.level   2
     */
     
    it('inputMethod_test_listInputMethodSubtype_003', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_003 start---------------------");
      let inputMethodProperty = {
        packageName:"com.example.kikakeyboard",
        methodId:"ServiceExtAbility",
        name:"com.example.kikakeyboard",
        id:"ServiceExtAbility",
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listInputMethodSubtype_003 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listInputMethodSubtype(inputMethodProperty).then((data) => {
          console.info("====>inputMethod_test_listInputMethodSubtype_003 listInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch(err => {
          console.info("====>inputMethod_test_listInputMethodSubtype_003  failed" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch(error){
        console.info("====>inputMethod_test_listInputMethodSubtype_003 listInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_003 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_004
     * @tc.name   List subtype of the specified input method
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_listInputMethodSubtype_004', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_004 start---------------------");
      let inputMethodProperty = {
        packageName:"com.example.kikakeyboard",
        methodId:"ServiceExtAbility",
        name:"com.example.kikakeyboard",
        id:"ServiceExtAbility",
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      };

        try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listInputMethodSubtype_004 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listInputMethodSubtype(inputMethodProperty).then((data) => {
          console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype:" + JSON.stringify(data));
          if(data.length >= 1){
            let inputMethodSubtype = data[0]
            console.info("====>inputMethod_test_listInputMethodSubtype_004  inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
            expect(inputMethodSubtype.id != null).assertTrue();
            expect(inputMethodSubtype.label != null).assertTrue();
            done();
          }else{
            console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype length less 1");
            expect().assertFail();
            done();
          }
        }).catch(err => {
          console.info("====>inputMethod_test_listInputMethodSubtype_004  failed" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch(error){
        console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      }
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_004 end---------------------");
    });

    /*
    * @tc.number  inputMethod_test_listCurrentInputMethodSubtype_001
    * @tc.name   List subtype of the specified input method
    * @tc.desc    Function test
    * @tc.level   2
    */
    it('inputMethod_test_listCurrentInputMethodSubtype_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_001 start---------------------");
      try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listCurrentInputMethodSubtype((err, data) => {
          if(err){
            console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001  failed" + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        });
      }catch(error){
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_001 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_003
     * @tc.name    List subtype of current input method
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_listCurrentInputMethodSubtype_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 start---------------------");
      try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listCurrentInputMethodSubtype().then((data) => {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch(err => {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002  failed" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch(error){
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_getCurrentInputMethodSubtype_001
     * @tc.name    Get the current input method subtype
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_getCurrentInputMethodSubtype_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_001 start---------------------");
      try{
        let inputMethodSubtype = inputMethod.getCurrentInputMethodSubtype();
        console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 result:" + typeof inputMethodSubtype);
        if(typeof inputMethodSubtype == "object" ){
          console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype success");
          expect(true).assertTrue();
        }else{
          console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype failed");
          expect().assertFail();
        };
      }catch(error){
        console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype error" + JSON.stringify(error));
        expect().assertFail();
      }
      console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_001 end---------------------");
      done();
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodAndSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodAndSubtype_001', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_001 Test start*************");
      let inputMethodProperty = {
        packageName: "com.example.kikakeyboard",
        methodId: "ServiceExtAbility",
        name:"com.example.kikakeyboard",
        id:"ServiceExtAbility",
        extra:{}
      };
      let inputMethodSubProperty : subtype = {
        id: "com.example.kikakeyboard",
        label: "ServiceExtAbility",
        name: "",
        mode: "upper",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };
      try {
        inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty, (err,data) => {
          if (err) {
            console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_001 err: ' + JSON.stringify(err));
            expect( err.code == 12800008 ).assertTrue();
            done();
          }
          console.info("====>inputMethod_test_switchCurrentInputMethodAndSubtype_001 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        });
      } catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_001 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_001 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodAndSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodAndSubtype_002', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_002 Test start*************");
      let inputMethodProperty = {
        packageName: "com.example.kikakeyboard",
        methodId: "ServiceExtAbility",
        name:"com.example.kikakeyboard",
        id:"ServiceExtAbility",
        extra:{}
      };
      let inputMethodSubProperty : subtype = {
        id: "com.example.kikakeyboard",
        label: "ServiceExtAbility",
        name: "",
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };
      try {
        inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty).then((data) => {
          console.info("====>inputMethod_test_switchCurrentInputMethodAndSubtype_002 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        }).catch(err => {
          console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_002 err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_002 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_002 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodSubtype_001', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_001 Test start*************");
      let inputMethodSubProperty : subtype = {
        id: "com.example.kikakeyboard",
        label: "ServiceExtAbility",
        name: "",
        mode: "upper",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };
      try {
        inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty, (err,data) => {
          if (err) {
            console.error('inputMethod_test_switchCurrentInputMethodSubtype_001 err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_switchCurrentInputMethodSubtype_001 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        });
      } catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodSubtype_001 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_001 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodSubtype_002', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_002 Test start*************");
      let inputMethodSubProperty : subtype = {
        id: "com.example.kikakeyboard",
        label: "ServiceExtAbility",
        name: "",
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };
      try {
        inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty).then((data) => {
          console.info("====>inputMethod_test_switchCurrentInputMethodSubtype_002 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        }).catch(err => {
          console.error('inputMethod_test_switchCurrentInputMethodSubtype_002 err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodSubtype_002 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_002 Test end*************");
      done();
    });

    /*
     * @tc.number  inputMethod_test_showOptionalInputMethods_001
     * @tc.name    Show input method setting extension dialog
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_showOptionalInputMethods_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_001 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try{
        console.info("====>inputMethod_test_showOptionalInputMethods_001 result:" + inputMethodSetting);
        inputMethodSetting.showOptionalInputMethods((err, data) => {
          if(err){
            console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods faild: " + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods success data is : " + data);
          expect(true).assertTrue();
          setTimeout(() => {
            done();
          }, 1000);
        });
      }catch(error){
        console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods catch error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_001 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_showOptionalInputMethods_002
     * @tc.name    Show input method setting extension dialog
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_showOptionalInputMethods_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_002 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try {
        console.info("====>inputMethod_test_showOptionalInputMethods_002 result:" + JSON.stringify(inputMethodSetting));
        inputMethodSetting.showOptionalInputMethods().then((data) => {
          console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods success data is: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch(err => {
          console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods faild: " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods catch error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_stopInputSession_002
     * @tc.name   Stop input
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_stopInputSession_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_stopInputSession_002 start---------------------");
      try{
        let inputMethodCtrl = inputMethod.getController();
        console.info("====>inputMethod_test_stopInputSession_002 result:" + typeof inputMethodCtrl);
        inputMethodCtrl.stopInputSession().then((data) => {
          expect().assertFail();
          done();
        }).catch((err) => {
          console.debug("inputMethod_test_stopInputSession_002 faild: " + JSON.stringify(err));
          expect(err.code).assertEqual('12800003')
          done();
        })
      }catch(error){
        console.info("====>inputMethod_test_stopInputSession_002 catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_stopInputSession_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_stopInputSession_001
     * @tc.name   Stop input
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_stopInputSession_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_stopInputSession_001 start---------------------");
      let inputMethodCtrl = inputMethod.getController();
      console.debug("inputMethod_test_stopInputSession_001 result: " + typeof inputMethodCtrl);
      try{
          inputMethodCtrl.stopInputSession((err)=>{
            if(err){
              console.info("====>inputMethod_test_stopInputSession_001 faild: " + JSON.stringify(err));
              expect(err.code).assertEqual('12800003');
              done();
            }else{
              expect().assertFail();
              done();
            }
          })
      }catch(err){
          expect().assertFail();
          done();
      }
    });
    
    /*
     * @tc.number  inputMethod_test_EXCEPTION_PERMISSION_001
     * @tc.name   Errorcode 201. The permissions check fails.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_PERMISSION_001', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_PERMISSION;
      console.info("====>inputMethod_test_EXCEPTION_PERMISSION_001 result:" + keyType);
      expect(keyType).assertEqual(201);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_PARAMCHECK_002
     * @tc.name   Errorcode 401. The parameters check fails.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_PARAMCHECK_002', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_PARAMCHECK;
      console.info("====>inputMethod_test_EXCEPTION_PARAMCHECK_002 result:" + keyType);
      expect(keyType).assertEqual(401);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_UNSUPPORTED_003
     * @tc.name   Errorcode 801. Call unsupported api.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_UNSUPPORTED_003', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_UNSUPPORTED;
      console.info("====>inputMethod_test_EXCEPTION_UNSUPPORTED_003 result:" + keyType);
      expect(keyType).assertEqual(801);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_PACKAGEMANAGER_004
     * @tc.name   Errorcode 12800001. Package manager error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_PACKAGEMANAGER_004', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_PACKAGEMANAGER;
      console.info("====>inputMethod_test_EXCEPTION_PACKAGEMANAGER_004 result:" + keyType);
      expect(keyType).assertEqual(12800001);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_IMENGINE_005
     * @tc.name   Errorcode 12800002. Input method engine error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_IMENGINE_005', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_IMENGINE;
      console.info("====>inputMethod_test_EXCEPTION_IMENGINE_005 result:" + keyType);
      expect(keyType).assertEqual(12800002);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_IMCLIENT_006
     * @tc.name   Errorcode 12800003. Input method client error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_IMCLIENT_006', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_IMCLIENT;
      console.info("====>inputMethod_test_EXCEPTION_IMCLIENT_006 result:" + keyType);
      expect(keyType).assertEqual(12800003);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_KEYEVENT_007
     * @tc.name   Errorcode 12800004. Key event processing error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_KEYEVENT_007', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_KEYEVENT;
      console.info("====>inputMethod_test_EXCEPTION_KEYEVENT_007 result:" + keyType);
      expect(keyType).assertEqual(12800004);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_CONFPERSIST_008
     * @tc.name   Errorcode 12800005. Configuration persisting error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_CONFPERSIST_008', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_CONFPERSIST;
      console.info("====>inputMethod_test_EXCEPTION_CONFPERSIST_008 result:" + keyType);
      expect(keyType).assertEqual(12800005);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_CONTROLLER_009
     * @tc.name   Errorcode 12800006. Input method controller error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_CONTROLLER_009', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_CONTROLLER;
      console.info("====>inputMethod_test_EXCEPTION_CONTROLLER_009 result:" + keyType);
      expect(keyType).assertEqual(12800006);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_SETTINGS_010
     * @tc.name   Errorcode 12800007. Input method settings extension error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_SETTINGS_010', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_SETTINGS;
      console.info("====>inputMethod_test_EXCEPTION_SETTINGS_010 result:" + keyType);
      expect(keyType).assertEqual(12800007);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_IMMS_011
     * @tc.name   Errorcode 12800008. Input method manager service error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_IMMS_011', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_IMMS;
      console.info("====>inputMethod_test_EXCEPTION_IMMS_011 result:" + keyType);
      expect(keyType).assertEqual(12800008);
      done();
    });

    /*
     * @tc.number  inputMethod_test_EXCEPTION_OTHERS_012
     * @tc.name   Errorcode 12899999. Others error.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_EXCEPTION_OTHERS_012', 0, async function (done) {
      let keyType = inputMethod.EXCEPTION_OTHERS;
      console.info("====>inputMethod_test_EXCEPTION_OTHERS_012 result:" + keyType);
      expect(keyType).assertEqual(12899999);
      done();
    });
  });
};
