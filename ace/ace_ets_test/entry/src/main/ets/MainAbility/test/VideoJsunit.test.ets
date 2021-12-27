// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function videoJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }
  describe('VideoAppInfoTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0630
     * @tc.name      videoAppInfoTest001
     * @tc.desc      aceEtsTest
     */
    it('videoAppInfoTest001', 0, async function (done) {
      console.info('videoAppInfoTest001 START');
      let options = {
        uri: 'pages/Video',
      }
      try {
        let result = await router.push(options)
        console.info("push video page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push video page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('video');
      let obj = JSON.parse(strJson);
      console.info("cd video component obj is: " + JSON.stringify(obj));
      console.log("cd video type" +JSON.stringify(obj.$type));
      console.log("cd video autoPlay" +JSON.stringify(obj.$attrs.autoPlay));
      console.log("cd video muted" +JSON.stringify(obj.$attrs.muted));
      console.log("cd video controls" +JSON.stringify(obj.$attrs.controls));
      console.log("cd video loop" +JSON.stringify(obj.$attrs.loop));
      console.log("cd video objectFit" +JSON.stringify(obj.$attrs.objectFit));
      console.info('videoAppInfoTest001 END');
      done();
    });
  })
}
