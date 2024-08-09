import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so'
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'abc';
      let b = 'b';
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })



    it('testuidna_openUTS46',0,() =>{
      expect(testNapi.testuidna_openUTS46()).assertTrue()
    })



      it('testuidna_close',0,() =>{
        expect(testNapi.testuidna_close()).assertTrue()
      })



      it('testuidna_labelToASCII',0,() =>{
        expect(testNapi.testuidna_labelToASCII()).assertTrue()
      })



      it('testuidna_labelToUnicode',0,() =>{
        expect(testNapi.testuidna_labelToUnicode()).assertTrue()
      })



      it('testuidna_nameToASCII',0,() =>{
        expect(testNapi.testuidna_nameToASCII()).assertTrue()
      })



      it('testuidna_nameToUnicode',0,() =>{
        expect(testNapi.testuidna_nameToUnicode()).assertTrue()
      })



      it('testuidna_labelToASCLL_UTF8',0,() =>{
        expect(testNapi.testuidna_labelToASCLL_UTF8()).assertTrue()
      })



      it('testuidna_labelToUnicodeUTF8',0,() =>{
        expect(testNapi.testuidna_labelToUnicodeUTF8()).assertTrue()
      })



      it('testuidna_nameToASCII_UTF8',0,() =>{
        expect(testNapi.testuidna_nameToASCII_UTF8()).assertTrue()
      })



      it('testuidna_nameToUnicodeUTF8',0,() =>{
        expect(testNapi.testuidna_nameToUnicodeUTF8()).assertTrue()
      })


  })
}