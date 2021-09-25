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

describe('SmsMmsRelTest', function () {
  const TEST_RUN_TIME = 10;
  const TEST_PHONY_NUMBER = '18211305277';

  const TRUE_SLOT_ID = 0;
  const IDENTIFIER_MIN = 0;
  const RANTYPE_GSM = 1;
  const PROTOCOL_ID = 145;
  const SC_TIMESTAMP = 1644112405;
  var rawArray = [
    0x30, 0x00, 0x01, 0x00, 0x0D, 0x91, 0x68, 0x71, 0x26, 0x30,
    0x37, 0x25, 0xF7, 0x00, 0x08, 0x10, 0x54, 0xC8, 0x7F, 0x57,
    0xFF, 0x01, 0x00, 0x7A, 0x00, 0x65, 0x00, 0x73, 0x00, 0x74, 0x30, 0x02
  ];

  const OTHER_SMSC_NUMBER = '+8613800755500';
  const USABLE_SMSC_NUMBER = '+8613800512500';
  const CORRECT_SMS_PDU = '01000F9168683106019196F400080A00680065006C006C006F';
  const RECEIVE_SMS_PDU = '240D91689141468496F600001270721142432302B319';

  var DATA_SCADDR = '';
  var DEFAULT_SMS_SLOTID = 0;
  var smsIndex = 0;
  beforeAll(async function () {
    sms.getSmscAddr(TRUE_SLOT_ID, (geterr, getresult) => {
      if (geterr) {
        return;
      }
      DATA_SCADDR = getresult
    });
    sms.getDefaultSmsSlotId((geterr, getresult) => {
      if (geterr) {
        return;
      }
      DEFAULT_SMS_SLOTID = getresult;
    });
    let allSmsRecord = [];
    sms.getAllSimMessages(TRUE_SLOT_ID, (geterr, getresult) => {
      if (geterr) {
        return;
      }
      allSmsRecord = getresult;
    });
    if (allSmsRecord.length !== 0) {
      for (let index = 0;index < 10;++index) {
        sms.delSimMessage(TRUE_SLOT_ID, index, (err) => {});
      }
    }
  });

  beforeEach(async function () {
    sms.setSmscAddr(TRUE_SLOT_ID, DATA_SCADDR, (err) => {});
    sms.setDefaultSmsSlotId(DEFAULT_SMS_SLOTID, (err) => {});
    for (let index = 0;index < 10;++index) {
      sms.delSimMessage(TRUE_SLOT_ID, index, (err) => {});
    }
  });

  /*
   * @tc.number  Telephony_SmsMms_sendMessage_1400
   * @tc.name    The loop calls the interface SendMessage1000 times,
   *             and the message is sent successfully each time
   * @tc.desc    Reliability test
   */
  it('Telephony_SmsMms_sendMessage_1400', 0, async function (done) {
    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_sendMessage_1400 finish');
        done();
        return;
      }
      sms.sendMessage({
        slotId: TRUE_SLOT_ID,
        destinationHost: TEST_PHONY_NUMBER,
        content: 'hello',
        sendCallback: (err, value) => {
          if (err) {
            expect().assertFail();
            return;
          }
          expect(value.result === sms.SEND_SMS_SUCCESS).assertTrue();
          recursive(n - 1);
        },
        deliveryCallback: (err, value) => {
          if (err) {
            expect().assertFail();
            return;
          }
          console.log(`deliveryCallback success sendResult = ${value.pdu}`);
        }
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_setSmscAddr_Promise_1000
   * @tc.name     The loop calls SetSmscAddr() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_setSmscAddr_Promise_1000', 0, async function (done) {
    let curAddr = OTHER_SMSC_NUMBER;
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let promiseSet = await sms.setSmscAddr(TRUE_SLOT_ID, curAddr);
        expect(promiseSet).assertTrue();
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setSmscAddr_Promise_1000 fail');
        done();
        return;
      }
      try {
        let promise = await sms.getSmscAddr(TRUE_SLOT_ID);
        expect(promise === curAddr).assertTrue();
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_setSmscAddr_Promise_1000 finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setSmscAddr_Promise_1000 fail');
        done();
        return;
      }
    }
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Async_0300
   * @tc.name    Loop through the createMessage() TEST_RUN_TIME times
   * @tc.desc    Reliability test
   */
  it('Telephony_SmsMms_createMessage_Async_0300', 0, async function (done) {
    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_createMessage_Async_0300 finish');
        done();
        return;
      }
      sms.createMessage(rawArray, '3gpp', (err, shortMessage) => {
        if (err) {
          expect().assertFail();
          return;
        }
        expect(shortMessage.protocolId === PROTOCOL_ID).assertTrue();
        expect(shortMessage.scTimestamp === SC_TIMESTAMP).assertTrue();
        expect(shortMessage.isReplaceMessage).assertFalse();
        expect(shortMessage.hasReplyPath).assertFalse();
        expect(shortMessage.pdu.length > 0).assertTrue();
        expect(shortMessage.status === 0).assertTrue();
        expect(shortMessage.isSmsStatusReportMessage).assertFalse();
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Promise_0300
   * @tc.name    Loop through the createMessage() TEST_RUN_TIME times promise
   * @tc.desc    Reliability test
   */
  it('Telephony_SmsMms_createMessage_Promise_0300', 0, async function (done) {
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        var promise = await sms.createMessage(rawArray, '3gpp');
        expect(promise.protocolId === PROTOCOL_ID).assertTrue();
        expect(promise.scTimestamp === SC_TIMESTAMP).assertTrue();
        expect(promise.isReplaceMessage).assertFalse();
        expect(promise.hasReplyPath).assertFalse();
        expect(promise.pdu.length > 0).assertTrue();
        expect(promise.status === 0).assertTrue();
        expect(promise.isSmsStatusReportMessage).assertFalse();
      } catch (err) {
        expect().assertFail();
        done();
        return;
      }
    }
    console.log('Telephony_SmsMms_createMessage_Promise_0300 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_getSmscAddr_Async_0300
   * @tc.name     The loop calls getSmscAddr() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_getSmscAddr_Async_0300', 0, async function (done) {
    let curAddr = USABLE_SMSC_NUMBER;

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_getSmscAddr_Async_0300 finish');
        done();
        return;
      }
      sms.getSmscAddr(TRUE_SLOT_ID, (geterr, getresult) => {
        if (geterr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_getSmscAddr_Async_0300 fail');
          done();
          return;
        }
        expect(getresult === curAddr).assertTrue();
        recursive(n - 1);
      });
    }
    sms.setSmscAddr(TRUE_SLOT_ID, curAddr, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getSmscAddr_Async_0300 fail');
        done();
        return;
      }
      expect(result).assertTrue();
      console.log(`Telephony_SmsMms_getSmscAddr_Async_0300 setSmscAddr result = ${result}`);
      recursive(TEST_RUN_TIME);
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_getSmscAddr_Promise_0300
   * @tc.name     The loop calls getSmscAddr() LOOP_MULTITUDE_NUMBER times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_getSmscAddr_Promise_0300', 0, async function (done) {
    let curAddr = OTHER_SMSC_NUMBER;
    try {
      let promiseSet = await sms.setSmscAddr(TRUE_SLOT_ID, curAddr);
      expect(promiseSet).assertTrue();
      console.log(`Telephony_SmsMms_getSmscAddr_Promise_0300 setSmscAddr : ${promiseSet}`);
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_getSmscAddr_Promise_0100 fail');
      done();
      return;
    }
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let promise = await sms.getSmscAddr(TRUE_SLOT_ID);
        expect(promise === curAddr).assertTrue();
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_getSmscAddr_Promise_0300 finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_setCBConfig_Async_1300
   * @tc.name     The loop calls SetCBConfig() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_setCBConfig_Async_1300', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      enable: true,
      identifier: IDENTIFIER_MIN,
      ranType: RANTYPE_GSM
    };

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_setCBConfig_Async_1300 finish');
        done();
        return;
      }
      sms.setCBConfig(data, (err, result) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_setCBConfig_Async_1300 fail');
          done();
          return;
        }
        expect(result).assertTrue();
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_setCBConfig_Promise_1300
   * @tc.name     The loop calls SetCBConfig() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_setCBConfig_Promise_1300', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      enable: true,
      identifier: IDENTIFIER_MIN,
      ranType: RANTYPE_GSM
    };
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let promiseSet = await sms.setCBConfig(data);
        expect(promiseSet).assertTrue();
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_setCBConfig_Promise_1300  finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setCBConfig_Promise_1300  fail');
        done();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_setDefaultSmsSlotId_Async_0300
   * @tc.name     The loop calls setDefaultSmsSlotId() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_setDefaultSmsSlotId_Async_0300', 0, async function (done) {
    let slotId = TRUE_SLOT_ID;

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_setDefaultSmsSlotId_Async_0300 finish');
        done();
        return;
      }
      sms.setDefaultSmsSlotId(slotId, (err, result) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_setDefaultSmsSlotId_Async_0300 fail');
          done();
          return;
        }
        expect(result).assertTrue();
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_setDefaultSmsSlotId_Promise_0300
   * @tc.name     The loop calls setDefaultSmsSlotId() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_setDefaultSmsSlotId_Promise_0300', 0, async function (done) {
    let slotId = TRUE_SLOT_ID;
    let cnt = 0;
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let promiseSet = await sms.setDefaultSmsSlotId(slotId);
        expect(promiseSet).assertTrue();
        cnt++;
        if (cnt === TEST_RUN_TIME) {
          console.log('Telephony_SmsMms_setDefaultSmsSlotId_Promise_0300 finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setDefaultSmsSlotId_Promise_0300  fail');
        done();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_getDefaultSmsSlotId_Async_0200
   * @tc.name     The loop calls GetDefaultSmsSlotId() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_getDefaultSmsSlotId_Async_0200', 0, async function (done) {
    let slotId = TRUE_SLOT_ID;

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0200 finish');
        done();
        return;
      }
      sms.getDefaultSmsSlotId((geterr, getresult) => {
        if (geterr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0200 fail');
          done();
          return;
        }
        expect(getresult === slotId).assertTrue();
        recursive(n - 1);
      });
    }
    sms.setDefaultSmsSlotId(slotId, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0200 set fail');
        done();
        return;
      }
      expect(result).assertTrue();
      console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0200 set finish');
      recursive(TEST_RUN_TIME);
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_getDefaultSmsSlotId_Promise_0200
   * @tc.name     The loop calls GetDefaultSmsSlotId() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0200', 0, async function (done) {
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let promise = await sms.getDefaultSmsSlotId();
        expect(promise !== undefined || promise !== '');
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0200 finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0200 fail');
        done();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_setSmscAddr_Async_1000
   * @tc.name     The loop calls SetSmscAddr() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_setSmscAddr_Async_1000', 0, async function (done) {
    let curAddr = USABLE_SMSC_NUMBER;

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_setSmscAddr_Async_1000 finish');
        done();
        return;
      }
      sms.setSmscAddr(TRUE_SLOT_ID, curAddr, (err, result) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_setSmscAddr_Async_1000 fail');
          done();
          return;
        }
        expect(result).assertTrue();
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_addSimMessage_Async_1900
   * @tc.name     loops Failed to save SMS to SIM TEST_RUN_TIME
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_addSimMessage_Async_1900', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };

    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_addSimMessage_Async_1900 finish');
        done();
        return;
      }
      sms.addSimMessage(data, (err, result) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_addSimMessage_Async_1900 fail');
          done();
          return;
        }
        expect(result).assertTrue();
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_addSimMessage_Promise_1900
   * @tc.name     loops Failed to save SMS to SIM TEST_RUN_TIME
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_addSimMessage_Promise_1900', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_NOT_SENT
    };
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let promiseSet = await sms.addSimMessage(data);
        expect(promiseSet).assertTrue();
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_addSimMessage_Promise_1900 finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_addSimMessage_Promise_1900 fail');
        done();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_delSimMessage_Async_0500
   * @tc.name     loops Deletes a text message from the SIM card TEST_RUN_TIME
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_delSimMessage_Async_0500', 0, async function (done) {
    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_SmsMms_setSmscAddr_Async_1000 finish');
        done();
        return;
      }
      sms.delSimMessage(TRUE_SLOT_ID, 0, (err) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_delSimMessage_Async_0500 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_delSimMessage_Promise_0500
   * @tc.name     loops Deletes a text message from the SIM card LOOP_MULTITUDE_NUMBER
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_delSimMessage_Promise_0500', 0, async function (done) {
    let beforeSmsRecord = [];
    let cnt = 0;
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let addIndex = [];
    let count = 0;
    try {
      beforeSmsRecord = await sms.getAllSimMessages(TRUE_SLOT_ID);
      console.log('Telephony_SmsMms_delSimMessage_Promise_0500 getAllSimMessages before finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          addIndex[count] = index;
          count++;
          if (count === TEST_RUN_TIME) {
            break;
          }
        }
      }
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_delSimMessage_Promise_0500 fail');
      done();
      return;
    }
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.addSimMessage(data);
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_delSimMessage_Promise_0500 addSimMessage finish');
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_delSimMessage_Promise_0500 fail');
        done();
        return;
      }
    }
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      let delIndex = addIndex[index];
      try {
        await sms.delSimMessage(TRUE_SLOT_ID, delIndex);
        cnt++;
        if (cnt === TEST_RUN_TIME) {
          console.log('Telephony_SmsMms_delSimMessage_Promise_0500 delAllSIMMessages cur finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_delSimMessage_Promise_0500 fail');
        done();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_getAllSIMMessages_Promise_0300
   * @tc.name     The loop calls getAllSimMessages() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_getAllSIMMessages_Promise_0300', 0, async function (done) {
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let promise = await sms.getAllSimMessages(TRUE_SLOT_ID);
        expect(promise !== null || promise !== undefined).assertTrue();
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_getAllSIMMessages_Promise_0300 addSimMessage finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getAllSIMMessages_Promise_0300 fail');
        done();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_2200
   * @tc.name     The loop calls updateSIMMessage() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_2200', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let addIndex = 0;
    let upData = {
      slotId: TRUE_SLOT_ID,
      msgIndex: addIndex,
      newStatus: sms.MESSAGE_HAVE_READ,
      pdu: RECEIVE_SMS_PDU,
      smsc: ''
    };

    function recursive (n) {
      if (n < 0) {
        console.log('Telephony_SmsMms_updateSimMessage_Async_2200 finish');
        done();
        return;
      }
      if (n === 0) {
        sms.getAllSimMessages(TRUE_SLOT_ID, (err, getresult) => {
          if (err) {
            expect().assertFail();
            console.log('Telephony_SmsMms_updateSimMessage_Async_2200 fail');
            done();
            return;
          }
          expect(getresult[addIndex].simMessageStatus === sms.SMS_SIM_MESSAGE_STATUS_READ).assertTrue();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2200 getAllSimMessages cur finish');
          recursive(n - 1);
        });
      }
      sms.updateSimMessage(upData, (err) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2200 update fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_2200 fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_2200 getAllSimMessages before finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          addIndex = index;
          break;
        }
      }
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2200 fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_2200 finish');
      });
      recursive(TEST_RUN_TIME);
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Promise_2200
   * @tc.name     The loop calls updateSIMMessage() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_updateSimMessage_Promise_2200', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let addIndex = 0;
    try {
      beforeSmsRecord = await sms.getAllSimMessages(TRUE_SLOT_ID);
      console.log('Telephony_SmsMms_updateSimMessage_Promise_2200 getAllSimMessages before finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          addIndex = index;
          break;
        }
      }
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_updateSimMessage_Promise_2200 fail');
      done();
      return;
    }
    try {
      await sms.addSimMessage(data);
      console.log('Telephony_SmsMms_updateSimMessage_Promise_2200 addSimMessage');
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_updateSimMessage_Promise_2200 fail');
      done();
      return;
    }
    let upData = {
      slotId: TRUE_SLOT_ID,
      msgIndex: addIndex,
      newStatus: sms.MESSAGE_HAS_BEEN_SENT,
      pdu: RECEIVE_SMS_PDU,
      smsc: ''
    };
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.updateSimMessage(upData);
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_updateSimMessage_Promise_2200  finish');
          done();
        }
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Promise_2200 fail');
        done();
        return;
      }
    }
  });

  /**
   * @tc.number   Telephony_SmsMms_getAllSIMMessages_Async_0300
   * @tc.name     The loop calls getAllSimMessages() TEST_RUN_TIME times
   * @tc.desc     Reliability test
   */
  it('Telephony_SmsMms_getAllSIMMessages_Async_0300', 0, async function (done) {
    function recursive (n) {
      if (n <= 0) {
        console.log('Telephony_Sim_getISOCountryCodeForSim_Async_0300 finish');
        done();
        return;
      }
      sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_getAllSIMMessages_Async_0300 fail');
          done();
          return;
        }
        expect(result !== null || result !== undefined).assertTrue();
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });
});