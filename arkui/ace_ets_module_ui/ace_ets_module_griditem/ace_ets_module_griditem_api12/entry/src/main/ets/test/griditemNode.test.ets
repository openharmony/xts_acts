import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../MainAbility/utils/Common';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeEach(async (done: Function) => {
      console.info('griditemNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/griditemNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get griditemNode state pages: ' + JSON.stringify(pages));
        if (!('griditemNode' == pages.name)) {
          console.info('get griditemNode pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push griditemNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('griditemNode beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('griditemNode after each called');
    })
    it('gridItemNode0100', 0, async (done: Function) => {

      let tagName = 'gridItemNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_ gridItem_001');
      console.info('[' + tagName + '] Search width is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .width));

      expect(JSON.parse(strJsonNew).$attrs.width).assertEqual('100.00%');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    it('gridItemNode0200', 0, async (done: Function) => {

      let tagName = 'gridItemNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_ gridItem_001');
      console.info('[' + tagName + '] Search textAlign is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .textAlign));

      expect(JSON.parse(strJsonNew).$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}