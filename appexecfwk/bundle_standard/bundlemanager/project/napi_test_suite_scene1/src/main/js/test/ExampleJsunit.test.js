import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import demo from '@ohos.bundle'

describe('appInfoTest', function () {

    it('getApplicationInfos_0100', 0, async function (done) {
        var datainfo = await demo.getApplicationInfos(8, 0)
        checkgetApplicationInfos(datainfo)
        done()
    })

    function checkgetApplicationInfos(datainfo) {
        expect(typeof datainfo).assertEqual("object")
        expect(datainfo.length).assertLarger(0)
        for (var i = 0; i < datainfo.length; i++) {
            expect(datainfo[i].name.length).assertLarger(0)
            expect(datainfo[i].description.length).assertLarger(0)
            expect(datainfo[i].icon.length).assertLarger(0)
            expect(datainfo[i].label.length).assertLarger(0)
            expect(datainfo[i].entryDir.length).assertLarger(0)
            expect(datainfo[i].moduleSourceDirs.length).assertLarger(0)
            expect(datainfo[i].moduleInfos.length).assertLarger(0)
        }
    }

    it('getApplicationInfos_0600', 0, async function (done) {
        await  demo.getApplicationInfos(8, 0, (error, datainfo) => {
            expect(typeof datainfo).assertEqual("object")
            expect(datainfo.length).assertLarger(0)
            for (var i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0)
                expect(datainfo[i].description.length).assertLarger(0)
                expect(datainfo[i].icon.length).assertLarger(0)
                expect(datainfo[i].label.length).assertLarger(0)
                expect(datainfo[i].entryDir.length).assertLarger(0)
                expect(datainfo[i].moduleSourceDirs.length).assertLarger(0)
                expect(datainfo[i].moduleInfos.length).assertLarger(0)
            }
        });
        done()
    })

    it('getApplicationInfo_0100', 0, async function (done) {
        var datainfo = await demo.getApplicationInfo('com.example.myapplication1', 8, 1)
        expect(typeof datainfo).assertEqual("object")
        expect(datainfo.name.length).assertLarger(0)
        expect(datainfo.description.length).assertLarger(0)
        expect(datainfo.icon.length).assertLarger(0)
        expect(datainfo.label.length).assertLarger(0)
        expect(datainfo.entryDir.length).assertLarger(0)
        expect(datainfo.moduleSourceDirs.length).assertLarger(0)
        expect(datainfo.moduleInfos.length).assertLarger(0)
        done()
    })

    it('getApplicationInfo_0600', 0, async function (done) {
        await demo.getApplicationInfo('com.example.myapplication1', 8, 1, (error, datainfo) => {
            expect(typeof datainfo).assertEqual("object")
            expect(datainfo.name.length).assertLarger(0)
            expect(datainfo.description.length).assertLarger(0)
            expect(datainfo.icon.length).assertLarger(0)
            expect(datainfo.label.length).assertLarger(0)
            expect(datainfo.entryDir.length).assertLarger(0)
            expect(datainfo.moduleSourceDirs.length).assertLarger(0)
            expect(datainfo.moduleInfos.length).assertLarger(0)
        })
        done()
    })

    it('getBundleInfos_0100', 0, async function () {
        var data = await demo.getBundleInfos(8)
        expect(typeof data).assertEqual("object")
        expect(data.length).assertLarger(0)
        for (var i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0)
            expect(data[i].entryModuleName.length).assertLarger(0)
            expect(typeof data[i].appInfo).assertEqual("object")
            expect(data[i].abilityInfos.length).assertLarger(0)
        }
    })

    it('getBundleInfos_0600', 0, async function () {
        await demo.getBundleInfos(8, (error, datainfo) => {
            expect(typeof datainfo).assertEqual("object")
            expect(datainfo.length).assertLarger(0)
            for (var i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0)
                expect(datainfo[i].entryModuleName.length).assertLarger(0)
                expect(typeof datainfo[i].appInfo).assertEqual("object")
                expect(datainfo[i].abilityInfos.length).assertLarger(0)
            }
        })
    })

    it('getApplicationInfo_0400', 0, async function (done) {
        var datainfo = await demo.getApplicationInfo('com.example.napi_test_suitee', 8, 1)
        checkgetApplicationInfoe(datainfo)
        done()
    })

    function checkgetApplicationInfoe(datainfo) {
        expect(datainfo.name.length).assertEqual(0)
    }

    it('getApplicationInfo_0500', 0, async function (done) {
        await demo.getApplicationInfo('', 8, 1, (error, datainfo) => {
            expect(datainfo.name.length).assertEqual(0)
        })
        done()
    })

    it('getApplicationInfo_0900', 0, async function (done) {
        await demo.getApplicationInfo('com.example.napi_test_suitee', 8, 1, (error, datainfo) => {
            expect(datainfo.name.length).assertEqual(0)
        })
        done()
    })

    it('getApplicationInfo_1000', 0, async function (done) {
        await demo.getApplicationInfo('', 8, 1, (error, datainfo) => {
            expect(datainfo.name.length).assertEqual(0)
        })
        done()
    })

    it('getBundleInfo_0100', 0, async function (done) {
        var datainfo = await demo.getBundleInfo('com.example.myapplication1',1)
        expect(datainfo.name.length).assertLarger(0)
        expect(datainfo.vendor.length).assertLarger(0)
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertEqual(1.0)
        expect(datainfo.appInfo.name.length).assertLarger(0)
        expect(datainfo.appInfo.description.length).assertLarger(0)
        expect(datainfo.appInfo.label.length).assertLarger(0)
        expect(datainfo.appInfo.icon.length).assertLarger(0)
        expect(datainfo.appInfo.descriptionId).assertEqual(16777217)
        done()
    })

    it('getBundleInfo_0400', 0, async function (done) {
        var datainfo = await demo.getBundleInfo('error',1);
        expect(datainfo.name.length).assertEqual(0)
        done();
    })

    it('getBundleInfo_0500', 0, async function (done) {
        var datainfo = await demo.getBundleInfo();
        expect(datainfo.name.length).assertEqual(0)
        done();
    })

    it('getBundleInfo_0600', 0, async function (done) {
        await demo.getBundleInfo('com.example.myapplication1',1,OnReceiveEvent)
        function OnReceiveEvent(err,datainfo) {
            expect(datainfo.name.length).assertLarger(0)
            expect(datainfo.vendor.length).assertLarger(0)
            expect(datainfo.versionCode).assertEqual(1)
            expect(datainfo.versionName).assertEqual(1.0)
            expect(datainfo.appInfo.name.length).assertLarger(0)
            expect(datainfo.appInfo.description.length).assertLarger(0)
            expect(datainfo.appInfo.label.length).assertLarger(0)
            expect(datainfo.appInfo.icon.length).assertLarger(0)
            expect(datainfo.appInfo.descriptionId).assertEqual(16777217)
        }
        done()
    })

    it('getBundleInfo_0900', 0, async function (done) {
        await demo.getBundleInfo('error',1,OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            expect(datainfo.name.length).assertEqual(0)
        }
        done()
    })

    it('getBundleInfo_1000', 0, async function (done) {
        await demo.getBundleInfo(OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            expect(datainfo.name.length).assertEqual(0)
        }
        done()
    })

    it('getBundleArchiveInfo_0100',  0, async function (done) {
        var datainfo = await demo.getBundleArchiveInfo('/data/bmsJstest1.hap',1)
        expect(datainfo.name.length).assertLarger(0)
        expect(datainfo.vendor.length).assertLarger(0)
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertEqual(1.0)
        expect(datainfo.appInfo.name.length).assertLarger(0)
        expect(datainfo.appInfo.description.length).assertLarger(0)
        expect(datainfo.appInfo.label.length).assertLarger(0)
        expect(datainfo.appInfo.icon.length).assertLarger(0)
        done()
    })

    it('getBundleArchiveInfo_0400',  0, async function (done) {
        var datainfo = await demo.getBundleArchiveInfo('/data/error.hap',1)
        expect(datainfo.name.length).assertEqual(0)
        done()
    })

    it('getBundleArchiveInfo_0500',  0, async function (done) {
        var datainfo = await demo.getBundleArchiveInfo(' ',1)
        expect(datainfo.name.length).assertEqual(0)
        done()
    })

    it('getBundleArchiveInfo_0600',  0, async function (done) {
        await demo.getBundleArchiveInfo('/data/bmsJstest1.hap',1,OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            expect(datainfo.name.length).assertLarger(0)
            expect(datainfo.vendor.length).assertLarger(0)
            expect(datainfo.versionCode).assertEqual(1)
            expect(datainfo.versionName).assertEqual(1.0)
            expect(datainfo.appInfo.name.length).assertLarger(0)
            expect(datainfo.appInfo.description.length).assertLarger(0)
            expect(datainfo.appInfo.label.length).assertLarger(0)
            expect(datainfo.appInfo.icon.length).assertLarger(0)
        }
        done()
    })

    it('getBundleArchiveInfo_0900',  0, async function (done) {
        await demo.getBundleArchiveInfo('/data/error.', 1,OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            expect(datainfo.name.length).assertEqual(0)
        }
        done()
    })

    it('getBundleArchiveInfo_1000',  0, async function (done) {
        await demo.getBundleArchiveInfo(' ', 1,OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            expect(datainfo.name.length).assertEqual(0)
        }
        done()
    })

    it('queryAbilityByWant_0100', 0, async function (done) {
        var datainfo =
            await demo.queryAbilityByWant({
                want:{
                    action: "action.system.home",
                    entities:["entity.system.home"],
                    elementName: {
                        deviceId: "0",
                        bundleName : "com.example.myapplication1",
                        abilityName : ".MainAbility",
                    },}},{
                params:{
                    flags: 8 ,
                    userId:"0" ,
                }
            })
        expect(datainfo.name.length).assertLarger(0)
        expect(datainfo.label.length).assertLarger(0)
        expect(datainfo.description.length).assertLarger(0)
        expect(datainfo.icon.length).assertLarger(0)
        expect(datainfo.moduleName.length).assertLarger(0)
        expect(datainfo.bundleName.length).assertLarger(0)
        expect(datainfo.applicationInfo.name.length).assertLarger(0)
        expect(datainfo.applicationInfo.description.length).assertLarger(0)
        expect(datainfo.applicationInfo.icon.length).assertLarger(0)
        expect(datainfo.applicationInfo.label.length).assertLarger(0)
        done();
    })

    it('queryAbilityByWant_0400', 0, async function (done) {
        var datainfo =
            await demo.queryAbilityByWant({
                want:{
                    action: "action.system.home",
                    entities:["entity.system.home"],
                    elementName: {
                        deviceId : "0",
                        bundleName : "com.example.myapplication1",
                        abilityName : "",
                    },}},{
                params:{
                    flags: 8 ,
                    userId:"0" ,
                }
            })
        expect(datainfo.name.length).assertEqual(0)
        done();
    })

    it('queryAbilityByWant_0500', 0, async function (done) {
        var datainfo =
            await demo.queryAbilityByWant({
                want:{
                    action: "action.system.home",
                    entities:["entity.system.home"],
                    elementName: {
                        deviceId : "0",
                        bundleName : "",
                        abilityName : "",
                    },}},{
                params:{
                    flags: 8 ,
                    userId:"0" ,
                }
            })
        expect(datainfo.name.length).assertEqual(0)
        done();
    })

    it('queryAbilityByWant_0600', 0, async function (done) {
        await demo.queryAbilityByWant({
            want: {
                action: "action.system.home",
                entities: ["entity.system.home"],
                elementName: {
                    deviceId: "0",
                    bundleName: "com.example.myapplication1",
                    abilityName: ".MainAbility",
                },
            }
        }, {
            params: {
                flags: 8,
                userId: "0",
            }
        },OnReceiveEvent)
        function OnReceiveEvent(err,datainfo) {
            expect(datainfo.name.length).assertLarger(0)
            expect(datainfo.label.length).assertLarger(0)
            expect(datainfo.description.length).assertLarger(0)
            expect(datainfo.icon.length).assertLarger(0)
            expect(datainfo.moduleName.length).assertLarger(0)
            expect(datainfo.bundleName.length).assertLarger(0)
            expect(datainfo.applicationInfo.name.length).assertLarger(0)
            expect(datainfo.applicationInfo.description.length).assertLarger(0)
            expect(datainfo.applicationInfo.icon.length).assertLarger(0)
            expect(datainfo.applicationInfo.label.length).assertLarger(0)
            done()
        }
    })

    it('queryAbilityByWant_0900', 0, async function (done) {
        await demo.queryAbilityByWant({
            want: {
                action: "action.system.home",
                entities: ["entity.system.home"],
                elementName: {
                    deviceId: "0",
                    bundleName: "com.example.myapplication1",
                    abilityName: "",
                },
            }
        }, {
            params: {
                flags: 8,
                userId: "0",
            }
        },OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            expect(datainfo.name.length).assertEqual(0)
            done();
        }
    })

    it('queryAbilityByWant_1000', 0, async function (done) {
        await demo.queryAbilityByWant({
            want: {
                action: "action.system.home",
                entities: ["entity.system.home"],
                elementName: {
                    deviceId: "0",
                    bundleName: "",
                    abilityName: "",
                },
            }
        }, {
            params: {
                flags: 8,
                userId: "0",
            }
        },OnReceiveEvent)
        function OnReceiveEvent(err,datainfo) {
            expect(datainfo.name.length).assertEqual(0)
            done()
        }
    })

    it('getPermissionDef_0100', 0, async function(done){
        await demo.getPermissionDef('com.permission.CAMERA').then((infos) => {
            expect(typeof infos).assertEqual("object");

            expect(infos.name).assertEqual("com.permission.CAMERA");
            expect(infos.grantMode).assertEqual(1);
            expect(infos.availableScope).assertEqual(2);
            expect(infos.label).assertEqual("CAMERA permission");
            expect(infos.description).assertEqual("CAMERA permission in detail");
        });
        done();
    })

    it('getPermissionDef_0600', 0, async function(done){
        console.info("neu========================getPermissionDef_0100: for begin");

        await demo.getPermissionDef('com.permission.CAMERA', OnReceiveEvent);

        function OnReceiveEvent(err, data) {
            expect(data.name).assertEqual("com.permission.CAMERA");
            expect(data.grantMode).assertEqual(1);
            expect(data.availableScope).assertEqual(2);
            expect(data.label).assertEqual("CAMERA permission");
            expect(data.description).assertEqual("CAMERA permission in detail");
        }

        done();

    })
    
    it('getPermissionDef_0400', 0, async function(done){
        await demo.getPermissionDef('').then((infos) => {
            expect(typeof infos).assertEqual("object");
            expect(infos.name).assertEqual("");
            expect(infos.grantMode).assertEqual("");
            expect(infos.availableScope).assertEqual(0);
            expect(infos.label).assertEqual("");
            expect(infos.description).assertEqual("");
        });
        done();
    })
    it('getPermissionDef_0900', 0, async function(done)
    {

        await demo.getPermissionDef('', OnReceiveEvent);

        function OnReceiveEvent(err, data) {
            expect(typeof data).assertEqual("object");

            expect(data.name).assertEqual("");

            expect(data.availableScope).assertEqual(0);
            expect(data.grantMode).assertEqual("");
            expect(data.label).assertEqual("");
            expect(data.description).assertEqual("");
        }

        done();
    })

})
