import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function FileButtonSaveFileTest() {

  describe('FileButtonSaveFileTest', function () {
    beforeEach(async function (done) {
      console.info('FileButtonSaveFileTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/FileButtonSaveFile',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('FileButtonSaveFile' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonSaveFile page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('FileButtonSaveFileTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('FileButtonSaveFileTest after each called');
    })

    it('FileButtonSaveFileTest', 0, async function (done) {
      console.info('[FileButtonSaveFileTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存文件'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonSaveFileTest] END');
      done();
    });
  })

}