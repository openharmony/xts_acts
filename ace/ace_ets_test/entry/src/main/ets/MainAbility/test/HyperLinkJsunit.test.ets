// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function hyperlinkJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('hyperLinkTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0360
     * @tc.name      hyperLinkTest001
     * @tc.desc      aceEtsTest
     */
    it('hyperLinkTest001', 0, async function (done) {
      console.info('++++++++++++++++ Hyperlink TestCase 1 START ++++++++++++++++');
      let options = {
        uri: 'pages/HyperLink',
      }
      try {
        let result = await router.push(options)
        console.info( JSON.stringify(result));
      } catch (err) {
        console.error(JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('hyperlink1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Hyperlink')
      console.info("属性值集合: " + JSON.stringify(obj));
      console.log('Hyperlink‘s address is '+JSON.stringify(obj.$attrs.address))
      console.log('Hyperlink‘s content is '+JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.address).assertEqual('https://developer.harmonyos.com/')
      expect(obj.$attrs.content).assertEqual('Go to the developer website')
      console.info('++++++++++++++++ Hyperlink TestCase 1 End ++++++++++++++++');
      done();
    });
  })
}
