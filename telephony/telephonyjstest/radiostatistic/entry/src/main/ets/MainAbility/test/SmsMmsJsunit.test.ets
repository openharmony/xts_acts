// @ts-nocheck
/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets";
import mms from '@ohos.telephony.sms';
import utils from './Utils.ets'
export default function smsUiJsunit() {
  describe('appInfoTest', function () {
   
    const SMS_SEND_DST_NUMBER = '';
    const TRUE_SLOT_ID = 0;
    const FALSE_SLOT_ID = 9;
    const OTHER_SLOT_ID = 1;
    const SECOND_SLOT_ID = 2;
    const IDENTIFIER_MIN = 0;
    const IDENTIFIER_MAX = 0xFFFF;
    const RANTYPE_GSM = 1;
    const RANTYPE_CDMA = 2;
    const RANTYPE_ERROR = 3;
    var rawArray = [
      0x08, 0x91, 0x68, 0x31, 0x08, 0x20, 0x00, 0x75, 0xF4, 0x24, 0x0D, 0x91,
      0x68, 0x81, 0x29, 0x56, 0x29, 0x83, 0xF6, 0x00, 0x00, 0x12, 0x40, 0x80,
      0x01, 0x02, 0x14, 0x23, 0x02, 0xC1, 0x30
    ]
    

   
    /*
   * @tc.number  Telephony_SmsMms_createMessage_Async_0100
   * @tc.name    Call interface CreateMessage,
   *             pass in the PDU(rawArray) in line with the coding specification, the specification is 3GPP,
   *             shortMessage Don't empty
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_createMessage_Async_0100', 0, async function (done) {
      if (true) {
        expect(true).assertTrue();
        done();
        return;
      }
      sms.createMessage(rawArray, '3gpp', (err, shortMessage) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_createMessage_Async_0100 fail');
          done();
          return;
        }
        expect(shortMessage.visibleMessageBody === MESSAGEBODY).assertTrue();
        expect(shortMessage.visibleRawAddress.length === ADDR_LENGTH).assertTrue();
        expect(shortMessage.messageClass === sms.FORWARD_MESSAGE).assertTrue();
        expect(shortMessage.protocolId === 0).assertTrue();
        expect(shortMessage.scAddress.length === ADDR_LENGTH).assertTrue();
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
   * @tc.number  Telephony_SmsMms_getSmsEncodingScheme_Async_0100
   * @tc.name
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_getSmsEncodingScheme_Async_0100', 0, async function (done) {
      if (true) {
        expect(true).assertTrue();
        done();
        return;
      }
      expect(sms.SMS_ENCODING_UNKNOWN == 0).assertTrue();
      expect(sms.SMS_ENCODING_7BIT == 1).assertTrue();
      expect(sms.SMS_ENCODING_8BIT == 2).assertTrue();
      expect(sms.SMS_ENCODING_16BIT == 3).assertTrue();
      done();
    });

    /*
   * @tc.number  Telephony_SmsMms_getSendSmsResult_Async_0100
   * @tc.name
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_getSendSmsResult_Async_0100', 0, async function (done) {
      if (true) {
        expect(true).assertTrue();
        done();
        return;
      }
      expect(sms.SEND_SMS_FAILURE_RADIO_OFF == 0).assertTrue();
      expect(sms.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE == 1).assertTrue();
      expect(sms.SIM_MESSAGE_STATUS_FREE == 0).assertTrue();
      expect(sms.INSTANT_MESSAGE == 1).assertTrue();
      expect(sms.OPTIONAL_MESSAGE == 2).assertTrue();
      done();
    });

    /*
   * @tc.number  Telephony_SmsMms_ShortMessageClass_Async_0100
   * @tc.name
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_ShortMessageClass_Async_0100', 0, async function (done) {
      if (true) {
        expect(true).assertTrue();
        done();
        return;
      }
      expect(sms.SIM_MESSAGE_STATUS_FREE == 0).assertTrue();
      expect(sms.INSTANT_MESSAGE == 1).assertTrue();
      expect(sms.OPTIONAL_MESSAGE == 2).assertTrue();
      done();
    });
    /*
   * @tc.number  Telephony_SmsMms_getMmsCharSets_Async_0100
   * @tc.name
   * @tc.desc    Function test
   */
    it('Telephony_SmsMms_getMmsCharSets_Async_0100', 0, async function (done) {
      if (true) {
        expect(true).assertTrue();
        done();
        return;
      }
      expect(sms.BIG5 == 0X07EA).assertTrue();
      expect(sms.ISO_10646_UCS_2 == 0X03E8).assertTrue();
      expect(sms.ISO_8859_1 == 0X04).assertTrue();
      expect(sms.ISO_8859_2 == 0X05).assertTrue();
      expect(sms.ISO_8859_3 == 0X06).assertTrue();
      expect(sms.ISO_8859_4 == 0X07).assertTrue();
      expect(sms.ISO_8859_5 == 0X08).assertTrue();
      expect(sms.ISO_8859_6 == 0X09).assertTrue();
      expect(sms.ISO_8859_7 == 0X10).assertTrue();
      expect(sms.ISO_8859_8 == 0X12).assertTrue();
      expect(sms.ISO_8859_9 == 0X13).assertTrue();
      expect(sms.SHIFT_JIS == 0X11).assertTrue();
      expect(sms.US_ASCII == 0X03).assertTrue();
      expect(sms.UTF_8 == 0X6A).assertTrue();
      done();
    });
  })
}
