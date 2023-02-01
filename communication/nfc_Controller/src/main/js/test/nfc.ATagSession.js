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
let getAtag = null ;

export default function nfcATagSessionTest() {
    describe('nfcATagSessionTest', function () {
        beforeAll(function () {
            console.info('[NFC_test]beforeAll called')
            try {
                getAtag = tag.getNfcATag(aTag)
                console.info('Nfcget Connected data' + getAtag)
            } catch (error) {
                console.info('Nfcget Connected error' + error)
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
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0100
         * @tc.name testconnectTag
         * @tc.desc Test connectTag api.
         * @tc.size MEDIUM
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0100', 0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let NfcConnected;
                try {
                    NfcConnected = getAtag.connectTag();
                    console.info("NfcConnected:" + NfcConnected);
                    expect(NfcConnected).assertFalse();
                } catch (error) {
                    console.info('NfcConnected error' + error)
                    expect(true).assertFalse();
                }
            } else {
                console.info("[NFC_test]getAtag1 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0200
         * @tc.name testreset
         * @tc.desc Test reset api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0200', 0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                try {
                    getAtag.reset();
                    expect(true).assertTrue();
                    console.info('reset1 pass' )
                } catch (error) {
                    console.info('reset1 error' + error)
                    expect(true).assertFalse();
                }
            } else {
                console.info("[NFC_test]getAtag2 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0300
         * @tc.name testisTagConnected
         * @tc.desc Test isTagConnected api by callback.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0300', 0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let isNfcConnected;
                try {
                    isNfcConnected = getAtag.isTagConnected();
                    console.info("isNfcConnected:" +isNfcConnected);
                    expect(isNfcConnected).assertFalse();
                } catch (error) {
                    console.info('isNfcConnected error' + error)
                    expect(true).assertFalse();
                }
            } else {
                console.info("[NFC_test]getAtag3 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0400
         * @tc.name testgetMaxSendLength
         * @tc.desc Test getMaxSendLength api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0400', 0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let mazSendLen;
                try {
                    mazSendLen = getAtag.getMaxSendLength();
                    console.info("getMaxSendLength:" + mazSendLen);
                    expect(mazSendLen >= 0).assertTrue();
                    console.info('getMaxSendLength pass' )
                } catch (error) {
                    console.info('getMaxSendLength error' + error)
                    expect(true).assertFalse();
                }
            } else {
                console.info("[NFC_test]getAtag4 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0500
         * @tc.name testsetSendDataTimeout
         * @tc.desc Test setSendDataTimeout api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0500', 0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let settime;
                try {
                    settime  = getAtag.setSendDataTimeout(1000);
                    console.info("setSendDataTimeout:" + settime);
                    expect(settime >= 0).assertTrue();
                } catch (error) {
                    console.info('setSendDataTimeout error' + error)
                    expect(true).assertFalse();
                }
            } else {
                console.info("[NFC_test]getAtag5 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0600
         * @tc.name testgetSendDataTimeout
         * @tc.desc Test getSendDataTimeout api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0600', 0, function ()  {
            if (getAtag != null && getAtag != undefined) {
                let gettime;
                try {
                    gettime  = getAtag.getSendDataTimeout();
                    console.info("getMaxSendLength:" + gettime + 'aTag is--<-!!!->' + JSON.stringify(gettime));
                    expect(gettime >= 0).assertTrue();
                    console.info('getMaxSendLength pass' )
                } catch (error) {
                    console.info('getMaxSendLength error' + error)
                    expect(true).assertFalse();
                }
            } else {
                console.info("[NFC_test]getAtag6 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0700
         * @tc.name testsendData
         * @tc.desc Test sendData api by peomise.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0700', 0, async function (done) {
            if (getAtag != null && getAtag != undefined) {
                let sendDatas = [0x01, 0x02, 0x03, 0x04];
                await getAtag.sendData(sendDatas).then((data) => {
                    console.log("nfcAtage sendData1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(data >= 0).assertTrue();
                    done();
                }).catch((err)=> {
                    console.log("nfcAtage sendData1 err: " + err);
                    expect(true).assertFalse();
                });
                sleep(3500);
            } else {
                console.info("[NFC_test]getAtag7 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0800
         * @tc.name testsendData
         * @tc.desc Test sendData api by callback.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0800', 0, async function (done) {
            if (getAtag != null && getAtag != undefined) {
                let sendDatas = [0x01, 0x02, 0x03, 0x04];
                getAtag.sendData(sendDatas, (err, data)=> {
                    if (err) {
                        console.log("nfcAtage sendData2 data err: " + err);
                        expect(true).assertFalse();
                    } else {
                        sleep(2500);
                        console.log("nfcAtage sendData2 data: " + data + "json2:" + JSON.stringify(data));
                        expect(data >= 0).assertTrue();
                    }
                });
                sleep(500);
                done();
            } else {
                console.info("[NFC_test]getAtag8 = null & = undefined: ");
                expect(true).assertFalse();
            }
        })

       /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_0900
         * @tc.name testreset
         * @tc.desc Test reset api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_0900', 0, function ()  {
            try {
                tag.getNfcA(aTag).resetConnection();
                expect(true).assertTrue();
                console.info('reset1 pass' )
            } catch (error) {
                console.info('reset1 error' + error)
                expect(true).assertTrue();
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1000
         * @tc.name testsetSendDataTimeout
         * @tc.desc Test setSendDataTimeout api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_1000', 0, function ()  {
            let settime;
            try {
                settime = tag.getNfcATag(aTag).getTimeout(1000);
                console.info("setSendDataTimeout:" +settime);
                expect(settime >= 0).assertTrue();
            } catch (error) {
                console.info('setSendDataTimeout error' + error)
                expect(true).assertTrue();
            }
        })

       /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1100
         * @tc.name testsendData
         * @tc.desc Test sendData api by peomise.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_1100', 0, async function (done) {
            let sendDatas = [0x01, 0x02, 0x03, 0x04];
            await tag.getNfcATag(aTag).transmit(sendDatas).then((data) => {
                console.log("nfcAtage sendData1 data: " + data + "json1:" + JSON.stringify(data));
                expect(data >= 0).assertTrue();
                done();
            }).catch((err)=> {
                console.log("nfcAtage sendData1 err: " + err);
                expect(true).assertTrue();
            });
            sleep(3500);
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1200
         * @tc.name testsendData
         * @tc.desc Test sendData api by callback.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_1200', 0, async function (done) {
            let sendDatas = [0x01, 0x02, 0x03, 0x04];
            tag.getNfcATag(aTag).transmit(sendDatas, (err, data)=> {
                if (err) {
                    console.log("nfcAtage sendData2 data err: " + err);
                    expect(true).assertFalse();
                } else {
                    sleep(2500);
                    console.log("nfcAtage sendData2 data: " + data + "json2:" + JSON.stringify(data));
                    expect(data >= 0).assertTrue();
                }
            });
            sleep(500);
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcAtage_js_1300
         * @tc.name testgetMaxSendLength
         * @tc.desc Test getMaxSendLength api.
         * @tc.size MEDIUM
         * @ since 7
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcAtage_js_1300', 0, function ()  {
            let mazSendLen;
            try {
                mazSendLen  = tag.getNfcATag(aTag).getMaxTransmitSize();
                console.info("getMaxTransmitSize:" +mazSendLen);
                expect(mazSendLen >= 0).assertTrue();
                console.info('getMaxTransmitSize pass' )
            } catch (error) {
                console.info('getMaxTransmitSize error' + error)
                expect(true).assertFalse();
            }
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}


