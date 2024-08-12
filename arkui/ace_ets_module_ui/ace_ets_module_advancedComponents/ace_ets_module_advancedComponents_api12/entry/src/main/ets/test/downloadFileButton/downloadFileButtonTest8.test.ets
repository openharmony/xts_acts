import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function downloadFileButtonTest8() {

  describe('downloadFileButtonTest8', function () {
    beforeEach(async function (done) {
      console.info('downloadFileButtonTest8 beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/Index8',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('downloadFileButtonTest8' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push downloadFileButtonTest8 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('downloadFileButtonTest8 beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('downloadFileButtonTest8 after each called');
    })

    it('downloadFileButtonTest8', 0, async function (done) {
      console.info('[downloadFileButtonTest8] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存图片'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[downloadFileButtonTest8] END');
      done();
    });
  })

}