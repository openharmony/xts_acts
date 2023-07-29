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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import BackupExtensionAbility, {BundleVersion} from '@ohos.application.BackupExtensionAbility';

export class BackupExt extends BackupExtensionAbility {
    onRestore(ver : BundleVersion) {
        console.log('do restore ' + JSON.stringify(ver))
    }
    onBackup() {
        console.log('do backup.')
    }
};

export default function abilityTest() {
    describe("backupExtension", function () {
        /**
         * @tc.number    : SUB_BACKUPEXTENSION_CALL_0000
         * @tc.name      : backupextension_test_call_000
         * @tc.desc      : select with option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("backupextension_test_call_000", 0, function(done) {
            try {
                let backupExt = new BackupExt()
                backupExt.onBackup()
                let ver = {
                    code : 1,
                    name : '1.0.0.0',
                }
                backupExt.onRestore(ver)
                console.info('backupextension run ok')
                expect(true).assertTrue()
                done()
            } catch (error) {
                 console.info(`backupextension error: ${JSON.stringify(error)}`)
                 expect(false).assertTrue()
                 done()
             }
        });
    });
}

