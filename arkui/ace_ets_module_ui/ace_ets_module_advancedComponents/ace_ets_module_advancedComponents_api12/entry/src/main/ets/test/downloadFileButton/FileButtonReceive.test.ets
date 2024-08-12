import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function FileButtonReceiveTest() {

  describe('FileButtonReceiveTest', function () {
    beforeEach(async function (done) {
      console.info('FileButtonReceiveTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/FileButtonReceive',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('FileButtonReceive' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonReceive page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('FileButtonReceiveTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('FileButtonReceiveTest after each called');
    })

    /**
     * @tc.number FileButtonReceiveTest
     * @tc.name   FileButtonReceiveTest
     * @tc.desc   Test FileButtonReceiveTest
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('FileButtonReceiveTest', 0, async function (done) {
      console.info('[FileButtonReceiveTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('接收'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonReceiveTest] END');
      done();
    });
  })

}