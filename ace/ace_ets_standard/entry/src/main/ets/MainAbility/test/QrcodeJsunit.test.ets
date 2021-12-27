// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function qrcodeJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('QrcodeTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0980
     * @tc.name      testGetQrcodeAttr010
     * @tc.desc      aceEtsTest
     */
    it('testGetQrcodeAttr010', 0, async function (done) {
      console.info('testGetQrcodeAttr START');
      let options = {
        uri: 'pages/Qrcode',
      }
      try {
        let result = await router.push(options)
        console.info("push Qrcode page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push Qrcode page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('qrcode');
      let obj = JSON.parse(strJson);
      console.info("Qrcode component obj is: " + JSON.stringify(obj));
      console.info("qrcode width" + JSON.stringify(obj.$attrs.width))
      console.info("qrcode height" + JSON.stringify(obj.$attrs.height))
      console.info("qrcode value" + JSON.stringify(obj.$attrs.value))
      expect(obj.$attrs.value).assertEqual("hello world")
      console.info('testGetQrcodeAttr END');
      done();
    });
  })
}
