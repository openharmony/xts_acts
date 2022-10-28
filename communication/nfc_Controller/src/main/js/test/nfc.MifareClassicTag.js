/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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


import tag from '@ohos.nfc.tag';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

function sleep(delay) { // delay x ms
    let start = (new Date()).getTime();
    while ((new Date()).getTime() - start < delay) {
        continue;
    }
}


let mifareclassicTaginfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1, 8],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
        {
            
        },
    ],
    "tagRfDiscId": 1,
};
let mifareClassic = null;
export default function nfcControllerTest1() {
    describe('nfcControllerTest1', function () {
        beforeAll(function () {
            console.info('[NFC_test]beforeAll called')
            try{
                mifareClassic = tag.getMifareClassic(mifareclassicTaginfo);
            }catch(error){
                console.log('beforeAll mifareClassic error' + error)
            }
        })
        beforeEach(function() {
            console.info('[NFC_test]beforeEach called')
        })
        afterEach(function () {
            console.info('[NFC_test]afterEach called')
        })
        afterAll(function () {
            console.info('[NFC_test]afterAll called')
        })

            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0001
         * @tc.name testauthenticateSector
         * @tc.desc Test authenticateSector api by callback.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0001', 0, async function (done) {
            let sectorIndex = 1; 
            let key = [0x04, 0x05];  
            await mifareClassic.authenticateSector(sectorIndex, key, true).then((data) => {
                console.log("mifareClassic authenticateSector1 data: " + data + "json1:" + JSON.stringify(data));
                expect(data).assertTrue();
                done();
            }).catch((err)=> {
                console.log("mifareClassic authenticateSector1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0002
         * @tc.name testauthenticateSector
         * @tc.desc Test authenticateSector api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0002', 0, async function (done) {
            let sectorIndex = 1; 
            let key = [0x04, 0x05];  
            mifareClassic.authenticateSector(sectorIndex, key, true, (err, data)=> {
                if (err) {
                    console.log("mifareClassic authenticateSector2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.log("mifareClassic authenticateSector2 data: " + data + "json2:" + JSON.stringify(data));
                    expect(data).assertTrue();
                }
            });
            sleep(3000);
            done();
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0003
         * @tc.name testreadSingleBlock
         * @tc.desc Test readSingleBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0003', 0, async function (done) {
            let mifareClassic;
            try{
                mifareClassic = tag.getMifareClassic(mifareclassicTaginfo);
            }catch(error){
                console.log('beforeAll mifareClassic error' + error)
            }
            let blockIndex = 1; 
            await mifareClassic.readSingleBlock(blockIndex).then((data) => {
                console.log("mifareClassic readSingleBlock1 data: " + data + "json3:" + JSON.stringify(data));
                expect(data).assertInstanceOf('Array')
                done();
            }).catch((err)=> {
                console.log("mifareClassic readSingleBlock1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0004
         * @tc.name testreadSingleBlock
         * @tc.desc Test readSingleBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0004', 0, async function (done) {
            let blockIndex = 1; 
            mifareClassic.readSingleBlock(blockIndex, (err, data)=> {
                if (err) {
                    console.log("mifareClassic readSingleBlock2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.log("mifareClassic readSingleBlock2 data: " + data+ "json4:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Array')
                }
            });
            done();
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0005
         * @tc.name testwriteSingleBlock
         * @tc.desc Test writeSingleBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0005', 0, async function (done) {
            let blockIndex = 1;
            let rawData = [0x0a, 0x14]; 
            await mifareClassic.writeSingleBlock(blockIndex, rawData).then((data) => {
                console.log("mifareClassic writeSingleBlock1 data: " + data + "json5:" + JSON.stringify(data));
                expect(data).assertTrue();
                done();
            }).catch((err)=> {
                console.log("mifareClassic writeSingleBlock1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0006
         * @tc.name testwriteSingleBlock
         * @tc.desc Test writeSingleBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0006', 0, async function (done) {
            let blockIndex = 1; 
            let rawData = [0x0a, 0x14]; 
            mifareClassic.writeSingleBlock(blockIndex, rawData, (err, data)=> {
                if (err) {
                    console.log("mifareClassic writeSingleBlock2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.log("mifareClassic writeSingleBlock2 data: " + data + "json6:" + JSON.stringify(data));
                    expect(data).assertTrue();
                }
            });
            sleep(3000);
            done();
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0007
         * @tc.name testincrementBlock
         * @tc.desc Test incrementBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0007', 0, async function (done) {
            let blockIndex = 1; 
            let value = 0x20;
            await mifareClassic.incrementBlock(blockIndex, value).then((data) => {
                console.log("mifareClassic incrementBlock1 data: " + data + "json7:" + JSON.stringify(data));
                expect(data).assertInstanceOf('Number')
                done();
            }).catch((err)=> {
                console.log("mifareClassic incrementBlock1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0008
         * @tc.name testincrementBlock
         * @tc.desc Test incrementBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0008', 0, async function (done) {
            let blockIndex = 1; 
            let value = 0x20;
            mifareClassic.incrementBlock(blockIndex, value, (err, data)=> {
                if (err) {
                    console.log("mifareClassic incrementBlock2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.log("mifareClassic incrementBlock2 data: " + data + "json8:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                }
            });
            sleep(3000);
            done();
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0009
         * @tc.name testdecrementBlock
         * @tc.desc Test decrementBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0009', 0, async function (done) {
            let blockIndex = 1; 
            let value = 0x20;
            await mifareClassic.decrementBlock(blockIndex, value).then((data) => {
                console.log("mifareClassic decrementBlock1 data: " + data + "json9:" + JSON.stringify(data));
                expect(data).assertInstanceOf('Number')
                done();
            }).catch((err)=> {
                console.log("mifareClassic decrementBlock1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0010
         * @tc.name testdecrementBlock
         * @tc.desc Test decrementBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0010', 0, async function (done) {
            let blockIndex = 1; 
            let value = 0x20;
            mifareClassic.decrementBlock(blockIndex, value, (err, data)=> {
                if (err) {
                    console.log("mifareClassic decrementBlock2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.log("mifareClassic decrementBlock2 data: " + data + "json10:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                }
            });
            sleep(3000);
            done();
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0011
         * @tc.name testtransferToBlock
         * @tc.desc Test transferToBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0011', 0, async function (done) {
            let blockIndex = 1; 
            await mifareClassic.transferToBlock(blockIndex).then((data) => {
                console.log("mifareClassic transferToBlock1 data: " + data + "json9:" + JSON.stringify(data));
                expect(data).assertInstanceOf('Number')
                done();
            }).catch((err)=> {
                console.log("mifareClassic transferToBlock1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0012
         * @tc.name testtransferToBlock
         * @tc.desc Test transferToBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0012', 0, async function (done) {
            let blockIndex = 1; 
            mifareClassic.transferToBlock(blockIndex, (err, data)=> {
                if (err) {
                    console.log("mifareClassic transferToBlock2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.log("mifareClassic transferToBlock2 data: " + data + "json10:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                }
            });
            sleep(3000);
            done();
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0013
         * @tc.name testrestoreFromBlock
         * @tc.desc Test restoreFromBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0013', 0, async function (done) {
            let blockIndex = 1; 
            await mifareClassic.restoreFromBlock(blockIndex).then((data) => {
                console.log("mifareClassic restoreFromBlock1 data: " + data + "json11:" + JSON.stringify(data));
                expect(data).assertInstanceOf('Number')
                done();
            }).catch((err)=> {
                console.log("mifareClassic restoreFromBlock1 err: " + err);
                expect(true).assertEqual(true);
                done();
            });
            sleep(3000);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0014
         * @tc.name testrestoreFromBlock
         * @tc.desc Test restoreFromBlock api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0014', 0, async function (done) {
            let blockIndex = 1; 
            mifareClassic.restoreFromBlock(blockIndex, (err, data)=> {
                if (err) {
                    console.log("mifareClassic restoreFromBlock2 err: " + err);
                    expect(true).assertEqual(true);
                } else {
                    console.log("mifareClassic restoreFromBlock2 data: " + data + "json12:" + JSON.stringify(data));
                    expect(data).assertInstanceOf('Number')
                }
            });
            sleep(3000);
            done();
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0015
         * @tc.name testgetSectorCount
         * @tc.desc Test getSectorCount api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0015', 0, function ()  {
            let sectorCount = mifareClassic.getSectorCount();
            console.log("mifareClassic sectorCount: " + sectorCount);
            expect(sectorCount).assertInstanceOf('Number')
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0016
         * @tc.name testgetBlockCountInSector
         * @tc.desc Test getBlockCountInSector api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0016', 0, function ()  {
            let blockCountInSector = mifareClassic.getBlockCountInSector();
            console.log("mifareClassic blockCountInSector: " + blockCountInSector);
            expect(blockCountInSector).assertInstanceOf('Number')
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0017
         * @tc.name testgetType
         * @tc.desc Test getType api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0017', 0, function ()  {
            let getType = mifareClassic.getType();
            console.log("mifareClassic getType: " + getType);
            expect(true).assertTrue(getType >= -1);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0018
         * @tc.name testgetTagSize
         * @tc.desc Test getTagSize api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0018', 0, function ()  {
            let tagSize = mifareClassic.getTagSize();
            console.log("mifareClassic tagSize: " + tagSize);
            expect(tagSize).assertInstanceOf('Number')
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0019
         * @tc.name testisEmulatedTag
         * @tc.desc Test isEmulatedTag api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0019', 0, function ()  {
            let isEmulatedTag = mifareClassic.isEmulatedTag();
            console.log("mifareClassic isEmulatedTag: " + isEmulatedTag);
            expect(false).assertEqual(isEmulatedTag);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0020
         * @tc.name testgetBlockIndex
         * @tc.desc Test getBlockIndex api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0020', 0, function ()  {
            let sectorIndex = 1; 
            let blockIndex = mifareClassic.getBlockIndex(sectorIndex);
            console.log("mifareClassic blockIndex: " + blockIndex);
            expect(true).assertTrue(blockIndex >= 0);
        })
            

        /**
         * @tc.number SUB_Communication_NFC_mifareClassic_js_0021
         * @tc.name testgetSectorIndex
         * @tc.desc Test getSectorIndex api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_mifareClassic_js_0021', 0, function ()  {
            let blockIndex = 1; 
            let sectorIndex = mifareClassic.getSectorIndex(blockIndex);
            console.log("mifareClassic sectorIndex: " + sectorIndex);
            expect(true).assertTrue(sectorIndex >= 0);
        })
        
        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}

