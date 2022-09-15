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

export default function pasteBoardSupportBinaryDataTest(){
    describe('pasteBoardSupportBinaryDataTest', function() {
        console.info('start################################start');
        
        /**
         * @tc.number    SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0100
         * @tc.name      Create pasteData use binary parameter
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0100', 0, async function (done) {
            console.info("SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0100 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                console.info("systemPasteBoard clear data success")
                var dataUri = new ArrayBuffer(256)
                pasteData = pasteboard.createData("text/uri",dataUri)
                var addUri = new ArrayBuffer(128)
                pasteData.addRecord("text/uri", addUri)
                var recordUri = new ArrayBuffer(96)
                var pasteDataRecord = pasteboard.createRecord("text/uri", recordUri)
                pasteData.addRecord(pasteDataRecord)
                await systemPasteBoard.setPasteData(pasteData).then(async () => {
                    console.info("Set pastedata success")
                    await systemPasteBoard.hasPasteData().then(async (data) => {
                        console.info("Check pastedata has data success, result: " + data)
                        expect(data).assertTrue();
                        await systemPasteBoard.getPasteData().then(async (data) => {
                            console.info("Get paste data success")
                            expect(data.getRecordCount()).assertEqual(3)
                        })
                    })
                })
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0200
         * @tc.name      Create pasteData use binary parameter
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0200', 0, async function (done) {
            console.info("SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0200 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                var pasteData = undefined;
                console.info("systemPasteBoard clear data success")
                var dataHtml = new ArrayBuffer(256)
                pasteData = pasteboard.createData("text/html",dataHtml)
                var addHtml = new ArrayBuffer(128)
                pasteData.addRecord("text/html", addHtml)
                var recordHtml = new ArrayBuffer(64)
                var pasteDataRecord = pasteboard.createRecord("text/html", recordHtml)
                pasteData.addRecord(pasteDataRecord)
                await systemPasteBoard.setPasteData(pasteData).then(async () => {
                    console.info("set pastedata success")
                    await systemPasteBoard.hasPasteData().then(async (data) => {
                        console.info("Check pastedata has data success, result: " + data)
                        expect(data).assertTrue();
                        await systemPasteBoard.getPasteData().then(async (data) => {
                            console.info("get paste data success")
                            expect(data.getRecordCount()).assertEqual(3)
                        })
                    })
                })
            })
            done();
        })

        /**
         * @tc.number    SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0300
         * @tc.name      Create pasteData use binary parameter
         * @tc.desc      Test pasteBoard API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
         it('SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0300', 0, async function (done) {
            console.info("SUB_PASTEBOARD_BINARY_FUNCTION_ETS_TEST_0300 start")
            var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                console.info("systemPasteBoard clear data success")
                var pasteData = undefined
                var pasteRecord = undefined;


                var dataHtml = new ArrayBuffer(256)
                pasteData = pasteboard.createData("x".repeat(1025),dataHtml)
                expect(pasteData).assertEqual(undefined)
                pasteData = pasteboard.createData("x".repeat(1024),dataHtml)
                expect(pasteData != undefined).assertTrue();
                
                var addHtml = new ArrayBuffer(128)
                pasteData.addRecord("x".repeat(1025),dataHtml)
                expect(pasteData.getRecordCount()).assertEqual(1)
                pasteData.addRecord("x".repeat(1024),dataHtml)
                expect(pasteData.getRecordCount()).assertEqual(2)

                var recordHtml = new ArrayBuffer(64)
                pasteRecord = pasteboard.createRecord("x".repeat(1025),dataHtml)
                expect(pasteRecord).assertEqual(undefined);
                pasteRecord = pasteboard.createRecord("x".repeat(1024),dataHtml)
                expect(pasteRecord != undefined).assertTrue();;
                
                pasteData.addRecord(pasteRecord)
                await systemPasteBoard.setPasteData(pasteData).then(async () => {
                    console.info("set pastedata success")
                    await systemPasteBoard.hasPasteData().then(async (data) => {
                        console.info("Check pastedata has data success, result: " + data)
                        expect(data).assertTrue();
                        await systemPasteBoard.getPasteData().then(async (data) => {
                            console.info("get paste data success")
                            expect(data.getRecordCount()).assertEqual(3)
                        })
                    })
                })
            })
            done();
        })
        console.info('end################################end');
    });
}
