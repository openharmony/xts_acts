/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import webViewControllerJsunit from './webViewControllerJsunit.test'
import webViewOnWindowNewJsunit from './WebViewOnWindowNewJsunit.test'
import webViewOnErrorReceive02Jsunit from './WebViewOnErrorReceive02Jsunit.test'
import webViewOnErrorReceive03Jsunit from './WebViewOnErrorReceive03Jsunit.test'
import webViewHasImageJsunit from './webViewHasImageJsunit.test'
import webViewSrollToJsunit from './webViewSrollToJsunit.test'
import webViewSrollByJsunit from './webViewSrollByJsunit.test'
export default function testsuite() {
       webViewControllerJsunit()
       webViewOnWindowNewJsunit()
       webViewOnErrorReceive02Jsunit()
       webViewOnErrorReceive03Jsunit()
       webViewHasImageJsunit()
       webViewSrollToJsunit()
       webViewSrollByJsunit()
}