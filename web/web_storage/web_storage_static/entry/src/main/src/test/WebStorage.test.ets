import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import webView from '@ohos.web.webview'
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;
let origin: string = "resource://rawfile/"

export default function webStorageTest() {

    describe("webStorageTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
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
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld")
            await Utils.msSleep(2000)
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINS_0001
         * @tc.name       : testGetOrigins001
         * @tc.desc       : test getOrigins
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOrigins001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOrigins((error, origins: webView.WebStorageOrigin[]) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        //expect(false).assertTrue();
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'origins.length: ' + origins.length);
                    expect(origins.length > 0).assertTrue();
                    for (let i = 0; i < origins.length; i++) {
                        hilog.info(domain, tag, '%{public}s', 'origin: ' + origins[i].origin);
                        hilog.info(domain, tag, '%{public}s', 'usage: ' + origins[i].usage);
                        hilog.info(domain, tag, '%{public}s', 'quota: ' + origins[i].quota);
                    }
                    expect(origins[0].origin == "resource://rawfile/").assertTrue();
                    expect(origins[0].usage > 0).assertTrue();
                    expect(origins[0].quota > 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOrigins001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINS_0002
         * @tc.name       : testGetOrigins002
         * @tc.desc       : test getOrigins
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOrigins002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOrigins()
                    .then((origins: webView.WebStorageOrigin[]) => {
                        hilog.info(domain, tag, '%{public}s', 'origins.length: ' + origins.length);
                        expect(origins.length > 0).assertEqual(false);
                        for (let i = 0; i < origins.length; i++) {
                            hilog.info(domain, tag, '%{public}s', 'origin: ' + origins[i].origin);
                            hilog.info(domain, tag, '%{public}s', 'usage: ' + origins[i].usage);
                            hilog.info(domain, tag, '%{public}s', 'quota: ' + origins[i].quota);
                        }
                        expect(origins[0].origin == "resource://rawfile/").assertTrue();
                        expect(origins[0].usage > 0).assertTrue();
                        expect(origins[0].quota > 0).assertTrue();
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOrigins001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINUSAGE_0001
         * @tc.name       : testGetOriginUsage001
         * @tc.desc       : test getOriginUsage
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginUsage001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginUsage(origin, (error, usage) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        //expect(false).assertTrue();
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'usage: ' + usage);
                    expect(usage > 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginUsage001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINUSAGE_0002
         * @tc.name       : testGetOriginUsage002
         * @tc.desc       : test getOriginUsage
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginUsage002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginUsage(origin)
                    .then((usage : Double) => {
                        hilog.info(domain, tag, '%{public}s', 'usage: ' + usage);
                        expect(usage > 0).assertEqual(false);
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginUsage002 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINQUOTA_0001
         * @tc.name       : testGetOriginQuota001
         * @tc.desc       : test getOriginQuota
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginQuota001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginQuota(origin, (error, quota) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        //expect(false).assertTrue();
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'quota: ' + quota);
                    expect(quota > 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginQuota001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINQUOTA_0002
         * @tc.name       : testGetOriginQuota002
         * @tc.desc       : test getOriginQuota
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginQuota002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginQuota(origin)
                    .then((quota : Double) => {
                        hilog.info(domain, tag, '%{public}s', 'quota: ' + quota);
                        expect(quota > 0).assertEqual(false);
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testGetOriginQuota002 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_DELETEORIGIN_0001
         * @tc.name       : testDeleteOrigin001
         * @tc.desc       : test deleteOrigin
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testDeleteOrigin001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.deleteOrigin(origin);
                await Utils.msSleep(2000);
                webView.WebStorage.getOriginUsage(origin)
                    .then((usage : Double) => {
                        hilog.info(domain, tag, '%{public}s', 'usage: ' + usage);
                        expect(usage == 0).assertEqual(false);
                    })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testDeleteOrigin001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_DELETEALLDATA_0001
         * @tc.name       : testDeleteAllData001
         * @tc.desc       : test deleteAllData
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */        
        it("testDeleteAllData001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.deleteAllData();
                await Utils.msSleep(2000);
                webView.WebStorage.getOrigins((error, origins: webView.WebStorageOrigin[]) => {
                    if (error) {
                        hilog.info(domain, tag, '%{public}s', 'error: ' + JSON.stringify(error));
                        //expect(false).assertTrue();
                        return;
                    }
                    hilog.info(domain, tag, '%{public}s', 'origins length: ' + origins.length);
                    for (let i = 0; i < origins.length; i++) {
                        hilog.info(domain, tag, '%{public}s', 'origin: ' + origins[i].origin);
                        hilog.info(domain, tag, '%{public}s', 'usage: ' + origins[i].usage);
                        hilog.info(domain, tag, '%{public}s', 'quota: ' + origins[i].quota);
                    }
                    expect(origins[0].usage == 0).assertTrue();
                })
            } catch (e: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'testDeleteAllData001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })
    })

}