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
import webViewController from './WebViewController.test'
import geolocationPermissions from './GeolocationPermissions.test'
import webCookieManager from './WebCookieManager.test'
import jsMessageExt from './JsMessageExt.test'
import webMessageExt from './WebMessageExt.test'
import webDataBase from './WebDataBase.test'
import webController from './WebController.test'
import webAttribute from './WebAttribute.test'
import sslErrorHandler from './SslErrorHandler.test'
import webStorage from './WebStorage.test'
import httpAuthHandler from './HttpAuthHandler.test'
import webViewControllerHitTest from './WebViewControllerHitTest.test'
import webAttributeTest from './WebAttributeTest.test'
import webOnBeforeUnload from './WebOnBeforeUnload.test'
import webOnPermissionRequest from './WebOnPermissionRequestTest.test'
import webOnFullScreenExit from './WebOnFullScreenExit.test'
import webOnFullScreenEnter from './WebOnFullScreenEnter.test'
import webOnDataResubmitted from './WebOnDataResubmitted.test'
import webOptions from './WebOptions.test'
import webOnInterceptRequestTest from './WebOnInterceptRequest.test'
import webOnAudioStateChanged from './WebOnAudioStateChanged.test'
import webOnFirstContentfulPaint from './WebOnFirstContentfulPaint.test'
import webMediaPlayGestureAccess from './WebMediaPlayGestureAccess.test'
import webMediaOption from './WebMediaOption.test'
import webOnLoadIntercept from './WebOnLoadIntercept.test'
import webControllerHitTest from './WebControllerHitTest.test'
import webJsGeolocationInvoke from './WebJsGeolocationInvoke.test'
import WebViewEnumAndFontLibrary from './WebViewEnumAndFontLibrary.test'
import WebViewEnumAndSetWebController from './WebViewEnumAndSetWebController.test'
import WebViewJavaScriptProxyAndOnPageVisible from './WebViewJavaScriptProxyAndOnPageVisible.test'
import WebViewOverviewModeAccessAndContextMenuMediaTypeImage
  from './WebViewOverviewModeAccessAndContextMenuMediaTypeImage.test'
import webViewControllerPart3Test from './WebViewControllerPart3.test'
import webResourceResponseGet from './WebResourceResponseGet.test'
import webResourceResponseSet from './WebResourceResponseSet.test'
import webResourceError from './WebResourceError.test'
import webViewControllerPart2 from './WebViewControllerPart2.test'
import webFontTest from './WebFontTest.test'
import webSslErrorTest from './WebSslErrorTest.test'
import webOnHttpErrorReceiveTest from './WebOnHttpErrorReceive.test'
import webOnUrlLoadIntercept from './WebOnUrlLoadIntercept.test'
import webOnInterceptKeyEvent from './WebOnInterceptKeyEvent.test'
import webInitTest from './WebInitTest.test'
import webZoomAccessTest from './WebZoomAccessTest.test'
import webControllerLoadUrlTest from './WebControllerLoadUrlTest.test'
import webViewControllerLoadUrlTest from './WebViewControllerLoadUrlTest.test'
import webControllerRefreshTest from './WebControllerRefreshTest.test'
import webViewControllerRefreshTest from './WebViewControllerRefreshTest.test'
import webViewControllerDownloadTest from './WebViewControllerDownloadTest.test'
import webViewControllerRemoveCacheTest from './WebViewControllerRemoveCacheTest.test'
import webViewControllerDownloadServerTest from './WebViewControllerDownloadServerTest.test'
import webHitTestTypeEnumTest from './WebHitTestTypeEnumTest.test'
import webDownloadEnumTest from './WebDownloadEnumTest.test'
import webSecureDnsModeEnumTest from './WebSecureDnsModeEnumTest.test'
import webViewControllerDownloadNetworkTest from './WebViewControllerDownloadNetworkTest.test'
import webViewControllerDownloadFileTest from './WebViewControllerDownloadFileTest.test'
import webViewZoomRatio from './WebViewZoomRatio.test'
import webViewControllerZoom from './WebViewControllerZoom.test'
import webControllerZoom from './WebControllerZoom.test'
import webViewMenuShowResult from './WebViewMenuShowResult.test'
import screenCapture from './ScreenCapture.test'
import webViewMenuInputFieldType from './WebViewMenuInputFieldType.test'
import webViewMinLogicalFontSize from './WebViewMinLogicalFontSize.test'
import webMessagePortIsExtentionTypeTest from './WebMessagePortIsExtentionTypeTest.test'
import webCookieManagerFetchCookieSync from './WebCookieManagerFetchCookieSync.test'
import webCookieManagerFetchCookie from './WebCookieManagerFetchCookie.test'
import webCookieManagerExistCookie from './WebCookieManagerExistCookie.test'
import webNestedScrollOptionsScrollBackwardTest from './WebNestedScrollOptionsScrollBackwardTest.test'
import webNestedScrollOptionsScrollForwardTest from './WebNestedScrollOptionsScrollForwardTest.test'
import webNestedScrollOptionsScrollBackwardHorizontalTest
  from './WebNestedScrollOptionsScrollBackwardHorizontalTest.test'
