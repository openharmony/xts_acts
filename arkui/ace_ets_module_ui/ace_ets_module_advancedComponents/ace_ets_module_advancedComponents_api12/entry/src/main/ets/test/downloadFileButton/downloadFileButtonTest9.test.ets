import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function downloadFileButtonTest9() {

  describe('downloadFileButtonTest9', function () {
    beforeEach(async function (done) {
      console.info('downloadFileButtonTest9 beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/Index9',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('downloadFileButtonTest9' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push downloadFileButtonTest9 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('downloadFileButtonTest9 beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('downloadFileButtonTest9 after each called');
    })

    it('downloadFileButtonTest9', 0, async function (done) {
      console.info('[downloadFileButtonTest9] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存文件'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[downloadFileButtonTest9] END');
      done();
    });
  })

}