/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import SecurityRandomJsunit from "./SecurityRandom.test.js";
import DigestAlgorithmJsunit from "./DigestAlgorithm.test.js";
import CertificateJsunit from "./Certificate.test.js";
import SymmetricCryptographyJsunit from "./SymmetricCryptography.test.js";
import AsymmetricCryptographyJsunit from "./AsymmetricCryptography.test.js";


export default function testsuite() {
  CertificateJsunit();
  DigestAlgorithmJsunit();
  SymmetricCryptographyJsunit();
  AsymmetricCryptographyJsunit();
  SecurityRandomJsunit();
}