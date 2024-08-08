import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { add } from 'productHar'

export default function HapNapiLoadTest() {
  let TAG = "";
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0001
     * @tc.name: test a single startup framework
     * @tc.desc: test the startup results of a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0001', 0, () => {
      TAG = "ARK_ETSRuntime_HAP_NAPI_LOAD_0001";
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.add(argc1, argc2);
      console.info(TAG, "result: ", result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0002
     * @tc.name: test a single startup framework
     * @tc.desc: test the startup results of a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0002', 0, () => {
      TAG = "ARK_ETSRuntime_HAP_NAPI_LOAD_0002";
      console.info(TAG, " start");
      let har: ESObject = testNapi.loadModuleWithInfo("harTwo", "com.acts.arttsnapiloadtest/entry_test");
      console.info(TAG, "har: ", JSON.stringify(har))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = har.add(argc1, argc2);
      console.info(TAG, "result: ", result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0003
     * @tc.name: test a single startup framework
     * @tc.desc: test the startup results of a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0003', 0, () => {
      TAG = "ARK_ETSRuntime_HAP_NAPI_LOAD_0003";
      console.info(TAG, " start");
      let harFile: ESObject = testNapi.loadModuleWithInfo("harTwo/Index", "com.acts.arttsnapiloadtest/entry_test");
      console.info(TAG, "harFile: ", JSON.stringify(harFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = harFile.add(argc1, argc2);
      console.info(TAG, "result: ", result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0004
     * @tc.name: test a single startup framework
     * @tc.desc: test the startup results of a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0004', 0, () => {
      TAG = "ARK_ETSRuntime_HAP_NAPI_LOAD_0004";
      console.info(TAG, " start");
      let hsp: ESObject = testNapi.loadModuleWithInfo("hspTwo", "com.acts.arttsnapiloadtest/entry_test");
      console.info(TAG, "hsp: ", JSON.stringify(hsp))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hsp.add(argc1, argc2);
      console.info(TAG, "result: ", result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0005
     * @tc.name: test a single startup framework
     * @tc.desc: test the startup results of a single startup framework
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0005', 0, () => {
      TAG = "ARK_ETSRuntime_HAP_NAPI_LOAD_0005";
      console.info(TAG, " start");
      let hspFile: ESObject = testNapi.loadModuleWithInfo("hspTwo/Test", "com.acts.arttsnapiloadtest/entry_test");
      console.info(TAG, "hspFile: ", JSON.stringify(hspFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hspFile.add(argc1, argc2);
      console.info(TAG, "result: ", result);
      expect(result).assertEqual(5);
    })
    
    // /**
    //  * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0006
    //  * @tc.name: test a single startup framework
    //  * @tc.desc: test the startup results of a single startup framework
    //  * @tc.size: MediumTest
    //  * @tc.type: Function
    //  * @tc.level: Level 1
    //  */
    // it('ARK_ETSRuntime_HAP_NAPI_LOAD_0006', 0, () => {
    //   TAG = "ARK_ETSRuntime_HAP_NAPI_LOAD_0006";
    //   add(1, 1);
    //   console.info(TAG, " start");
    //   let productHar: ESObject = testNapi.loadModuleWithInfo("productHar", "com.acts.arttsnapiloadtest/entry_test");
    //   console.info(TAG, "productHar: ", JSON.stringify(productHar))
    //   let argc1 = 2;
    //   let argc2 = 3;
    //   let result: number = productHar.add(argc1, argc2);
    //   console.info(TAG, "result: ", result);
    //   expect(result).assertEqual(5);
    // })
    
    // /**
    //  * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0007
    //  * @tc.name: test a single startup framework
    //  * @tc.desc: test the startup results of a single startup framework
    //  * @tc.size: MediumTest
    //  * @tc.type: Function
    //  * @tc.level: Level 1
    //  */
    // it('ARK_ETSRuntime_HAP_NAPI_LOAD_0007', 0, () => {
    //   TAG = "ARK_ETSRuntime_HAP_NAPI_LOAD_0007";
    //   console.info(TAG, " start");
    //   let productHarFile: ESObject = testNapi.loadModuleWithInfo("productHar/Test", "com.acts.arttsnapiloadtest/entry_test");
    //   console.info(TAG, "productHarFile: ", JSON.stringify(productHarFile))
    //   let argc1 = 2;
    //   let argc2 = 3;
    //   let result: number = productHarFile.add(argc1, argc2);
    //   console.info(TAG, "result: ", result);
    //   expect(result).assertEqual(5);
    // })

  })
}