import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function FileButtonDownloadAndShareTest() {

  describe('FileButtonDownloadAndShareTest', function () {
    beforeEach(async function (done) {
      console.info('FileButtonDownloadAndShareTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/FileButtonDownloadAndShare',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('FileButtonDownloadAndShare' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonDownloadAndShare page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('FileButtonDownloadAndShareTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('FileButtonDownloadAndShareTest after each called');
    })

    it('FileButtonDownloadAndShareTest', 0, async function (done) {
      console.info('[FileButtonDownloadAndShareTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('下载分享'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonDownloadAndShareTest] END');
      done();
    });
  })

}