/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import input from 'libinputndk.so';

export default function MultimodalInputNdkTest() {
  describe('MultimodalInputNdkTest', () => {

    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    /**
     * @tc.number: SUB_MMI_Api_Input_CreateTouchEvent_0100
     * @tc.name: SUB_MMI_Api_Input_CreateTouchEvent_0100
     * @tc.desc: OH_Input_CreateTouchEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_CreateTouchEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_CreateTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_CreateTouchEvent`);
      try {
        let data = input.createTouchEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
          console.info(`${caseName} created TouchEvent success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} created TouchEvent fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateTouchEvent`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_DestroyTouchEvent_0100
     * @tc.name: SUB_MMI_Api_Input_DestroyTouchEvent_0100
     * @tc.desc: OH_Input_DestroyTouchEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_DestroyTouchEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_DestroyTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_DestroyTouchEvent`);
      try {
        let data = input.destroyTouchEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroy TouchEvent success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} destroy TouchEvent fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyTouchEvent`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_TouchEventAction_0100
     * @tc.name: SUB_MMI_Api_Input_TouchEventAction_0100
     * @tc.desc: OH_Input_GetTouchEventAction Interface testing, verify the set and get of touchEvent action
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_TouchEventAction_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_TouchEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventAction`);
      try {
        let data = input.touchEventAction(1);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventAction`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_TouchEventFingerId_0100
     * @tc.name: SUB_MMI_Api_Input_TouchEventFingerId_0100
     * @tc.desc: OH_Input_GetTouchEventFingerId Interface testing, verify the set and get of touchEvent id
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_TouchEventFingerId_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_TouchEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventFingerId`);
      try {
        let data = input.touchEventFingerId(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventFingerId`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_TouchEventDisplayX_0100
     * @tc.name: SUB_MMI_Api_Input_TouchEventDisplayX_0100
     * @tc.desc: OH_Input_GetTouchEventDisplayX Interface testing, verify the set and get of touchEvent displayX
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_TouchEventDisplayX_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_TouchEventDisplayX_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventDisplayX`);
      try {
        let data = input.touchEventDisplayX(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventDisplayX`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_TouchEventDisplayY_0100
     * @tc.name: SUB_MMI_Api_Input_TouchEventDisplayY_0100
     * @tc.desc: OH_Input_GetTouchEventDisplayY Interface testing, verify the set and get of touchEvent displayY
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_TouchEventDisplayY_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_TouchEventDisplayY_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventDisplayY`);
      try {
        let data = input.touchEventDisplayY(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventDisplayY`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_TouchEventActionTime_0100
     * @tc.name: SUB_MMI_Api_Input_TouchEventActionTime_0100
     * @tc.desc: OH_Input_GetTouchEventActionTime Interface testing, verify the set and get of touchEvent actionTime
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_TouchEventActionTime_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_TouchEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventActionTime`);
      try {
        let data = input.touchEventActionTime(200);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 200) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventActionTime`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_InjectTouchEvent_0100
     * @tc.name: SUB_MMI_Api_Input_InjectTouchEvent_0100
     * @tc.desc: OH_Input_InjectTouchEvent Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_InjectTouchEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_InjectTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_InjectTouchEvent`);
      try {
        let data = input.injectTouchEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 401) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_InjectTouchEvent`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_CreateMouseEvent_0100
     * @tc.name: SUB_MMI_Api_Input_CreateMouseEvent_0100
     * @tc.desc: OH_Input_CreateMouseEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_CreateMouseEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_CreateMouseEvent_0100';
      console.info(`${caseName} start to test OH_Input_CreateMouseEvent`);
      try {
        let data = input.createMouseEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateMouseEvent`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_DestroyMouseEvent_0100
     * @tc.name: SUB_MMI_Api_Input_DestroyMouseEvent_0100
     * @tc.desc: OH_Input_DestroyMouseEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_DestroyMouseEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_DestroyMouseEvent_0100';
      console.info(`${caseName} start to test OH_Input_DestroyMouseEvent`);
      try {
        let data = input.destroyMouseEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyMouseEvent`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_MouseEventAction_0100
     * @tc.name: SUB_MMI_Api_Input_MouseEventAction_0100
     * @tc.desc: OH_Input_GetMouseEventAction Interface testing, verify the set and get of mouseEvent action
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_MouseEventAction_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_MouseEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventAction`);
      try {
        let data = input.mouseEventAction(2);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 2) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventAction`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_MouseEventDisplayX_0100
     * @tc.name: SUB_MMI_Api_Input_MouseEventDisplayX_0100
     * @tc.desc: OH_Input_GetMouseEventDisplayX Interface testing, verify the set and get of mouseEvent displayX
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_MouseEventDisplayX_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_MouseEventDisplayX_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventDisplayX`);
      try {
        let data = input.mouseEventDisplayX(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventDisplayX`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_MouseEventDisplayY_0100
     * @tc.name: SUB_MMI_Api_Input_MouseEventDisplayY_0100
     * @tc.desc: OH_Input_GetMouseEventDisplayY Interface testing, verify the set and get of mouseEvent displayY
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_MouseEventDisplayY_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_MouseEventDisplayY_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventDisplayY`);
      try {
        let data = input.mouseEventDisplayY(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventDisplayY`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_MouseEventButton_0100
     * @tc.name: SUB_MMI_Api_Input_MouseEventButton_0100
     * @tc.desc: OH_Input_GetMouseEventButton Interface testing, verify the set and get of mouseEvent button
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_MouseEventButton_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_MouseEventButton_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventButton`);
      try {
        let data = input.mouseEventButton(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventButton`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_MouseEventAxisType_0100
     * @tc.name: SUB_MMI_Api_Input_MouseEventAxisType_0100
     * @tc.desc: OH_Input_GetMouseEventAxisType Interface testing, verify the set and get of mouseEvent axisType
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_MouseEventAxisType_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_MouseEventAxisType_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventAxisType`);
      try {
        let data = input.mouseEventAxisType(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventAxisType`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_MouseEventAxisValue_0100
     * @tc.name: SUB_MMI_Api_Input_MouseEventAxisValue_0100
     * @tc.desc: OH_Input_GetMouseEventAxisValue Interface testing, verify the set and get of mouseEvent axisValue
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_MouseEventAxisValue_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_MouseEventAxisValue_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventAxisValue`);
      try {
        let data = input.mouseEventAxisValue(15.0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 15.0) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventAxisValue`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_MouseEventActionTime_0100
     * @tc.name: SUB_MMI_Api_Input_MouseEventActionTime_0100
     * @tc.desc: OH_Input_GetMouseEventActionTime Interface testing, verify the set and get of mouseEvent actionTime
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_MouseEventActionTime_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_MouseEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventActionTime`);
      try {
        let data = input.mouseEventActionTime(200);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 200) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventActionTime`);
    })
    /**
     * @tc.number: SUB_MMI_Api_Input_InjectMouseEvent_0100
     * @tc.name: SUB_MMI_Api_Input_InjectMouseEvent_0100
     * @tc.desc: OH_Input_InjectMouseEvent Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Api_Input_InjectMouseEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Api_Input_InjectMouseEvent_0100';
      console.info(`${caseName} start to test OH_Input_InjectMouseEvent`);
      try {
        let data = input.injectMouseEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 401) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_InjectMouseEvent`);
    })
  })
}