import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {

  describe("ActsAbilityTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
   * @tc.number    : testDemo_static_0100
   * @tc.name      : testDemo_static_0100
   * @tc.desc      : MediumTest
   * @tc.size      : Function
   * @tc.type      : Function test
   * @tc.level     : Level 3
   */
    it("testDemo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testDemo_static_0100 start');
      let cls = new Foo();
      let result = cls.add(1, 2);
      expect(result).assertEqual(3);
      hilog.info(domain, tag, 'testDemo_static_0100 done');
      done();
      hilog.info(domain, tag, 'testDemo_static_0100 end');
    })
  })
}