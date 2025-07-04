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

export default function webDeviceServiceTest() {

    describe("webDeviceServiceTest", (): void => {
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
            }, (err : BusinessError | null) : void => {
                if (err != null ) {
                    hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
                }
                hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswebdeviceservicetest.static")
            await Utils.msSleep(2000)
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        afterAll(() => {
            emitter.off(10);
        })

        /**
         * @tc.number     : SUB_WEB_DEVICESERVICE_ONPAGEBEGIN_0001
         * @tc.name       : testGeolocationAccess_static
         * @tc.desc       : test GeolocationAccess
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testGeolocationAccess_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("GeolocationAccess", 10);
            Utils.registerEvent("testGeolocationAccess_static", true, 101, done);
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
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testGeolocationAccess end');
        })

        /**
         * @tc.number     : SUB_WEB_DEVICESERVICE_ONPAGEBEGIN_0002
         * @tc.name       : testOnGeolocationShow_static
         * @tc.desc       : test OnGeolocationShow
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOnGeolocationShow_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("OnGeolocationShow", 10);
            Utils.registerEvent("testOnGeolocationShow_static", true, 102, done);
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
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testOnGeolocationShow end');
        })


        /**
         * @tc.number     : SUB_WEB_DEVICESERVICE_ONPAGEBEGIN_0003
         * @tc.name       : testGeoLocation_Constructor_static
         * @tc.desc       : test Constructor
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testGeoLocation_Constructor_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            Utils.emitEvent("Constructor", 10);
            Utils.registerEvent("testGeoLocation_Constructor_static", "done", 103, done);
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
            await Utils.msSleep(5000);
            done();
            hilog.info(domain, tag, '%{public}s', 'testGeoLocation_Constructor end');
        })

    })

}