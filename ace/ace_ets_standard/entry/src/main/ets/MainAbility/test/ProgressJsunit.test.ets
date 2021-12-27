// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function progressJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('progressTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0960
     * @tc.name      testGetProgressAttr010
     * @tc.desc      aceEtsTest
     */
    it('testGetProgressAttr010', 0, async function (done) {
      console.info('testGetProgressAttr START');
      let options = {
        uri: 'pages/Progress',
      }
      try {
        let result = await router.push(options)
        console.info("push Progress page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push Progress page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('progress');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("progress value" + JSON.stringify(obj.$attrs.value))
      console.log("progress type" + JSON.stringify(obj.$type))
      console.log("progress color" + JSON.stringify(obj.$attrs.color))
      console.log("progress width" + JSON.stringify(obj.$attrs.width))
      console.log("progress height" + JSON.stringify(obj.$attrs.height))
      console.log("progress total" + JSON.stringify(obj.$attrs.total))
      console.log("progress style" + JSON.stringify(obj.$attrs.style))
      expect(obj.$attrs.value).assertEqual(3.000000.toFixed(6))
      expect(obj.$type).assertEqual('Progress')
      expect(obj.$attrs.color).assertEqual("#FF0000FF")
      expect(obj.$attrs.width).assertEqual("50.000000vp")
      expect(obj.$attrs.height).assertEqual("70.000000vp")
      expect(obj.$attrs.total).assertEqual(40.000000.toFixed(6))
      expect(obj.$attrs.style).assertEqual("ProgressStyle.Linear")
      console.info('testGetProgressAttr END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0970
     * @tc.name      testGetProgressAttr020
     * @tc.desc      aceEtsTest
     */
    it('testGetProgressAttr020', 0, async function (done) {
      console.info('testGetProgressAttr2 START');
      await sleep(1)
      let strJson = getInspectorByKey('progress2');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("progress style" + JSON.stringify(obj.$attrs.style))
      expect(obj.$attrs.style).assertEqual("ProgressStyle.Eclipse")
      console.info('testGetProgressAttr2 END');
      done();
    });
  })
}
