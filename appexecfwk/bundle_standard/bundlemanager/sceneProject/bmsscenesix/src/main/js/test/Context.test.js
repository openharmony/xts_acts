//import demo from '@ohos.bundle_mgr'
//
//describe('appInfoTest', function () {
//
//    it('app_info_test_001', 0, function () {
//
//
//            demo.getApplicationInfos(8, 0).then((data) => {
//                console.info('**************************getApplicationInfos1********************************');
//                console.info('xxx getApplicationInfos data length [' + data.length + ']');
//                for (var i = 0; i < data.length; i++) {
//                    console.info("neu========================index[" + i + "].name: for begin");
//                    console.info("neu========================index[" + i + "].name:" + data[i].name);
//                    console.info("neu========================index[" + i + "].bundleName:" + data[i].bundleName);
//                    console.info("neu========================index[" + i + "].description:" + data[i].description);
//                    console.info("neu========================index[" + i + "].descriptionId:" + data[i].descriptionId);
//                    console.info("neu========================index[" + i + "].iconPath:" + data[i].iconPath);
//                    console.info("neu========================index[" + i + "].iconId:" + data[i].iconId);
//                    console.info("neu========================index[" + i + "].label:" + data[i].label);
//                    console.info("neu========================index[" + i + "].labelId:" + data[i].labelId);
//                    console.info("neu========================index[" + i + "].deviceId:" + data[i].deviceId);
//                    console.info("neu========================index[" + i + "].signatureKey:" + data[i].signatureKey);
//                    console.info("neu========================index[" + i + "].process:" + data[i].process);
//                    console.info("neu========================index[" + i + "].isSystemApp:" + data[i].isSystemApp);
//                    console.info("neu========================index[" + i + "].isLauncherApp:" + data[i].isLauncherApp);
//                    console.info("neu========================index[" + i + "].supportedModes:" + data[i].supportedModes);
//
//                    console.info('getApplicationInfosAsync permissions length [' + data[i].permissions.length + ']');
//                    for (var j = 0; j < data[i].permissions.length; j++) {
//                        console.info("neu====================index[" + i + "]permissions[" + j + "]:" + data[i].permissions[j]);
//                    }
//                    console.info('getApplicationInfosAsync moduleSourceDirs length [' + data[i].moduleSourceDirs.length + ']');
//                    for (var j = 0; j < data[i].moduleSourceDirs.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleSourceDirs[" + j + "]:" + data[i].moduleSourceDirs[j]);
//                    }
//                    console.info('getApplicationInfosAsync moduleInfos length [' + data[i].moduleInfos.length + ']');
//                    for (var j = 0; j < data[i].moduleInfos.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleInfos[" + j + "]moduleName:" + data[i].moduleInfos[j].moduleName);
//                        console.info("neu====================index[" + i + "]moduleInfos[" + j + "]moduleSourceDir:" + data[i].moduleInfos[j].moduleSourceDir);
//                    }
//                    console.info("neu========================index[" + i + "].entryDir:" + data[i].entryDir);
//                    console.info("neu========================index[" + i + "].codePath:" + data[i].codePath);
//                    console.info("neu========================index[" + i + "].dataDir:" + data[i].dataDir);
//                    console.info("neu========================index[" + i + "].dataBaseDir:" + data[i].dataBaseDir);
//                    console.info("neu========================index[" + i + "].cacheDir:" + data[i].cacheDir);
//                }
//            })
//    })
//
//    it('app_info_test_002', 0, function () {
//
//            demo.getApplicationInfos(8, 0, OnReceiveEvent);
//
//            function OnReceiveEvent(data) {
//                console.info('**************************getApplicationInfos2********************************');
//                console.info('xxx getApplicationInfos data length [' + data.length + ']');
//                for (var i = 0; i < data.length; i++) {
//                    console.info("neu========================index[" + i + "].name: for begin");
//                    console.info("neu========================index[" + i + "].name:" + data[i].name);
//                    console.info("neu========================index[" + i + "].bundleName:" + data[i].bundleName);
//                    console.info("neu========================index[" + i + "].description:" + data[i].description);
//                    console.info("neu========================index[" + i + "].descriptionId:" + data[i].descriptionId);
//                    console.info("neu========================index[" + i + "].iconPath:" + data[i].iconPath);
//                    console.info("neu========================index[" + i + "].iconId:" + data[i].iconId);
//                    console.info("neu========================index[" + i + "].label:" + data[i].label);
//                    console.info("neu========================index[" + i + "].labelId:" + data[i].labelId);
//                    console.info("neu========================index[" + i + "].deviceId:" + data[i].deviceId);
//                    console.info("neu========================index[" + i + "].signatureKey:" + data[i].signatureKey);
//                    console.info("neu========================index[" + i + "].process:" + data[i].process);
//                    console.info("neu========================index[" + i + "].isSystemApp:" + data[i].isSystemApp);
//                    console.info("neu========================index[" + i + "].isLauncherApp:" + data[i].isLauncherApp);
//                    console.info("neu========================index[" + i + "].supportedModes:" + data[i].supportedModes);
//
//                    console.info('getApplicationInfosAsync permissions length [' + data[i].permissions.length + ']');
//                    for (var j = 0; j < data[i].permissions.length; j++) {
//                        console.info("neu====================index[" + i + "]permissions[" + j + "]:" + data[i].permissions[j]);
//                    }
//                    console.info('getApplicationInfosAsync moduleSourceDirs length [' + data[i].moduleSourceDirs.length + ']');
//                    for (var j = 0; j < data[i].moduleSourceDirs.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleSourceDirs[" + j + "]:" + data[i].moduleSourceDirs[j]);
//                    }
//                    console.info('getApplicationInfosAsync moduleInfos length [' + data[i].moduleInfos.length + ']');
//                    for (var j = 0; j < data[i].moduleInfos.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleInfos[" + j + "]moduleName:" + data[i].moduleInfos[j].moduleName);
//                        console.info("neu====================index[" + i + "]moduleInfos[" + j + "]moduleSourceDir:" + data[i].moduleInfos[j].moduleSourceDir);
//                    }
//                    console.info("neu========================index[" + i + "].entryDir:" + data[i].entryDir);
//                    console.info("neu========================index[" + i + "].codePath:" + data[i].codePath);
//                    console.info("neu========================index[" + i + "].dataDir:" + data[i].dataDir);
//                    console.info("neu========================index[" + i + "].dataBaseDir:" + data[i].dataBaseDir);
//                    console.info("neu========================index[" + i + "].cacheDir:" + data[i].cacheDir);
//                }
//            }
//    })
//
//
//    it('app_info_test_003', 0, function () {
//
//            demo.getApplicationInfo('com.example.myapplicationInstall', 8, 0).then((data) => {
//                console.info('**************************getApplicationInfo1********************************');
//                console.info("neu========================name: for begin");
//                console.info("neu========================name:" + data.name);
//                console.info("neu========================bundleName:" + data.bundleName);
//                console.info("neu========================description:" + data.description);
//                console.info("neu========================descriptionId:" + data.descriptionId);
//                console.info("neu========================iconPath:" + data.iconPath);
//                console.info("neu========================iconId:" + data.iconId);
//                console.info("neu========================label:" + data.label);
//                console.info("neu========================labelId:" + data.labelId);
//                console.info("neu========================deviceId:" + data.deviceId);
//                console.info("neu========================signatureKey:" + data.signatureKey);
//                console.info("neu========================process:" + data.process);
//                console.info("neu========================isSystemApp:" + data.isSystemApp);
//                console.info("neu========================isLauncherApp:" + data.isLauncherApp);
//                console.info("neu========================supportedModes:" + data.supportedModes);
//
//                console.info('getApplicationInfo permissions length [' + data.permissions.length + ']');
//                for (var j = 0; j < data.permissions.length; j++) {
//                    console.info("neu====================permissions[" + j + "]:" + data.permissions[j]);
//                }
//                console.info('getApplicationInfo moduleSourceDirs length [' + data.moduleSourceDirs.length + ']');
//                for (var j = 0; j < data.moduleSourceDirs.length; j++) {
//                    console.info("neu====================moduleSourceDirs[" + j + "]:" + data.moduleSourceDirs[j]);
//                }
//                console.info('getApplicationInfo moduleInfos length [' + data.moduleInfos.length + ']');
//                for (var j = 0; j < data.moduleInfos.length; j++) {
//                    console.info("neu====================moduleInfos[" + j + "]moduleName:" + data.moduleInfos[j].moduleName);
//                    console.info("neu====================moduleInfos[" + j + "]moduleSourceDir:" + data.moduleInfos[j].moduleSourceDir);
//                }
//                console.info("neu========================entryDir:" + data.entryDir);
//                console.info("neu========================codePath:" + data.codePath);
//                console.info("neu========================dataDir:" + data.dataDir);
//                console.info("neu========================dataBaseDir:" + data.dataBaseDir);
//                console.info("neu========================cacheDir:" + data.cacheDir);
//            })
//    })
//
//
//    it('app_info_test_004', 0, function () {
//
//            demo.getApplicationInfo('com.example.myapplicationInstall', 8, 0, OnReceiveEvent);
//
//            function OnReceiveEvent(data) {
//                console.info('**************************getApplicationInfo2********************************');
//                console.info("neu========================name: for begin");
//                console.info("neu========================name:" + data.name);
//                console.info("neu========================bundleName:" + data.bundleName);
//                console.info("neu========================description:" + data.description);
//                console.info("neu========================descriptionId:" + data.descriptionId);
//                console.info("neu========================iconPath:" + data.iconPath);
//                console.info("neu========================iconId:" + data.iconId);
//                console.info("neu========================label:" + data.label);
//                console.info("neu========================labelId:" + data.labelId);
//                console.info("neu========================deviceId:" + data.deviceId);
//                console.info("neu========================signatureKey:" + data.signatureKey);
//                console.info("neu========================process:" + data.process);
//                console.info("neu========================isSystemApp:" + data.isSystemApp);
//                console.info("neu========================isLauncherApp:" + data.isLauncherApp);
//                console.info("neu========================supportedModes:" + data.supportedModes);
//
//                console.info('getApplicationInfo permissions length [' + data.permissions.length + ']');
//                for (var j = 0; j < data.permissions.length; j++) {
//                    console.info("neu====================permissions[" + j + "]:" + data.permissions[j]);
//                }
//                console.info('getApplicationInfo moduleSourceDirs length [' + data.moduleSourceDirs.length + ']');
//                for (var j = 0; j < data.moduleSourceDirs.length; j++) {
//                    console.info("neu====================moduleSourceDirs[" + j + "]:" + data.moduleSourceDirs[j]);
//                }
//                console.info('getApplicationInfo moduleInfos length [' + data.moduleInfos.length + ']');
//                for (var j = 0; j < data.moduleInfos.length; j++) {
//                    console.info("neu====================moduleInfos[" + j + "]moduleName:" + data.moduleInfos[j].moduleName);
//                    console.info("neu====================moduleInfos[" + j + "]moduleSourceDir:" + data.moduleInfos[j].moduleSourceDir);
//                }
//                console.info("neu========================entryDir:" + data.entryDir);
//                console.info("neu========================codePath:" + data.codePath);
//                console.info("neu========================dataDir:" + data.dataDir);
//                console.info("neu========================dataBaseDir:" + data.dataBaseDir);
//                console.info("neu========================cacheDir:" + data.cacheDir);
//            }
//
//    })
//
//
//    it('app_info_test_005', 0, function () {
//            demo.getBundleInfos(8).then((data) => {
//                console.info('**************************getBundleInfos1********************************');
//                console.info('xxx getBundleInfos data length [' + data.length + ']');
//                for (var i = 0; i < data.length; i++) {
//                    console.info("neu========================index[" + i + "].name: for begin");
//                    console.info("neu========================index[" + i + "].name:" + data[i].name);
//                    console.info("neu========================index[" + i + "].label:" + data[i].label);
//                    console.info("neu========================index[" + i + "].description:" + data[i].description);
//                    console.info("neu========================index[" + i + "].vendor:" + data[i].vendor);
//                    console.info("neu========================index[" + i + "].versionCode:" + data[i].versionCode);
//                    console.info("neu========================index[" + i + "].versionName:" + data[i].versionName);
//                    console.info("neu========================index[" + i + "].jointUserId:" + data[i].jointUserId);
//                    console.info("neu========================index[" + i + "].minSdkVersion:" + data[i].minSdkVersion);
//                    console.info("neu========================index[" + i + "].maxSdkVersion:" + data[i].maxSdkVersion);
//                    console.info("neu========================index[" + i + "].mainEntry:" + data[i].mainEntry);
//                    console.info("neu========================index[" + i + "].cpuAbi:" + data[i].cpuAbi);
//                    console.info("neu========================index[" + i + "].appId:" + data[i].appId);
//                    console.info("neu========================index[" + i + "].compatibleVersion:" + data[i].compatibleVersion);
//                    console.info("neu========================index[" + i + "].targetVersion:" + data[i].targetVersion);
//                    console.info("neu========================index[" + i + "].releaseType:" + data[i].releaseType);
//                    console.info("neu========================index[" + i + "].uid:" + data[i].uid);
//                    console.info("neu========================index[" + i + "].gid:" + data[i].gid);
//                    console.info("neu========================index[" + i + "].seInfo:" + data[i].seInfo);
//                    console.info("neu========================index[" + i + "].entryModuleName:" + data[i].entryModuleName);
//                    console.info("neu========================index[" + i + "].isKeepAlive:" + data[i].isKeepAlive);
//                    console.info("neu========================index[" + i + "].isNativeApp:" + data[i].isNativeApp);
//                    console.info("neu========================index[" + i + "].installTime:" + data[i].installTime);
//                    console.info("neu========================index[" + i + "].updateTime:" + data[i].updateTime);
//                    console.info("neu========================index[" + i + "].appInfo.name:" + data[i].applicationInfo.name);
//                    console.info("neu========================index[" + i + "].appInfo.bundleName:" + data[i].applicationInfo.bundleName);
//                    console.info('getBundleInfos reqPermissions length [' + data[i].reqPermissions.length + ']');
//                    for (var j = 0; j < data[i].reqPermissions.length; j++) {
//                        console.info("neu====================index[" + i + "]reqPermissions[" + j + "]:" + data[i].reqPermissions[j]);
//                    }
//                    console.info('getBundleInfos defPermissions length [' + data[i].defPermissions.length + ']');
//                    for (var j = 0; j < data[i].defPermissions.length; j++) {
//                        console.info("neu====================index[" + i + "]defPermissions[" + j + "]:" + data[i].defPermissions[j]);
//                    }
//
//                    console.info('getBundleInfos hapModuleNames length [' + data[i].hapModuleNames.length + ']');
//                    for (var j = 0; j < data[i].hapModuleNames.length; j++) {
//                        console.info("neu====================index[" + i + "]hapModuleNames[" + j + "]:" + data[i].hapModuleNames[j]);
//                    }
//                    console.info('getBundleInfos moduleNames length [' + data[i].moduleNames.length + ']');
//                    for (var j = 0; j < data[i].moduleNames.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleNames[" + j + "]:" + data[i].moduleNames[j]);
//                    }
//                    console.info('getBundleInfos modulePublicDirs length [' + data[i].modulePublicDirs.length + ']');
//                    for (var j = 0; j < data[i].modulePublicDirs.length; j++) {
//                        console.info("neu====================index[" + i + "]modulePublicDirs[" + j + "]:" + data[i].modulePublicDirs[j]);
//                    }
//                    console.info('getBundleInfos moduleDirs length [' + data[i].moduleDirs.length + ']');
//                    for (var j = 0; j < data[i].moduleDirs.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleDirs[" + j + "]:" + data[i].moduleDirs[j]);
//                    }
//                    console.info('getBundleInfos moduleResPaths length [' + data[i].moduleResPaths.length + ']');
//                    for (var j = 0; j < data[i].moduleResPaths.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleResPaths[" + j + "]:" + data[i].moduleResPaths[j]);
//                    }
//                    console.info('getBundleInfos abilityInfo length [' + data[i].abilityInfos.length + ']');
//                    for (var j = 0; j < data[i].abilityInfos.length; j++) {
//                        console.info("neu====================index[" + i + "]abilityInfos[" + j + "]name:" + data[i].abilityInfos[j].name);
//                        console.info("neu====================index[" + i + "]abilityInfos[" + j + "]package:" + data[i].abilityInfos[j].package);
//                    }
//                }
//            })
//    })
//
//    it('app_info_test_006', 0, function () {
//
//            demo.getBundleInfos(8, OnReceiveEvent);
//
//            function OnReceiveEvent(data) {
//                console.info('**************************getBundleInfos2********************************');
//                console.info('xxx getBundleInfos data length [' + data.length + ']');
//                for (var i = 0; i < data.length; i++) {
//                    console.info("neu========================index[" + i + "].name: for begin");
//                    console.info("neu========================index[" + i + "].name:" + data[i].name);
//                    console.info("neu========================index[" + i + "].label:" + data[i].label);
//                    console.info("neu========================index[" + i + "].description:" + data[i].description);
//                    console.info("neu========================index[" + i + "].vendor:" + data[i].vendor);
//                    console.info("neu========================index[" + i + "].versionCode:" + data[i].versionCode);
//                    console.info("neu========================index[" + i + "].versionName:" + data[i].versionName);
//                    console.info("neu========================index[" + i + "].jointUserId:" + data[i].jointUserId);
//                    console.info("neu========================index[" + i + "].minSdkVersion:" + data[i].minSdkVersion);
//                    console.info("neu========================index[" + i + "].maxSdkVersion:" + data[i].maxSdkVersion);
//                    console.info("neu========================index[" + i + "].mainEntry:" + data[i].mainEntry);
//                    console.info("neu========================index[" + i + "].cpuAbi:" + data[i].cpuAbi);
//                    console.info("neu========================index[" + i + "].appId:" + data[i].appId);
//                    console.info("neu========================index[" + i + "].compatibleVersion:" + data[i].compatibleVersion);
//                    console.info("neu========================index[" + i + "].targetVersion:" + data[i].targetVersion);
//                    console.info("neu========================index[" + i + "].releaseType:" + data[i].releaseType);
//                    console.info("neu========================index[" + i + "].uid:" + data[i].uid);
//                    console.info("neu========================index[" + i + "].gid:" + data[i].gid);
//                    console.info("neu========================index[" + i + "].seInfo:" + data[i].seInfo);
//                    console.info("neu========================index[" + i + "].entryModuleName:" + data[i].entryModuleName);
//                    console.info("neu========================index[" + i + "].isKeepAlive:" + data[i].isKeepAlive);
//                    console.info("neu========================index[" + i + "].isNativeApp:" + data[i].isNativeApp);
//                    console.info("neu========================index[" + i + "].installTime:" + data[i].installTime);
//                    console.info("neu========================index[" + i + "].updateTime:" + data[i].updateTime);
//                    console.info("neu========================index[" + i + "].appInfo.name:" + data[i].applicationInfo.name);
//                    console.info("neu========================index[" + i + "].appInfo.bundleName:" + data[i].applicationInfo.bundleName);
//                    console.info('getBundleInfos reqPermissions length [' + data[i].reqPermissions.length + ']');
//                    for (var j = 0; j < data[i].reqPermissions.length; j++) {
//                        console.info("neu====================index[" + i + "]reqPermissions[" + j + "]:" + data[i].reqPermissions[j]);
//                    }
//                    console.info('getBundleInfos defPermissions length [' + data[i].defPermissions.length + ']');
//                    for (var j = 0; j < data[i].defPermissions.length; j++) {
//                        console.info("neu====================index[" + i + "]defPermissions[" + j + "]:" + data[i].defPermissions[j]);
//                    }
//
//                    console.info('getBundleInfos hapModuleNames length [' + data[i].hapModuleNames.length + ']');
//                    for (var j = 0; j < data[i].hapModuleNames.length; j++) {
//                        console.info("neu====================index[" + i + "]hapModuleNames[" + j + "]:" + data[i].hapModuleNames[j]);
//                    }
//                    console.info('getBundleInfos moduleNames length [' + data[i].moduleNames.length + ']');
//                    for (var j = 0; j < data[i].moduleNames.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleNames[" + j + "]:" + data[i].moduleNames[j]);
//                    }
//                    console.info('getBundleInfos modulePublicDirs length [' + data[i].modulePublicDirs.length + ']');
//                    for (var j = 0; j < data[i].modulePublicDirs.length; j++) {
//                        console.info("neu====================index[" + i + "]modulePublicDirs[" + j + "]:" + data[i].modulePublicDirs[j]);
//                    }
//                    console.info('getBundleInfos moduleDirs length [' + data[i].moduleDirs.length + ']');
//                    for (var j = 0; j < data[i].moduleDirs.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleDirs[" + j + "]:" + data[i].moduleDirs[j]);
//                    }
//                    console.info('getBundleInfos moduleResPaths length [' + data[i].moduleResPaths.length + ']');
//                    for (var j = 0; j < data[i].moduleResPaths.length; j++) {
//                        console.info("neu====================index[" + i + "]moduleResPaths[" + j + "]:" + data[i].moduleResPaths[j]);
//                    }
//                    console.info('getBundleInfos abilityInfo length [' + data[i].abilityInfos.length + ']');
//                    for (var j = 0; j < data[i].abilityInfos.length; j++) {
//                        console.info("neu====================index[" + i + "]abilityInfos[" + j + "]name:" + data[i].abilityInfos[j].name);
//                        console.info("neu====================index[" + i + "]abilityInfos[" + j + "]package:" + data[i].abilityInfos[j].package);
//                    }
//                }
//
//            }
//
//    })
//
//
//})
//
//
//
//
//
