import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function downloadFileButtonTest13() {

  describe('downloadFileButtonTest13', function () {
    beforeEach(async function (done) {
      console.info('downloadFileButtonTest13 beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/Index13',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('downloadFileButtonTest13' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push downloadFileButtonTest13 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('downloadFileButtonTest13 beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('downloadFileButtonTest13 after each called');
    })

    it('downloadFileButtonTest13', 0, async function (done) {
      console.info('[downloadFileButtonTest13] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('继续接收'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[downloadFileButtonTest13] END');
      done();
    });
  })

}