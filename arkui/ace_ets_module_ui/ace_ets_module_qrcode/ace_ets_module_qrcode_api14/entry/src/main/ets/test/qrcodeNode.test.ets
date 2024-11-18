/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../MainAbility/utils/Common';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeEach(async (done: Function) => {
      console.info('qrcodeNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/qrcodeNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get qrcodeNode state pages: ' + JSON.stringify(pages));
        if (!('qrcodeNode' == pages.name)) {
          console.info('get qrcodeNode pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push qrcodeNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('qrcodeNode beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('qrcodeNode after each called');
    })
    it('QRCodeNode0100', 0, async (done: Function) => {

        let tagName = 'QRCodeNode0100';
        console.info('[' + tagName + '] START============================');
        let strJsonNew = getInspectorByKey('key_QRCode_001');
        console.info('[' + tagName + '] Search width is: ' + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs
          .width));
  
        expect(JSON.parse(strJsonNew).$attrs.width).assertEqual('100.00vp');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  
      it('QRCodeNode0200', 0, async (done: Function) => {
        let tagName = 'QRCodeNode0200';
        console.info('[' + tagName + '] START============================');
        let strJsonNew = getInspectorByKey('key_QRCode_001');
        console.info('[' + tagName + '] Search contentOpacity is: ' + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs
          .contentOpacity));
        expect(JSON.parse(strJsonNew).$attrs.contentOpacity).assertEqual(undefined);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  
    })
  }
  