/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import pasteboard from '@ohos.pasteboard'
import image from '@ohos.multimedia.image';

const color = new ArrayBuffer(96);
let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
export default function pasteBoardTest(){
    describe('pasteBoardEtsTest', function() {
        console.info('start################################start');

         /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0100 
         * @tc.name      Create pixelMap data
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0100 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                var pixelMap = undefined;
                console.info("systemPasteBoard clear data success")
                await image.createPixelMap(color,opts).then(async (PixelMap) => {
                    console.info("Create pixelMap success")
                    pixelMap = PixelMap
                })
                pasteData = pasteboard.createPixelMapData(pixelMap)
                console.info("Create pixelMap data success")
                var hasType = pasteData.hasMimeType(pasteboard.MIMETYPE_PIXELMAP);
                expect(hasType).assertTrue();
                await systemPasteBoard.setPasteData(pasteData).then(async () => {
                    console.info("set pastedata success")
                    await systemPasteBoard.hasPasteData().then(async (data) => {
                        console.info("Check pastedata has data success, result: " + data)
                        expect(data).assertTrue();
                        await systemPasteBoard.getPasteData().then(async (data) => {
                            console.info("get paste data success")
                            expect(data.getRecordCount()).assertEqual(1)
                            let pixelMap1 = data.getRecordAt(0).pixelMap
                            let pixelMap2 = data.getPrimaryPixelMap()
                            if(pixelMap1 != null){
                                expect(0).assertEqual(0)
                            }else{
                                expect(1).assertEqual(0)
                            }
                            if(pixelMap2 != null){
                                expect(0).assertEqual(0)
                            }else{
                                expect(1).assertEqual(0)
                            }
                        })
                    })
                })
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0200
         * @tc.name      Create pixelMap
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0200 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                var pixelMap = undefined;
                await image.createPixelMap(color,opts).then(async (PixelMap) => {
                    pixelMap = PixelMap
                })
                pasteData = pasteboard.createUriData("https://www.baidu.com/")
                let pixelMapRecord = pasteboard.createPixelMapRecord(pixelMap)
                pasteData.addRecord(pixelMapRecord)
                await systemPasteBoard.setPasteData(pasteData).then(async () => {
                    await systemPasteBoard.hasPasteData().then(async (data) => {
                        expect(data).assertTrue();
                        await systemPasteBoard.getPasteData().then((data) => {
                            expect(data.getRecordCount()).assertEqual(2)
                            // expect(data.getRecordAt(1).pixelMap).assertNotNull();
                            if(data.getRecordAt(1).pixelMap != null){
                                expect(0).assertEqual(1)
                            }else{
                                expect(0).assertEqual(0)
                            }
                        })
                    })
                })
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300
         * @tc.name      Adds PixelMapRecord
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start1")
            await systemPasteBoard.clear().then(async () => {
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start2")
                var pasteData = undefined;
                var pixelMap = undefined;
                await image.createPixelMap(color,opts).then(async (PixelMap) => {
                    pixelMap = PixelMap
                })
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start4")
                pasteData = pasteboard.createUriData("https://www.baidu.com/")
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start5")
                pasteData.addPixelMapRecord(pixelMap)
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start6")
                await systemPasteBoard.setPasteData(pasteData).then(async () => {
                    console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start7")
                    await systemPasteBoard.hasPasteData().then(async (data) => {
                        console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start8")
                        expect(data).assertTrue();
                        await systemPasteBoard.getPasteData().then((data) => {
                            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0300 start9")
                            expect(data.getRecordCount()).assertEqual(2)
                        })
                    })
                })
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0400
         * @tc.name      Adds one record(s)
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0400', 0, async function (done) {
            var uri = "https://www.baidu.com/"
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0400 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                pasteData = pasteboard.createUriData(uri)
                await systemPasteBoard.setPasteData(pasteData).then(async () => {
                    await systemPasteBoard.hasPasteData().then(async (data) => {
                        expect(data).assertTrue();
                        await systemPasteBoard.getPasteData().then((data) => {
                            expect(uri).assertEqual(data.getRecordAt(0).uri)
                            expect('text/uri').assertEqual(data.getRecordAt(0).mimeType)
                            console.info(data.getRecordAt(0).mimeType)
                            console.info(data.getProperty().mimeTypes[0]);
                            expect("text/uri").assertEqual(data.getProperty().mimeTypes[0]);
                        })
                    })
                })
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0500
         * @tc.name      Create PixelMap data with string type parameters;
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0500', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0500 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = null;
                var pixelMap = "pixelMap";
                try{
                    pasteData = pasteboard.createPixelMapData(pixelMap)
                }catch(err){
                    console.info("Create pixleMap data fail " + err)
                }
                expect(pasteData == null).assertTrue();
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0600
         * @tc.name      Create PixelMap data with parameter is null;
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0600', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0600 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                var pixelMap = null;
                try{
                    pasteData = pasteboard.createPixelMapData(pixelMap)
                }catch(err){
                    console.info("Create pixleMap data fail " + err)
                }
                expect(pasteData == null).assertTrue();
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0700
         * @tc.name      Create PixelMap record with string type parameters; 
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0700', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0700 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pixelMapRecord = undefined;
                var pixelMap = "pixelMap";
                try{
                    pixelMapRecord = pasteboard.createPixelMapRecord(pixelMap)
                }catch(err){
                    console.info("Create pixleMap data fail " + err)
                }
                expect(pixelMapRecord == null).assertTrue();
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0800
         * @tc.name      Create PixelMap record with parameter is null;
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0800', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0800 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pixelMapRecord = undefined;
                var pixelMap = null;
                try{
                    pixelMapRecord = pasteboard.createPixelMapRecord(pixelMap)
                }catch(err){
                    console.info("Create pixleMap data fail " + err)
                }
                expect(pixelMapRecord == null).assertTrue();
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_0900
         * @tc.name      Add a PixelMap record to pasteData with string type parameters;
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_0900', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_0900 start")
            var uri = "https://www.baidu.com/"
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                var pixelMap = "pixelMap";
                pasteData = pasteboard.createUriData(uri)
                try{
                    pasteData.addPixelMapRecord(pixelMap)
                }catch(err){
                    console.info("Create pixleMap data fail " + err)
                }
                let ret = pasteData.getRecordCount();
                expect(ret).assertEqual(1);
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1000
         * @tc.name      Add a PixelMap record to pasteData with parameter is null;
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
         it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1000', 0, async function (done) {
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1000 start")
            var uri = "https://www.baidu.com/"
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                var pixelMap = null;
                pasteData = pasteboard.createUriData(uri)
                try{
                    pasteData.addPixelMapRecord(pixelMap)
                }catch(err){
                    console.info("Create pixleMap data fail " + err)
                }
                let ret = pasteData.getRecordCount();
                expect(ret).assertEqual(1);
            })
            done();
        })
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100
         * @tc.name      Set pasteData Property's sharOption for  InApp
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100', 0, async function (done) {
            var pasteData = pasteboard.createHtmlData('application/xml');
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
                prop.shareOption = pasteboard.ShareOption.InApp;
                pasteData.setProperty(prop);
                var property = pasteData.getProperty();
                expect(0).assertEqual(property.shareOption)
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100 end")
            })
            done();
        })
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200
         * @tc.name      Set pasteData Property's sharOption for LocalDevice
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200', 0, async function (done) {
            var pasteData = pasteboard.createPlainTextData("hello");
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
                prop.shareOption = pasteboard.ShareOption.LocalDevice;
                pasteData.setProperty(prop);
                var property = pasteData.getProperty();
                expect(1).assertEqual(property.shareOption)
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200 end")
            })
            done();
        })
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300
         * @tc.name      Set pasteData Property's sharOption for CrossDevice
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300', 0, async function (done) {
            var pasteData = pasteboard.createPlainTextData("hello");
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
                prop.shareOption = pasteboard.ShareOption.CrossDevice;
                pasteData.setProperty(prop);
                var property = pasteData.getProperty();
                expect(2).assertEqual(property.shareOption)
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300 end")
            })
            done();
        })
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400
         * @tc.name      Set pasteData Property's sharOption for default
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400', 0, async function (done) {
            var pasteData = pasteboard.createPlainTextData("hello");
            console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
                pasteData.setProperty(prop);
                var property = pasteData.getProperty();
                expect(2).assertEqual(property.shareOption)
                console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400 end")
            })
            done();
        })
    });
}
