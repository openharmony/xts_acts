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
import sms from '@ohos.telephony.sms';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect
} from 'deccjsunit/index';

describe('SmsMmsErrorTest', function () {
  const FALSE_SLOT_ID = 9;
  const CORRECT_SMS_PDU = '01000F9168683106019196F400080A00680065006C006C006F';
  const eorroMessagePath = '/data/telephony/deSrc/EorroMessagePath.mms';
  const IDENTIFIER_MIN = 0;
  const IDENTIFIER_MAX = 0xFFFF;
  const RANTYPE_GSM = 1;
  var rawArrayNull = [];
  const SMS_SEND_DST_NUMBER = '';
  const MAX_CHINESE_MESSAGE_LENTH = 63;
  const MAX_MESSAGE_LENTH = 2401;

  const TRUE_SLOT_ID = 0;
  const RECEIVE_SMS_PDU = '240D91689141468496F600001270721142432302B319';


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
      expect(shortMessage.visibleMessageBody != 'visibleMessageBody').assertTrue();
      expect(shortMessage.visibleRawAddress != 'visibleRawAddress').assertTrue();
      expect(shortMessage.messageClass != 'sms.FORWARD_MESSAGE').assertTrue();
      expect(shortMessage.protocolId != -1).assertTrue();
      expect(shortMessage.scAddress != 'scAddress').assertTrue();
      expect(shortMessage.scTimestamp != -1).assertTrue();
      expect(shortMessage.isReplaceMessage != true).assertTrue();
      expect(shortMessage.hasReplyPath != true).assertTrue();
      expect(shortMessage.status != -1).assertTrue();
      expect(shortMessage.isSmsStatusReportMessage != true).assertTrue();
      expect().assertFail();
      console.log('Telephony_SmsMms_createMessage_Async_0200 fail');
      done();
    });
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
   * @tc.number  Telephony_SmsMms_hasSmsCapability_0100
   * @tc.name    Check whether the Ims SMS function is supported
   * @tc.desc    Function test
   */
  it('Telephony_SmsMms_hasSmsCapability_0100', 0, async function (done) {
    let result = sms.hasSmsCapability();
    console.log('Telephony_SmsMms_hasSmsCapability_0100 result : ' + result);
    expect(result === false || result === true).assertTrue();
    done();
  });


  /**
   * @tc.number   Telephony_SmsMms_getDefaultSmsSlotId_Async_0100
   * @tc.name     Set the default card slot ID for sending SMS
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_getDefaultSmsSlotId_Async_0100', 0, async function (done) {
    sms.getDefaultSmsSlotId((getErr, getResult) => {
      if (getErr) {
        console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0100 finish');
        done();
        return;
      }
      console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0100 fail');
      done();
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_getDefaultSmsSlotId_Promise_0100
   * @tc.name     Set the default card slot ID for sending SMS
   * @tc.desc     Function test
   */
  it('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0100', 0, async function (done) {
    try {
      let getResult = await sms.getDefaultSmsSlotId();
      console.log('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0100 fail');
      done();
    } catch (err) {
      console.log('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0100 finish');
      done();
    }
  });

});