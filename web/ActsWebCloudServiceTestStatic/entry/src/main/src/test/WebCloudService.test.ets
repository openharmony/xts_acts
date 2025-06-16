import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, afterEach, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { Utils, startAbility, stopApplication } from './Util.test';
import webview from '@ohos.web.webview';
import router from '@ohos.router';
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, loadAndSetUpUiTest } from '@ohos.UiTest';
import { sendEventByKey } from '@internal.full.global';
import emitter from '@ohos.events.emitter';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function webCloudServiceTest() {

    describe("webCloudServiceTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            await Utils.loadAndSetUpUiTest();
            await Utils.msSleep(2000);
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                    testAbilityContext = abilitys.context
                    hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

                },
            }, (err : BusinessError) : void => {
                if (err != null ) {
                    hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
                }
                hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswebcloudservicetest.static")
            await Utils.msSleep(2000)
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        afterAll(() => {
            emitter.off(10);
        })

        it('testOnPageBegin_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnPageBegin", 10);
            Utils.registerEvent("testOnPageBegin_static", "resource://rawfile/first.html", 100, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnPageBegin end');
        })

        it('testOnPageEnd_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnPageEnd", 10);
            Utils.registerEvent("testOnPageEnd_static", "resource://rawfile/second.html", 101, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnPageEnd end');
        })

        it('testOnProgressChange_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnProgressChange", 10);
            Utils.registerEvent("testOnProgressChange_static", "100", 102, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnProgressChange end');
        })

        it('testOnErrorReceive_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnErrorReceive", 10);
            Utils.registerEvent("testOnErrorReceive_static", "https://untrusted-root.badssl.com/", 103, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnErrorReceive end');
        })

        it('testOnLoadIntercept_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnLoadIntercept", 10);
            Utils.registerEvent("testOnLoadIntercept_static", "resource://rawfile/second.html", 104, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebAttributeTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnLoadIntercept end');
        })

        it('testWebviewController_refresh_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Refresh", 10);
            Utils.registerEvent("testWebviewController_refresh_static", "resource://rawfile/first.html", 105, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_refresh end');
        })

        it('testWebviewController_stop_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Stop", 10);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_stop end');
        })

        it('testWebviewController_postUrl_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("PostUrl", 10);
            Utils.registerEvent("testWebviewController_postUrl_static", "resource://rawfile/second.html", 106, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_postUrl end');
        })

        it('testWebviewController_loadData_getTitle_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("LoadData", 10);
            Utils.registerEvent("testWebviewController_loadData_getTitle_static", "LoadData", 107, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_loadData_getTitle end');
        })

        it('testWebviewController_userAgent_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("UserAgent", 10);
            Utils.registerEvent("testWebviewController_userAgent_static", "true*true*resource://rawfile/second.html*resource://rawfile/first.html", 111, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_userAgent&url end');
        })

        it('testWebviewController_getLastJavascriptProxyCallingFrameUrl_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("GetLastJavascriptProxyCallingFrameUrl", 10);
            Utils.registerEvent("testWebviewController_getLastJavascriptProxyCallingFrameUrl_static", "true", 112, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_getLastJavascriptProxyCallingFrameUrl end');
        })

        it('testWebviewController_backwardAndforward_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("BackwardAndForward", 10);
            Utils.registerEvent("testWebviewController_backwardAndforward_static", "true*resource://rawfile/first.html*true*resource://rawfile/second.html*false", 117, done);
            await Utils.msSleep(2000);

            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_backwardAndforward end');
        })

        it('testWebviewController_clearWebSchemeHandler_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("ClearWebSchemeHandler", 10);
            Utils.registerEvent("testWebviewController_clearWebSchemeHandler_static", "done", 118, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_clearWebSchemeHandler end');
        })

        it('testWebviewController_getBackForwardEntries_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("GetBackForwardEntries", 10);
            Utils.registerEvent("testWebviewController_getBackForwardEntries_static", "success", 119, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebviewController_getBackForwardEntries end');
        })

        it('testWebview_webSchemeHandlerResponse_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("WebSchemeHandlerResponse", 10);
            Utils.registerEvent("testWebview_webSchemeHandlerResponse_static", "https://www.example.com", 120, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_webSchemeHandlerResponse end');
        })

        it('testWebview_webDownloadItem_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("WebDownloadItem", 10);
            Utils.registerEvent("testWebview_webDownloadItem_static", "https://www.example.com/", 121, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_webDownloadItem end');
        })

        it('testWebview_proxyRule_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("ProxyRule", 10);
            Utils.registerEvent("testWebview_proxyRule_static", "https://proxy.XXX.com", 122, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_proxyRule end');
        })

        it('testWebview_cookieManager_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("CookieManager", 10);
            Utils.registerEvent("testWebview_cookieManager_static", "done*done*done*done", 126, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_cookieManager end');
        })

        it('testWebview_Constructor_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Constructor", 10);
            Utils.registerEvent("testWebview_Constructor_static", "done", 130, done);
            await Utils.msSleep(2000);
            try {
                let driver = Driver.create();
                await driver.delayMs(1000);
                let button = await driver.findComponent(ON.id('WebviewContrllerTestButton'));
                expect(button != null).assertTrue();
                await driver.delayMs(500);
                if (button != null) {
                    await button.click();
                }
            } catch(error) {
                hilog.info(domain, tag, `testPinchOut error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            done();
            hilog.info(domain, tag, '%{public}s', 'testWebview_cookieManager end');
        })

    })

}