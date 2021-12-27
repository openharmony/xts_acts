// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function alphabetIndexerJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('alphabetIndexerTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0100
     * @tc.name      alphabetIndexerTest001
     * @tc.desc      aceEtsTest
     */
    it('alphabetIndexerTest001', 0, async function (done) {
      console.info('AlphabetIndexerTest001 START');
      let options = {
        uri: 'pages/AlphabetIndexer',
      }
      try {
        let result = await router.push(options)
        console.info("push AlphabetIndexer page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push AlphabetIndexer page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('alphabetIndexer');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('AlphabetIndexer');
      console.info('AlphabetIndexerTest001 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0110
     * @tc.name      alphabetIndexerTest002
     * @tc.desc      aceEtsTest
     */
    it('alphabetIndexerTest002', 0, async function (done) {
      console.info('AlphabetIndexerTest002 START');
      let strJson = getInspectorByKey('alphabetIndexer1');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info('AlphabetIndexerTest002 END');
      done();
    });
  })
}
