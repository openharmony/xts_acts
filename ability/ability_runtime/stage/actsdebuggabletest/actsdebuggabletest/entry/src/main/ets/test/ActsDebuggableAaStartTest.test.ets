/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

async function cancelSuspendDelay() {
  hilog.info(0x0000, 'debuggabletest', '%{public}s', 'cancelSuspendDelay delayId ' + globalThis.delayId);
  backgroundTaskManager.cancelSuspendDelay(globalThis.delayId);
}

function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(null);
    }, time)
  });
}

export default function actsDebuggableAaStartTest() {
  describe('ActsDebuggableAaStartTest', function () {
    beforeAll(async function () {
    })

    beforeEach(async function () {
      await abilityDelegator.executeShellCommand('aa force-stop com.example.timeout').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest force-stop data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest force-stop err is: ' + JSON.stringify(err));
      });
      await sleep(1000);
      await abilityDelegator.executeShellCommand('hilog -r').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest hilog -r data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest hilog -r err is: ' + JSON.stringify(err));
      });
      await sleep(2000);
    })
    afterEach(function () {
    })
    afterAll(async function () {
      await cancelSuspendDelay();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0100
     * @tc.name    aa start -b com.example.timeout -a EntryAbility -p 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('SUB_AA_AMS_Debuggable_0100',1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa start -b com.example.timeout -a EntryAbility -p \'sleep 100\' -S').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0100 data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0100 err is: ' + JSON.stringify(err));
      });
      await sleep(800);

      let res = undefined;
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0100 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0100 hilog err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep 100');
      expect(res).assertContain('debuggablePipe sandbox: true');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0200
     * @tc.name    aa start -b com.example.timeout -a EntryAbility -p 'sleep 100'
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0200',1, async function (done) {
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility -p \'sleep 100\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0200 data is: ' + JSON.stringify(data));
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0200 err is: ' + JSON.stringify(err));
        });
      await sleep(800);

      let res = undefined;
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0200 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0200 hilog err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep 100');
      expect(res.indexOf('debuggablePipe sandbox: true') > 0).assertFalse();
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0300
     * @tc.name    aa start -b com.example.timeout -a EntryAbility
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0300',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0300 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0400
     * @tc.name    aa start -b com.example.timeout -a EntryAbility -S -p
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0400',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility -S -p')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0400 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0500
     * @tc.name    aa start -b com.example.timeout -a EntryAbility -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0500',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility -S').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0500 data is: ' + JSON.stringify(data));
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0500 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('start ability successfully.');
      await sleep(800);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0500 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0500 hilog err is: ' + JSON.stringify(err));
      });

      expect(res.indexOf('debuggablePipe perfCmd') > 0).assertFalse();
      expect(res.indexOf('debuggablePipe sandbox') > 0).assertFalse();
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0600
     * @tc.name    aa start -b com.example.timeout -a EntryAbility -p sleep 100 -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0600',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility -p sleep 100 -S')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0600 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      await sleep(800);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0600 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0600 hilog err is: ' + JSON.stringify(err));
      });

      expect(res).assertContain('debuggablePipe perfCmd:sleep');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res.indexOf('debuggablePipe perfCmd:sleep 100') > 0).assertFalse();
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0700
     * @tc.name    aa start -b com.example.timeout -a EntryAbility -p 'value length large than 1024' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0700',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility -p \'qwertyuiopas' +
      'dfghjklzxcvbnm123456qwert' +
      'yuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghj' +
      'klzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123' +
      '456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuio' +
      'pasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzx' +
      'cvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456q' +
      'wertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasd' +
      'fghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbn' +
      'm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwert' +
      'yuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghj' +
      'klzxcvbnm123456\' -S').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0700 data is: ' + JSON.stringify(data));
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0700 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('usage: aa start <options>');
      await sleep(800);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0700 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0700 hilog err is: ' + JSON.stringify(err));
      });

      expect(res).assertContain('debuggablePipe aa start -p param length must be less than 1024.');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2600
     * @tc.name    aa start -h
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2600',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -h').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2600 aa process data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2600 aa process err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('usage: aa start <options>');
      expect(res).assertContain('[-p <perf-cmd>]');
      expect(res).assertContain('[-S]');
      done();
    })
  })
}