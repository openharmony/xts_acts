/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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
  hilog.info(0x0000, 'aaimplicitstarttest', '%{public}s', 'cancelSuspendDelay delayId ' + globalThis.delayId);
  backgroundTaskManager.cancelSuspendDelay(globalThis.delayId);
}

function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(null);
    }, time)
  });
}

export default function aaImplicitStartTest() {
  describe('AACommandImplicitStartTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {})
    beforeEach(async () => {
      await abilityDelegator.executeShellCommand('hilog -r').then(data => {
        hilog.info(0x0000, 'aaimplicitstarttest', '%{public}s',
          'beforeEach AACommandImplicitStartTest hilog -r data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'aaimplicitstarttest', '%{public}s',
          'beforeEach AACommandImplicitStartTest hilog -r err is: ' + JSON.stringify(err));
      });
      await sleep(2000);
    })
    afterEach(() => {})
    afterAll(async () => {
      await cancelSuspendDelay();
    })

    /*
    * @tc.number  ACTS_AACommand_AAImplicitStart_0100
    * @tc.name    ACTS_AACommand_AAImplicitStart_0100 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('ACTS_AACommand_AAImplicitStart_0100', 1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'ACTS_AACommand_AAImplicitStart_0100 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
    * @tc.number  ACTS_AACommand_AAImplicitStart_0200
    * @tc.name    ACTS_AACommand_AAImplicitStart_0200 aa start -U "https:://uri.aacommandimplicitstarttest.home" -t uri-type
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('ACTS_AACommand_AAImplicitStart_0200',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -U "https://uri.aacommandimplicitstarttest.com" -t uri-type').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'ACTS_AACommand_AAImplicitStart_0200 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
    * @tc.number  ACTS_AACommand_AAImplicitStart_0300
    * @tc.name    ACTS_AACommand_AAImplicitStart_0300 aa start -A "action.aacommandimplicitstarttest.home"
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('ACTS_AACommand_AAImplicitStart_0300',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -A "action.aacommandimplicitstarttest.home"').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'ACTS_AACommand_AAImplicitStart_0300 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
    * @tc.number  ACTS_AACommand_AAImplicitStart_0400
    * @tc.name    ACTS_AACommand_AAImplicitStart_0400 aa start -e "entity.aacommandimplicitstarttest.home"
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('ACTS_AACommand_AAImplicitStart_0400',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -e "entity.aacommandimplicitstarttest.home"').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'ACTS_AACommand_AAImplicitStart_0400 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_0600
     * @tc.name    ACTS_AACommand_AAImplicitStart_0600 aa start -U
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_0600',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -U')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0600 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_0700
     * @tc.name    ACTS_AACommand_AAImplicitStart_0700 aa start -A
     * @tc.desc    Function test
     * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_0700',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -A')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0700 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0700 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_0800
     * @tc.name    ACTS_AACommand_AAImplicitStart_0800 aa start -e
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_0800',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -e')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0800 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0800 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_0900
     * @tc.name    ACTS_AACommand_AAImplicitStart_0900 aa start -t
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_0900',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -t')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0900 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_0900 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1000
     * @tc.name    ACTS_AACommand_AAImplicitStart_1000 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility 
     * --pi kinteger 13 --pb kbool1 true --pb kbool2 f --ps kstring1 value1 --ps string2 value2 --psn knullstring1 --psn knullstring2
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1000',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger 13 --pb kbool1 true --pb kbool2 f --ps kstring1 value1 --ps string2 value2 --psn knullstring1 --psn knullstring2').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'ACTS_AACommand_AAImplicitStart_1000 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1100
     * @tc.name    ACTS_AACommand_AAImplicitStart_1100 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1100',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1100 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1200
     * @tc.name    ACTS_AACommand_AAImplicitStart_1200 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1200',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1200 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1200 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pi');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1300
     * @tc.name    ACTS_AACommand_AAImplicitStart_1300 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger invalidnum
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1300',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger invalidnum')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1300 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1300 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid parameter');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1400
     * @tc.name    ACTS_AACommand_AAImplicitStart_1400 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1400',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1400 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1500
     * @tc.name    ACTS_AACommand_AAImplicitStart_1500 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1500',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbbol')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1500 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1500 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pb');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1600
     * @tc.name    ACTS_AACommand_AAImplicitStart_1600 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kbool invalidbool
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1600',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kbool invalidbool')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1600 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid parameter');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1700
     * @tc.name    ACTS_AACommand_AAImplicitStart_1700aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1700',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1700 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1700 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1800
     * @tc.name    ACTS_AACommand_AAImplicitStart_1800 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1800',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1800 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1800 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --ps');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_1900
     * @tc.name    ACTS_AACommand_AAImplicitStart_1900 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring value1 value2
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_1900',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring value1 value2')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1900 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_1900 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --ps');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_2000
     * @tc.name    ACTS_AACommand_AAImplicitStart_2000 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --psn knullstring value
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_2000',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --psn knullstring value')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_2000 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_2000 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --psn');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_2100
     * @tc.name    ACTS_AACommand_AAImplicitStart_2100 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger 100 200
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_2100',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger 100 200')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_2100 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_2100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pi');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  ACTS_AACommand_AAImplicitStart_2200
     * @tc.name    ACTS_AACommand_AAImplicitStart_2200 aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool true false
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ACTS_AACommand_AAImplicitStart_2200',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool true false')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_2200 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'ACTS_AACommand_AAImplicitStart_2200 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pb');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })
  })
}