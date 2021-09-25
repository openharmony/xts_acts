/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import sms from '@ohos.telephony_sms';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect
} from 'deccjsunit/index';

describe('SmsMmsCreateTest', function () {
  var rawArrayNull = [];

  var rawArray = [
    0x08, 0x91, 0x68, 0x31, 0x08, 0x20, 0x00, 0x75, 0xF4, 0x24, 0x0D, 0x91, 0x68,
    0x81, 0x29, 0x56, 0x29, 0x83, 0xF6, 0x00, 0x00, 0x12, 0x40, 0x80, 0x01, 0x02, 0x14, 0x23, 0x02, 0xC1, 0x30
  ];
  // rawArray PDU data
  const SC_TIMESTAMP = 1617848441;
  var MESSAGEBODY = 'Aa';
  var RAWADDRESS = '+8618926592386';
  var SC_ADDRESS = '+8613800200574';

  var pduArray = [
    0x00, 0x24, 0x0D, 0x91, 0x68, 0x91, 0x41, 0x46, 0x84,
    0x96, 0xF6, 0x00, 0x00, 0x12, 0x70, 0x72, 0x11, 0x42, 0x43, 0x23, 0x02, 0xB3, 0x19
  ];
  // pduArray PDU data
  var PDU_MESSAGEBODY = '33';
  var PDU_RAWADDRESS = '+8619146448696';
  const PDU_SC_TIMESTAMP = 1627356274;

  var pduCDMA = [0x00,0x00,0x02,0x10,0x02,0x02,0x07,0x02,0xC6,0x04,0x90,0x64,0xC4,
    0xD4,0x06,0x01,0xFC,0x08,0x1B,0x00,0x03,0x10,0x00,0x20,0x01,0x06,0x10,0x2E,0x8C,0xBB,
    0x36,0x6F,0x03,0x06,0x14,0x09,0x01,0x11,0x26,0x31,0x0A,0x01,0x40,0x0D,0x01,0x01];
  var body = 'hello';
  var rawAddr = '18124193135';
  var scTime = 1409570791;


  var OtherPduCDMA = [0x00,0x00,0x02,0x10,0x02,0x02,0x07,0x02,0xC5,0x4E,0xA4,0x88,
    0x64,0x9C,0x06,0x01,0xFC,0x08,0x12,0x00,0x03,0x10,0x1B,0xB0,0x01,0x03,0x10,0x0C,0x10,
    0x03,0x06,0x11,0x08,0x04,0x18,0x22,0x57];
  var OtherBody = 'A';
  var OtherRawAddr = '153*9221927';
  var OtherScTime = 1312482177;

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Async_0100
   * @tc.name    Call interface CreateMessage,
   *             pass in the PDU(rawArray) in line with the coding specification, the specification is 3GPP,
   *             shortMessage Don't empty
   * @tc.desc    Function test
   */
  it('Telephony_SmsMms_createMessage_Async_0100', 0, async function (done) {
    sms.createMessage(rawArray, '3gpp', (err, shortMessage) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_createMessage_Async_0100 fail');
        done();
        return;
      }
      expect(shortMessage.visibleMessageBody === MESSAGEBODY).assertTrue();
      expect(shortMessage.visibleRawAddress === RAWADDRESS).assertTrue();
      expect(shortMessage.messageClass === sms.FORWARD_MESSAGE).assertTrue();
      expect(shortMessage.protocolId === 0).assertTrue();
      expect(shortMessage.scAddress === SC_ADDRESS).assertTrue();
      expect(shortMessage.scTimestamp === SC_TIMESTAMP).assertTrue();
      expect(shortMessage.isReplaceMessage).assertFalse();
      expect(shortMessage.hasReplyPath).assertFalse();
      expect(shortMessage.pdu.length > 0).assertTrue();
      expect(shortMessage.status === 0).assertTrue();
      expect(shortMessage.isSmsStatusReportMessage).assertTrue();
      console.log('Telephony_SmsMms_createMessage_Async_0100 finish');
      done();
    });
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Async_0200
   * @tc.name    Call interface CreateMessage,
   *             The incoming PDU is empty, the specification is 3GPP,
   *             shortMessage isn't empty
   * @tc.desc    Function test
   */
  it('Telephony_SmsMms_createMessage_Async_0200', 0, async function (done) {
    sms.createMessage(rawArrayNull, '3gpp', (err, shortMessage) => {
      if (err) {
        console.log('Telephony_SmsMms_createMessage_Async_0200 finish');
        done();
        return;
      }
      expect().assertFail();
      console.log('Telephony_SmsMms_createMessage_Async_0200 fail');
      done();
    });
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Async_0500
   * @tc.name    Call interface CreateMessage,
   *             pass in the PDU(pduArray) in line with the coding specification, the specification is 3GPP,
   *             shortMessage Don't empty
   * @tc.desc    Function test
   */
  it('Telephony_SmsMms_createMessage_Async_0500', 0, async function (done) {
    sms.createMessage(pduArray, '3gpp', (err, shortMessage) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_createMessage_Async_0700 fail');
        done();
        return;
      }
      expect(shortMessage.visibleMessageBody === PDU_MESSAGEBODY).assertTrue();
      expect(shortMessage.visibleRawAddress === PDU_RAWADDRESS).assertTrue();
      expect(shortMessage.messageClass === sms.FORWARD_MESSAGE).assertTrue();
      expect(shortMessage.protocolId === 0).assertTrue();
      expect(shortMessage.scAddress.length === 0).assertTrue();
      expect(shortMessage.scTimestamp === PDU_SC_TIMESTAMP).assertTrue();
      expect(shortMessage.isReplaceMessage).assertFalse();
      expect(shortMessage.hasReplyPath).assertFalse();
      expect(shortMessage.pdu.length > 0).assertTrue();
      expect(shortMessage.status === 0).assertTrue();
      expect(shortMessage.isSmsStatusReportMessage).assertTrue();
      console.log('Telephony_SmsMms_createMessage_Async_0500 finish');
      done();
    });
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Promise_0100
   * @tc.name    Call interface CreateMessage,
   *             pass in the PDU(rawArray) in line with the coding specification, the specification is 3GPP,
   *             promise returns the result Don't empty
   * @tc.desc    Function test
   */
  it('Telephony_SmsMms_createMessage_Promise_0100', 0, async function (done) {
    try {
      var promise = await sms.createMessage(rawArray, '3gpp');
      expect(promise.visibleMessageBody === MESSAGEBODY).assertTrue();
      expect(promise.visibleRawAddress === RAWADDRESS).assertTrue();
      expect(promise.messageClass === sms.FORWARD_MESSAGE).assertTrue();
      expect(promise.protocolId === 0).assertTrue();
      expect(promise.scAddress === SC_ADDRESS).assertTrue();
      expect(promise.scTimestamp === SC_TIMESTAMP).assertTrue();
      expect(promise.isReplaceMessage).assertFalse();
      expect(promise.hasReplyPath).assertFalse();
      expect(promise.pdu.length > 0).assertTrue();
      expect(promise.status === 0).assertTrue();
      expect(promise.isSmsStatusReportMessage).assertTrue();
      console.log('Telephony_SmsMms_createMessage_Promise_0100 finish');
      done();
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_createMessage_Promise_0100 fail');
      done();
    }
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Promise_0200
   * @tc.name    Call interface CreateMessage,
   *             The incoming PDU is empty, the specification is 3GPP,
   *             promise returns the result Don't empty
   * @tc.desc    Function test
   */
  it('Telephony_SmsMms_createMessage_Promise_0200', 0, async function (done) {
    try {
      await sms.createMessage(rawArrayNull, '3gpp');
      expect().assertFail();
      console.log('Telephony_SmsMms_createMessage_Promise_0200 fail');
      done();
    } catch (err) {
      console.log('Telephony_SmsMms_createMessage_Promise_0200 finish');
      done();
    }
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Promise_0500
   * @tc.name    Call interface CreateMessage,
   *             pass in the PDU(pduArray) in line with the coding specification, the specification is 3GPP,
   *             promise returns the result Don't empty
   * @tc.desc    Function test
   */
  it('Telephony_SmsMms_createMessage_Promise_0500', 0, async function (done) {
    try {
      var promise = await sms.createMessage(pduArray, '3gpp');
      expect(promise.visibleMessageBody === PDU_MESSAGEBODY).assertTrue();
      expect(promise.visibleRawAddress === PDU_RAWADDRESS).assertTrue();
      expect(promise.messageClass === sms.FORWARD_MESSAGE).assertTrue();
      expect(promise.protocolId === 0).assertTrue();
      expect(promise.scAddress.length === 0).assertTrue();
      expect(promise.scTimestamp === PDU_SC_TIMESTAMP).assertTrue();
      expect(promise.isReplaceMessage).assertFalse();
      expect(promise.hasReplyPath).assertFalse();
      expect(promise.pdu.length > 0).assertTrue();
      expect(promise.status === 0).assertTrue();
      expect(promise.isSmsStatusReportMessage).assertTrue();
      console.log('Telephony_SmsMms_createMessage_Promise_0500 finish');
      done();
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_createMessage_Promise_0500 fail');
      done();
    }
  });
});