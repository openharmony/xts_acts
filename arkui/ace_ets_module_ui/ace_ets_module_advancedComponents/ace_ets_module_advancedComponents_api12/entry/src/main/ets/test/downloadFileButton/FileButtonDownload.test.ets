import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function FileButtonDownloadTest() {

  describe('FileButtonDownloadTest', function () {
    beforeEach(async function (done) {
      console.info('FileButtonDownloadTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/FileButtonDownload',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('FileButtonDownload' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonDownload page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('FileButtonDownloadTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('FileButtonDownloadTest after each called');
    })

    /**
     * @tc.number FileButtonDownloadTest
     * @tc.name   FileButtonDownloadTest
     * @tc.desc   Test FileButtonDownloadTest
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('FileButtonDownloadTest', 0, async function (done) {
      console.info('[FileButtonDownloadTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('下载'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonDownloadTest] END');
      done();
    });
  })

}