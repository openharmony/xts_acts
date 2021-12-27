// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function gridItemJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('gridItemTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0340
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('gridItemTest001', 0, async function (done) {
      console.info('gridItemTest001 START');
      let options = {
        uri: 'pages/GridItem',
      }
      try {
        let result = await router.push(options)
        console.info( JSON.stringify(result));
      } catch (err) {
        console.error(JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('GridItem1');
      let obj = JSON.parse(strJson);
      console.info("属性值集合: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('GridItem')
      console.log('GridItem1‘s rowStart is '+JSON.stringify(obj.$attrs.rowStart))
      console.log('GridItem1‘s rowEnd is '+JSON.stringify(obj.$attrs.rowEnd))
      console.log('GridItem1‘s columnStart is '+JSON.stringify(obj.$attrs.columnStart))
      console.log('GridItem1‘s columnEnd is '+JSON.stringify(obj.$attrs.columnEnd))
      console.log('GridItem1‘s forceRebuild is '+JSON.stringify(obj.$attrs.forceRebuild))
      await sleep(1)
      expect(obj.$attrs.rowStart).assertEqual('1')
      expect(obj.$attrs.rowEnd).assertEqual('4')
      expect(obj.$attrs.columnStart).assertEqual('1')
      expect(obj.$attrs.columnEnd).assertEqual('2')
      expect(obj.$attrs.forceRebuild).assertEqual('false')
      console.info('gridItemTest001 END');
      done();
    });
  })
}
