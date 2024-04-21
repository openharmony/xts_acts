import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import window from '@ohos.window';

import {GlobalContext} from '../test/GlobalContext.test'
import { BusinessError } from '@ohos.base';


export default function FloatingWindowTest() {
  describe('FloatingWindowTest', () => {
    let tag = 'FloatingWindowTestLog:'
    beforeAll(() => {
      console.info('beforeAll function.');
    })
    beforeEach(() => {
      console.info('beforeEach function.');
    })
    afterEach(() => {
      console.info('afterEach function.');
    })
    afterAll(() => {
      console.info('afterAll function.');
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_FUNCTION_WULTMINDOW_LATERAL_FLOATING_1300
     * @tc.name      : test_landscap_disableLandscapeMultiWindow
     * @tc.desc      : preferMultWindowOrientation配置为landscap，调用disableLandscapeMultiWindow不报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_landscap_disableLandscapeMultiWindow', 2, async (done:Function) => {
      try{
        await window.getLastWindow(GlobalContext.getContext().getObject("context")).then(async (data) => {
          let windowClass = data;
          console.info(tag+'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
          await windowClass.disableLandscapeMultiWindow().then(() => {
            console.info(tag+'Succeeded in making multi-window become not landscape.');
            expect(true).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(tag+'Failed to make multi-window become not landscape. Cause: ' + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          });
        }).catch((err: BusinessError) => {
          console.error(tag+'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(tag+'Failed to getLastWindow window. Cause: ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

    })
  })
}