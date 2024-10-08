/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function SmsMmsErrorTest() {

describe('SmsMmsErrorTest', function () {

  var rawArrayNull = [];

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
      expect(shortMessage.messageClass != sms.ShortMessageClass.FORWARD_MESSAGE).assertTrue();
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

  /**
   * @tc.number Telephony_SmsMms_sendMessage_Promise_0100
   * @tc.name Telephony_SmsMms_sendMessage_Promise_0100
   * @tc.desc Function test
   */
  it('Telephony_SmsMms_sendMessage_Promise_0100', 0, async function (done) {
    try {
      let sendCallback = function (err, data) {
        expect(data.isLastPart !== '').assertTrue();
        console.log(`sendCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
      }
      let deliveryCallback = function (err, data) {
        console.log(`deliveryCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
      }
      let slotId = 0;
      let content = '短信内容';
      let destinationHost = '10086';
      let serviceCenter = '';
      let destinationPort = 1000;
      let options = {
        slotId,
        content,
        destinationHost,
        serviceCenter,
        destinationPort,
        sendCallback,
        deliveryCallback
      };
      sms.sendMessage(options);
      done();
    } catch (err) {
      expect(true).assertFalse();
      done();
    }
  });

  /**
   * @tc.number Telephony_SmsMms_sendShortMessage_Promise_0100
   * @tc.name Telephony_SmsMms_sendShortMessage_Promise_0100
   * @tc.desc Function test
   */
   it('Telephony_SmsMms_sendShortMessage_Promise_0100', 0, async function (done) {
    try {
      let sendCallback = function (err, data) {
        console.log(`sendCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
      }
      let deliveryCallback = function (err, data) {
        console.log(`deliveryCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
      }
      let slotId = 0;
      let content = '短信内容';
      let destinationHost = '10086';
      let serviceCenter = '';
      let destinationPort = 1000;
      let options = {
        slotId,
        content,
        destinationHost,
        serviceCenter,
        destinationPort,
        sendCallback,
        deliveryCallback
      };
      sms.sendShortMessage(options).then((data)=>{
        console.info('Telephony_SmsMms_sendShortMessage_Promise_0100 ' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((error)=>{
        console.info('Telephony_SmsMms_sendShortMessage_Promise_0100 ' + JSON.stringify(error));
        done();
      });
    } catch (error) {
      console.info('Telephony_SmsMms_sendShortMessage_Promise_0100 catch ' + JSON.stringify(error));
      done();
    }
  });

  /**
   * @tc.number Telephony_SmsMms_sendShortMessage_Async_0100
   * @tc.name Telephony_SmsMms_sendShortMessage_Async_0100
   * @tc.desc Function test
   */
   it('Telephony_SmsMms_sendShortMessage_Async_0100', 0, async function (done) {
    try {
      let sendCallback = function (err, data) {
        console.log(`sendCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
      }
      let deliveryCallback = function (err, data) {
        console.log(`deliveryCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
      }
      let slotId = 0;
      let content = '短信内容';
      let destinationHost = '10086';
      let serviceCenter = '';
      let destinationPort = 1000;
      let options = {
        slotId,
        content,
        destinationHost,
        serviceCenter,
        destinationPort,
        sendCallback,
        deliveryCallback
      };
      sms.sendShortMessage(options,(err, data)=>{
        if(err){
          console.info('Telephony_SmsMms_sendShortMessage_Async_0100 ' + JSON.stringify(err));
          done();
        } else {
          console.info('Telephony_SmsMms_sendShortMessage_Async_0100 ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }        
      });
      done();
    } catch (error) {
      console.info('Telephony_SmsMms_sendShortMessage_Async_0100 catch ' + JSON.stringify(error));
      done();
    }
  });
});
}