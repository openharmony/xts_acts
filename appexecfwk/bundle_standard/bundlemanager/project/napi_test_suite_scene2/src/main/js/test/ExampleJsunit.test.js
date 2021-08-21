import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import demo from '@ohos.bundle'

describe('appInfoTest', function () {

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

    it('getBundleInfos_0200', 0, async function () {
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

    it('getBundleInfos_0400', 0, async function () {
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

    it('getBundleInfos_0700', 0, async function () {
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

    it('getBundleInfos_0900', 0, async function () {
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

    it('getApplicationInfo_0200', 0, async function (done) {
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

    it('getApplicationInfo_0700', 0, async function (done) {
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

})