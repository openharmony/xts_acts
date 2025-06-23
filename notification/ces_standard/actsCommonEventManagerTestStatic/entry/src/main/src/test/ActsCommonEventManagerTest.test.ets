import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import commonEventManager from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG = 'SUB_NOTIFICATION_CES_MANAGER_TEST ===>'

export default function ActsCommonEventManagerTest() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("SUB_NOTIFICATION_CES_MANAGER_TEST", (): void => {
    hilog.info(domain, TAG, '%{public}s', 'describe start');
  })
  hilog.info(domain, TAG, '%{public}s', 'SUB_NOTIFICATION_CES_MANAGER_TEST end');
}