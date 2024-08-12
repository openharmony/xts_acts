import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';


export default function FileButtonContinueToReceiveTest() {

  describe('FileButtonContinueToReceiveTest', function () {
    beforeEach(async function (done) {
      console.info('FileButtonContinueToReceiveTest beforeEach start');
      let options = {
        uri: 'MainAbility/pages/downloadFileButton/FileButtonContinueToReceive',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        if (!('FileButtonContinueToReceive' == pages.name)) {
          result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonContinueToReceive page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('FileButtonContinueToReceiveTest beforeEach end');
      done();
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('FileButtonContinueToReceiveTest after each called');
    })

    /**
     * @tc.number FileButtonContinueToReceiveTest
     * @tc.name   FileButtonContinueToReceiveTest
     * @tc.desc   Test FileButtonContinueToReceiveTest
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('FileButtonContinueToReceiveTest', 0, async function (done) {
      console.info('[FileButtonContinueToReceiveTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('继续接收'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonContinueToReceiveTest] END');
      done();
    });
  })

}