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
import webOnAudioStateChangedTest from './WebOnAudioStateChangedTest.test'
import webOnDataResubmittedTest from './WebOnDataResubmittedTest.test'
import webOnFaviconReceivedTest from './WebOnFaviconReceivedTest.test'
import webOnFirstContentfulPaintTest from './WebOnFirstContentfulPaintTest.test'
import webOnInterceptKeyEventTest from './WebOnInterceptKeyEventTest.test'
import webOnPageBeginTest from './WebOnPageBeginTest.test'
import webAttributeOnDownloadStartTest from './WebAttributeOnDownloadStartTest.test'
import webAttributeOnErrorReceiveTest from './WebAttributeOnErrorReceiveTest.test'
import webAttributeOnFullScreenEnterTest from './WebAttributeOnFullScreenEnterTest.test'
import webAttributeOnFullScreenExitTest from './WebAttributeOnFullScreenExitTest.test'
import webAttributeOnHttpErrorReceiveTest from './WebAttributeOnHttpErrorReceiveTest.test'
import webAttributeOnInterceptRequestTest from './WebAttributeOnInterceptRequestTest.test'
import webAttributeOnLoadInterceptTest from './WebAttributeOnLoadInterceptTest.test'
import webAttributeOnScrollTest from './WebAttributeOnScrollTest.test'
import webAttributeOnTitleReceiveTest from './WebAttributeOnTitleReceiveTest.test'
import webAttributeOnUrlLoadInterceptTest from './WebAttributeOnUrlLoadInterceptTest.test'
import webControllerAccessBackwardTest from './WebControllerAccessBackwardTest.test'
import webControllerAccessForwardTest from './WebControllerAccessForwardTest.test'
import webControllerAccessStepTest from './WebControllerAccessStepTest.test'
import webControllerBackwardTest from './WebControllerBackwardTest.test'
import webControllerClearHistoryTest from './WebControllerClearHistoryTest.test'
import webControllerForwardTest from './WebControllerForwardTest.test'
import webControllerRequestFocusTest from './WebControllerRequestFocusTest.test'
import webOnPageEndTest from './WebOnPageEndTest.test'
import webOnProgressChangeTest from './WebOnProgressChangeTest.test'
import webOnRefreshAccessedHistoryTest from './WebOnRefreshAccessedHistoryTest.test'
import webOnRenderExitedTest from './WebOnRenderExitedTest.test'
import webOnRequestSelectedTest from './WebOnRequestSelectedTest.test'
import webOnScaleChangeTest from './WebOnScaleChangeTest.test'
import webOnSearchResultReceiveTest from './WebOnSearchResultReceiveTest.test'
import webViewControllerCustomizeSchemesTest from './WebViewControllerCustomizeSchemesTest.test'
import webResourceErrorGetErrorCodeTest from './WebResourceErrorGetErrorCodeTest.test'
import webResourceErrorGetErrorInfoTest from './WebResourceErrorGetErrorInfoTest.test'
import webViewControllerAccessBackwardTest from './WebViewControllerAccessBackwardTest.test'
import webViewControllerAccessForwardTest from './WebViewControllerAccessForwardTest.test'
import webViewControllerAccessStepTest from './WebViewControllerAccessStepTest.test'
import webViewControllerBackOrForwardTest from './WebViewControllerBackOrForwardTest.test'
import webViewControllerBackwardTest from './WebViewControllerBackwardTest.test'
import webViewControllerClearClientAuthenticationCacheTest from './WebViewControllerClearClientAuthenticationCacheTest.test'
import webViewControllerForwardTest from './WebViewControllerForwardTest.test'
import webViewControllerLoadUrlTest from './WebViewControllerLoadUrlTest.test'
import webViewOnceTest from './WebViewOnceTest.test'
import webLoadDataTest from './WebLoadDataTest.test'
import webLoadUrlTest from './WebLoadUrlTest.test'
import webRefreshTest from './WebRefreshTest.test'
import webGetHitTestTest from './WebGetHitTestTest.test'
import webZoomTest from './WebZoomTest.test'
import webOnActiveTest from './WebOnActiveTest.test'
import webOnInactiveTest from './WebOnInactiveTest.test'
import webDeleteJavaScriptRegisterTest from './WebDeleteJavaScriptRegisterTest.test'
import webRegisterJavaScriptProxyTest from './WebRegisterJavaScriptProxyTest.test'
import webGetCookieManagerTest from './WebGetCookieManagerTest.test'
import webStopTest from './WebStopTest.test'
import webViewControllerLoadDataTest from './WebViewControllerLoadDataTest.test'
import webViewControllerRefreshTest from './WebViewControllerRefreshTest.test'
import webViewControllerZoomTest from './WebViewControllerZoomTest.test'
import webViewControllerZoomInTest from './WebViewControllerZoomInTest.test'
import webViewControllerZoomOutTest from './WebViewControllerZoomOutTest.test'


export default function testsuite() {
  webViewControllerLoadUrlTest()
  webOnPageEndTest()
  webViewOnceTest()
  webViewControllerCustomizeSchemesTest()
  webOnFirstContentfulPaintTest()
  webOnFaviconReceivedTest()
  webOnAudioStateChangedTest()
  webOnSearchResultReceiveTest()
  webOnRenderExitedTest()
  webOnPageBeginTest()
  webOnScaleChangeTest()
  webOnRequestSelectedTest()
  webOnProgressChangeTest()
  webOnInterceptKeyEventTest()
  webOnRefreshAccessedHistoryTest()
  webOnDataResubmittedTest()
  webAttributeOnDownloadStartTest();
  webAttributeOnErrorReceiveTest();
  webAttributeOnFullScreenEnterTest();
  webAttributeOnFullScreenExitTest();
  webAttributeOnHttpErrorReceiveTest();
  webAttributeOnInterceptRequestTest();
  webAttributeOnLoadInterceptTest();
  webAttributeOnScrollTest();
  webAttributeOnTitleReceiveTest();
  webAttributeOnUrlLoadInterceptTest();
  webControllerAccessBackwardTest();
  webControllerAccessForwardTest();
  webControllerAccessStepTest();
  webControllerBackwardTest();
  webControllerClearHistoryTest();
  webControllerForwardTest();
  webControllerRequestFocusTest();
  webResourceErrorGetErrorCodeTest();
  webResourceErrorGetErrorInfoTest();
  webViewControllerAccessBackwardTest();
  webViewControllerAccessForwardTest();
  webViewControllerAccessStepTest();
  webViewControllerBackOrForwardTest();
  webViewControllerBackwardTest();
  webViewControllerClearClientAuthenticationCacheTest();
  webViewControllerForwardTest();
  webLoadDataTest()
  webRefreshTest()
  webLoadUrlTest()
  webGetHitTestTest()
  webZoomTest()
  webOnActiveTest()
  webOnInactiveTest()
  webDeleteJavaScriptRegisterTest()
  webRegisterJavaScriptProxyTest()
  webGetCookieManagerTest()
  webStopTest()
  webViewControllerLoadDataTest()
  webViewControllerRefreshTest()
  webViewControllerZoomTest()
  webViewControllerZoomInTest()
  webViewControllerZoomOutTest()
}