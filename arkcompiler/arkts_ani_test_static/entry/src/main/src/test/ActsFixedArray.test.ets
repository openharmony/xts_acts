import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function fixedArrayTest() {

  describe("ActsFixedArrayTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : FixedArray_GetLength_0100
     * @tc.name      : FixedArray_GetLength_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_GetLength_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_GetLength_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_GetLength_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_GetLength_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Boolean_0100
     * @tc.name      : FixedArray_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Boolean_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Byte_0100
     * @tc.name      : FixedArray_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Byte_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Char_0100
     * @tc.name      : FixedArray_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Char_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Char_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Short_0100
     * @tc.name      : FixedArray_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Short_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Short_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Int_0100
     * @tc.name      : FixedArray_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Int_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Int_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Long_0100
     * @tc.name      : FixedArray_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Long_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Long_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Float_0100
     * @tc.name      : FixedArray_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Float_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Float_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Double_0100
     * @tc.name      : FixedArray_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Double_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Double_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Get_Ref_0100
     * @tc.name      : FixedArray_Get_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Get_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Get_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Get_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Get_Ref_0100 end');
      })

    /*
     * @tc.number    : FixedArray_New_Ref_0100
     * @tc.name      : FixedArray_New_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_New_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_New_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_New_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_New_Ref_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Set_Ref_0100
     * @tc.name      : FixedArray_Set_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Set_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FixedArray_Set_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FixedArray_Set_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'FixedArray_Set_Ref_0100 end');
      })
  })
}