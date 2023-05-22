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
import inputMethod from '@ohos.inputMethod';
import subtype from '@ohos.InputMethodSubtype';

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
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_001 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
        try {
          if(err){
            console.info("====>inputMethod_test_listInputMethodSubtype_001  failed" + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info("====>inputMethod_test_listInputMethodSubtype_001 listInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.info("====>inputMethod_test_listInputMethodSubtype_001 listInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
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
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_002 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
        try {
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
        } catch (error) {
          console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
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
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_003 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
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
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_004 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_004 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty).then((data) => {
        try{
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
        }catch(error){
          console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype catch error" + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }).catch(err => {
        console.info("====>inputMethod_test_listInputMethodSubtype_004  failed" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
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
      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listCurrentInputMethodSubtype((err, data) => {
        try {
          if(err){
            console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001  failed" + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
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
     * @tc.number  inputMethod_test_showOptionalInputMethods_001
     * @tc.name    Show input method setting extension dialog
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_showOptionalInputMethods_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_001 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_showOptionalInputMethods_001 result:" + inputMethodSetting);
      inputMethodSetting.showOptionalInputMethods((err, data) => {
        try {
          if(err){
            console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods faild: " + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods success data is : " + data);
          expect(true).assertTrue();
          setTimeout(() => {
            done();
          }, 1500);
        } catch (error) {
          console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods catch error: " + JSON.stringify(error));
          done();
        }
      });
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
        await inputMethodCtrl.stopInputSession().then((data) => {
          console.info("====>inputMethod_test_stopInputSession_002 data:" + data);
          expect().assertFail();
          done();
        }).catch((err) => {
          expect(err.code).assertEqual(12800003)
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
      inputMethodCtrl.stopInputSession((err)=>{
        try {
          if(err){
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + JSON.stringify(err));
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + err.code);
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + typeof(err.code));
            expect(err.code).assertEqual(12800003);
            done();
          }else{
            expect().assertFail();
            done();
          }
        } catch (err) {
          done();
        }
      })
    });

  });
};
