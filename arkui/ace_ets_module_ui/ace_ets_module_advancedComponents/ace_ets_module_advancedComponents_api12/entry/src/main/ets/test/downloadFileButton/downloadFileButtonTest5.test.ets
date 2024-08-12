import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function downloadFileButtonTest5() {

  describe('downloadFileButtonTest5', function () {
    beforeEach(async function (done) {
      console.info('downloadFileButtonTest5 beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/Index5',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('downloadFileButtonTest5' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push downloadFileButtonTest5 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('downloadFileButtonTest5 beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('downloadFileButtonTest5 after each called');
    })

    it('downloadFileButtonTest5', 0, async function (done) {
      console.info('[downloadFileButtonTest5] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[downloadFileButtonTest5] END');
      done();
    });
  })

}