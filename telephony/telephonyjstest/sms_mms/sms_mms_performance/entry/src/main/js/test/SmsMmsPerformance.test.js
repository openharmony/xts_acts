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

describe('SmsMmsPreTest', function () {
  const TEST_PHONY_NUMBER = '18211305277';

  const TEST_RUN_TIME = 10;
  const TIME_SPAN = 5;
  const TRUE_SLOT_ID = 0;

  const IDENTIFIER_MIN = 0;
  const IDENTIFIER_MAX = 0xFFFF;
  const RANTYPE_GSM = 1;
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
   * @tc.number  Telephony_SmsMms_sendMessage_1500
   * @tc.name    The loop calls the interface SendMessage10 times,
   *             Delay < TIME_SPAN
   * @tc.desc    Performance test
   */
  it('Telephony_SmsMms_sendMessage_1500', 0, async function (done) {
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_sendMessage_1500 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_sendMessage_1500 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.sendMessage({
        slotId: TRUE_SLOT_ID,
        destinationHost: TEST_PHONY_NUMBER,
        content: 'hello',
        sendCallback: (err, value) => {
          endTime = new Date().getTime();
          totalTime += endTime - startTime;
          if (err) {
            expect().assertFail();
            console.log('Telephony_SmsMms_sendMessage_1500 fail');
            done();
            return;
          }
          recursive(n - 1);
        },
        deliveryCallback: (err, value) => {
          if (err) {
            expect().assertFail();
            console.log('Telephony_SmsMms_sendMessage_1500 fail');
            return;
          }
          console.log(`deliveryCallback success sendResult = ${value.pdu}`);
        }
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Async_0400
   * @tc.name    Loop through the createMessage() TEST_RUN_TIME times,
   *             Time delay < TIME_SPAN
   * @tc.desc    Performance test
   */
  it('Telephony_SmsMms_createMessage_Async_0400', 0, async function (done) {
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_createMessage_Async_0400 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_createMessage_Async_0400 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.createMessage(rawArray, '3gpp', (err, shortMessage) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /*
   * @tc.number  Telephony_SmsMms_createMessage_Promise_0400
   * @tc.name    Loop through the createMessage() TEST_RUN_TIME times promise,
   *             Time delay < TIME_SPAN
   * @tc.desc    Performance test
   */
  it('Telephony_SmsMms_createMessage_Promise_0400', 0, async function (done) {
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.createMessage(rawArray, '3gpp');
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_createMessage_Promise_0400 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_createMessage_Promise_0400 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_setSmscAddr_Async_1100
   * @tc.name     The loop calls SetSmscAddr() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_SPAN
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_setSmscAddr_Async_1100', 0, async function (done) {
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;
    let curAddr = USABLE_SMSC_NUMBER;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_setSmscAddr_Async_1100 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_setSmscAddr_Async_1100 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.setSmscAddr(TRUE_SLOT_ID, curAddr, (err) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_getDefaultSmsSlotId_Async_0400
   * @tc.name     The loop calls GetDefaultSmsSlotId() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_SPAN
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_getDefaultSmsSlotId_Async_0300', 0, async function (done) {
    let slotId = TRUE_SLOT_ID;
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_getDefaultSmsSlotId_Async_0300 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0300 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.getDefaultSmsSlotId((err, result) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0300 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    sms.setDefaultSmsSlotId(slotId, (err) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0300 set fail');
        done();
        return;
      }
      console.log('Telephony_SmsMms_getDefaultSmsSlotId_Async_0300 set finish');
      recursive(TEST_RUN_TIME);
    });
  });

  /**
   * @tc.number   Telephony_SmsMms_setDefaultSmsSlotId_Promise_0400
   * @tc.name     The loop calls setDefaultSmsSlotId() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_setDefaultSmsSlotId_Promise_0400', 0, async function (done) {
    let slotId = TRUE_SLOT_ID;
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.setDefaultSmsSlotId(slotId);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setDefaultSmsSlotId_Promise_0400 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_setDefaultSmsSlotId_Promise_0400 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_setDefaultSmsSlotId_Async_0400
   * @tc.name     The loop calls setDefaultSmsSlotId() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_SPAN
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_setDefaultSmsSlotId_Async_0400', 0, async function (done) {
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_setDefaultSmsSlotId_Async_0400 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_setDefaultSmsSlotId_Async_0400 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.setDefaultSmsSlotId(TRUE_SLOT_ID, (err) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_setDefaultSmsSlotId_Async_0400 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_setCBRangeConfig_Promise_1200
   * @tc.name     The loop calls setCBRangeConfig() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_setCBRangeConfig_Promise_1200', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      enable: true,
      startMessageId: IDENTIFIER_MIN,
      endMessageId: IDENTIFIER_MAX,
      ranType: RANTYPE_GSM
    };
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.setCBRangeConfig(data);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setCBRangeConfig_Promise_1200 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_setCBRangeConfig_Promise_1200 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_setCBConfig_Promise_1400
   * @tc.name     The loop calls SetCBConfig() LOOP_MULTITUDE_NUMBER times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_setCBConfig_Promise_1400', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      enable: true,
      identifier: IDENTIFIER_MIN,
      ranType: RANTYPE_GSM
    };
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.setCBConfig(data);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setCBConfig_Promise_1400 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_setCBConfig_Promise_1400 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_setCBConfig_Async_1400
   * @tc.name     The loop calls SetCBConfig() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_setCBConfig_Async_1400', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      enable: true,
      identifier: IDENTIFIER_MIN,
      ranType: RANTYPE_GSM
    };
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_setCBConfig_Async_1400 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_setCBConfig_Async_1400 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.setCBConfig(data, (err) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_setCBConfig_Async_1400 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_getSmscAddr_Promise_0400
   * @tc.name     The loop calls getSmscAddr() LOOP_MULTITUDE_NUMBER times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_getSmscAddr_Promise_0400', 0, async function (done) {
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.getSmscAddr(TRUE_SLOT_ID);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getSmscAddr_Promise_0400 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_getSmscAddr_Promise_0400 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_getSmscAddr_Async_0400
   * @tc.name     The loop calls getSmscAddr() LOOP_MULTITUDE_NUMBER times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_getSmscAddr_Async_0400', 0, async function (done) {
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_getSmscAddr_Async_0400 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_getSmscAddr_Async_0400 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.getSmscAddr(TRUE_SLOT_ID, (err, result) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_getSmscAddr_Async_0400 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_setSmscAddr_Promise_1100
   * @tc.name     The loop calls SetSmscAddr() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_SPAN
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_setSmscAddr_Promise_1100', 0, async function (done) {
    const startTime = (new Date).getTime();
    let curAddr = OTHER_SMSC_NUMBER;
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.setSmscAddr(TRUE_SLOT_ID, curAddr);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_setSmscAddr_Promise_1100 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_setSmscAddr_Promise_1100 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_getDefaultSmsSlotId_Promise_0400
   * @tc.name     The loop calls GetDefaultSmsSlotId() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_SPAN
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0300', 0, async function (done) {
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.getDefaultSmsSlotId();
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0300 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_getDefaultSmsSlotId_Promise_0300 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_getAllSIMMessages_Promise_0400
   * @tc.name     The loop calls getAllSimMessages() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_SPAN
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_getAllSIMMessages_Promise_0400', 0, async function (done) {
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.getAllSimMessages(TRUE_SLOT_ID);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_getAllSIMMessages_Promise_0400 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_getAllSIMMessages_Promise_0400 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_getAllSIMMessages_Async_0400
   * @tc.name     The loop calls getAllSimMessages() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_SPAN
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_getAllSIMMessages_Async_0400', 0, async function (done) {
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_getAllSIMMessages_Async_0400 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_getAllSIMMessages_Async_0400 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_getAllSIMMessages_Async_0400 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Async_2300
   * @tc.name     The loop calls updateSIMMessage() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_updateSimMessage_Async_2300', 0, async function (done) {
    let beforeSmsRecord = [];
    let addIndex = 0;
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAVE_READ
    };
    let upData = {
      slotId: TRUE_SLOT_ID,
      msgIndex: addIndex,
      newStatus: sms.MESSAGE_HAVE_READ,
      pdu: RECEIVE_SMS_PDU,
      smsc: ''
    };
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_updateSimMessage_Async_2300 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_updateSimMessage_Async_2300 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.updateSimMessage(upData, (err) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2300 update fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    sms.getAllSimMessages(TRUE_SLOT_ID, (err, result) => {
      if (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Async_2300 fail');
        done();
        return;
      }
      beforeSmsRecord = result;
      console.log('Telephony_SmsMms_updateSimMessage_Async_2300 getAllSimMessages before finish');
      for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
        if (beforeSmsRecord[index].shortMessage.pdu.length === 0) {
          addIndex = index;
          break;
        }
      }
      sms.addSimMessage(data, (adderr) => {
        if (adderr) {
          expect().assertFail();
          console.log('Telephony_SmsMms_updateSimMessage_Async_2300 fail');
          done();
          return;
        }
        console.log('Telephony_SmsMms_updateSimMessage_Async_2300 finish');
        recursive(TEST_RUN_TIME);
      });
    });

  });

  /**
   * @tc.number   Telephony_SmsMms_updateSimMessage_Promise_2300
   * @tc.name     The loop calls updateSIMMessage() TEST_RUN_TIME times,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_updateSimMessage_Promise_2300', 0, async function (done) {
    let beforeSmsRecord = [];
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: RECEIVE_SMS_PDU,
      status: sms.MESSAGE_HAS_BEEN_SENT
    };
    let addIndex = 0;
    try {
      let promiseGet = await sms.getAllSimMessages(TRUE_SLOT_ID);
      beforeSmsRecord = promiseGet;
      console.log('Telephony_SmsMms_updateSimMessage_Promise_2300 getAllSimMessages before finish');
      done();
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_updateSimMessage_Promise_2300 fail');
      done();
      return;
    }
    for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
      if (beforeSmsRecord[index].pdu.length === 0) {
        addIndex = index;
        break;
      }
    }
    try {
      await sms.addSimMessage(data);
      console.log('setSmscAddr beforeAddr  ');
      done();
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_updateSimMessage_Promise_2300 fail');
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
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.updateSimMessage(upData);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_updateSimMessage_Promise_2300 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_updateSimMessage_Promise_2300 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_addSimMessage_Async_2000
   * @tc.name     loops Failed to save SMS to SIM LOOP_MULTITUDE_NUMBER,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_addSimMessage_Async_2000', 0, async function (done) {
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_NOT_SENT
    };
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_addSimMessage_Async_2000 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_addSimMessage_Async_2000 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.addSimMessage(data, (err) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_addSimMessage_Async_2000 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_addSimMessage_Promise_2300
   * @tc.name     loops Failed to save SMS to SIM LOOP_MULTITUDE_NUMBER,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_addSimMessage_Promise_2000', 0, async function (done) {
    const startTime = (new Date).getTime();
    let data = {
      slotId: TRUE_SLOT_ID,
      smsc: '',
      pdu: CORRECT_SMS_PDU,
      status: sms.MESSAGE_NOT_SENT
    };
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.addSimMessage(data);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_addSimMessage_Promise_2000 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_addSimMessage_Promise_2000 finish');
    done();
  });

  /**
   * @tc.number   Telephony_SmsMms_delSimMessage_Async_0600
   * @tc.name     loops Deletes a text message from the SIM card LOOP_MULTITUDE_NUMBER,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_delSimMessage_Async_0600', 0, async function (done) {
    let totalTime = 0;
    let startTime = 0;
    let endTime = 0;

    function recursive (n) {
      if (n <= 0) {
        console.log(`Telephony_SmsMms_delSimMessage_Async_0600 exec done useTime:${totalTime}`);
        console.log('Telephony_SmsMms_delSimMessage_Async_0600 finish');
        expect(totalTime).assertLess(TIME_SPAN);
        done();
        return;
      }
      startTime = new Date().getTime();
      sms.delSimMessage(TRUE_SLOT_ID, 0, (err) => {
        endTime = new Date().getTime();
        totalTime += endTime - startTime;
        if (err) {
          expect().assertFail();
          console.log('Telephony_SmsMms_delSimMessage_Async_0600 fail');
          done();
          return;
        }
        recursive(n - 1);
      });
    }
    recursive(TEST_RUN_TIME);
  });

  /**
   * @tc.number   Telephony_SmsMms_delSimMessage_Promise_0600
   * @tc.name     loops Deletes a text message from the SIM card TEST_RUN_TIME,
   *              Determine that the running time is less than TIME_USEC_500
   * @tc.desc     Performance test
   */
  it('Telephony_SmsMms_delSimMessage_Promise_0600', 0, async function (done) {
    let beforeSmsRecord = [];
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
      console.log('Telephony_SmsMms_delSimMessage_Promise_0600 getAllSimMessages before finish');
      done();
    } catch (err) {
      expect().assertFail();
      console.log('Telephony_SmsMms_delSimMessage_Promise_0600 fail');
      done();
      return;
    }
    for (let index = 0, len = beforeSmsRecord.length;index < len;index++) {
      if (beforeSmsRecord[index].pdu.length === 0) {
        addIndex[count] = index;
        if (count === TEST_RUN_TIME) {
          break;
        }
      }
    }
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        await sms.addSimMessage(data);
        if (index === TEST_RUN_TIME - 1) {
          console.log('Telephony_SmsMms_delSimMessage_Promise_0600 addSimMessage finish');
        }
        done();
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_delSimMessage_Promise_0600 fail');
        done();
        return;
      }
    }
    const startTime = (new Date).getTime();
    for (let index = 0;index < TEST_RUN_TIME;index++) {
      try {
        let delIndex = addIndex[index];
        await sms.addSimMessage(TRUE_SLOT_ID, delIndex);
      } catch (err) {
        expect().assertFail();
        console.log('Telephony_SmsMms_delSimMessage_Promise_0600 fail');
        done();
        return;
      }
    }
    const endTime = (new Date).getTime();
    expect(endTime - startTime).assertLess(TIME_SPAN);
    console.log('Telephony_SmsMms_delSimMessage_Promise_0600 finish');
    done();
  });

});