/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import HuksTest_JSApiTest_CA from './hks_jsApi_ca.test.js'
import HuksTest_JSApiTest_DeriveKey from './hks_jsApi_deriveKey.test.js'
import HuksTest_JSApiTest_GenerateKey from './hks_jsApi_generateKey.test.js'
import HuksTest_JSApiTest_GetKeyProperties from './hks_jsApi_getKeyProperties.test.js'
import HuksTest_JSApiTest_getSdkVersion from './hks_jsApi_getSdkVersion.test.js'
import Hks_XtsTest_algCompletion_Aes_Encrypt_Decrypt from './hks_xtsTest_algCompletion_encryptAndDecrypt_aes.test.js'
import Hks_XtsTest_ALGCOMPLETION_RSA_ENCRYPT_DECRYPT from './hks_xtsTest_algCompletion_encryptAndDecrypt_rsa.test.js'
import Hks_XtsTest_AlgCompletion_Mac from './hks_xtsTest_algCompletion_mac.test.js'
import Hks_XtsTest_AlgCompletion_Agree from './hks_xtsTest_algCompletion_agree.test.js'
import Hks_XtsTest_AlgCompletion_Sign_Verify from './hks_xtsTest_algCompletion_signAndVerify_callback.test.js'
import Hks_XtsTest_AlgCompletion_Rsa_Sign_Verify_Promise from './hks_xtsTest_algCompletion_signAndVerify_promise.test.js'
export default function testsuite() {
    HuksTest_JSApiTest_CA()
    HuksTest_JSApiTest_DeriveKey()
    HuksTest_JSApiTest_GenerateKey()
    HuksTest_JSApiTest_GetKeyProperties()
    HuksTest_JSApiTest_getSdkVersion()
    Hks_XtsTest_AlgCompletion_Agree()
    Hks_XtsTest_algCompletion_Aes_Encrypt_Decrypt()
    Hks_XtsTest_ALGCOMPLETION_RSA_ENCRYPT_DECRYPT()
    Hks_XtsTest_AlgCompletion_Mac()
    Hks_XtsTest_AlgCompletion_Sign_Verify()
    Hks_XtsTest_AlgCompletion_Rsa_Sign_Verify_Promise()
}

