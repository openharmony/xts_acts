// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function gridJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('gridTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('gridTest001', 0, async function (done) {
      console.info('gridTest001 START');
      let options = {
        uri: 'pages/Grid',
      }
      try {
        let result = await router.push(options)
        console.info( JSON.stringify(result));
      } catch (err) {
        console.error(JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('Grid');
      let obj = JSON.parse(strJson);
      console.info("属性值集合: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Grid')
      console.log(JSON.stringify(obj.$attrs.columnsTemplate))
      console.log(JSON.stringify(obj.$attrs.rowsTemplate))
      console.log(JSON.stringify(obj.$attrs.rowsTemplate))
      console.log(JSON.stringify(obj.$attrs.columnsGap))
      console.log(JSON.stringify(obj.$attrs.rowsGap))
      await sleep(1)
      expect(obj.$attrs.columnsTemplate).assertEqual('1fr 1fr 1fr 1fr 1fr')
      expect(obj.$attrs.rowsTemplate).assertEqual('1fr 1fr 1fr 1fr 1fr')
      console.info('gridTest001 END');
      done();
    });
  })
}
