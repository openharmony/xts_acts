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

import { expect,afterEach, beforeAll, describe, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect,MouseButton } from '@ohos.UiTest';
import nativeFunc from 'libnativefunc.so'

async function MouseClickComponent(id: string, mouseButton: MouseButton , done?: Function) {
  let driver = Driver.create();
  let button = await driver.findComponent(ON.id(id));
  let point = await button.getBounds();
  await driver.mouseClick({x:point.left+10, y:point.top+10}, mouseButton);
}

export default function InputEventTest() {

  describe('InputEventTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_001
     * @tc.name       : testInputEvent001
     * @tc.desc       : testing input event value for mouse click  button 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent001', 0, async (done: Function) => {
      let PAGE_TAG = 'InputEventTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await Utils.sleep(1000)
      await MouseClickComponent('buttonMouse', MouseButton.MOUSE_BUTTON_RIGHT);     
      await Utils.sleep(1000)
      // When event type is ARKUI_UIINPUTEVENT_TYPE_MOUSE
      // and event source Type is SOURCETYPE_NONE 
      // and event toolType is OH_NATIVEXCOMPONENT_SOURCETOOL_UNKNOWN
      // component 'buttonMouse' backgroundColor will change to '#FF00FF00'. Assert the backgroundColor.
      expect(Utils.getComponentInfoByKey('buttonMouse').$attrs.backgroundColor).assertEqual('#FF00FF00')
      await Utils.sleep(1000)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_002
     * @tc.name       : testInputEvent002
     * @tc.desc       : testing input event value for touch button 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent002', 0, async (done: Function) => {
      let PAGE_TAG = 'InputEventTest';     
      await Utils.pushPage(`inputevent/${PAGE_TAG}`, ()=>{        
        setTimeout(()=>{}, 100000)        
      });     
      //await Utils.clickComponent('textTouch');
      let driver = Driver.create()
      let rect = Utils.getComponentRect('textTouch');
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info('testInputEvent002  x= ' +  x  + ', y = ' + y);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(x),y: Math.round(y)});
      pointers.setPoint(0,1,{x: Math.round(y),y: Math.round(y + vp2px(20))});
      pointers.setPoint(1,0,{x: Math.round(x),y: Math.round(y)});
      pointers.setPoint(1,1,{x: Math.round(x),y: Math.round(y + vp2px(20))});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(3000);
      // When event type is ARKUI_UIINPUTEVENT_TYPE_TOUCH
      // and event source Type is SOURCETYPE_TOUCH 
      // and event toolType is SOURCETOLL_FINGER
      // component 'textTouch' backgroundColor will change to '#FFDDDDDD'. Assert the backgroundColor.    
      expect(Utils.getComponentInfoByKey('textTouch').$attrs.backgroundColor).assertEqual('#FFDDDDDD')
      await Utils.sleep(1000)
      done();
    });    

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_003
     * @tc.name       : testInputEvent003
     * @tc.desc       : testing Input Event function abnormal parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent003', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent003()).assertEqual(0);
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_004
     * @tc.name       : testInputEvent004
     * @tc.desc       : testing AxisEvent GetVerticalAxisValue abnormal parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent004', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent004()).assertEqual(0)
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_005
     * @tc.name       : testInputEvent005
     * @tc.desc       : testing AxisEvent GetHorizontalAxisValue abnormal parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent005', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent005()).assertEqual(0)
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_006
     * @tc.name       : testInputEvent006
     * @tc.desc       : testing AxisEvent GetPinchAxisScaleValue abnormal parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent006', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent006()).assertEqual(0)
      done()
    });   

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_008
     * @tc.name       : testInputEvent008
     * @tc.desc       : testing PointerEvent SetInterceptHitTestMode abnormal parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent008', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent008()).assertEqual(0)
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_009
     * @tc.name       : testInputEvent009
     * @tc.desc       : testing Input Event GetMouseButton abnormal parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent009', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent009()).assertEqual(0)
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_010
     * @tc.name       : testInputEvent010
     * @tc.desc       : testing Input Event GetMouseAction abnormal parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent010', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent010()).assertEqual(0)
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_011
     * @tc.name       : testInputEvent011
     * @tc.desc       : testing Right Mouse button for GetMouseButton and GetMouseAction sequence of Press and Release.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent011', 0, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseRightTest', MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1000);
      // When mouse button is RIGHT_MOUSE_BUTTON and mouse action sequence is MOUSE_PRESSED then MOUSE_RELEASE
      // component 'onMouseRightTest' backgroundColor will change to '#FFFFFF00'. Assert the backgroundColor.
      expect(Utils.getComponentInfoByKey('onMouseRightTest').$attrs.backgroundColor).assertEqual('#FFFFFF00');
      await Utils.sleep(2000);
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_012
     * @tc.name       : testInputEvent012
     * @tc.desc       : testing Input Event of Left Mouse button for GetMouseButton.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent012', 0, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseLeftTest',MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000);
      // When mouse button is LEFT_MOUSE_BUTTON and mouse action is MOUSE_PRESSED,
      // component 'onMouseLeftTest' backgroundColor will change to '#FFFF11FF'. Assert the backgroundColor.
      expect(Utils.getComponentInfoByKey('onMouseLeftTest').$attrs.backgroundColor).assertEqual('#FFFF11FF');
      await Utils.sleep(2000);
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_013
     * @tc.name       : testInputEvent013
     * @tc.desc       : testing Input Event of Middle Mouse button for GetMouseButton.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent013', 0, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseMiddleTest',MouseButton.MOUSE_BUTTON_MIDDLE);
      await Utils.sleep(1000);
      // When mouse button is MIDDLE_MOUSE_BUTTON and mouse action is MOUSE_PRESSED,
      // component 'onMouseMiddleTest' backgroundColor will change to '#FFFFC0CB'. Assert the backgroundColor.      
      expect(Utils.getComponentInfoByKey('onMouseMiddleTest').$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      await Utils.sleep(2000);
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_014
     * @tc.name       : testInputEvent014
     * @tc.desc       : testing Input Event of Mouse movement for GetMouseAction.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent014', 0, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseMoveTest',MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000);
      // When mouse action is MOUSE_MOVEMENT,
      // component 'onMouseMoveTest' backgroundColor will change to '#FF000000'. Assert the backgroundColor.          
      expect(Utils.getComponentInfoByKey('onMouseMoveTest').$attrs.backgroundColor).assertEqual('#FF000000');
      await Utils.sleep(2000);
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_015
     * @tc.name       : testInputEvent015
     * @tc.desc       : testing Input Event function abnormal parameter of point event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent015', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent015()).assertEqual(0);
      done()
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_016
     * @tc.name       : testInputEvent016
     * @tc.desc       : testing Input Event function abnormal parameter of history point event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent016', 0, async (done: Function) => {
      expect(nativeFunc.testInputEvent016()).assertEqual(0);
      done()
    });
    
    /*
     * @tc.number     : SUB_ARKUI_CAPI_INPUT_EVENT_017
     * @tc.name       : testInputEvent017
     * @tc.desc       : testing input event value for Axis event.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testInputEvent017', 0, async (done: Function) => {
      let PAGE_TAG = 'InputEventAxisTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let rect = Utils.getComponentRect("AxisID");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("testInputEvent017  x= " +  x  + ", y = " + y);
      await driver.mouseScroll({x:x, y:y}, true, 30);
      await Utils.sleep(2000);
      // When event type is ARKUI_UIINPUTEVENT_TYPE_AXIS
      // and event source Type is MOUSE
      // component 'AxisID' backgroundColor will change to '#FF00FF00'. Assert the backgroundColor.
      expect(Utils.getComponentInfoByKey('AxisID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
  })
}
