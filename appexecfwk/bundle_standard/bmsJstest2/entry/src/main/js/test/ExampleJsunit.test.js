import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import demo from '@ohos.bundle_mgr'

describe('appInfoTest', function () {


    it('getApplicationInfos_0200', 0, async function (done) {
        var datainfo = await demo.getApplicationInfos(8, 0);
        checkgetApplicationInfos(datainfo)
        done();
    })

    function checkgetApplicationInfos(datainfo) {
        expect(typeof datainfo).assertEqual("object")
        expect(datainfo.length).assertLarger(0)
        for (var i = 0; i < datainfo.length; i++) {
            expect(datainfo[i].name.length).assertLarger(0)
            expect(datainfo[i].bundleName.length).assertLarger(0)
            expect(datainfo[i].supportedModes).assertEqual(0)
            expect(datainfo[i].moduleSourceDirs.length).assertLarger(0)
            for (var j = 0; j < datainfo[i].moduleSourceDirs.length; j++) {
                expect(datainfo[i].moduleSourceDirs[j].length).assertLarger(0)
            }
            expect(datainfo[i].moduleInfos.length).assertLarger(0)
            for (var j = 0; j < datainfo[i].moduleInfos.length; j++) {
                expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0)
                expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0)
            }
            expect(datainfo[i].entryDir.length).assertLarger(0)
            expect(datainfo[i].codePath.length).assertLarger(0)
            expect(datainfo[i].dataDir.length).assertLarger(0)
            expect(datainfo[i].dataBaseDir.length).assertLarger(0)
            expect(datainfo[i].cacheDir.length).assertLarger(0)
        }
    }

    it('getApplicationInfos_0400', 0, async function (done) {
        var datainfo = await demo.getApplicationInfos(8, 0);
        checkgetApplicationInfos(datainfo)
        done();
    })

    function checkgetApplicationInfos(datainfo) {
        expect(typeof datainfo).assertEqual("object")
        expect(datainfo.length).assertLarger(0)
        for (var i = 0; i < datainfo.length; i++) {
            expect(datainfo[i].name.length).assertLarger(0)
            expect(datainfo[i].bundleName.length).assertLarger(0)
            expect(datainfo[i].supportedModes).assertEqual(0)
            expect(datainfo[i].moduleSourceDirs.length).assertLarger(0)
            for (var j = 0; j < datainfo[i].moduleSourceDirs.length; j++) {
                expect(datainfo[i].moduleSourceDirs[j].length).assertLarger(0)
            }
            expect(datainfo[i].moduleInfos.length).assertLarger(0)
            for (var j = 0; j < datainfo[i].moduleInfos.length; j++) {
                expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0)
                expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0)
            }
            expect(datainfo[i].entryDir.length).assertLarger(0)
            expect(datainfo[i].codePath.length).assertLarger(0)
            expect(datainfo[i].dataDir.length).assertLarger(0)
            expect(datainfo[i].dataBaseDir.length).assertLarger(0)
            expect(datainfo[i].cacheDir.length).assertLarger(0)
        }
    }


    it('getApplicationInfos_0700', 0, async function (done) {
        await  demo.getApplicationInfos(8, 0, OnReceiveEvent);

        function OnReceiveEvent(datainfo) {
            expect(typeof datainfo).assertEqual("object")
            expect(datainfo.length).assertLarger(0)
            for (var i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0)
                expect(datainfo[i].bundleName.length).assertLarger(0)
                expect(datainfo[i].supportedModes).assertEqual(0)
                expect(datainfo[i].moduleSourceDirs.length).assertLarger(0)
                for (var j = 0; j < datainfo[i].moduleSourceDirs.length; j++) {
                    expect(datainfo[i].moduleSourceDirs[j].length).assertLarger(0)
                }
                expect(datainfo[i].moduleInfos.length).assertLarger(0)
                for (var j = 0; j < datainfo[i].moduleInfos.length; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0)
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0)
                }
                expect(datainfo[i].entryDir.length).assertLarger(0)
                expect(datainfo[i].codePath.length).assertLarger(0)
                expect(datainfo[i].dataDir.length).assertLarger(0)
                expect(datainfo[i].dataBaseDir.length).assertLarger(0)
                expect(datainfo[i].cacheDir.length).assertLarger(0)
            }
        }

        done();
    })

    it('getApplicationInfos_0900', 0, async function (done) {
        await  demo.getApplicationInfos(8, 0, OnReceiveEvent);

        function OnReceiveEvent(datainfo) {
            expect(typeof datainfo).assertEqual("object")
            expect(datainfo.length).assertLarger(0)
            for (var i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0)
                expect(datainfo[i].bundleName.length).assertLarger(0)
                expect(datainfo[i].supportedModes).assertEqual(0)
                expect(datainfo[i].moduleSourceDirs.length).assertLarger(0)
                for (var j = 0; j < datainfo[i].moduleSourceDirs.length; j++) {
                    expect(datainfo[i].moduleSourceDirs[j].length).assertLarger(0)
                }
                expect(datainfo[i].moduleInfos.length).assertLarger(0)
                for (var j = 0; j < datainfo[i].moduleInfos.length; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0)
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertLarger(0)
                }
                expect(datainfo[i].entryDir.length).assertLarger(0)
                expect(datainfo[i].codePath.length).assertLarger(0)
                expect(datainfo[i].dataDir.length).assertLarger(0)
                expect(datainfo[i].dataBaseDir.length).assertLarger(0)
                expect(datainfo[i].cacheDir.length).assertLarger(0)
            }
        }

        done();
    })
    it('getApplicationInfo_0200', 0, async function (done) {
        var datainfo = await demo.getApplicationInfo('com.example.napi_test_suite', 8, 1);
        checkgetApplicationInfo(datainfo)
        done();
    })

    function checkgetApplicationInfo(datainfo) {
        expect(typeof datainfo).assertEqual("object")
        expect(datainfo.name.length).assertLarger(0)
        expect(datainfo.bundleName.length).assertLarger(0)
        expect(datainfo.supportedModes).assertEqual(0)
        expect(datainfo.moduleSourceDirs.length).assertLarger(0)
        for (var j = 0; j < datainfo.moduleSourceDirs.length; j++) {
            expect(datainfo.moduleSourceDirs[j].length).assertLarger(0)
        }
        expect(datainfo.moduleInfos.length).assertLarger(0)
        for (var j = 0; j < datainfo.moduleInfos.length; j++) {
            expect(datainfo.moduleInfos[j].moduleName.length).assertLarger(0)
            expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertLarger(0)
        }
        expect(datainfo.entryDir.length).assertLarger(0)
        expect(datainfo.codePath.length).assertLarger(0)
        expect(datainfo.dataDir.length).assertLarger(0)
        expect(datainfo.dataBaseDir.length).assertLarger(0)
        expect(datainfo.cacheDir.length).assertLarger(0)
    }

    it('getApplicationInfo_0700', 0, async function (done) {
        await demo.getApplicationInfo('com.example.napi_test_suite', 8, 1, OnReceiveEvent);

        function OnReceiveEvent(datainfo) {
            expect(typeof datainfo).assertEqual("object")
            expect(datainfo.name.length).assertLarger(0)
            expect(datainfo.bundleName.length).assertLarger(0)
            expect(datainfo.supportedModes).assertEqual(0)
            expect(datainfo.moduleSourceDirs.length).assertLarger(0)
            for (var j = 0; j < datainfo.moduleSourceDirs.length; j++) {
                expect(datainfo.moduleSourceDirs[j].length).assertLarger(0)
            }
            expect(datainfo.moduleInfos.length).assertLarger(0)
            for (var j = 0; j < datainfo.moduleInfos.length; j++) {
                expect(datainfo.moduleInfos[j].moduleName.length).assertLarger(0)
                expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertLarger(0)
            }
            expect(datainfo.entryDir.length).assertLarger(0)
            expect(datainfo.codePath.length).assertLarger(0)
            expect(datainfo.dataDir.length).assertLarger(0)
            expect(datainfo.dataBaseDir.length).assertLarger(0)
            expect(datainfo.cacheDir.length).assertLarger(0)
        }

        done();
    })
    it('getBundleInfos_0200', 0, async function () {
        var data = await demo.getBundleInfos(8)
        expect(typeof data).assertEqual("object")
        expect(data.length).assertLarger(0)
        for (var i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0)
            expect(data[i].applicationInfo.name.length).assertLarger(0)
            expect(data[i].applicationInfo.bundleName.length).assertLarger(0)

            expect(data[i].hapModuleNames.length).assertLarger(0)
            for (var j = 0; j < data[i].hapModuleNames.length; j++) {
                expect(data[i].hapModuleNames[j].length).assertLarger(0)
            }
            expect(data[i].moduleNames.length).assertLarger(0)
            for (var j = 0; j < data[i].moduleNames.length; j++) {
                expect(data[i].moduleNames[j].length).assertLarger(0)
            }
            expect(data[i].modulePublicDirs.length).assertLarger(0)
            for (var j = 0; j < data[i].modulePublicDirs.length; j++) {
                expect(data[i].modulePublicDirs[j].length).assertLarger(0)
            }
            expect(data[i].moduleDirs.length).assertLarger(0)
            for (var j = 0; j < data[i].moduleDirs.length; j++) {
                expect(data[i].moduleDirs[j].length).assertLarger(0)
            }
            expect(data[i].moduleResPaths.length).assertLarger(0)
            for (var j = 0; j < data[i].moduleResPaths.length; j++) {
                expect(data[i].moduleResPaths[j].length).assertLarger(0)
            }
            expect(data[i].abilityInfos.length).assertLarger(0)
            for (var j = 0; j < data[i].abilityInfos.length; j++) {
                expect(data[i].abilityInfos[j].name.length).assertLarger(0)
                expect(data[i].abilityInfos[j].package.length).assertLarger(0)
            }
        }
    })
    it('getBundleInfos_0400', 0, async function () {
        var data = await demo.getBundleInfos(8)
        expect(typeof data).assertEqual("object")
        expect(data.length).assertLarger(0)
        for (var i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0)
            expect(data[i].applicationInfo.name.length).assertLarger(0)
            expect(data[i].applicationInfo.bundleName.length).assertLarger(0)

            expect(data[i].hapModuleNames.length).assertLarger(0)
            for (var j = 0; j < data[i].hapModuleNames.length; j++) {
                expect(data[i].hapModuleNames[j].length).assertLarger(0)
            }
            expect(data[i].moduleNames.length).assertLarger(0)
            for (var j = 0; j < data[i].moduleNames.length; j++) {
                expect(data[i].moduleNames[j].length).assertLarger(0)
            }
            expect(data[i].modulePublicDirs.length).assertLarger(0)
            for (var j = 0; j < data[i].modulePublicDirs.length; j++) {
                expect(data[i].modulePublicDirs[j].length).assertLarger(0)
            }
            expect(data[i].moduleDirs.length).assertLarger(0)
            for (var j = 0; j < data[i].moduleDirs.length; j++) {
                expect(data[i].moduleDirs[j].length).assertLarger(0)
            }
            expect(data[i].moduleResPaths.length).assertLarger(0)
            for (var j = 0; j < data[i].moduleResPaths.length; j++) {
                expect(data[i].moduleResPaths[j].length).assertLarger(0)
            }
            expect(data[i].abilityInfos.length).assertLarger(0)
            for (var j = 0; j < data[i].abilityInfos.length; j++) {
                expect(data[i].abilityInfos[j].name.length).assertLarger(0)
                expect(data[i].abilityInfos[j].package.length).assertLarger(0)
            }
        }


    })
    it('getBundleInfos_0700', 0, async function () {
        await demo.getBundleInfos(8, OnReceiveEvent)

        function OnReceiveEvent(data) {
            expect(typeof data).assertEqual("object")
            expect(data.length).assertLarger(0)
            for (var i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0)
                expect(data[i].applicationInfo.name.length).assertLarger(0)
                expect(data[i].applicationInfo.bundleName.length).assertLarger(0)

                expect(data[i].hapModuleNames.length).assertLarger(0)
                for (var j = 0; j < data[i].hapModuleNames.length; j++) {
                    expect(data[i].hapModuleNames[j].length).assertLarger(0)
                }
                expect(data[i].moduleNames.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleNames.length; j++) {
                    expect(data[i].moduleNames[j].length).assertLarger(0)
                }
                expect(data[i].modulePublicDirs.length).assertLarger(0)
                for (var j = 0; j < data[i].modulePublicDirs.length; j++) {
                    expect(data[i].modulePublicDirs[j].length).assertLarger(0)
                }
                expect(data[i].moduleDirs.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleDirs.length; j++) {
                    expect(data[i].moduleDirs[j].length).assertLarger(0)
                }
                expect(data[i].moduleResPaths.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleResPaths.length; j++) {
                    expect(data[i].moduleResPaths[j].length).assertLarger(0)
                }
                expect(data[i].abilityInfos.length).assertLarger(0)
                for (var j = 0; j < data[i].abilityInfos.length; j++) {
                    expect(data[i].abilityInfos[j].name.length).assertLarger(0)
                    expect(data[i].abilityInfos[j].package.length).assertLarger(0)
                }
            }
        }

    })

    it('getBundleInfos_0700', 0, async function () {
        await demo.getBundleInfos(8, OnReceiveEvent)

        function OnReceiveEvent(data) {
            expect(typeof data).assertEqual("object")
            expect(data.length).assertLarger(0)
            for (var i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0)
                expect(data[i].applicationInfo.name.length).assertLarger(0)
                expect(data[i].applicationInfo.bundleName.length).assertLarger(0)

                expect(data[i].hapModuleNames.length).assertLarger(0)
                for (var j = 0; j < data[i].hapModuleNames.length; j++) {
                    expect(data[i].hapModuleNames[j].length).assertLarger(0)
                }
                expect(data[i].moduleNames.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleNames.length; j++) {
                    expect(data[i].moduleNames[j].length).assertLarger(0)
                }
                expect(data[i].modulePublicDirs.length).assertLarger(0)
                for (var j = 0; j < data[i].modulePublicDirs.length; j++) {
                    expect(data[i].modulePublicDirs[j].length).assertLarger(0)
                }
                expect(data[i].moduleDirs.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleDirs.length; j++) {
                    expect(data[i].moduleDirs[j].length).assertLarger(0)
                }
                expect(data[i].moduleResPaths.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleResPaths.length; j++) {
                    expect(data[i].moduleResPaths[j].length).assertLarger(0)
                }
                expect(data[i].abilityInfos.length).assertLarger(0)
                for (var j = 0; j < data[i].abilityInfos.length; j++) {
                    expect(data[i].abilityInfos[j].name.length).assertLarger(0)
                    expect(data[i].abilityInfos[j].package.length).assertLarger(0)
                }
            }
        }

    })
    it('getBundleInfos_0900', 0, async function () {
        await demo.getBundleInfos(8, OnReceiveEvent)

        function OnReceiveEvent(data) {
            expect(typeof data).assertEqual("object")
            expect(data.length).assertLarger(0)
            for (var i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0)
                expect(data[i].applicationInfo.name.length).assertLarger(0)
                expect(data[i].applicationInfo.bundleName.length).assertLarger(0)

                expect(data[i].hapModuleNames.length).assertLarger(0)
                for (var j = 0; j < data[i].hapModuleNames.length; j++) {
                    expect(data[i].hapModuleNames[j].length).assertLarger(0)
                }
                expect(data[i].moduleNames.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleNames.length; j++) {
                    expect(data[i].moduleNames[j].length).assertLarger(0)
                }
                expect(data[i].modulePublicDirs.length).assertLarger(0)
                for (var j = 0; j < data[i].modulePublicDirs.length; j++) {
                    expect(data[i].modulePublicDirs[j].length).assertLarger(0)
                }
                expect(data[i].moduleDirs.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleDirs.length; j++) {
                    expect(data[i].moduleDirs[j].length).assertLarger(0)
                }
                expect(data[i].moduleResPaths.length).assertLarger(0)
                for (var j = 0; j < data[i].moduleResPaths.length; j++) {
                    expect(data[i].moduleResPaths[j].length).assertLarger(0)
                }
                expect(data[i].abilityInfos.length).assertLarger(0)
                for (var j = 0; j < data[i].abilityInfos.length; j++) {
                    expect(data[i].abilityInfos[j].name.length).assertLarger(0)
                    expect(data[i].abilityInfos[j].package.length).assertLarger(0)
                }
            }
        }

    })
    it('getBundleInfo_0200', 0, async function (done) {
        var info = await demo.getBundleManager()
        var datainfo = await info.getBundleInfo('com.example.napi_test_suite', 1)
        console.info('**************************getBundleInfo_01********************************')
        expect(datainfo.name.length).assertLarger(0)
        expect(datainfo.label.length).assertLarger(0)
        expect(datainfo.vendor.length).assertLarger(0)
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertEqual(1.0)
        expect(datainfo.minSdkVersion).assertEqual(0)
        expect(datainfo.maxSdkVersion).assertEqual(0)
        expect(datainfo.hapModuleNames.length).assertLarger(0)
        for (var j = 0; j < datainfo.hapModuleNames.length; j++) {
            expect(datainfo.hapModuleNames[j].length).assertLarger(0)
        }
        expect(datainfo.moduleNames.length).assertLarger(0)
        for (var j = 0; j < datainfo.moduleNames.length; j++) {
            expect(datainfo.moduleNames[j].length).assertLarger(0)
        }
        expect(datainfo.modulePublicDirs.length).assertLarger(0)
        for (var j = 0; j < datainfo.modulePublicDirs.length; j++) {
            expect(datainfo.modulePublicDirs[j].length).assertLarger(0)
        }
        expect(datainfo.moduleDirs.length).assertLarger(0)
        for (var j = 0; j < datainfo.moduleDirs.length; j++) {
            expect(datainfo.moduleDirs[j].length).assertLarger(0)
        }
        done()
    })
    it('getBundleInfo_0700', 0, async function (done) {

        var info = await demo.getBundleManager()
        await info.getBundleInfo('com.example.napi_test_suite', 1, OnReceiveEvent)

        function OnReceiveEvent(datainfo) {
            console.info('**************************getBundleInfo_01********************************')
            expect(datainfo.name.length).assertLarger(0)
            expect(datainfo.label.length).assertLarger(0)
            expect(datainfo.vendor.length).assertLarger(0)
            expect(datainfo.versionCode).assertEqual(1)
            expect(datainfo.versionName).assertEqual(1.0)
            expect(datainfo.minSdkVersion).assertEqual(0)
            expect(datainfo.maxSdkVersion).assertEqual(0)
            expect(datainfo.hapModuleNames.length).assertLarger(0)
            for (var j = 0; j < datainfo.hapModuleNames.length; j++) {
                expect(datainfo.hapModuleNames[j].length).assertLarger(0)
            }
            expect(datainfo.moduleNames.length).assertLarger(0)
            for (var j = 0; j < datainfo.moduleNames.length; j++) {
                expect(datainfo.moduleNames[j].length).assertLarger(0)
            }
            expect(datainfo.modulePublicDirs.length).assertLarger(0)
            for (var j = 0; j < datainfo.modulePublicDirs.length; j++) {
                expect(datainfo.modulePublicDirs[j].length).assertLarger(0)
            }
            expect(datainfo.moduleDirs.length).assertLarger(0)
            for (var j = 0; j < datainfo.moduleDirs.length; j++) {
                expect(datainfo.moduleDirs[j].length).assertLarger(0)
            }
        }

        done()
    })
    it('getBundleArchiveInfo_0200', 0, async function (done) {
        var info = await demo.getBundleManager()
        var datainfo = await info.getBundleArchiveInfo('/data/abc2.hap', 1)

        expect(datainfo.entryModuleName.length).assertLarger(0)
        expect(datainfo.compatibleVersion).assertEqual(5)
        expect(datainfo.targetVersion).assertEqual(5)
        expect(datainfo.isKeepAlive).assertEqual(false)
        expect(datainfo.isNativeApp).assertEqual(false)
        expect(datainfo.hapModuleNames.length).assertLarger(0)
        //            for(var j = 0; j < datainfo.hapModuleNames.length; j++) {
        //            expect(datainfo.hapModuleNames[j].length).assertLarger(0)
        //            }
        //            expect(datainfo.moduleNames.length).assertLarger(0)
        //            for(var j = 0; j < datainfo.moduleNames.length; j++) {
        //            expect(datainfo.moduleNames[j].length).assertLarger(0)
        //            }
        //            expect(datainfo.modulePublicDirs.length).assertLarger(0)
        //            for(var j = 0; j < datainfo.modulePublicDirs.length; j++) {
        //            expect(datainfo.modulePublicDirs[j].length).assertLarger(0)
        //            }
        //            expect(datainfo.moduleDirs.length).assertLarger(0)
        //            for(var j = 0; j < datainfo.moduleDirs.length; j++) {
        //            expect(datainfo.moduleDirs[j].length).assertLarger(0)
        //            }
        done()
    })
    it('getBundleArchiveInfo_0700', 0, async function (done) {
        var info = await demo.getBundleManager()
        await info.getBundleArchiveInfo('/data/abc2.hap', 1, OnReceiveEvent)

        function OnReceiveEvent(datainfo) {
            console.info('**************************getBundleInfo_01********************************')
            expect(datainfo.entryModuleName.length).assertLarger(0)
            expect(datainfo.compatibleVersion).assertEqual(5)
            expect(datainfo.targetVersion).assertEqual(5)
            expect(datainfo.isKeepAlive).assertEqual(false)
            expect(datainfo.isNativeApp).assertEqual(false)
            done()
        }
    })

    it('queryAbilityByWant_0100', 0, async function (done) {
        var info = await demo.getBundleManager()
        var datainfo =
            info.queryAbilityByWant({
                want: {
                    action: "action.system.home",
                    entities: ["entity.system.home"],
                    elementName: {
                        deviceId: "0",
                        bundleName: "com.example.myapplicationInstall2",
                        abilityName: "com.example.myapplication.MainAbility",
                    },
                }
            }, {
                params: {
                    flags: 8,
                    userId: "0",
                }
            })
        console.info('**************************queryAbilityByWant_01********************************')
        expect(datainfo.name.length).assertLarger(0)
        expect(datainfo.label.length).assertLarger(0)
        expect(datainfo.description.length).assertLarger(0)
        expect(datainfo.iconPath.length).assertLarger(0)
        expect(datainfo.visible.length).assertLarger(0)
        expect(datainfo.kind.length).assertLarger(0)
        expect(datainfo.package.length).assertLarger(0)
        expect(datainfo.bundleName.length).assertLarger(0)
        expect(datainfo.moduleName.length).assertLarger(0)
        expect(datainfo.applicationName.length).assertLarger(0)
        expect(datainfo.resourcePath.length).assertLarger(0)
        expect(datainfo.deviceTypes.length).assertLarger(0)
        for (var j = 0; j < datainfo.deviceTypes.length; j++) {
            expect(datainfo.deviceTypes[j].length).assertLarger(0)
        }
        expect(datainfo.deviceCapabilities.length).assertLarger(0)
        for (var j = 0; j < datainfo.deviceCapabilities.length; j++) {
            expect(datainfo.deviceCapabilities[j].length).assertLarger(0)
        }
        expect(datainfo.applicationInfo.name.length).assertLarger(0)
        expect(datainfo.applicationInfo.bundleName.length).assertLarger(0)
        done();
    })
    it('queryAbilityByWant_0700', 0, async function (done) {

        var info = await demo.getBundleManager()
        await info.queryAbilityByWant({
            want: {
                action: "action.system.home",
                entities: ["entity.system.home"],
                elementName: {
                    deviceId: "0",
                    bundleName: "com.example.myapplicationInstall2",
                    abilityName: "com.example.myapplication.MainAbility",
                },
            }
        }, {
            params: {
                flags: 8,
                userId: "0",
            }
        }, OnReceiveEvent)

        function OnReceiveEvent(datainfo) {
            expect(datainfo.name.length).assertLarger(0)
            expect(datainfo.label.length).assertLarger(0)
            expect(datainfo.description.length).assertLarger(0)
            expect(datainfo.iconPath.length).assertLarger(0)
            expect(datainfo.visible.length).assertLarger(0)
            expect(datainfo.kind.length).assertLarger(0)
            expect(datainfo.package.length).assertLarger(0)
            expect(datainfo.bundleName.length).assertLarger(0)
            expect(datainfo.moduleName.length).assertLarger(0)
            expect(datainfo.applicationName.length).assertLarger(0)
            expect(datainfo.resourcePath.length).assertLarger(0)
            expect(datainfo.deviceTypes.length).assertLarger(0)
            for (var j = 0; j < datainfo.deviceTypes.length; j++) {
                expect(datainfo.deviceTypes[j].length).assertLarger(0)
            }
            expect(datainfo.deviceCapabilities.length).assertLarger(0)
            for (var j = 0; j < datainfo.deviceCapabilities.length; j++) {
                expect(datainfo.deviceCapabilities[j].length).assertLarger(0)
            }
            expect(datainfo.applicationInfo.name.length).assertLarger(0)
            expect(datainfo.applicationInfo.bundleName.length).assertLarger(0)
            done()
        }
    })
    it('getPermissionDef_0200', 0, async function (done) {
        demo.getPermissionDef('com.permission.music').then((infos) => {
            expect(typeof infos).assertEqual("object");
            expect(infos.name.length).assertLarger(0);
            expect(infos.descriptionId.length).assertLarger(0);
            expect(infos.grantMode.length).assertLarger(0);
            expect(infos.availableScope.length).assertLarger(0);
        });
        done();
    })
    it('getPermissionDef_0700', 0, async function (done) {
        demo.getPermissionDef('com.permission.CAMERA', OnReceiveEvent);
        demo.getPermissionDef('com.permission.music', OnReceiveEvent);

        function OnReceiveEvent(data) {
            expect(data.name.length).assertLarger(0);
            expect(data.descriptionId.length).assertEqual(0);
            expect(data.grantMode.length).assertLarger(0);
            expect(data.availableScope.length).assertLarger(0);
        }

        done();
    })
    it('install_0200', 0, async function (done) {
        demo.getBundleInstaller().then((data) => {
            data.install(['/data/abc2.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            data.install(['/data/abc3.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(infos) {
                expect(typeof infos).assertEqual("object");
                expect(infos.status).assertEqual(0);
                expect(infos.statusMessage).assertEqual("SUCCESS");
            }
        });
        done();
    })
    it('uninstall_0200', 0, async function (done) {
        demo.getBundleInstaller().then((data) => {
            data.uninstall('com.example.myapplication2', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);
            //            data.uninstall('com.example.myapplication2', {
            //                param: {
            //                    userId: 0,
            //                    isKeepData: false
            //                }
            //            }, OnReceiveinstallEvent);
            function OnReceiveinstallEvent(data) {
                expect(typeof data).assertEqual("object");
                expect(data.status).assertEqual(0);
                expect(data.statusMessage).assertEqual("SUCCESS");
            }
        });
        done();
    })
})