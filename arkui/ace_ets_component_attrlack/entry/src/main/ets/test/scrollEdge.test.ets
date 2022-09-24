import router from '@system.router';
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function ScrollExampleJsunit() {
  describe('ScrollExampleTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/scroll_edge',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scroll_edge state success " + JSON.stringify(pages));
        if (!("ScrollExample" == pages.name)) {
          console.info("get scroll_edge state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push scroll_edge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll_edge page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("ScrollExample after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testscrollEdgeMiddle0001
     * @tc.desic         acescrollEdgeMiddleEtsTest0001
     */
    it('testscrollEdgeMiddle0001', 0, async function (done) {
      console.info('scrollEdgeMiddle testscrollEdgeMiddle0001 START');

      await Utils.sleep(2000);
      try {
        var innerEventOne = {
          eventId: 60306,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("testscrollEdgeMiddle0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
          done();
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('MiddleText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testscrollEdgeMiddle0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testscrollEdgeMiddle0001 END');
    });
  })
}
