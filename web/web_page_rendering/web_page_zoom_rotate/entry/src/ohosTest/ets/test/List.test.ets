/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import webJsunit from './WebJsunit.test';
import webTwoJsunit from './WebTwoJsunit.test';
import webControllerZoom from './WebControllerZoom.test';
import webAttributeTest from './WebAttributeTest.test';
import webViewControllerZoom from './WebViewControllerZoom.test';
import webViewZoomRatio from './WebViewZoomRatio.test';
import WebViewEnumAndFontLibrary from './WebViewEnumAndFontLibrary.test';
import WebViewEnumAndSetWebController from './WebViewEnumAndSetWebController.test';
import WebViewOverviewModeAccess from './WebViewOverviewModeAccess.test';



export default function testsuite() {
  webJsunit();
  webTwoJsunit();
  webControllerZoom();
  webAttributeTest();
  webViewControllerZoom();
  webViewZoomRatio();
  WebViewEnumAndFontLibrary();
  WebViewEnumAndSetWebController();
  WebViewOverviewModeAccess();
}