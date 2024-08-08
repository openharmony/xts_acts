import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';

export default function HarNapiLoadTest() {
  let TAG = "";
  let HarProject: ESObject = testNapi.loadModuleWithInfo("harOne", "com.acts.arttsnapiloadtest/entry_test");
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
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0001', 0, () => {
      TAG = "ARK_ETSRuntime_HAR_NAPI_LOAD_0001";
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.harSOAdd(argc1, argc2, TAG);
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
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0002', 0, () => {
      TAG = "ARK_ETSRuntime_HAR_NAPI_LOAD_0002";
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherHarAdd(argc1, argc2, TAG);
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
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0003', 0, () => {
      TAG = "ARK_ETSRuntime_HAR_NAPI_LOAD_0003";
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherFileHarAdd(argc1, argc2, TAG);
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
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0004', 0, () => {
      TAG = "ARK_ETSRuntime_HAR_NAPI_LOAD_0004";
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherHspAdd(argc1, argc2, TAG);
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
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0005', 0, () => {
      TAG = "ARK_ETSRuntime_HAR_NAPI_LOAD_0005";
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherHspFileAdd(argc1, argc2, TAG);
      console.info(TAG, "result: ", result);
      expect(result).assertEqual(5);
    })

  })
}