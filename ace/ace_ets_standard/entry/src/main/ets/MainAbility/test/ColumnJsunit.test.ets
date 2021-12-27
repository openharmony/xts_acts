// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function columnJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('columnTest', function () {
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0670
     * @tc.name      testColumn010
     * @tc.desc      aceEtsTest
     */
    it('testColumn010', 0, async function (done) {
      console.info('new Column0 START');
      let options = {
        uri: 'pages/Column',
      }
      try {
        let result = await router.push(options)
        console.info("push Column page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push Column page error " + JSON.stringify(result));
      }
      await sleep(3)
      let strJson = getInspectorByKey('column');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Column');
      console.info("yr new Column0-Column: " + JSON.stringify(obj.$type))
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Center')
      console.log("yr new Column0 alignItems-'HorizontalAlign.Center':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new Column0 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0680
     * @tc.name      testColumn020
     * @tc.desc      aceEtsTest
     */
    it('testColumn020', 0, async function (done) {
      console.info('new Column1 START');
      let strJson = getInspectorByKey('column1');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.Start')
      console.log("yr new Column1 alignItems-'HorizontalAlign.Start':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new Column1 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0690
     * @tc.name      testColumn030
     * @tc.desc      aceEtsTest
     */
    it('testColumn030', 0, async function (done) {
      console.info('new Column2 START');
      let strJson = getInspectorByKey('column2');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignItems).assertEqual('HorizontalAlign.End');
      console.log("yr new Column2 alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.$attrs.alignItems));
      console.info('new Column2 END');
      done();
    });
  })
}
