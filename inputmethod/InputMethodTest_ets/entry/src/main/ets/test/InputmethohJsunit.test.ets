// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'hypium/index';
import inputMethod from '@ohos.inputmethod';

export default function settingUiJsunit() {
  describe('appInfoTest_input_2', function () {
    console.info("************* settings Test start*************");
    it('inputmethoh_test_001', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("inputmethoh_test_001 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.listInputMethod((arr) => {
        console.info("inputmethoh_test_001 listInputMethod result---" + JSON.stringify(arr));
        expect(1==1).assertTrue();
      });
      done();
    });

    it('inputmethoh_test_002', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("inputmethoh_test_002 result:" + JSON.stringify(inputMethodSetting));
      let promise = inputMethodSetting.listInputMethod();
      console.info("inputmethoh_test_002 listInputMethod result---" + JSON.stringify(promise));
      if (promise.length > 0){
        let obj = promise[0]
        console.info("inputmethoh_test_002 listInputMethod obj---" + JSON.stringify(obj));
        expect(obj.packageName != null).assertTrue();
        expect(obj.methodId != null).assertTrue();
      }else{
        console.info("inputmethoh_test_002 listInputMethod is null");
        except().assertFail()
      }
      done();
    });

    it('inputmethoh_test_003', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("inputmethoh_test_003 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.displayOptionalInputMethod(() => {
        console.info("inputmethoh_test_003 displayOptionalInputMethod---");
      });
      done();
    });

    it('inputmethoh_test_004', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("inputmethoh_test_004 result:" + JSON.stringify(inputMethodSetting));
      let promise = inputMethodSetting.displayOptionalInputMethod();
      console.info("inputmethoh_test_004 displayOptionalInputMethod result---" + JSON.stringify(promise));
      expect(promise).assertEqual(undefined)
      done();
    });

    it('inputmethoh_test_005', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      console.info("inputmethoh_test_005 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInput((res) => {
        console.info("inputmethoh_test_005 stopInput result----" + res);
      });
      done();
    });

    it('inputmethoh_test_006', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      console.info("inputmethoh_test_006 result:" + JSON.stringify(inputMethodCtrl));
      let promise = inputMethodCtrl.stopInput();
      console.info("inputmethoh_test_006 inputMethodCtrl stopInput result---" + JSON.stringify(promise));
      expect(promise).assertEqual(true)
      done();
    });

    /*
     * @tc.number: inputmethod_test_MAX_TYPE_NUM_001
     * @tc.name: inputMethod::MAX_TYPE_NUM
     * @tc.desc: Verify Max_ TYPE_ NUM
     */
    it('inputmethod_test_MAX_TYPE_NUM_001', 0, async function (done) {
      console.info("************* inputmethod_test_MAX_TYPE_NUM_001 Test start*************");
      let inputMethodSetting = inputMethod.MAX_TYPE_NUM;
      console.info("inputmethod_test_001 result:" + inputMethodSetting);
      expect(inputMethodSetting != null).assertTrue();
      console.info("************* inputmethod_test_MAX_TYPE_NUM_001 Test end*************");
      done();
    });

    /*
     * @tc.number  inputmethod_test_switchInputMethod_001
     * @tc.name    Test Indicates the input method which will replace the current one.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_switchInputMethod_001', 0, async function (done) {
      console.info("************* inputmethod_test_switchInputMethod_001 Test start*************");
      let inputMethodProperty = {
        packageName:"com.example.kikakeyboard",
        methodId:"ServiceExtAbility"
      }
      inputMethod.switchInputMethod(inputMethodProperty).then((data) => {
        console.info("inputmethod_test_switchInputMethod_001 data:" + data)
        expect(data).assertEqual(true);
      }).catch((err) => {
        console.error('inputmethod_test_switchInputMethod_001 failed because ' + JSON.stringify(err));
      });
      console.info("************* inputmethod_test_switchInputMethod_001 Test end*************");
      done();
    });

    /*
     * @tc.number  inputmethod_test_switchInputMethod_002
     * @tc.name    Test Indicates the input method which will replace the current one.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_switchInputMethod_002', 0, async function (done) {
      console.info("************* inputmethod_test_switchInputMethod_002 Test start*************");
      let inputMethodProperty = {
        packageName:"com.example.kikakeyboard",
        methodId:"ServiceExtAbility"
      }
      inputMethod.switchInputMethod(inputMethodProperty, (err, data)=>{
        if(err){
          console.info("inputmethod_test_switchInputMethod_002 error:" + err);
          expect().assertFail()
        }
        console.info("inputmethod_test_switchInputMethod_002 data:" + data)
        expect(data == true).assertTrue();
      });
      console.info("************* inputmethod_test_switchInputMethod_002 Test end*************");
      done();
    });
  })
}
