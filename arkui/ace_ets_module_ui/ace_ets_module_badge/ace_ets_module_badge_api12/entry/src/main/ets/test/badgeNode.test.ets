import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../MainAbility/utils/Common';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeEach(async (done: Function) => {
      console.info('badgeNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/badgeNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get badgeNode state pages: ' + JSON.stringify(pages));
        if (!('badgeNode' == pages.name)) {
          console.info('get badgeNode pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push badgeNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('badgeNode beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('badgeNode after each called');
    })
   
    it('badgeNode0100', 0, async (done: Function) => {

      let tagName = 'badgeNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_ badge_001');
      console.info('[' + tagName + '] Search width is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .width));

      expect(JSON.parse(strJsonNew).$attrs.width).assertEqual('20.00vp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
