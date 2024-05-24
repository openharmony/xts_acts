/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import bundle from '@ohos.bundle.bundleManager';


export default function abilityTest() {

  describe('ActsAbilityTest', () => {
    /*
     * @tc.number: SUB_BMS_APPINFO_SYNC_SELF_0013
     * @tc.name  : GetBundleInfoForSelfSyncSkill
     * @tc.desc  : Test getBundleInfoForSelfSync with Skill
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    it('getBundleInfoForSelfSyncSkill', 0, async (done: Function) => {
      let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL
        | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE
        | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY
        | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY);

      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(1);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].actions[0])
        .assertEqual('action.system.home');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].domainVerify).assertEqual(false);
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].scheme).assertEqual('scheme');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].host).assertEqual('host');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].port).assertEqual('port');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].pathStartWith).assertEqual('pathStartWith');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].path).assertEqual('path');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].pathRegex).assertEqual('pathRegex');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].type).assertEqual('type');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].utd).assertEqual('utd');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].linkFeature).assertEqual('linkFeature');
      expect(data.hapModulesInfo[0].abilitiesInfo[0].skills[0].uris[0].maxFileSupported).assertEqual(10000);
      done();
    })
  })
}