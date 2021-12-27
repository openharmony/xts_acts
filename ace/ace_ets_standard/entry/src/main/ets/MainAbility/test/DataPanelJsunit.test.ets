// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function datapanelJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('dataPanelTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0730
     * @tc.name      testDataPanelGetInspectorByKey010
     * @tc.desc      aceEtsTest
     */
    it('testDataPanelGetInspectorByKey010', 0, async function (done) {
      console.info('testGetInspectorByKey START');
      let options = {
        uri: 'pages/DataPanel',
      }
      try {
        let result = await router.push(options)
        console.info("push  DataPanel success " + JSON.stringify(result));
      } catch (err) {
        console.error("push DataPanel page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('DataPanel');
      let obj = JSON.parse(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringify(obj));
      console.log("cd DataPanel type " + JSON.stringify(obj.$type));
      console.log("cd DataPanel values1 " + typeof ([20, 40, 20]));
      console.log("cd DataPanel values " + typeof (obj.$attrs.values));
      console.log("cd DataPanel values" + JSON.stringify(obj.$attrs.values));
      console.log("cd  DataPanel max" + JSON.stringify(obj.$attrs.max));
      console.log("panel closeEffect" + JSON.stringify(obj.$attrs.closeEffect))
      expect(obj.$attrs.closeEffect).assertEqual("false")
      expect(obj.$type).assertEqual("DataPanel")
      expect(JSON.stringify(obj.$attrs.values)).assertEqual('[20,40,20]')
      expect(obj.$attrs.max).assertEqual(100.000000.toFixed(6))
      console.info('cd dataPanelInspectorByKey END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0740
     * @tc.name      testDataPanelGetInspectorByKey020
     * @tc.desc      aceEtsTest
     */
    it('testDataPanelGetInspectorByKey020', 0, async function (done) {
      console.info('testGetInspectorByKey START');
      await sleep(1)
      let strJson = getInspectorByKey('DataPanel2');
      let obj = JSON.parse(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringify(obj));
      console.log("panel closeEffect" + JSON.stringify(obj.$attrs.closeEffect))
      expect(obj.$attrs.closeEffect).assertEqual("true")
      console.info('cd dataPanelInspectorByKey END');
      done();
    });
  })
}
