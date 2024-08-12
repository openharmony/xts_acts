import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function FileButtonSaveTest() {

  describe('FileButtonSaveTest', function () {
    beforeEach(async function (done) {
      console.info('FileButtonSaveTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/FileButtonSave',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('FileButtonSave' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonSave page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('FileButtonSaveTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('FileButtonSaveTest after each called');
    })

    it('FileButtonSaveTest', 0, async function (done) {
      console.info('[FileButtonSaveTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonSaveTest] END');
      done();
    });
  })

}