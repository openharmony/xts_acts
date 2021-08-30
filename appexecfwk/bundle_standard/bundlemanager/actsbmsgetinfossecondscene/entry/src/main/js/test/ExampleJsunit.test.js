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
import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import demo from '@ohos.bundle'

describe('ActsBmsGetInfosSecondScene', function () {

    it('getApplicationInfos_0200', 0, async function (done) {
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

    it('getApplicationInfos_0400', 0, async function (done) {
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

    it('getApplicationInfos_0700', 0, async function (done) {
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

    it('getApplicationInfos_0900', 0, async function (done) {
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

    it('getBundleInfos_0200', 0, async function (done) {
        var data = await demo.getBundleInfos(8)
        expect(typeof data).assertEqual("object")
        expect(data.length).assertLarger(0)
        for (var i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0)
            expect(data[i].entryModuleName.length).assertLarger(0)
            expect(typeof data[i].appInfo).assertEqual("object")
            expect(data[i].abilityInfos.length).assertLarger(0)
        }
        done();
    })

    it('getBundleInfos_0400', 0, async function (done) {
        var data = await demo.getBundleInfos(8)
        expect(typeof data).assertEqual("object")
        expect(data.length).assertLarger(0)
        for (var i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0)
            expect(data[i].entryModuleName.length).assertLarger(0)
            expect(typeof data[i].appInfo).assertEqual("object")
            expect(data[i].abilityInfos.length).assertLarger(0)
        }
        done();
    })

    it('getBundleInfos_0700', 0, async function (done) {
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
        done()
    })

    it('getBundleInfos_0900', 0, async function (done) {
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
        done()
    })

    it('getApplicationInfo_0200', 0, async function (done) {
        var datainfo = await demo.getApplicationInfo('com.example.myapplication2', 8, 1)
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

    it('getApplicationInfo_0700', 0, async function (done) {
        await demo.getApplicationInfo('com.example.myapplication2', 8, 1, (error, datainfo) => {
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

    it('getBundleInfo_0200', 0, async function (done) {
        var datainfo = await demo.getBundleInfo('com.example.myapplication2',1)
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

    it('getBundleInfo_0700', 0, async function (done) {
        await demo.getBundleInfo('com.example.myapplication2',1,OnReceiveEvent)
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

    it('getBundleArchiveInfo_0200',  0, async function (done) {
        var datainfo = await demo.getBundleArchiveInfo('/data/bmsJstest2.hap',1)
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

    it('getBundleArchiveInfo_0700',  0, async function (done) {
        await demo.getBundleArchiveInfo('/data/bmsJstest2.hap',1,OnReceiveEvent)
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

    it('queryAbilityByWant_0200', 0, async function (done) {
        var datainfo =
            await demo.queryAbilityByWant({
                want:{
                    action: "action.system.home",
                    entities:["entity.system.home"],
                    elementName: {
                        deviceId: "0",
                        bundleName : "com.example.myapplication2",
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

    it('queryAbilityByWant_0700', 0, async function (done) {
        await demo.queryAbilityByWant({
            want: {
                action: "action.system.home",
                entities: ["entity.system.home"],
                elementName: {
                    deviceId: "0",
                    bundleName: "com.example.myapplication2",
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
    it('getPermissionDef_0200', 0, async function(done){
        await demo.getPermissionDef('com.permission.CAMERA').then((infos) => {
            expect(typeof infos).assertEqual("object");
            expect(infos.name).assertEqual("com.permission.CAMERA");
            expect(infos.grantMode).assertEqual(1);
            expect(infos.availableScope).assertEqual(2);
            expect(infos.label).assertEqual("CAMERA permission");
            expect(infos.description).assertEqual("CAMERA permission in detail");
        });
        await demo.getPermissionDef('com.permission.music').then((infos) => {
            expect(typeof infos).assertEqual("object");
            expect(infos.name).assertEqual("com.permission.music");
            expect(infos.grantMode).assertEqual(1);
            expect(infos.availableScope).assertEqual(2);
            expect(infos.label).assertEqual("music permission");
            expect(infos.description).assertEqual("music permission in detail");
        });
        done();
    })

    it('getPermissionDef_0700', 0, async function(done){
        await demo.getPermissionDef('com.permission.CAMERA', OnReceiveEvent1);

        await demo.getPermissionDef('com.permission.music', OnReceiveEvent2);

        function OnReceiveEvent1(err, data) {
            expect(data.name).assertEqual("com.permission.CAMERA");
            expect(data.grantMode).assertEqual(1);
            expect(data.availableScope).assertEqua(2);
            expect(data.label).assertEqual("CAMERA permission");
            expect(data.description).assertEqual("CAMERA permission in detail");
        }

        function OnReceiveEvent2(err, data) {
            expect(data.name).assertEqual("com.permission.music");
            expect(data.grantMode).assertEqual(1);
            expect(data.availableScope).assertEqual(2);
            expect(data.label).assertEqual("music permission");
            expect(data.description).assertEqual("music permission in detail");
        }

        done();
    })

})
