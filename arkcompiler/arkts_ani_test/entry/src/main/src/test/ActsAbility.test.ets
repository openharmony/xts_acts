import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import abilityConstant from '@ohos.app.ability.AbilityConstant';
import { Calc } from '../ets/Index'

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
     * @tc.number    : abilityAni_TestDemo_static_0100
     * @tc.name      : abilityAni_TestDemo_static_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("abilityAni_TestDemo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'abilityAni_TestDemo_static_0100 start');
      let cls = new Calc();
      let result = cls.add(1, 2);
      expect(result).assertEqual(3);
      hilog.info(domain, tag, 'abilityAni_TestDemo_static_0100 done');
      done();
      hilog.info(domain, tag, 'abilityAni_TestDemo_static_0100 end');
    })

    /*
     * @tc.number    : abilityAni_getVersionInfo_static_0100
     * @tc.name      : abilityAni_getVersionInfo_static_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("abilityAni_getVersionInfo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'abilityAni_getVersionInfo_static_0100 start');
      let cls = new Calc();
      let result = cls.test_GetVersion();
      expect(result).assertEqual(1);
      hilog.info(domain, tag, 'abilityAni_getVersionInfo_static_0100 done');
      done();
      hilog.info(domain, tag, 'abilityAni_getVersionInfo_static_0100 end');
    })

    /*
     * @tc.number    : abilityAni_findClass_static_0100
     * @tc.name      : abilityAni_findClass_static_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("abilityAni_findClass_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'abilityAni_findClass_static_0100 start');
      let cls = new Calc();
      let result = cls.test_FindClass();
      expect(result).assertTrue();
      hilog.info(domain, tag, 'abilityAni_findClass_static_0100 done');
      done();
      hilog.info(domain, tag, 'abilityAni_findClass_static_0100 end');
    })

  })
}