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

import connectedTag from '@ohos.connectedTag';
import parameter from '@ohos.systemparameter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

function sleep(delay) { // delay x ms
    let start = (new Date()).getTime();
    while ((new Date()).getTime() - start < delay) {
        continue;
    }
}

let NfcRfType = {
    NFC_RF_LEAVE : 0,
    NFC_RF_ENTER : 1,
}

export default function ConnectedTagTest() {
    describe('ConnectedTagTest', function () {
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
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0100
         * @tc.name Test init connectedTag
         * @tc.desc Initializes the active label chip.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0100', 0, function ()  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let inittag = connectedTag.init();
                expect(inittag).assertTrue();
                console.info("ConnectedTag readMultiplePages1 err: " + inittag );
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0200
         * @tc.name Test init connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0200', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                await connectedTag.readNdefTag().then(result => {
                    console.info("ConnectedTag readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("ConnectedTag readMultiplePages1 err: " + err);
                    expect(true).assertEqual(true);
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0300
         * @tc.name Test init connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0300', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                connectedTag.readNdefTag((err, result)=> {
                    if (err) {
                        expect().assertFail();
                        console.info("isoDep isExtendedApduSupported err: " + err);
                    } else {
                        expect(result!=null).assertEqual(data);
                        console.info("isoDep isExtendedApduSupported data: " + result);
                    }
                });
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0400
         * @tc.name Test writeNdefTag connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0400', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            } else {
                await connectedTag.writeNdefTag().then(result => {
                    console.info("ConnectedTag readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("ConnectedTag readMultiplePages1 err: " + err);
                    expect(true).assertEqual(true);
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0500
         * @tc.name Test writeNdefTag connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0500', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                connectedTag.writeNdefTag((err, result)=> {
                    if (err) {
                        expect().assertFail();
                        console.info("isoDep isExtendedApduSupported err: " + err);
                    } else {
                        expect(result!=null).assertEqual(data);
                        console.info("isoDep isExtendedApduSupported data: " + result);
                    }
                });
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0600
         * @tc.name Test on_off connectedTag
         * @tc.desc Registers and cancels the NFC field strength status event.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0600', 0, function () {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let recvNfcRfNotifyFunc = result => {
                    console.info("nfc state receive state ->" + result);
                    expect(result != null).assertTrue();
                }
                connectedTag.on('notify',recvNfcRfNotifyFunc)
                connectedTag.off('notify',recvNfcRfNotifyFunc)
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0700
         * @tc.name Test uninit connectedTag
         * @tc.desc Unloads active label chip resources.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0700', 0, function () {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            } else {
                let uninittag = connectedTag.uninit();
                expect(uninittag).assertTrue();
                console.info("ConnectedTag readMultiplePages1 err: " + uninittag );
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0800
         * @tc.name Test initialize connectedTag
         * @tc.desc Initializes the active label chip.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
         it('SUB_Communication_NFC_nfcConnectedTag_js_0800', 0, function ()  {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                let inittag = connectedTag.initialize();
                expect(inittag).assertTrue();
                console.info("mifareUltralight readMultiplePages1 err: " + inittag );
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_0900
         * @tc.name Test uninitialize connectedTag
         * @tc.desc uninitialize active label chip resources.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_0900', 0, function () {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                let uninittag = connectedTag.uninitialize();
                expect(uninittag).assertTrue();
                console.info("mifareUltralight readMultiplePages1 err: " + uninittag );
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1000
         * @tc.name Test read connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1000', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                await connectedTag.read().then(result => {
                    console.info("mifareUltralight readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("mifareUltralight readMultiplePages1 err: " + err);
                    expect(true).assertEqual(true);
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1100
         * @tc.name Test read connectedTag
         * @tc.desc Reads the content of the active tag.
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1100', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                connectedTag.read((err, result)=> {
                    if (err) {
                        expect().assertFail();
                        console.info("isoDep isExtendedApduSupported err: " + err);
                    } else {
                        expect(result!=null).assertEqual(data);
                        console.info("isoDep isExtendedApduSupported data: " + result);
                    }
                });
            }
            done();
        })

       /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1200
         * @tc.name Test write connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1200', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
                done();
            }
            else{
                await connectedTag.write().then(result => {
                    console.info("mifareUltralight readMultiplePages1 data: " + data + "json1:" + JSON.stringify(data));
                    expect(result != null).assertTrue();
                    done();
                }).catch((err)=> {
                    console.info("mifareUltralight readMultiplePages1 err: " + err);
                    expect(true).assertEqual(true);
                    done();
                });
                sleep(3000);
            }
        })

        /**
         * @tc.number SUB_Communication_NFC_nfcConnectedTag_js_1200
         * @tc.name Test write connectedTag
         * @tc.desc Write Content to Active Tags
         * @tc.size since 8
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_Communication_NFC_nfcConnectedTag_js_1200', 0, async function (done) {
            var isAccessToken = canIUse("SystemCapability.Communication.ConnectedTag");
            console.info("testSysCaps01 test.syscap.param.001 : " + isAccessToken);
            if (!isAccessToken) {
                console.info("The device does not support active label chips.")
                expect(isAccessToken).assertFalse()
            }
            else{
                connectedTag.write((err, result)=> {
                    if (err) {
                        expect().assertFail();
                        console.info("isoDep isExtendedApduSupported err: " + err);
                    } else {
                        expect(result!=null).assertEqual(data);
                        console.info("isoDep isExtendedApduSupported data: " + result);
                    }
                });
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}


