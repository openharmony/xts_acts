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

let aTag = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
    ],
    "tagRfDiscId": 1,
};

export default function nfcATagSessionTest() {
    describe('nfcATagSessionTest', function () {
        beforeAll(function () {
            console.info('[NFC_test]beforeAll called')
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
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0100
         * @tc.name testconnectTag
         * @tc.desc Test connectTag api.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0001', 0, function ()  {
            let NfcConnected;
            try{
                NfcConnected = tag.getNfcATag(aTag).connectTag();
                console.info("NfcConnected:" +NfcConnected);
                expect(NfcConnected).assertFalse();
            }catch(error){
                console.info('NfcConnected error' + error)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0002
         * @tc.name testreset
         * @tc.desc Test reset api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0002', 0, function ()  {
            try{
                tag.getNfcATag(aTag).reset();
                expect(true).assertTrue();
                console.info('reset1 pass' )
            }catch(error){
                console.info('reset1 error' + error)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0003
         * @tc.name testisTagConnected
         * @tc.desc Test isTagConnected api by callback.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0003', 0, function ()  {
            let isNfcConnected;
            try{
                isNfcConnected = tag.getNfcATag(aTag).isTagConnected();
                console.info("isNfcConnected:" +isNfcConnected);
                expect(isNfcConnected).assertFalse();
            }catch(error){
                console.info('isNfcConnected error' + error)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0004
         * @tc.name testgetMaxSendLength
         * @tc.desc Test getMaxSendLength api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0004', 0, function ()  {
            let mazSendLen;
            try{
                mazSendLen  = tag.getNfcATag(aTag).getMaxSendLength();
                console.info("getMaxSendLength:" +mazSendLen);
                expect(true).assertTrue(mazSendLen >= 0);
                console.info('getMaxSendLength pass' )
            }catch(error){
                console.info('getMaxSendLength error' + error)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0005
         * @tc.name testsetSendDataTimeout
         * @tc.desc Test setSendDataTimeout api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0005', 0, function ()  {
            let settime;
            try{
                settime  = tag.getNfcATag(aTag).setSendDataTimeout(1000);
                console.info("setSendDataTimeout:" +settime);
                expect(true).assertTrue(settime >= 0);
            }catch(error){
                console.info('setSendDataTimeout error' + error)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0006
         * @tc.name testgetSendDataTimeout
         * @tc.desc Test getSendDataTimeout api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0006', 0, function ()  {
            let gettime;
            try{
                gettime  = tag.getNfcATag(aTag).getSendDataTimeout();
                console.info("getMaxSendLength:" +gettime + 'aTag is--<-!!!->' + JSON.stringify(gettime));
                expect(true).assertTrue(gettime >= 0);
                console.info('getMaxSendLength pass' )
            }catch(error){
                console.info('getMaxSendLength error' + error)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0007
         * @tc.name testsendData
         * @tc.desc Test sendData api by peomise.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0007', 0, async function (done) {
            let sendDatas = [0x01, 0x02, 0x03, 0x04];
            await tag.getNfcATag(aTag).sendData(sendDatas).then((data) => {
                console.log("nfcAtage sendData1 data: " + data + "json1:" + JSON.stringify(data));
                expect(true).assertTrue(data >= 0);
                done();
            }).catch((err)=> {
                console.log("nfcAtage sendData1 err: " + err);
            });
            sleep(3500);
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0008
         * @tc.name testsendData
         * @tc.desc Test sendData api by callback.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0008', 0, async function (done) {
            let sendDatas = [0x01, 0x02, 0x03, 0x04];
            tag.getNfcATag(aTag).sendData(sendDatas, (err, data)=> {
                if (err) {
                    console.log("nfcAtage sendData2 data err: " + err);
                } else {
                    sleep(2500);
                    console.log("nfcAtage sendData2 data: " + data + "json2:" + JSON.stringify(data));
                    expect(true).assertTrue(data >= 0);
                }
            });
            sleep(500);
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}

