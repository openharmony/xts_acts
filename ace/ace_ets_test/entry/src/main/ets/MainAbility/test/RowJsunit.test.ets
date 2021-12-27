// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function rowJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }
  describe('rowTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0490
     * @tc.name      rowTest001
     * @tc.desc      aceEtsTest
     */
    it('rowTest001', 0, async function (done) {
      console.info('++++++++++++++++ Row TestCase 1 START ++++++++++++++++');
      let options = {
        uri: 'pages/Row',
      }
      try {
        let result = await router.push(options)
        console.info( JSON.stringify(result));
      } catch (err) {
        console.error(JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('row');
      let obj = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Row')
      console.log('Row‘s useAlign is '+JSON.stringify(obj.$attrs.useAlign))
      console.log('Row‘s space is '+JSON.stringify(obj.$attrs.space))
      console.log('Row‘s alignItems is '+JSON.stringify(obj.$attrs.alignItems))
      expect(obj.$attrs.alignItems).assertEqual('VerticalAlign.Top')
      console.info('++++++++++++++++ Row TestCase 1 End ++++++++++++++++');
      done();
    });
  })
}
