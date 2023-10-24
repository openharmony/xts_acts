/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

let formName1 = 'normalWidget';
let formName2 = 'transparentWidget';
let formName3 = 'widget';
let bundleName = 'com.acts.transparentformsystemtest';
let bundleNameNormalHap = 'com.acts.transparentformnormalhap';
let moduleName = 'entry';
let abilityName = 'EntryFormAbility';

function GetDumpInfoLines(dumpInfo: string) {
  let dumpInfoLines = dumpInfo.split(/[(\r\n)\r\n]+/);
  dumpInfoLines.forEach((item, index) => {
    // Delete empty line
    if (!item) {
      dumpInfoLines.splice(index, 1);
    }
  })
  console.log('dumpInfoLines--------------------')
  dumpInfoLines.forEach((item, index) => {
    console.log("SUB_AA_TransparentFormTest + " + item);
  })
  return dumpInfoLines;
}

function SliceString(info, start, end?) {
  let startIndex = info.indexOf(start);
  if (startIndex == -1) {
    return null;
  }
  if (end) {
    let endIndex = info.lastIndexOf(end);
    return info.slice(startIndex + 1, endIndex);
  } else {
    return info.slice(startIndex + 1);
  }
}

function CreateBundleFormInfo(dumpInfoLines: string[]) {
  console.log('CreateTempFormInfo');
  let keys = [ 'moduleName', 'abilityName', 'formName', 'transparencyEnabled' ];
  let keyIndex = 0;
  let staticFormArray = [];
  let staticForm = new StaticFormInfo();
  dumpInfoLines.forEach((item, index) => {
    console.log('ACTS_Card_Dump + ' + item);
    if (item.includes('bundleName')) {
      if (staticForm) {
        staticForm = new StaticFormInfo();
        staticFormArray.push(staticForm);
        keyIndex = 0;
      }
      let bundleName = SliceString(item, '#');
      staticForm.info.set('bundleName', bundleName);
      console.log('bundleName = ' + bundleName);
    } else if (staticForm) {
      let key = keys[keyIndex];
      console.log('CreateTempFormInfo key = ' + key);
      if (item.includes(key)) {
        let val = SliceString(item, '[', ']');
        console.log('CreateTempFormInfo val = ' + val);
        staticForm.info.set(key, val);
        keyIndex++;
      }
    }
  })
  return staticFormArray;
}

class StaticFormInfo {
  info = new Map();

  constructor() {
    this.info.set('bundleName', '');
    this.info.set('moduleName', '');
    this.info.set('abilityName', '');
    this.info.set('formName', '');
    this.info.set('transparencyEnabled', '');
  }

  GetFormName() {
    return this.info.get('formName');
  }
  GetBundleName() {
    return this.info.get('bundleName');
  }
  GetModuleName() {
    return this.info.get('moduleName');
  }
  GetAbilityName() {
    return this.info.get('abilityName');
  }
  GetTransparencyEnabled() {
    return this.info.get('transparencyEnabled');
  }
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {

    it('SUB_Ability_AbilityForm_GetFormsInfo_TransparentForm_0200', 0, async function (done) {
      let TAG = 'SUB_Ability_AbilityForm_GetFormsInfo_TransparentForm_0200 ';
      // Dump static-form info
      let cmd = 'hidumper -s FormMgr -a \'-b\'';
      console.log(TAG + " --- cmd: " + cmd);
      let result = await globalThis.abilityDelegator.executeShellCommand(cmd);
      console.log(TAG + ' stdResult = ' + JSON.stringify(result.stdResult));
      let dumpInfo = result.stdResult;
      let dumpInfoLines = GetDumpInfoLines(dumpInfo);
      let staticFormInfoArray = CreateBundleFormInfo(dumpInfoLines);
      let findForm1 = false;
      staticFormInfoArray.forEach((staticFormInfo, index) => {
        console.log(TAG + "bundleName: " + staticFormInfo.GetBundleName());
        if (staticFormInfo.GetBundleName() === bundleName &&
          staticFormInfo.GetModuleName() === moduleName &&
          staticFormInfo.GetAbilityName() === abilityName) {
          if (staticFormInfo.GetFormName() === formName1) {
            console.log(TAG + formName1 + " GetTransparencyEnabled: " + staticFormInfo.GetTransparencyEnabled());
            expect(staticFormInfo.GetTransparencyEnabled()).assertEqual('0');
            findForm1 = true;
            return;
          }
        }
      })
      expect(findForm1).assertTrue();
      done();
    })

    it('SUB_Ability_AbilityForm_GetFormsInfo_TransparentForm_0100', 0, async function (done) {
      let TAG = 'SUB_Ability_AbilityForm_GetFormsInfo_TransparentForm_0100 ';
      // Dump static-form info
      let cmd = 'hidumper -s FormMgr -a \'-b\'';
      console.log(TAG + " --- cmd: " + cmd);
      let result = await globalThis.abilityDelegator.executeShellCommand(cmd);
      console.log(TAG + ' stdResult = ' + JSON.stringify(result.stdResult));
      let dumpInfo = result.stdResult;
      let dumpInfoLines = GetDumpInfoLines(dumpInfo);
      let staticFormInfoArray = CreateBundleFormInfo(dumpInfoLines);
      let findForm2 = false;
      staticFormInfoArray.forEach((staticFormInfo, index) => {
        console.log(TAG + "bundleName: " + staticFormInfo.GetBundleName());
        if (staticFormInfo.GetBundleName() === bundleName &&
          staticFormInfo.GetModuleName() === moduleName &&
          staticFormInfo.GetAbilityName() === abilityName) {
          if (staticFormInfo.GetFormName() === formName2) {
            console.log(TAG + formName2 + " GetTransparencyEnabled: " + staticFormInfo.GetTransparencyEnabled());
            expect(staticFormInfo.GetTransparencyEnabled()).assertEqual('1');
            findForm2 = true;
            return;
          }
        }
      })
      expect(findForm2).assertTrue();
      done();
    })

    it('SUB_Ability_AbilityForm_GetFormsInfo_TransparentForm_0300', 0, async function (done) {
      let TAG = 'SUB_Ability_AbilityForm_GetFormsInfo_TransparentForm_0300 ';
      // Dump static-form info
      let cmd = 'hidumper -s FormMgr -a \'-b\'';
      console.log(TAG + " --- cmd: " + cmd);
      let result = await globalThis.abilityDelegator.executeShellCommand(cmd);
      console.log(TAG + ' stdResult = ' + JSON.stringify(result.stdResult));
      let dumpInfo = result.stdResult;
      let dumpInfoLines = GetDumpInfoLines(dumpInfo);
      let staticFormInfoArray = CreateBundleFormInfo(dumpInfoLines);
      let findForm1 = false;
      staticFormInfoArray.forEach((staticFormInfo, index) => {
        console.log(TAG + "bundleName: " + staticFormInfo.GetBundleName());
        if (staticFormInfo.GetBundleName() === bundleNameNormalHap &&
          staticFormInfo.GetModuleName() === moduleName &&
          staticFormInfo.GetAbilityName() === abilityName) {
          if (staticFormInfo.GetFormName() === formName3) {
            console.log(TAG + formName3 + " GetTransparencyEnabled: " + staticFormInfo.GetTransparencyEnabled());
            expect(staticFormInfo.GetTransparencyEnabled()).assertEqual('0');
            findForm1 = true;
            return;
          }
        }
      })
      expect(findForm1).assertTrue();
      done();
    })
  })
}