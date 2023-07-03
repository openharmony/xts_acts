/*
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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import {UiDriver, UiComponent, BY, Driver, Component, ON} from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
export default function CanvasShaderTest() {

  const SUITE = 'CanvasShader'
  describe('CanvasShaderTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/CanvasShader",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("CanvasShader" == pages.name)) {
          await router.pushUrl(options).then(()=>{
            console.info(`${SUITE} router.pushUrl success`);
          }).catch(err => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_Canvas_Shader_0100
     *tc.name   CanvasRenderingContext2D support createConicGradient
     *tc.desc   CanvasRenderingContext2D support createConicGradient
     */
    it('ArkUI_Canvas_Shader_0100', 0, async function (done) {
      let CASE = 'ArkUI_Canvas_Shader_0100'
      console.info(`${SUITE} ${CASE} START`)
      let strJson = getInspectorByKey('CanvasShader_Canvas1')
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });

    /*
     *tc.number ArkUI_Canvas_Shader_0200
     *tc.name   CanvasRenderingContext2D.createPattern support "clamp" and "mirror"
     *tc.desc   CanvasRenderingContext2D.createPattern support "clamp" and "mirror"
     */
    it('ArkUI_Canvas_Shader_0200', 0, async function (done) {
      let CASE = 'ArkUI_Canvas_Shader_0200'
      console.info(`${SUITE} ${CASE} START`)
      let strJson = getInspectorByKey('CanvasShader_Canvas2')
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Canvas')
      console.info(`${SUITE} ${CASE} END`)
      done()
    });

  })
}
