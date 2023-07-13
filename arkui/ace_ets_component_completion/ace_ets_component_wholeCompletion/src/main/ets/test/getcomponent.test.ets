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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import Utils from './common/Utils'
import router from '@system.router';

export default function ActsgetcomponentTest() {
  describe('ActsgetcomponentTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/getcomponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getcomponent state success " + JSON.stringify(pages));
        if (!("getcomponent" == pages.name)) {
          console.info("get getcomponent state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push getcomponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getcomponent page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('ArkUX_Get_component_0010', 0, async function (done) {
      console.info('ArkUX_Get_component_0010 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0010');
          expect(parseInt(strJson.width)).assertEqual(252);
          expect(parseInt(strJson.height)).assertEqual(56);
          expect(parseInt(strJson.localOffsetX)).assertEqual(234);
          expect(parseInt(strJson.localOffsetY)).assertEqual(30);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(234);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(102);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(234);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(234);
          console.info('ArkUX_Get_component_0010 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0010 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0020', 0, async function (done) {
      console.info('ArkUX_Get_component_0020 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0020');
          expect(parseInt(strJson.width)).assertEqual(30);
          expect(parseInt(strJson.height)).assertEqual(30);
          expect(parseInt(strJson.localOffsetX)).assertEqual(345);
          expect(parseInt(strJson.localOffsetY)).assertEqual(100);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(345);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(172);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(345);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(345);
          console.info('ArkUX_Get_component_0020 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0020 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0030', 0, async function (done) {
      console.info('ArkUX_Get_component_0030 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0030');
          expect(parseInt(strJson.width)).assertEqual(165);
          expect(parseInt(strJson.height)).assertEqual(165);
          expect(parseInt(strJson.localOffsetX)).assertEqual(277);
          expect(parseInt(strJson.localOffsetY)).assertEqual(144);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(277);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(216);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(277);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(277);
          console.info('ArkUX_Get_component_0030 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0030 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0040', 0, async function (done) {
      console.info('ArkUX_Get_component_0040 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0040');
          expect(parseInt(strJson.width)).assertEqual(75);
          expect(parseInt(strJson.height)).assertEqual(75);
          expect(parseInt(strJson.localOffsetX)).assertEqual(322);
          expect(parseInt(strJson.localOffsetY)).assertEqual(351);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(322);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(423);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(322);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(322);
          console.info('ArkUX_Get_component_0040 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0040 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0050', 0, async function (done) {
      console.info('ArkUX_Get_component_0050 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0050');
          expect(parseInt(strJson.width)).assertEqual(30);
          expect(parseInt(strJson.height)).assertEqual(1136);
          expect(parseInt(strJson.localOffsetX)).assertEqual(345);
          expect(parseInt(strJson.localOffsetY)).assertEqual(1576);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(345);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(1648);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(345);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(345);
          console.info('ArkUX_Get_component_0050 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0050 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0060', 0, async function (done) {
      console.info('ArkUX_Get_component_0060 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0060');
          expect(parseInt(strJson.width)).assertEqual(126);
          expect(parseInt(strJson.height)).assertEqual(36);
          expect(parseInt(strJson.localOffsetX)).assertEqual(297);
          expect(parseInt(strJson.localOffsetY)).assertEqual(2712);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(297);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(2784);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(297);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(297);
          console.info('ArkUX_Get_component_0060 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0060 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0070', 0, async function (done) {
      console.info('ArkUX_Get_component_0070 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0070');
          expect(parseInt(strJson.width)).assertEqual(421);
          expect(parseInt(strJson.height)).assertEqual(88);
          expect(parseInt(strJson.localOffsetX)).assertEqual(149);
          expect(parseInt(strJson.localOffsetY)).assertEqual(2748);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(149);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(2820);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(149);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(149);
          console.info('ArkUX_Get_component_0070 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0070 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0080', 0, async function (done) {
      console.info('ArkUX_Get_component_0080 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0080');
          expect(parseInt(strJson.width)).assertEqual(648);
          expect(parseInt(strJson.height)).assertEqual(450);
          expect(parseInt(strJson.localOffsetX)).assertEqual(36);
          expect(parseInt(strJson.localOffsetY)).assertEqual(2836);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(36);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(2908);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(36);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(36);
          console.info('ArkUX_Get_component_0080 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0080 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0090', 0, async function (done) {
      console.info('ArkUX_Get_component_0090 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0090');
          expect(parseInt(strJson.width)).assertEqual(648);
          expect(parseInt(strJson.height)).assertEqual(1136);
          expect(parseInt(strJson.localOffsetX)).assertEqual(36);
          expect(parseInt(strJson.localOffsetY)).assertEqual(3286);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(36);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(3358);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(36);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(36);
          console.info('ArkUX_Get_component_0090 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0090 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Get_component_0100', 0, async function (done) {
      console.info('ArkUX_Get_component_0100 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0100');
          expect(parseInt(strJson.width)).assertEqual(600);
          expect(parseInt(strJson.height)).assertEqual(60);
          expect(parseInt(strJson.localOffsetX)).assertEqual(60);
          expect(parseInt(strJson.localOffsetY)).assertEqual(4452);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(60);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(4524);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(60);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(60);
          console.info('ArkUX_Get_component_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  })
}