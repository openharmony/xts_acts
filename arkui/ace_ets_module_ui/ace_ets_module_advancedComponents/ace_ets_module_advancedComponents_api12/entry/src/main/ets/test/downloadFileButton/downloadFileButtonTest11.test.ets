import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function downloadFileButtonTest11() {

  describe('downloadFileButtonTest11', function () {
    beforeEach(async function (done) {
      console.info('downloadFileButtonTest11 beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/Index11',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('downloadFileButtonTest11' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push downloadFileButtonTest11 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('downloadFileButtonTest11 beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('downloadFileButtonTest11 after each called');
    })

    it('downloadFileButtonTest11', 0, async function (done) {
      console.info('[downloadFileButtonTest11] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('下载分享'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[downloadFileButtonTest11] END');
      done();
    });
  })

}