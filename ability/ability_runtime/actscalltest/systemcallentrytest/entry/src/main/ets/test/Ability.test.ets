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
import { describe, it, expect } from "@ohos/hypium"

const ERROR_CODE_INVALID_PARAM = 401;
const ERROR_CODE_FUNC_REGISTERED = 16200004;
const ERROR_CODE_FUNC_NOT_EXIST = 16200005;

export default function abilityTest() {
  describe('ActsAbilityTest', function () {

    /**
     * @tc.number: ACTS_CommonComponent_Call_3100
     * @tc.name: The parameter method of the Callee.on function is an empty string.
     * @tc.desc: Verify that the parameter method of the Callee.on function is an empty string.
     */
    it('ACTS_CommonComponent_Call_3100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3100 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3100 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on('', onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3100 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3200
     * @tc.name: The parameter method of the Callee.on function is null.
     * @tc.desc: Verify that the parameter method of the Callee.on function is null.
     */
    it('ACTS_CommonComponent_Call_3200', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3200 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3200 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on(null, onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3200 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3300
     * @tc.name: The parameter method of the Caller.callWithResult function is undefined.
     * @tc.desc: Verify that the parameter method of the Caller.callWithResult function is undefined.
     */
    it('ACTS_CommonComponent_Call_3300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3300 begin');

      function onTest(data) {
        console.log('ACTS_CommonComponent_Call_3300 onTest');
      }

      let finishFlag = 0;
      try {
        globalThis.callee.on(undefined, onTest);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3300 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3400
     * @tc.name: The parameter "method" of the Callee.off function is an empty string.
     * @tc.desc: Verify that the parameter "method" of the Callee.off function is an empty string.
     */
    it('ACTS_CommonComponent_Call_3400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3400 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off('');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3400 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3500
     * @tc.name: The parameter "method" of the Callee.off function is null.
     * @tc.desc: Verify that the parameter "method" of the Callee.off function is null.
     */
    it('ACTS_CommonComponent_Call_3500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3500 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off(null);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3500 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /**
     * @tc.number: ACTS_CommonComponent_Call_3600
     * @tc.name: The parameter “method” of the Callee.off function is undefined.
     * @tc.desc: Verify that the parameter “method” of the Callee.off function is undefined.
     */
    it('ACTS_CommonComponent_Call_3600', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_3600 begin');

      let finishFlag = 0;
      try {
        globalThis.callee.off(undefined);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_3600 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4300
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4300', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4300 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', "");
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4300 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4400
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4400', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4400 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', null);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4400 call err.code: ' + JSON.stringify(err.code) +
          ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_4500
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_4500', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_4500 begin');
      let finishFlag = 0;
      try {
        globalThis.callee.on('testCall', undefined);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_4500 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_INVALID_PARAM);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5000
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5000', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5000 begin');
      let finishFlag = 0;

      function testCallback_5100() {
        console.log('ACTS_CommonComponent_Call_5000 testCallback');
      }

      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5000', testCallback_5100);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5000 call err' + err);
        expect().assertFail();
        globalThis.callee.off('ACTS_CommonComponent_Call_5000');
        done();
      }
      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5000', testCallback_5100);
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5000 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_FUNC_REGISTERED);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      globalThis.callee.off('ACTS_CommonComponent_Call_5000');
      console.log('ACTS_CommonComponent_Call_5000 finished');
      done();
    })

    /*
      * @tc.number: ACTS_CommonComponent_Call_5100
      * @tc.name: Connects a service ability, which is used to start a cloned page ability.
      * @tc.desc: Check the event data of executor page ability publishes
      */
    it('ACTS_CommonComponent_Call_5100', 0, async function (done) {
      console.log('ACTS_CommonComponent_Call_5100 begin');
      let finishFlag = 0;

      function testCallback_5100() {
        console.log('ACTS_CommonComponent_Call_5100 testCallback');
      }

      try {
        globalThis.callee.on('ACTS_CommonComponent_Call_5100', testCallback_5100);
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5100 first step err' + err);
        expect().assertFail();
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
        done();
      }
      try {
        globalThis.callee.off('ACTS_CommonComponent_Call_5100');
      } catch (err) {
        console.log('ACTS_CommonComponent_Call_5100 call err.code: ' + JSON.stringify(err.code) +
        ' err.msg: ' + JSON.stringify(err.message));
        expect(err.code).assertEqual(ERROR_CODE_FUNC_NOT_EXIST);
        finishFlag = 1;
      }

      expect(finishFlag).assertEqual(1);
      console.log('ACTS_CommonComponent_Call_5100 finished');
      done();
    })
  })
}