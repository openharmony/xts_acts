import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function classOperationsTest() {

  describe("ActsClassOperationsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : findClass_static_0100
     * @tc.name      : findClass_static_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("findClass_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'findClass_static_0100 start');
      let cls = new Foo();
      let result = cls.test_FindClass();
      expect(result).assertTrue();
      hilog.info(domain, tag, 'findClass_static_0100 done');
      done();
      hilog.info(domain, tag, 'findClass_static_0100 end');
    })

    /*
     * @tc.number    : class_FindStaticMethod_0100
     * @tc.name      : class_FindStaticMethod_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("class_FindStaticMethod_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'class_FindStaticMethod_0100 start');
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod();
      expect(result).assertTrue();
      hilog.info(domain, tag, 'class_FindStaticMethod_0100 done');
      done();
      hilog.info(domain, tag, 'class_FindStaticMethod_0100 end');
    })
  })
}