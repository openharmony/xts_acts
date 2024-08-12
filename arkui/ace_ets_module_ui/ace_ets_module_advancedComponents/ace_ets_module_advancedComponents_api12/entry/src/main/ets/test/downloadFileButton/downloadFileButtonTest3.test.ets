import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function downloadFileButtonTest3() {

  describe('downloadFileButtonTest3', function () {
    beforeEach(async function (done) {
      console.info('downloadFileButtonTest3 beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/Index3',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('downloadFileButtonTest3' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push downloadFileButtonTest3 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('downloadFileButtonTest3 beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('downloadFileButtonTest3 after each called');
    })

    it('downloadFileButtonTest3', 0, async function (done) {
      console.info('[downloadFileButtonTest3] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('下载文件'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[downloadFileButtonTest3] END');
      done();
    });
  })

}