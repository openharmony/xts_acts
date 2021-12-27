// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function buttonJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('buttonTest', function () {
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0640
     * @tc.name      testButtonGetInspectorByKey010
     * @tc.desc      aceEtsTest
     */
    it('buttonGetInspectorByKey010', 0, async function (done) {
      console.info('testGetInspectorByKey START');
      let options = {
        uri: 'pages/Button',
      }
      try {
        let result = await router.push(options)
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      await sleep(2)
      let strJson = getInspectorByKey('button');
      let obj = JSON.parse(strJson);
      console.info("cd button component obj is: " + JSON.stringify(obj));
      console.log("cd button type" + JSON.stringify(obj.$type));
      console.log("cd button  Buttontype" + JSON.stringify(obj.$attrs.type));
      console.log("cd button stateEffect" + JSON.stringify(obj.$attrs.stateEffect));
      console.log("cd button label" + JSON.stringify(obj.$attrs.label));
      expect(obj.$type).assertEqual('Button')
      expect(obj.$attrs.type).assertEqual('ButtonType.Circle')
      expect(obj.$attrs.stateEffect).assertEqual('true')
      expect(obj.$attrs.label).assertEqual('1.value')
      console.info('cd buttonInspectorByKey END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0650
     * @tc.name      testButtonGetInspectorByKey020
     * @tc.desc      aceEtsTest
     */
    it('ButtonGetInspectorByKey020', 0, async function (done) {
      await sleep(1)
      let strJson = getInspectorByKey('button1');
      let obj = JSON.parse(strJson);
      console.info("cd button1 component obj is: " + JSON.stringify(obj));
      console.log("cd button1 type" + JSON.stringify(obj.$type));
      console.log("cd button1  Buttontype" + JSON.stringify(obj.$attrs.type));
      console.log("cd button1 stateEffect" + JSON.stringify(obj.$attrs.stateEffect));
      expect(obj.$attrs.type).assertEqual('ButtonType.Capsule')
      expect(obj.$attrs.stateEffect).assertEqual('false')
      console.info('cd button1InspectorByKey END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0660
     * @tc.name      testButtonGetInspectorByKey030
     * @tc.desc      aceEtsTest
     */
    it('ButtonGetInspectorByKey030', 0, async function (done) {
      await sleep(1)
      let strJson = getInspectorByKey('button2');
      let obj = JSON.parse(strJson);
      console.info("cd button2 component obj is: " + JSON.stringify(obj));
      console.log("cd button2 type" + JSON.stringify(obj.$type));
      console.log("cd button2  Buttontype" + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('ButtonType.Normal')
      console.info('cd button2InspectorByKey END');
      done();
    });
  })
}
