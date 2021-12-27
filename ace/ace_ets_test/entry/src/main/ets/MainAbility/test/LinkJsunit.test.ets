// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function linkJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }


  describe('linkTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0370
     * @tc.name      linkTest001
     * @tc.desc      aceEtsTest
     */
    it('linkTest001', 0, async function (done) {
      console.info('linkTest001 START');
      let options = {
        uri: 'pages/Link',
      }
      try {
        let result = await router.push(options)
        console.info("push link0 page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push link0 page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('Button');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Button');
      console.log(JSON.stringify(obj.$type))
      console.info("yr link0 type: " + JSON.stringify(obj.$type));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.stateEffect).assertEqual('false');
      console.log("yr link0 stateEffect-'false'"+JSON.stringify(obj.$attrs.stateEffect))
      console.info('linkTest001 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0380
     * @tc.name      linkTest001
     * @tc.desc      aceEtsTest
     */
    it('linkTest002', 0, async function (done) {
      console.info('linkTest002 START');
      let strJson = getInspectorByKey('Button1');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.stateEffect).assertEqual('false');
      console.log("yr link1 stateEffect-'false'"+JSON.stringify(obj.$attrs.stateEffect))
      console.info('linkTest002 END');
      done();
    });
  })
}
