// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function counterJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('counterTest', function () {
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0720
     * @tc.name      testCounterGetInspectorByKey010
     * @tc.desc      aceEtsTest
     */
    it('testCounterGetInspectorByKey010', 0, async function (done) {
      console.info('testGetInspectorByKey START');
      let options = {
        uri: 'pages/Counter',
      }
      try {
        let result = await router.push(options)
        console.info("push counter page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push counter page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('counter');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info('testGetInspectorByKey END');
      done();
    });
  })
}
