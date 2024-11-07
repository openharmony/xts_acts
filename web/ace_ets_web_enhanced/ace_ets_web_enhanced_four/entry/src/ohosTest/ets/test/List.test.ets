/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import webSchemeHandler from './WebSchemeHandler.test';
import WebSendTest from './WebSend.test';
import ActsAceWebMessageExt from './WebMessageExtTest.test'
import ActsAceSaveHttpAuthCredentials from './SaveHttpAuthCredentials.test'
import ActsAceGetHttpAuthCredentials from './GetHttpAuthCredentials.test'
import ActsAcGetOriginUsage from './GetOriginUsage.test'
import ActsAceGetOriginQuota from './GetOriginQuota.test'
import GeolocationTest from './Geolocation.test'
import webTestFour from './WebTestFour.test';
import ActsAceConfigCookieCallback from './ConfigCookieTest_callback.test';
import ActsAceConfigCookiePromise from './ConfigCookieTest_promise.test';
import ActsAceConfigCookieSync from './ConfigCookieTest_sync.test';
import ActsAceSetCookie from './SetCookieTest.test';
import ActsAceCookieTest from './ConfigCookieTest.test';
import webTestEight from './WebTestEight.test';
import webTestSeven from './WebTestSeven.test';
import webTestSevenTwo from './WebTestSeven_two.test';

export default function testsuite() {
  webSchemeHandler();
  WebSendTest();
  ActsAceWebMessageExt();
  ActsAceSaveHttpAuthCredentials();
  ActsAceGetHttpAuthCredentials();
  ActsAcGetOriginUsage();
  ActsAceGetOriginQuota();
  GeolocationTest();
  webTestFour();
  ActsAceConfigCookieCallback();
  ActsAceConfigCookiePromise();
  ActsAceConfigCookieSync();
  ActsAceSetCookie();
  ActsAceCookieTest();
  webTestEight();
  webTestSeven();
  webTestSevenTwo();
}