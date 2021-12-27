// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function columnSplitJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('columnSplitTest', function () {
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0700
     * @tc.name      testColumnSplit010
     * @tc.desc      aceEtsTest
     */
    it('testColumnSplit010', 0, async function (done) {
      console.info('new columnSplit0 START');
      let options = {
        uri: 'pages/ColumnSplit',
      }
      try {
        let result = await router.push(options)
        console.info("push columnSplit page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push columnSplit page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('columnSplit')
      let obj = JSON.parse(strJson)
      console.info("component obj is: " + JSON.stringify(obj))
      expect(obj.$type).assertEqual('ColumnSplit')
      console.info("yr ColumnSplit0 type: " + JSON.stringify(obj.$type))
      expect(obj.$attrs.resizeable).assertEqual('true')
      console.log("yr columnSplit0 obj.$resizeable-'true':" + JSON.stringify(obj.$attrs.resizeable))
      console.info('new columnSplit0 END')
      done()
    })

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0710
     * @tc.name      testColumnSplit020
     * @tc.desc      aceEtsTest
     */
    it('testColumnSplit020', 0, async function (done) {
      console.info('new columnSplit1 START');
      let strJson = getInspectorByKey('columnSplit1');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.resizeable).assertEqual('false')
      console.log("yr columnSplit obj.$resizeable-'false':" + JSON.stringify(obj.$attrs.resizeable));
      console.info('new columnSplit1 END');
      done();
    })
  })
}
