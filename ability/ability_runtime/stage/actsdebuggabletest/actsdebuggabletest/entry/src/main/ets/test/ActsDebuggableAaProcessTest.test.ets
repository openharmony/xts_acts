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

async function requestSuspendDelay() {
  hilog.info(0x0000, 'debuggabletest', '%{public}s', 'requestSuspendDelay start ');
  let myReason = 'test ActsDebuggableAaProcessTest';
  let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
    hilog.info(0x0000, 'debuggabletest', '%{public}s', 'requestSuspendDelay delay will timeout. ');
  });
  globalThis.delayId = delayInfo.requestId;
  hilog.info(0x0000, 'debuggabletest', '%{public}s', 'requestSuspendDelay delayId is ' + globalThis.delayId);
  hilog.info(0x0000, 'debuggabletest', '%{public}s',
    'requestSuspendDelay actualDelayTime is ' + delayInfo.actualDelayTime);
}

function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(null);
    }, time)
  });
}

export default function actsDebuggableAaProcessTest() {

  describe('ActsDebuggableAaProcessTest', function () {
    beforeAll(async function () {
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'beforeAll aa start  data is: ' + data.stdResult);
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'beforeAll err is: ' + JSON.stringify(err));
      });
      await sleep(2000);
      await requestSuspendDelay();
    })

    beforeEach(async function () {
      await abilityDelegator.executeShellCommand('hilog -r').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaProcessTest hilog -r data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaProcessTest hilog -r err is: ' + JSON.stringify(err));
      });
      await sleep(2000);
    })

    afterEach(function () {
    })

    afterAll(async function () {
      await abilityDelegator.executeShellCommand('aa force-stop com.example.timeout').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'afterAll force-stop data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'afterAll force-stop err is: ' + JSON.stringify(err));
      });
      await sleep(1000);
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0800
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -p 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('SUB_AA_AMS_Debuggable_0800', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -p \'sleep 100\' -S').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0800 data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0800 err is: ' + JSON.stringify(err));
      });
      await sleep(500);

      let res = undefined
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_0800 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0800 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep 100');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0900
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -p 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0900', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -p \'sleep 100\' -S').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0900 data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0900 err is: ' + JSON.stringify(err));
      });
      await sleep(500);

      let res = undefined
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0900 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0900 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep 100');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1000
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -p 'sleep 100'
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1000', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -p \'sleep 100\'').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1000 data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1000 err is: ' + JSON.stringify(err));
      });
      await sleep(500);

      let res = undefined;
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1000 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1000 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep 100');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      expect(res.indexOf('debuggablePipe sandbox: true') > 0).assertFalse();
      done()
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1100
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1100', 1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa process -b com.example.timeout -a EntryAbility -m entry -S')
        .then(data => {
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_1100 err is: ' + JSON.stringify(err));
        })
      expect(res).assertContain('usage: aa process <options>');
      await sleep(500);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1100 SUB_AA_AMS_Debuggable_1100 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1100 hilog err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain(
        'debuggablePipe aa process must contains -p or -D and param length must be less than 1024.');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1200
     * @tc.name    aa process -b com.ohos.test -a EntryAbility -m entry -p 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1200', 1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand(
        'aa process -b com.ohos.test -a EntryAbility -m entry -p \'sleep 100\' -S').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1200 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('error: failed to start native process.');
      await sleep(500);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1200 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1200 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.ohos.test');
      expect(res).assertContain('debuggablePipe fail to start native process');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1300
     * @tc.name    aa process -b com.example.timeout -a test -m entry -p 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1300', 1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a test -m entry -p \'sleep 100\' -S').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1300 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('error: failed to start native process.');
      await sleep(500);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1300 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1300 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe abilityName:test');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      expect(res).assertContain('debuggablePipe fail to start native process');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1400
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m test -p 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1400', 1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m test -p \'sleep 100\' -S').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1400 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('error: failed to start native process.');
      await sleep(500);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1400 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1400 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:test');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      expect(res).assertContain('debuggablePipe fail to start native process');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1500
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -p 'value length large than 1024' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1500', 1, async function (done) {
      let res = undefined;
      let cmd = 'aa process -b com.example.timeout -a EntryAbility -m entry -p ' +
      '\'qwertyuiopasdfghjklzxcvbnm123456qwert' +
      'yuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghj' +
      'klzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123' +
      '456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuio' +
      'pasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzx' +
      'cvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456q' +
      'wertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasd' +
      'fghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbn' +
      'm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwert' +
      'yuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghj' +
      'klzxcvbnm123456\' -S';
      await abilityDelegator.executeShellCommand(cmd).then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1500 aa process err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('usage: aa process <options>');
      await sleep(500);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1500 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1500 hilog err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain(
        'debuggablePipe aa process must contains -p or -D and param length must be less than 1024.');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1600
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -p sleep 100 -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1600', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -p sleep 100 -S')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_1600 aa process data is: ' + JSON.stringify(data));
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_1600 aa process err is: ' + JSON.stringify(err));
        });
      await sleep(500);

      let res = undefined;
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1600 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1600 hilog err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1700
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -S -p
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1700', 1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa process -b com.example.timeout -a EntryAbility -m entry -S -p')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_1700 aa process data is: ' + data.stdResult);
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_1700 aa process err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa process <options>');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1800
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -D 'sleep 100'
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1800', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -D \'sleep 100\'').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1800 data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1800 err is: ' + JSON.stringify(err));
      });
      await sleep(500);

      let res = undefined;
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1800 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1800 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe debugCmd:sleep 100');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      expect(res.indexOf('debuggablePipe sandbox: true') > 0).assertFalse();
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1900
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -D 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1900', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -D \'sleep 100\' -S').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1900 data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1900 err is: ' + JSON.stringify(err));
      });
      await sleep(500);

      let res = undefined
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_1900 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_1900 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe debugCmd:sleep 100');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2000
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -D sleep 100 -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2000', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -D sleep 100 -S').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2000 aa process data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2000 aa process err is: ' + JSON.stringify(err));
      });
      await sleep(500);

      let res = undefined;
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2000 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2000 hilog err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe debugCmd:sleep');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      expect(res.indexOf('debuggablePipe debugCmd:sleep 100') > 0).assertFalse();
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2100
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -p 'sleep 100' -D 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2100', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -p \'sleep 100\' -D \'sleep 100\' -S')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2100 data is: ' + JSON.stringify(data));
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2100 err is: ' + JSON.stringify(err));
        });
      await sleep(500);

      let res = undefined
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2100 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2100 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep 100');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2200
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -D 'sleep 100' -p 'sleep 100' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2200', 1, async function (done) {
      await abilityDelegator.executeShellCommand(
        'aa process -b com.example.timeout -a EntryAbility -m entry -D \'sleep 100\' -p \'sleep 100\' -S')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2200 data is: ' + JSON.stringify(data));
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2200 err is: ' + JSON.stringify(err));
        });
      await sleep(500);

      let res = undefined
      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'SUB_AA_AMS_Debuggable_2200 data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2200 err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('debuggablePipe perfCmd:sleep 100');
      expect(res).assertContain('debuggablePipe sandbox: true');
      expect(res).assertContain('debuggablePipe abilityName:EntryAbility');
      expect(res).assertContain('debuggablePipe moduleName:entry');
      expect(res).assertContain('debuggablePipe bundleName:com.example.timeout');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2300
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -D 'value length large than 1024' -S
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2300',1, async function (done) {
      let res = undefined;
      let cmd = 'aa process -b com.example.timeout -a EntryAbility -m entry -D ' +
      '\'qwertyuiopasdfghjklzxcvbnm123456qwert' +
      'yuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghj' +
      'klzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123' +
      '456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuio' +
      'pasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzx' +
      'cvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456q' +
      'wertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasd' +
      'fghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbn' +
      'm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwert' +
      'yuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghjklzxcvbnm123456qwertyuiopasdfghj' +
      'klzxcvbnm123456\' -S';
      await abilityDelegator.executeShellCommand(cmd).then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2300 aa process err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('usage: aa process <options>');
      await sleep(500);

      await abilityDelegator.executeShellCommand('hilog -x | grep debuggablePipe').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2300 hilog data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2300 hilog err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain(
        'debuggablePipe aa process must contains -p or -D and param length must be less than 1024.');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2400
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -S -D
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2400',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa process -b com.example.timeout -a EntryAbility -m entry -S -D')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2400 aa process data is: ' + data.stdResult);
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2400 aa process err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa process <options>');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2500
     * @tc.name    aa process -h
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2500',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa process -h').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2500 aa process data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2500 aa process err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('usage: aa process <options>');
      expect(res).assertContain('-h, --help');
      expect(res).assertContain('list available commands');
      expect(res).assertContain('-a <ability-name> -b <bundle-name> [-m <module-name>]');
      expect(res).assertContain('-p <perf-cmd>');
      expect(res).assertContain('performance optimization command. Either -p or -D must be selected, -p takes precedence.');
      expect(res).assertContain('debug command. Either -p or -D must be selected, -p takes precedence.');
      expect(res).assertContain('-D <debug-cmd>');
      expect(res).assertContain('[-S]');
      expect(res).assertContain('debug ability with an element name');
      done();
    })
  })
}