import webNestedScrollOptionsScrollForwardHorizontalTest from './WebNestedScrollOptionsScrollForwardHorizontalTest.test'
import webViewControllerPostUrlTest from './WebViewControllerPostUrlTest.test'
import webViewControllerSetConnectionTimeoutTest from './WebViewControllerSetConnectionTimeoutTest.test'
import webJavaScriptOnDocumentStartTest from './WebJavaScriptOnDocumentStartTest.test'

export default function testsuite() {
  webInitTest()
  webAttributeTest()
  webStorage()
  webJsGeolocationInvoke()
  webMessageExt()
  webCookieManager()
  jsMessageExt()
  geolocationPermissions()
  webViewController()
  webDataBase()
  webController()
  webAttribute()
  sslErrorHandler()
  httpAuthHandler()
  webViewControllerHitTest()
  webControllerHitTest()
  webResourceResponseGet()
  webResourceResponseSet()
  webResourceError()
  webViewControllerPart2()
  webViewControllerPart3Test()
  webOnBeforeUnload()
  webOnInterceptRequestTest()
  webOnFullScreenEnter()
  webOnFullScreenExit()
  webOnDataResubmitted()
  webOptions()
  webOnAudioStateChanged()
  webOnFirstContentfulPaint()
  webMediaPlayGestureAccess()
  webMediaOption()
  webOnLoadIntercept()
  webOnPermissionRequest()
  WebViewEnumAndFontLibrary()
  WebViewEnumAndSetWebController()
  WebViewJavaScriptProxyAndOnPageVisible()
  WebViewOverviewModeAccessAndContextMenuMediaTypeImage()
  webFontTest()
  webSslErrorTest()
  webOnHttpErrorReceiveTest()
  webOnUrlLoadIntercept()
  webOnInterceptKeyEvent()
  webZoomAccessTest()
  webControllerLoadUrlTest()
  webViewControllerLoadUrlTest()
  webControllerRefreshTest()
  webViewControllerRefreshTest()
  webViewControllerDownloadTest()
  webViewControllerRemoveCacheTest()
  webViewControllerDownloadServerTest()
  webHitTestTypeEnumTest()
  webDownloadEnumTest()
  webSecureDnsModeEnumTest()
  webViewControllerDownloadNetworkTest()
  webViewControllerDownloadFileTest()
  webViewZoomRatio()
  webViewControllerZoom()
  webControllerZoom()
  webViewMenuShowResult()
  screenCapture()
  webViewMenuInputFieldType()
  webViewMinLogicalFontSize()
  webMessagePortIsExtentionTypeTest()
  webCookieManagerFetchCookieSync()
  webCookieManagerFetchCookie()
  webCookieManagerExistCookie()
  webNestedScrollOptionsScrollBackwardTest()
  webNestedScrollOptionsScrollForwardTest()
  webNestedScrollOptionsScrollBackwardHorizontalTest()
  webNestedScrollOptionsScrollForwardHorizontalTest()
  webViewControllerPostUrlTest()
  webViewControllerSetConnectionTimeoutTest()
  webJavaScriptOnDocumentStartTest()
}