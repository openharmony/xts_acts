// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function spanJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('SpanTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_1080
     * @tc.name      testGetSpanAttr010
     * @tc.desc      aceEtsTest
     */
    it('testGetSpanAttr010', 0, async function (done) {
      console.info('testGetSpanAttr1 START');
      let options = {
        uri: 'pages/Span',
      }
      try {
        let result = await router.push(options)
        console.info("push Span page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push Span page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('span1');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("span1 decoration" + JSON.stringify(obj.$attrs.decoration))
      console.info("span1 textCase" + JSON.stringify(obj.$attrs.textCase))
      console.info("span1 content" + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.decoration).assertEqual('{"Type":"TextDecorationType.LineThrough","Color":"#FFFF0000"}')
      expect(obj.$attrs.textCase).assertEqual('TextCase.UpperCase')
      expect(obj.$attrs.content).assertEqual('Test Span demo')
      console.info('testGetSpanAttr1 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_1090
     * @tc.name      testGetSpanAttr020
     * @tc.desc      aceEtsTest
     */
    it('testGetSpanAttr020', 0, async function (done) {
      console.info('testGetSpanAttr2 START');
      await sleep(1)
      let strJson = getInspectorByKey('span2');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("span2 textCase" + JSON.stringify(obj.$attrs.textCase))
      console.info("span2 content" + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.textCase).assertEqual('TextCase.LowerCase')
      expect(obj.$attrs.content).assertEqual('The second test Span demo')
      console.info('testGetSpanAttr2 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_1100
     * @tc.name      testGetSpanAttr030
     * @tc.desc      aceEtsTest
     */
    it('testGetSpanAttr030', 0, async function (done) {
      console.info('testGetSpanAttr3 START');
      await sleep(1)
      let strJson = getInspectorByKey('span3');
      let obj = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("span3 textCase" + JSON.stringify(obj.$attrs.textCase))
      console.info("span3 content" + JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.textCase).assertEqual('TextCase.Normal')
      expect(obj.$attrs.content).assertEqual('The third test Span demo')
      console.info('testGetSpanAttr3 END');
      done();
    });
  })
}
