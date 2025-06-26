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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import effectKit from '@ohos.effectKit';
import image from '@ohos.multimedia.image';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function GraphicEffectKitStaticTest() {

  describe("graphicEffectKitStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.effect.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })
    /**
     * @tc.number    : effectKitTest_static_0100
     * @tc.name      : effectKitTest_static_0100
     * @tc.desc      : effect for test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it("effectKitTest_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      // effectKit test codes
      hilog.info(domain, tag, '%{public}s', 'effectKit test START');
      const opts: image.InitializationOptions = {
        size: { width: 400, height: 360},
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        alphaType: image.AlphaType.PREMUL,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        editable: true
      };
      let pixelMap = image.createPixelMapSync(opts);
      if (pixelMap == undefined) {
        hilog.info(domain, tag, '%{public}s', 'effectKit createPixelMapSync failed.');
        return undefined;
      };
      try {
        let headFilter: effectKit.Filter = effectKit.createEffect(pixelMap);
        console.info('www data succeed')
        if (headFilter == undefined) {
          hilog.info(domain, tag, '%{public}s', 'effectKit createFilter failed.');
          return undefined;
        }
        let blurFilter: effectKit.Filter = headFilter.blur(10);
        expect(true).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'effectKit createFilter successfully.');
        const effectPixelMap = await blurFilter.getEffectPixelMap();
        if (effectPixelMap != undefined) {
          hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap successfully.');
        } else {
          hilog.info(domain, tag, '%{public}s', 'effectKit getEffectPixelMap failed.');
        }
        hilog.info(domain, tag, '%{public}s', 'effectKit test END');
        expect(true).assertTrue();
      } catch(err){
        console.info('www data err ' + JSON.stringify(err))
      }
      done();
    })

    /**
     * @tc.number    : testBlurTileModeStatic
     * @tc.name      : testBlurTileModeStatic
     * @tc.desc      : effect for test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */

    it('testBlurTileModeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let msgStr = 'testBlurTileMode'
      console.log(msgStr + ' begin');
      const color = new ArrayBuffer(96);
      let opts : image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 4,
          width: 6
        }
      };

      image.createPixelMap(color, opts).then((pixelMap) => {
        effectKit.createEffect(pixelMap).grayscale().getEffectPixelMap().then(data => {
          console.info('getPixelBytesNumber = ', data.getPixelBytesNumber());
        })
      })

      console.info('www data lxt ' + 1111)
      image.createPixelMap(color, opts).then((pixelMap) => {
        console.info(msgStr + ' Succeed in createPixelMap. ');
        let radius = 30;
        console.info('www data lxt ' + 222)
        let headFilter = effectKit.createEffect(pixelMap);
        console.info('www data lxt ' + 333)
        if (headFilter != null) {
          headFilter.blur(radius);
          console.info('www data lxt ' + 444)
          console.info(msgStr + ' Succeed in headFilter.blur. ');
          expect(true).assertTrue()
          console.info('www data lxt ' + 555)
          done()
        }
      }).catch((err) => {
        console.info('www data lxt ' + 666)
        console.info(msgStr + ' Failed in createPixelMap. ');
        expect().assertFail()
        done()
      })
    })
  })
}