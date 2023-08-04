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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import uriPermissionManager from '@ohos.application.uriPermissionManager';
import WantConstant from '@ohos.ability.wantConstant';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest() {
  describe('ActsAbilityTest', function () {

    /*
     * @tc.number: ActsUriPermissionTest_0100
     * @tc.name: UriPermission on demand start and stop
     * @tc.desc: UriPermission on demand start and stop
     * @tc.level:1
     */
    it('ActsUriPermissionTest_0100', 0, async function (done) {
      console.log('ActsUriPermissionTest_0100 start.');
      await abilityDelegator.executeShellCommand("hilog -x | grep UriPermissionManagerService").then((data) => {
        console.log("executeShellCommand ActsUriPermissionTest_0100 : data : " + data.stdResult);
        let i = JSON.stringify(data.stdResult).indexOf('UriPermissionManagerService');
        expect(i).assertEqual(-1);
        done();
      }).catch((error) => {
        console.log("executeShellCommand ActsUriPermissionTest_0100 error : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: ActsUriPermissionTest_0200
     * @tc.name: UriPermission on demand start and stop
     * @tc.desc: UriPermission on demand start and stop
     * @tc.level:1
     */
    it('ActsUriPermissionTest_0200', 0, async function (done) {
      console.log('ActsUriPermissionTest_0200 start.');
      let targetBundleName = 'com.example.actsuripermissionrely'
      let uri = "fileshare:///com.samples.filesharetest.FileShare/person/10"
      let result = uriPermissionManager.grantUriPermission(uri, WantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION, targetBundleName);
      setTimeout(() => {
        abilityDelegator.executeShellCommand("hilog -x | grep UriPermissionManagerService").then((data) => {
          console.log("Verification failed executeShellCommand ActsUriPermissionTest_0200: data: " + data.stdResult);
          expect(data.stdResult).assertContain('UriPermissionManagerService');
          done();
        }).catch((error) => {
          console.log("Verification failed executeShellCommand ActsUriPermissionTest_0200 error: " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
      }, 500)
    })
  })
}